import cv2
import numpy as np
from PIL import Image
import os
import math

def radial_shatter_blackbg(img, num_shards=12, strength="medium", center=None, bg_color=(0,0,0)):
    h, w = img.shape[:2]
    output = np.zeros_like(img)
    output[...,:3] = bg_color
    output[...,3] = 255  # full alpha

    if center is None:
        cx, cy = w//2, h//2
    else:
        cx, cy = center

    if strength == "medium":
        max_push = 5
        max_rot = 5
    else:
        raise ValueError("Only 'medium' supported in this version")

    angles = np.linspace(0, 2*np.pi, num_shards+1)
    xv, yv = np.meshgrid(np.arange(w), np.arange(h))
    dx = xv - cx
    dy = yv - cy
    pixel_angles = np.arctan2(dy, dx) % (2*np.pi)

    for i in range(num_shards):
        mask = (pixel_angles >= angles[i]) & (pixel_angles < angles[i+1])
        if np.sum(mask)==0:
            continue

        shard = np.zeros_like(img)
        for c in range(4):
            shard[...,c] = img[...,c] * mask.astype(np.uint8)

        angle = np.random.uniform(-max_rot, max_rot)
        M = cv2.getRotationMatrix2D((cx,cy), angle,1.0)
        shard_rot = cv2.warpAffine(shard, M, (w,h), borderMode=cv2.BORDER_CONSTANT, borderValue=(0,0,0,0))

        r_angle = (angles[i]+angles[i+1])/2
        dx_push = int(math.cos(r_angle)*np.random.uniform(1,max_push))
        dy_push = int(math.sin(r_angle)*np.random.uniform(1,max_push))

        shard_final = np.zeros_like(img)
        x_start = max(dx_push,0)
        y_start = max(dy_push,0)
        x_end = min(w+dx_push,w)
        y_end = min(h+dy_push,h)

        shard_slice_x = slice(max(-dx_push,0), w - max(dx_push,0))
        shard_slice_y = slice(max(-dy_push,0), h - max(dy_push,0))
        shard_final[y_start:y_end, x_start:x_end] = shard_rot[shard_slice_y, shard_slice_x]

        mask_final = shard_final[...,3]>0
        for c in range(4):
            channel = output[...,c]
            channel[mask_final] = shard_final[...,c][mask_final]
            output[...,c] = channel

    return output

def generate_puncture_medium_quilt(input_path, size=(64,64), num_variants=30, cols=6, output_file="puncture_medium_quilt.png"):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2]==3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    rows = (num_variants + cols - 1) // cols
    quilt_w = cols * size[0]
    quilt_h = rows * size[1]
    quilt = Image.new("RGBA", (quilt_w, quilt_h))

    for i in range(num_variants):
        out = radial_shatter_blackbg(img, strength="medium")
        pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA)).resize(size, Image.Resampling.NEAREST)
        row_idx = i // cols
        col_idx = i % cols
        quilt.paste(pil, (col_idx*size[0], row_idx*size[1]))

    quilt.save(output_file)
    print(f"Saved medium-strength puncture style quilt with {num_variants} images in '{output_file}'")

# Example usage:
# generate_puncture_medium_quilt("Mountain Pouch.png")
generate_puncture_medium_quilt("Mountain Pouch.png", output_file="puncture_medium_quilt_pouch.png")
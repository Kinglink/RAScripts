import cv2
import numpy as np
from PIL import Image, ImageDraw, ImageFont
import os
import math
import random

# --- Puncture effect with guaranteed outward radial push ---
def radial_shatter_blackbg_fixed(img, strength="medium", center=None, bg_color=(0,0,0)):
    h, w = img.shape[:2]
    output = np.zeros_like(img)
    output[...,:3] = bg_color
    output[...,3] = 255  # full alpha

    if center is None:
        cx, cy = w//2, h//2
    else:
        cx, cy = center

    if strength == "medium":
        max_push = max(5, w//15)
        max_rot = max(5, w//20)
    else:
        raise ValueError("Only 'medium' supported in this version")

    num_shards = random.randint(10,16)
    rotation_offset = random.uniform(0, 2*np.pi)
    angles = np.linspace(0, 2*np.pi, num_shards+1) + rotation_offset

    xv, yv = np.meshgrid(np.arange(w), np.arange(h))
    dx = xv - cx
    dy = yv - cy
    pixel_angles = np.arctan2(dy, dx) % (2*np.pi)

    for i in range(num_shards):
        start = angles[i] % (2*np.pi)
        end = angles[i+1] % (2*np.pi)

        # Handle wraparound
        if end > start:
            mask = (pixel_angles >= start) & (pixel_angles < end)
        else:
            mask = (pixel_angles >= start) | (pixel_angles < end)

        if np.sum(mask) == 0:
            continue

        # Extract shard
        shard = np.zeros_like(img)
        for c in range(4):
            shard[...,c] = img[...,c] * mask.astype(np.uint8)

        # Random rotation
        angle = random.uniform(-max_rot, max_rot)
        M = cv2.getRotationMatrix2D((cx,cy), angle, 1.0)
        shard_rot = cv2.warpAffine(shard, M, (w,h), borderMode=cv2.BORDER_CONSTANT, borderValue=(0,0,0,0))

        # Compute centroid for outward vector
        ys, xs = np.nonzero(mask)
        centroid_x = np.mean(xs)
        centroid_y = np.mean(ys)
        rx = centroid_x - cx
        ry = centroid_y - cy
        length = math.hypot(rx, ry)
        if length == 0:
            rx, ry = 1.0, 0.0
        else:
            rx /= length
            ry /= length

        push_distance = random.uniform(1, max_push)
        dx_push = int(rx * push_distance)
        dy_push = int(ry * push_distance)

        # Correct slicing to guarantee outward movement
        shard_final = np.zeros_like(img)
        src_x_start = max(0, -dx_push)
        src_x_end   = min(w, w - max(0, dx_push))
        src_y_start = max(0, -dy_push)
        src_y_end   = min(h, h - max(0, dy_push))

        dst_x_start = max(0, dx_push)
        dst_x_end   = dst_x_start + (src_x_end - src_x_start)
        dst_y_start = max(0, dy_push)
        dst_y_end   = dst_y_start + (src_y_end - src_y_start)

        shard_final[dst_y_start:dst_y_end, dst_x_start:dst_x_end] = shard_rot[src_y_start:src_y_end, src_x_start:src_x_end]

        mask_final = shard_final[...,3] > 0
        for c in range(4):
            output[...,c][mask_final] = shard_final[...,c][mask_final]

    return output

# --- Generate variants + quilt, preserving original size ---
def generate_puncture_variants_quilt_fixed(input_dir, output_dir="output_puncture", num_variants=16, cols=4):
    os.makedirs(output_dir, exist_ok=True)
    files = [f for f in os.listdir(input_dir) if f.lower().endswith(('.png','.jpg','.jpeg'))]

    for f in files:
        file_base = os.path.splitext(f)[0]
        img_path = os.path.join(input_dir, f)
        img = cv2.imread(img_path, cv2.IMREAD_UNCHANGED)
        if img is None:
            print(f"Skipping {f}: cannot read")
            continue
        if img.shape[2]==3:
            img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

        h, w = img.shape[:2]

        # Create folder for variants
        variant_folder = os.path.join(output_dir, file_base)
        os.makedirs(variant_folder, exist_ok=True)

        # Generate variants
        variants = []
        for i in range(num_variants):
            out = radial_shatter_blackbg_fixed(img)
            pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA))
            variant_path = os.path.join(variant_folder, f"{file_base}_{i+1:02d}.png")
            pil.save(variant_path)
            variants.append(pil)

        # Create quilt
        rows = (num_variants + cols - 1) // cols
        quilt_w = cols * w
        quilt_h = rows * h
        quilt = Image.new("RGBA", (quilt_w, quilt_h), (0,0,0,255))
        draw = ImageDraw.Draw(quilt)
        try:
            font = ImageFont.truetype("arial.ttf", max(12, w//8))
        except:
            font = ImageFont.load_default()

        for idx, pil in enumerate(variants):
            row = idx // cols
            col = idx % cols
            x, y = col*w, row*h
            quilt.paste(pil, (x,y))
            draw.text((x+2, y+2), str(idx+1), fill=(255,255,255,255), font=font)

        quilt_path = os.path.join(output_dir, f"{file_base}_quilt.png")
        quilt.save(quilt_path)
        print(f"Processed {f}: {num_variants} variants + quilt saved")

# --- Example usage ---
generate_puncture_variants_quilt_fixed("initial")

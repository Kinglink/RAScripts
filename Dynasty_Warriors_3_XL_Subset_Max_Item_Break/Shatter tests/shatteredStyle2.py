import cv2
import numpy as np
from PIL import Image

# --- Fragmented / shattered effect (no overlapping) ---
def fragmented_shattered_no_overlap(img, num_cells=8, strength="medium"):
    h, w = img.shape[:2]
    pts = np.random.randint(0, min(h, w), (num_cells, 2))

    # Adjust parameters based on strength
    if strength == "medium":
        shift = 10
        edge_kernel = 3
    elif strength == "strong":
        shift = 18
        edge_kernel = 4
    elif strength == "violent":
        shift = 25
        edge_kernel = 5
    else:
        raise ValueError("Strength must be 'medium', 'strong', or 'violent'")

    xv, yv = np.meshgrid(np.arange(w), np.arange(h))
    dist = np.zeros((h, w, num_cells))
    for i, (x, y) in enumerate(pts):
        dist[..., i] = (xv - x) ** 2 + (yv - y) ** 2
    regions = np.argmin(dist, axis=2)

    # Start with a fully transparent output
    output = np.zeros_like(img)

    for i in range(num_cells):
        mask_region = (regions == i).astype(np.uint8)

        # Generate random shift for this shard
        dx, dy = np.random.randint(-shift, shift+1), np.random.randint(-shift, shift+1)

        # Violent effect: optionally flip shard
        if strength == "violent" and np.random.rand() < 0.3:
            M = cv2.getRotationMatrix2D((w//2, h//2), 180, 1)
        else:
            M = np.float32([[1, 0, dx], [0, 1, dy]])

        # Apply shift to the shard
        shifted = cv2.warpAffine(img, M, (w, h))

        # Only keep pixels inside this shard
        for c in range(4):
            output[..., c] = np.where(mask_region == 1, shifted[..., c], output[..., c])

        # Dark edges around shards
        edges = cv2.morphologyEx(mask_region, cv2.MORPH_GRADIENT, np.ones((edge_kernel, edge_kernel), np.uint8))
        output[edges > 0] = (0, 0, 0, 255)

    return output

# --- Main: generate all 3 non-overlapping variants ---
def generate_shattered_no_overlap(input_path, size=(64, 64)):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    variants = []
    for strength in ["medium", "strong", "violent"]:
        out = fragmented_shattered_no_overlap(img, strength=strength)
        pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA))
        pil = pil.resize(size, Image.Resampling.NEAREST)
        variants.append(pil)

    # Combine into one comparison image
    total_w = size[0] * len(variants)
    combined = Image.new("RGBA", (total_w, size[1]))
    for i, im in enumerate(variants):
        combined.paste(im, (i*size[0], 0))

    combined.save("shattered_no_overlap.png")
    print("Saved 'shattered_no_overlap.png' with medium | strong | violent variations")

# --- Example usage ---
generate_shattered_no_overlap("Mountain Pouch.png")

import cv2
import numpy as np
from PIL import Image
import os

def shattered_center(img, num_shards=10, strength="medium"):
    h, w = img.shape[:2]

    # Define impact zone: center third
    x1, x2 = w // 3, 2 * w // 3
    y1, y2 = h // 3, 2 * h // 3

    # Adjust push distance based on strength
    if strength == "medium":
        max_push = 5
    elif strength == "strong":
        max_push = 10
    elif strength == "violent":
        max_push = 18
    else:
        raise ValueError("strength must be 'medium', 'strong', or 'violent'")

    # Output starts as a copy of original
    output = img.copy()

    # Generate shards
    for _ in range(num_shards):
        # Random shard position inside impact zone
        cx, cy = np.random.randint(x1, x2), np.random.randint(y1, y2)
        # Random small shard size
        sw, sh = np.random.randint(3, (x2-x1)//3), np.random.randint(3, (y2-y1)//3)
        x_start, y_start = max(cx-sw//2,0), max(cy-sh//2,0)
        x_end, y_end = min(cx+sw//2, w), min(cy+sh//2, h)

        # Extract shard
        shard = output[y_start:y_end, x_start:x_end].copy()
        # Clear original spot
        output[y_start:y_end, x_start:x_end] = 0

        # Random push outward from center
        push_x = np.sign(cx - w//2) * np.random.randint(1, max_push+1)
        push_y = np.sign(cy - h//2) * np.random.randint(1, max_push+1)
        new_x1 = min(max(x_start + push_x, 0), w)
        new_y1 = min(max(y_start + push_y, 0), h)
        new_x2 = min(new_x1 + shard.shape[1], w)
        new_y2 = min(new_y1 + shard.shape[0], h)

        # Place shard in new spot (avoid overlaps with existing shards)
        mask = shard[...,3] > 0  # alpha > 0
        for c in range(4):
            channel = output[new_y1:new_y2, new_x1:new_x2, c]
            channel[mask[:new_y2-new_y1, :new_x2-new_x1]] = shard[...,c][mask[:new_y2-new_y1, :new_x2-new_x1]]
            output[new_y1:new_y2, new_x1:new_x2, c] = channel

    return output

def generate_series(input_path, size=(64,64), output_folder="shattered_series", num_variants=10):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    os.makedirs(output_folder, exist_ok=True)

    for strength in ["medium", "strong", "violent"]:
        for i in range(num_variants):
            out = shattered_center(img, strength=strength)
            pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA))
            pil = pil.resize(size, Image.Resampling.NEAREST)
            filename = f"{output_folder}/{strength}_{i+1}.png"
            pil.save(filename)
    print(f"Saved {num_variants*3} images in '{output_folder}'")

# --- Example usage ---
# generate_series("input.png")
generate_series("Mountain Pouch.png")import cv2
import numpy as np
from PIL import Image
import os

def shattered_center(img, num_shards=10, strength="medium"):
    h, w = img.shape[:2]

    # Define impact zone: center third
    x1, x2 = w // 3, 2 * w // 3
    y1, y2 = h // 3, 2 * h // 3

    # Adjust push distance based on strength
    if strength == "medium":
        max_push = 5
    elif strength == "strong":
        max_push = 10
    elif strength == "violent":
        max_push = 18
    else:
        raise ValueError("strength must be 'medium', 'strong', or 'violent'")

    # Output starts as a copy of original
    output = img.copy()

    # Generate shards
    for _ in range(num_shards):
        # Random shard position inside impact zone
        cx, cy = np.random.randint(x1, x2), np.random.randint(y1, y2)
        # Random small shard size
        sw, sh = np.random.randint(3, (x2-x1)//3), np.random.randint(3, (y2-y1)//3)
        x_start, y_start = max(cx-sw//2,0), max(cy-sh//2,0)
        x_end, y_end = min(cx+sw//2, w), min(cy+sh//2, h)

        # Extract shard
        shard = output[y_start:y_end, x_start:x_end].copy()
        # Clear original spot
        output[y_start:y_end, x_start:x_end] = 0

        # Random push outward from center
        push_x = np.sign(cx - w//2) * np.random.randint(1, max_push+1)
        push_y = np.sign(cy - h//2) * np.random.randint(1, max_push+1)
        new_x1 = min(max(x_start + push_x, 0), w)
        new_y1 = min(max(y_start + push_y, 0), h)
        new_x2 = min(new_x1 + shard.shape[1], w)
        new_y2 = min(new_y1 + shard.shape[0], h)

        # Place shard in new spot (avoid overlaps with existing shards)
        mask = shard[...,3] > 0  # alpha > 0
        for c in range(4):
            channel = output[new_y1:new_y2, new_x1:new_x2, c]
            channel[mask[:new_y2-new_y1, :new_x2-new_x1]] = shard[...,c][mask[:new_y2-new_y1, :new_x2-new_x1]]
            output[new_y1:new_y2, new_x1:new_x2, c] = channel

    return output

def generate_series(input_path, size=(64,64), output_folder="shattered_series", num_variants=10):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    os.makedirs(output_folder, exist_ok=True)

    for strength in ["medium", "strong", "violent"]:
        for i in range(num_variants):
            out = shattered_center(img, strength=strength)
            pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA))
            pil = pil.resize(size, Image.Resampling.NEAREST)
            filename = f"{output_folder}/{strength}_{i+1}.png"
            pil.save(filename)
    print(f"Saved {num_variants*3} images in '{output_folder}'")

# --- Example usage ---
# generate_series("input.png")

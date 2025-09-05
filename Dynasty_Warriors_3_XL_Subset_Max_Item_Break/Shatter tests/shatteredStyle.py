import cv2
import numpy as np
from PIL import Image

# --- Fragmented / shattered effect ---
def fragmented_shattered(img, num_cells=8, strength="medium"):
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

    output = np.zeros_like(img)
    for i in range(num_cells):
        mask_region = (regions == i).astype(np.uint8)
        dx, dy = np.random.randint(-shift, shift+1), np.random.randint(-shift, shift+1)

        # Violent effect: randomly flip some shards
        if strength == "violent" and np.random.rand() < 0.3:
            M = cv2.getRotationMatrix2D((w//2, h//2), 180, 1)
        else:
            M = np.float32([[1, 0, dx], [0, 1, dy]])

        shifted = cv2.warpAffine(img, M, (w, h))
        for c in range(4):
            output[..., c] = np.where(mask_region == 1, shifted[..., c], output[..., c])

        # Dark edges around shards
        edges = cv2.morphologyEx(mask_region, cv2.MORPH_GRADIENT, np.ones((edge_kernel, edge_kernel), np.uint8))
        output[edges > 0] = (0, 0, 0, 255)

    return output

# --- Main: generate all 3 variants ---
def generate_shattered_comparison(input_path, size=(64, 64)):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    variants = []
    for strength in ["medium", "strong", "violent"]:
        out = fragmented_shattered(img, strength=strength)
        pil = Image.fromarray(cv2.cvtColor(out, cv2.COLOR_BGRA2RGBA))
        pil = pil.resize(size, Image.Resampling.NEAREST)
        variants.append(pil)

    # Combine into one comparison image
    total_w = size[0] * len(variants)
    combined = Image.new("RGBA", (total_w, size[1]))
    for i, im in enumerate(variants):
        combined.paste(im, (i*size[0], 0))

    combined.save("shattered_comparison.png")
    print("Saved 'shattered_comparison.png' with medium | strong | violent variations")

# --- Example usage ---
generate_shattered_comparison("Mountain Pouch.png")

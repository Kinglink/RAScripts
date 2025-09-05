import cv2
import numpy as np
from PIL import Image

# --- Effect 1: Crack lines ---
def crack_lines(img, num_cracks=12):
    h, w = img.shape[:2]
    overlay = np.zeros((h, w, 4), dtype=np.uint8)
    for _ in range(num_cracks):
        x1, y1 = np.random.randint(0, w), np.random.randint(0, h)
        x2, y2 = np.random.randint(0, w), np.random.randint(0, h)
        cv2.line(overlay, (x1, y1), (x2, y2), (255, 255, 255, 180), thickness=np.random.randint(1, 3))
    return cv2.addWeighted(img, 1.0, overlay, 0.8, 0)

# --- Effect 2: Fragmented shards ---
def fragmented(img, num_cells=12):
    h, w = img.shape[:2]
    mask = np.zeros((h, w), np.uint8)

    # Random seed points for Voronoi regions
    pts = np.random.randint(0, min(h, w), (num_cells, 2))
    for i, (x, y) in enumerate(pts):
        cv2.circle(mask, (x, y), 1, (i+1), -1)

    # Assign each pixel to closest seed (cheap Voronoi)
    dist = np.zeros((h, w, num_cells))
    for i, (x, y) in enumerate(pts):
        xv, yv = np.meshgrid(np.arange(w), np.arange(h))
        dist[..., i] = (xv - x) ** 2 + (yv - y) ** 2
    regions = np.argmin(dist, axis=2)

    # Apply jitter to each region
    output = np.zeros_like(img)
    for i in range(num_cells):
        mask_region = (regions == i).astype(np.uint8)
        dx, dy = np.random.randint(-5, 6), np.random.randint(-5, 6)
        M = np.float32([[1, 0, dx], [0, 1, dy]])
        shifted = cv2.warpAffine(img, M, (w, h))
        for c in range(4):
            output[..., c] = np.where(mask_region == 1, shifted[..., c], output[..., c])
    return output

# --- Effect 3: Overlay crack texture ---
def texture_overlay(img, texture_path):
    tex = cv2.imread(texture_path, cv2.IMREAD_UNCHANGED)
    if tex is None:
        raise FileNotFoundError("Provide a crack texture PNG with transparency")
    tex = cv2.resize(tex, (img.shape[1], img.shape[0]))
    return cv2.addWeighted(img, 1.0, tex, 0.7, 0)

# --- Main wrapper ---
def apply_all(input_path, texture_path=None, size=(128, 128)):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    out1 = crack_lines(img)
    out2 = fragmented(img)
    out3 = texture_overlay(img, texture_path) if texture_path else img.copy()

    # Convert to PIL and resize
    imgs = []
    for arr in [out1, out2, out3]:
        pil = Image.fromarray(cv2.cvtColor(arr, cv2.COLOR_BGRA2RGBA))
        pil = pil.resize(size, Image.Resampling.LANCZOS)
        imgs.append(pil)

    # Combine into one comparison image
    total_w = size[0] * len(imgs)
    combined = Image.new("RGBA", (total_w, size[1]))
    for i, im in enumerate(imgs):
        combined.paste(im, (i*size[0], 0))
    combined.save("comparison.png")
    print("Saved comparison.png with all three effects")

# Example usage:
apply_all("Mountain Pouch.png", "cracks_texture.png")
apply_all("Mountain Quiver.png", "cracks_texture.png")

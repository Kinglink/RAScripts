import cv2
import numpy as np
from PIL import Image

# --- Effect 1: Crack lines (bold for 64x64) ---
def crack_lines_64(img, num_cracks=8, min_thickness=3, max_thickness=6):
    h, w = img.shape[:2]
    overlay = np.zeros((h, w, 4), dtype=np.uint8)

    for _ in range(num_cracks):
        x1, y1 = np.random.randint(0, w), np.random.randint(0, h)
        x2, y2 = np.random.randint(0, w), np.random.randint(0, h)
        thickness = np.random.randint(min_thickness, max_thickness+1)

        # Shadow line
        cv2.line(overlay, (x1+1, y1+1), (x2+1, y2+1),
                 (0, 0, 0, 200), thickness=thickness+1)

        # Main crack
        cv2.line(overlay, (x1, y1), (x2, y2),
                 (255, 255, 255, 255), thickness=thickness)

    return cv2.addWeighted(img, 1.0, overlay, 0.9, 0)

# --- Effect 2: Fragmented shards (bold) ---
def fragmented_64(img, num_cells=8, shift=10):
    h, w = img.shape[:2]
    pts = np.random.randint(0, min(h, w), (num_cells, 2))

    xv, yv = np.meshgrid(np.arange(w), np.arange(h))
    dist = np.zeros((h, w, num_cells))
    for i, (x, y) in enumerate(pts):
        dist[..., i] = (xv - x) ** 2 + (yv - y) ** 2
    regions = np.argmin(dist, axis=2)

    output = np.zeros_like(img)
    for i in range(num_cells):
        mask_region = (regions == i).astype(np.uint8)
        dx, dy = np.random.randint(-shift, shift+1), np.random.randint(-shift, shift+1)
        M = np.float32([[1, 0, dx], [0, 1, dy]])
        shifted = cv2.warpAffine(img, M, (w, h))
        for c in range(4):
            output[..., c] = np.where(mask_region == 1, shifted[..., c], output[..., c])

        # Dark edges around shards
        edges = cv2.morphologyEx(mask_region, cv2.MORPH_GRADIENT, np.ones((3,3), np.uint8))
        output[edges > 0] = (0, 0, 0, 255)

    return output

# --- Effect 3: Texture overlay ---
def texture_overlay_64(img, texture_path):
    tex = cv2.imread(texture_path, cv2.IMREAD_UNCHANGED)
    if tex is None:
        raise FileNotFoundError("Texture file not found")
    tex = cv2.resize(tex, (img.shape[1], img.shape[0]))
    return cv2.addWeighted(img, 1.0, tex, 0.7, 0)

# --- Main: Apply all effects ---
def apply_all_64(input_path, texture_path=None, size=(64, 64)):
    img = cv2.imread(input_path, cv2.IMREAD_UNCHANGED)
    if img is None:
        raise FileNotFoundError("Input image not found")
    if img.shape[2] == 3:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2BGRA)

    out1 = crack_lines_64(img)
    out2 = fragmented_64(img)
    out3 = texture_overlay_64(img, texture_path) if texture_path else img.copy()

    # Convert to PIL + resize
    imgs = []
    for arr in [out1, out2, out3]:
        pil = Image.fromarray(cv2.cvtColor(arr, cv2.COLOR_BGRA2RGBA))
        pil = pil.resize(size, Image.Resampling.NEAREST)
        imgs.append(pil)

    # Combine into one comparison strip
    total_w = size[0] * len(imgs)
    combined = Image.new("RGBA", (total_w, size[1]))
    for i, im in enumerate(imgs):
        combined.paste(im, (i*size[0], 0))
    combined.save("comparison_64.png")
    print("Saved comparison_64.png with cracks | shards | texture")

# Example usage:
# apply_all_64("input.png", "A_digital_image_features_a_shattered_glass_pattern.png")
apply_all_64("Mountain Pouch.png", "cracks_texture.png")

from PIL import Image, ImageDraw, ImageFilter
import os

def tint_center_red_edges_black(
        input_path,
        red_color=(255, 0, 0),
        red_strength=0.15,    # 0-1, how much to push center to red
        black_strength=0.90   # 0-1, how much to darken edges
    ):

    # Load image (force RGB, no alpha expected)
    img = Image.open(input_path).convert("RGB")
    w, h = img.size

    # Create oval mask: white = center, black = edge
    mask = Image.new("L", (w, h), 0)
    draw = ImageDraw.Draw(mask)

    pad = int(min(w, h) * 0.15)  # edge padding for oval fade
    draw.ellipse((pad, pad, w-pad, h-pad), fill=255)

    # Feather the oval edges
    mask = mask.filter(ImageFilter.GaussianBlur(min(w, h) // 5))

    # Prepare masks for center red & edge black
    mask_center = mask.point(lambda p: int(p * red_strength))
    mask_edge = mask.point(lambda p: int((255 - p) * black_strength))

    # Create solid layers
    red_layer = Image.new("RGB", (w, h), red_color)
    black_layer = Image.new("RGB", (w, h), (0, 0, 0))

    # Blend center toward red
    img_red = Image.composite(red_layer, img, mask_center)

    # Blend edges toward black
    img_final = Image.composite(black_layer, img_red, mask_edge)

    # Save
    name, ext = os.path.splitext(input_path)
    out_path = f"{name}_red.png"
    img_final.save(out_path)
    print(f"✅ Saved: {out_path}")

# --- USE IT LIKE THIS ---
tint_center_red_edges_black("image_test.png")

import os
from PIL import Image, ImageDraw, ImageFilter

# Tint settings
RED_STRENGTH = 0.15
BLACK_STRENGTH = 0.75

# Tint colors for modes
MODES = {
    "Normal":  (0, 0, 255),      # Blue
    "Master":  (255, 215, 0),    # Yellow/Gold
    "Chaos":   (255, 0, 0)       # Red
}

def tint_center_and_edges(img, tint_color, red_strength, black_strength):
    img = img.convert("RGB")
    w, h = img.size

    # Create ellipse radial mask
    mask = Image.new("L", (w, h), 0)
    draw = ImageDraw.Draw(mask)
    pad = int(min(w, h) * 0.15)
    draw.ellipse((pad, pad, w-pad, h-pad), fill=255)
    mask = mask.filter(ImageFilter.GaussianBlur(min(w, h) // 5))

    # Masks for center tint & edge dark
    mask_center = mask.point(lambda p: int(p * red_strength))
    mask_edge = mask.point(lambda p: int((255 - p) * black_strength))

    # Color layers
    tint_layer = Image.new("RGB", (w, h), tint_color)
    black_layer = Image.new("RGB", (w, h), (0, 0, 0))

    # Apply tint & black fade
    img_tinted = Image.composite(tint_layer, img, mask_center)
    img_final = Image.composite(black_layer, img_tinted, mask_edge)

    return img_final


# --- Paths ---
input_dir = "Generated/Stages"        # folder containing your stage images
output_dir = "Output"
os.makedirs(output_dir, exist_ok=True)

# Process all images
for filename in os.listdir(input_dir):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".bmp")):
        continue

    input_path = os.path.join(input_dir, filename)
    img = Image.open(input_path)

    name, ext = os.path.splitext(filename)

    for mode_name, color in MODES.items():
        tinted = tint_center_and_edges(img, color, RED_STRENGTH, BLACK_STRENGTH)

        out_name = f"{name}_{mode_name}.png"
        out_path = os.path.join(output_dir, out_name)
        tinted.save(out_path)

        print(f"✅ Saved {out_path}")

print("\n🎉 Done tinting all stage images!")

from PIL import Image, ImageEnhance
import os

# Paths
stage_dir = "Intermediates/Stages"
icon_path = "Intermediates/Placards/Target_Icon.png"
output_dir = "Output"
os.makedirs(output_dir, exist_ok=True)

# Load icon
icon = Image.open(icon_path).convert("RGBA").resize((16, 16), Image.LANCZOS)

# Tint colors (25% opacity)
tints = {
    "Gray": (128, 128, 128, 64),
    "Blue": (0, 0, 255, 64),
    "Green": (0, 255, 0, 64),
    "Red": (255, 0, 0, 64),
    "Orange": (255, 140, 0, 64),
    "Yellow": (255, 255, 0, 64),
    "Purple": (128, 0, 128, 64)
}

for file in os.listdir(stage_dir):
    if not file.lower().endswith(".png"):
        continue

    # Load stage
    stage = Image.open(os.path.join(stage_dir, file)).convert("RGBA")

    # --- Resize to height 64, preserve aspect ---
    target_h = 64
    w0, h0 = stage.size
    new_w = int((target_h / h0) * w0)
    stage = stage.resize((new_w, target_h), Image.LANCZOS)

    # --- Crop horizontal center to 64x64 ---
    left = (new_w - 64) // 2
    right = left + 64
    stage = stage.crop((left, 0, right, 64))

    base = stage  # now this is the 64x64 processed stage
    
    # 3-icon layout math
    w, h = base.size
    icon_w, icon_h = icon.size

    # Total width of 3 icons
    total_icon_width = icon_w * 3
    start_x = (w - total_icon_width) // 2
    y = h - icon_h  # bottom

    for tint_name, tint_color in tints.items():

        # Copy stage
        canvas = base.copy()

        # ✅ Tint background
        tint_layer = Image.new("RGBA", canvas.size, tint_color)
        canvas = Image.alpha_composite(canvas, tint_layer)

        # ✅ Convert grayscale for Gray case
        if tint_name == "Gray":
            converter = ImageEnhance.Color(canvas)
            canvas = converter.enhance(0.75)  # 25% grayscale wash

        # ✅ Place 3 icons bottom-centered
        for i in range(3):
            x = start_x + i * icon_w
            canvas.paste(icon, (x, y), icon)

        # ✅ Save
        stage_name = os.path.splitext(file)[0]
        out_file = f"{stage_name}_{tint_name}.png"
        canvas.save(os.path.join(output_dir, out_file))

print("✅ All stage preview variants generated.")

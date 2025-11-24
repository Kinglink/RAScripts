from PIL import Image
import os

# Paths
input_dir = "Intermediates/Characters"
output_dir = "Output"
os.makedirs(output_dir, exist_ok=True)

for filename in os.listdir(input_dir):
    if not filename.lower().endswith(".png"):
        continue

    # Open character image
    img_path = os.path.join(input_dir, filename)
    img = Image.open(img_path).convert("RGBA")

    # Resize: shrink until height is 64
    w, h = img.size
    scale = 64 / h
    new_w = int(w * scale)
    img_resized = img.resize((new_w, 64), Image.LANCZOS)

    # Take center 64x64
    left = max(0, (new_w - 64) // 2)
    top = 0
    right = left + 64
    bottom = top + 64
    img_cropped = img_resized.crop((left, top, right, bottom))

    # Black background
    background = Image.new("RGBA", (64, 64), (0, 0, 0, 255))
    background.paste(img_cropped, (0, 0), img_cropped)

    # Save output
    out_path = os.path.join(output_dir, filename)
    background.save(out_path)

print("✅ Done creating 64x64 character images on black background.")

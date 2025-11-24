import os
from PIL import Image

# Folder containing your images
input_dir = "Intermediates/Stages"
output_dir = "Output"

# Create output folder if missing
os.makedirs(output_dir, exist_ok=True)

# Crop size
CROP_WIDTH = 408
CROP_HEIGHT = 216

for filename in os.listdir(input_dir):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".bmp")):
        continue  # skip non-image files

    input_path = os.path.join(input_dir, filename)
    img = Image.open(input_path)

    # Crop (left, upper, right, lower)
    cropped = img.crop((0, 0, CROP_WIDTH, CROP_HEIGHT))

    name, ext = os.path.splitext(filename)
    out_path = os.path.join(output_dir, f"{name}.png")

    cropped.save(out_path)

    print(f"✅ Saved: {out_path}")

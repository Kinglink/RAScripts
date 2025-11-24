import os
from PIL import Image

# Folders
challenge_folder = "Intermediates/Challenge"           
output_folder = "Output"
os.makedirs(output_folder, exist_ok=True)

# Image sizes
BG_SIZE = (64, 64)
PADDING = 0  # optional padding from bottom-right

# Function to resize and crop center
def shrink_and_center(img, target_height):
    w, h = img.size
    scale = target_height / h
    new_w = int(w * scale)
    img = img.resize((new_w, target_height), Image.LANCZOS)

    # Crop center horizontally if needed
    left = max((new_w - target_height) // 2, 0)
    right = left + target_height
    img_cropped = img.crop((left, 0, right, target_height))
    return img_cropped

# Processing loop

for filename in os.listdir(challenge_folder):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".bmp")):
        continue  # skip non-image files

    input_path = os.path.join(challenge_folder, filename)
    img = Image.open(input_path).convert("RGBA")


    clipped_img = shrink_and_center(img, 32)

    name, ext = os.path.splitext(filename)
    out_path = os.path.join(output_folder, f"{name}.png")

    clipped_img.save(out_path)

    print(f"✅ Saved: {out_path}")

import os
from PIL import Image

# Folders
horse_folder = "Intermediates/Horse"
output_folder = "Output"
os.makedirs(output_folder, exist_ok=True)

# Target image size
TARGET_SIZE = (64, 64)
LEFT_OFFSET = 2  # pixels of space added to the left

# Function: shrink width to 64 and center vertically on black background
def shrink_and_center_vertical(img, target_size, left_offset=0):
    target_w, target_h = target_size
    w, h = img.size
    scale = target_w / w
    new_h = int(h * scale)
    resized_img = img.resize((target_w, new_h), Image.LANCZOS)

    # Create black RGBA background
    background = Image.new("RGBA", target_size, (0, 0, 0, 255))

    # Center vertically, add horizontal offset
    top = (target_h - new_h) // 2
    left = left_offset
    background.paste(resized_img, (left, top), resized_img)

    return background

# Processing loop
for filename in os.listdir(horse_folder):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".bmp")):
        continue  # skip non-image files

    input_path = os.path.join(horse_folder, filename)
    img = Image.open(input_path).convert("RGBA")

    final_img = shrink_and_center_vertical(img, TARGET_SIZE, LEFT_OFFSET)

    name, _ = os.path.splitext(filename)
    out_path = os.path.join(output_folder, f"{name}.png")
    final_img.save(out_path)

    print(f"✅ Saved: {out_path} (shifted {LEFT_OFFSET}px right)")
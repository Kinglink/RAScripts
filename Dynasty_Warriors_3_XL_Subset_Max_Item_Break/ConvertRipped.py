from PIL import Image
import os

input_dir = "Ripped"
output_dir = "Generated"
canvas_size = (64, 64)
border_size = 6  # cut off 6px border from all sides

def resize_and_crop_center(input_image_path, output_image_path):
    # Open the image
    img = Image.open(input_image_path).convert("RGBA")

    # Remove the 6px border (left, top, right, bottom)
    if img.width > border_size * 2 and img.height > border_size * 2:
        img = img.crop((
            border_size,
            border_size,
            img.width - border_size,
            img.height - border_size
        ))

    # Calculate scale to fill 64x64 (might crop)
    scale = max(canvas_size[0] / img.width, canvas_size[1] / img.height)
    new_size = (int(img.width * scale), int(img.height * scale))

    # Resize with high-quality resampling
    img = img.resize(new_size, Image.LANCZOS)

    # Crop from center to exactly 64x64
    left = (img.width - canvas_size[0]) // 2
    top = (img.height - canvas_size[1]) // 2
    right = left + canvas_size[0]
    bottom = top + canvas_size[1]
    img = img.crop((left, top, right, bottom))

    # Fix alpha (any pixel with alpha > 0 becomes fully opaque)
    pixels = img.load()
    for y in range(img.height):
        for x in range(img.width):
            r, g, b, a = pixels[x, y]
            if a > 0:
                pixels[x, y] = (r, g, b, 255)

    # Save result
    os.makedirs(os.path.dirname(output_image_path), exist_ok=True)
    img.save(output_image_path)

def process_folder(input_dir, output_dir):
    for root, _, files in os.walk(input_dir):
        for filename in files:
            if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):
                input_image_path = os.path.join(root, filename)

                # Mirror directory structure inside Generated
                relative_path = os.path.relpath(input_image_path, input_dir)
                output_image_path = os.path.join(output_dir, relative_path)

                resize_and_crop_center(input_image_path, output_image_path)

# Run full Ripped → Generated
process_folder(input_dir, output_dir)

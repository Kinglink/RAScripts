#!/usr/bin/env python3

from PIL import Image
import os

# Paths to the overlays
overlay_paths = {
    "Clay": "Overlay/Clay Brick.png",
    "Straw": "Overlay/Straw Brick.png",
    "Brick": "Overlay/Brick Brick.png",
}

def apply_overlays_and_save(base_image, overlays, base_file_name, output_dir, with_no = False, with_red_no = False):
    for overlay_name, overlay_path in overlays.items():
        composition = Image.new("RGBA", base_image.size)
        composition.paste(base_image, (0, 0))
        overlay_image = Image.open(overlay_path)
        composition.paste(overlay_image, (0, 0), overlay_image)
        
        # Save the composition
        output_filename = f"{base_file_name}_{overlay_name}.png"
        output_path = os.path.join(output_dir, output_filename)
        composition.save(output_path)
        overlay_image.close()

# Directory to save the final compositions
output_dir = "Output"
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Directory containing the base images
generated_dir = "Generated"

# Process each .png file in the Generated directory
for file_name in os.listdir(generated_dir):
    if file_name.endswith(".png"):
        base_file_path = os.path.join(generated_dir, file_name)
        base_file_name = os.path.splitext(file_name)[0]
        base_image = Image.open(base_file_path)

        # Apply each overlay (Gold, Silver, Bronze)
        apply_overlays_and_save(base_image, {k: overlay_paths[k] for k in ["Clay", "Straw", "Brick"]}, base_file_name, output_dir)

        # Close the base image
        base_image.close()

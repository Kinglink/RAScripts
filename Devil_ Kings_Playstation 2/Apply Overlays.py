#!/usr/bin/env python3

from PIL import Image
import os

# Directory for input images
generated_dir = "Generated"
output_dir = "Output"

# Define overlay presets here
# Each entry is a tuple: (output_subfolder, list of overlay paths)
overlay_presets = [
    ("Border_Only", ["../Overlays/Devil_Kings_Frame.png"]),
    ("Border_with_No", ["../Overlays/White_No_Overlay.png", "../Overlays/Devil_Kings_Frame.png"]),
    ("Border_with_Star", ["../Overlays/Devil_Kings_Frame.png", "../Overlays/Corner_Star.png"]),
    ("Border_with_Question", ["../Overlays/Devil_Kings_Frame.png", "../Overlays/Question_mark.png"]),
    
]

# Ensure output folders exist
for folder_name, _ in overlay_presets:
    folder_path = os.path.join(output_dir, folder_name)
    os.makedirs(folder_path, exist_ok=True)

def compose_and_save(base_image, overlays, output_path):
    composition = Image.new("RGBA", base_image.size, (0, 0, 0, 255))
    filled_base = Image.new("RGBA", base_image.size)
    filled_base.paste((0, 0, 0, 255), [0, 0, base_image.size[0], base_image.size[1]])
    filled_base.paste(base_image, (0, 0), base_image)
    composition.paste(filled_base, (0, 0))

    for overlay_path in overlays:
        if overlay_path:
            with Image.open(overlay_path) as overlay_image:
                composition.paste(overlay_image, (0, 0), overlay_image)

    composition.save(output_path)

# Process images
for file_name in os.listdir(generated_dir):
    if file_name.endswith(".png"):
        base_path = os.path.join(generated_dir, file_name)
        base_name = os.path.splitext(file_name)[0]
        with Image.open(base_path).convert("RGBA") as base_image:
            for folder_name, overlay_paths in overlay_presets:
                output_path = os.path.join(output_dir, folder_name, f"{base_name}_{folder_name}.png")
                compose_and_save(base_image, overlay_paths, output_path)

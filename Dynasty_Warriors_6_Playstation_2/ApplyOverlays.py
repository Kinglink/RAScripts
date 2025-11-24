#!/usr/bin/env python3

from PIL import Image
import os

generated_dir = "Generated"   # ✅ Walk full tree
output_dir = "Output"

overlay_presets = [
    ("Border_Only", ["../Overlays/DW3XL_DaleRedfield.png"])
]

# Ensure output folders exist
for folder_name, _ in overlay_presets:
    os.makedirs(os.path.join(output_dir, folder_name), exist_ok=True)


def unique_filename(path):
    """Return a unique file path if there's a collision."""
    if not os.path.exists(path):
        return path

    base, ext = os.path.splitext(path)
    counter = 1
    new_path = f"{base}_{counter}{ext}"

    while os.path.exists(new_path):
        counter += 1
        new_path = f"{base}_{counter}{ext}"

    print(f"⚠️  Filename collision, saving as: {os.path.basename(new_path)}")
    return new_path


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

    final_path = unique_filename(output_path)
    composition.save(final_path)


# ✅ Walk entire "Generated" directory tree
for root, _, files in os.walk(generated_dir):
    for file_name in files:
        if not file_name.lower().endswith(".png"):
            continue

        base_path = os.path.join(root, file_name)
        base_name = os.path.splitext(file_name)[0]

        with Image.open(base_path).convert("RGBA") as base_image:
            for folder_name, overlay_paths in overlay_presets:
                # flatten all outputs into Output/<preset>/
                out_dir = os.path.join(output_dir, folder_name)
                os.makedirs(out_dir, exist_ok=True)

                output_path = os.path.join(out_dir, f"{base_name}.png")
                compose_and_save(base_image, overlay_paths, output_path)


# ✅ Also flatten badges folder
badges_dir = "DaleRedfield Badges"
for root, _, files in os.walk(badges_dir):
    for file_name in files:
        if not file_name.lower().endswith(".png"):
            continue

        base_path = os.path.join(root, file_name)

        with Image.open(base_path).convert("RGBA") as base_image:
            for folder_name, overlay_paths in overlay_presets:
                out_dir = os.path.join(output_dir, folder_name)
                os.makedirs(out_dir, exist_ok=True)

                output_path = os.path.join(out_dir, file_name)
                compose_and_save(base_image, overlay_paths, output_path)

print("✅ Finished flattening + composing with overlays.")

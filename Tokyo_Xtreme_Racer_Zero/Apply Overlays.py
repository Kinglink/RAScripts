#!/usr/bin/env python3

from PIL import Image
import os

# Comment out any that you don't want. 
# Paths to the overlays
overlay_paths = {
    "Gold": "../Overlays/Gold Overlay.png",
    "Silver": "../Overlays/Silver Overlay.png",
    "Bronze": "../Overlays/Bronze Overlay.png",
    "No_Overlay": "../Overlays/No_Overlay.png",
    "":None,
#    "Red_No_Overlay": "../Overlays/Red_No_Overlay.png",
}

base_overlays = ["Gold", "Silver", "Bronze",""]

def apply_overlays_and_save(base_image, overlays, base_file_name, output_dir, with_no = False, with_red_no = False):
    for overlay_name, overlay_path in overlays.items():
        composition = Image.new("RGBA", base_image.size)
        composition.paste(base_image, (0, 0))
        if (with_no):
            noOverlay_image = Image.open(overlay_paths["No_Overlay"])
            composition.paste(noOverlay_image, (0, 0), noOverlay_image)
        if (with_red_no):
            redNoOverlay_image = Image.open(overlay_paths["Red_No_Overlay"])
            composition.paste(redNoOverlay_image, (0, 0), redNoOverlay_image)
        if(overlay_path):
            overlay_image = Image.open(overlay_path)
            composition.paste(overlay_image, (0, 0), overlay_image)
        
        # Save the composition
        output_filename = f"{base_file_name}_{overlay_name}.png"
        if (with_no):
            output_filename = f"{base_file_name}_{overlay_name}_with_no.png"
        if (with_red_no):
            output_filename = f"{base_file_name}_{overlay_name}_with_red_no.png"
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
        apply_overlays_and_save(base_image, {k: overlay_paths[k] for k in base_overlays}, base_file_name, output_dir)

        # Apply each overlay with an additional No_Overlay
        apply_overlays_and_save(base_image, {k: overlay_paths[k] for k in base_overlays}, base_file_name, output_dir, True)
        
        # Close the base image
        base_image.close()

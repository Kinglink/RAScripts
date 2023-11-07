from PIL import Image
import os

# Path to the sky background image
sky_background_path = "Generated/BlackBackground.png"  # Replace with the path to your sky background image

# Path to the gold overlay image
gold_overlay_path = "../Overlays/Gold Overlay.png"  # Replace with the path to your gold overlay image

# Directory containing item overlays
item_overlay_dir = "Generated/Items"

# Directory to save the final compositions
output_dir = "Output"

# Path to the bronze overlay image
bronze_overlay_path = "../Overlays/Bronze Overlay.png"  # Replace with the path to your bronze overlay image
# Path to the gold overlay image
common_items_path = "Generated/Items/Common Items.png"  # Replace with the path to your gold overlay image


# Open the sky background image, gold overlay, and bronze overlay
sky_background = Image.open(sky_background_path)
gold_overlay = Image.open(gold_overlay_path)
bronze_overlay = Image.open(bronze_overlay_path)
common_items_image = Image.open(common_items_path)

# Iterate through the images in the item overlay directory
for item_overlay_filename in os.listdir(item_overlay_dir):
    if item_overlay_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
        item_overlay_path = os.path.join(item_overlay_dir, item_overlay_filename)

        # Open the item overlay image
        item_overlay = Image.open(item_overlay_path)

        # Combine the images for the first composition (gold overlay)
        composition_gold = Image.new("RGBA", sky_background.size)
        composition_gold.paste(sky_background, (0, 0))
        composition_gold.paste(item_overlay, (0, 0), item_overlay)
        composition_gold.paste(gold_overlay, (0, 0), gold_overlay)

        # Generate the output file name, replacing spaces with underscores
        item_overlay_name = item_overlay_filename.replace(" ", "_")
        output_filename_gold = f"{item_overlay_name}_composition_gold.png"
        output_path_gold = os.path.join(output_dir, output_filename_gold)

        # Save the first composition with gold overlay
        composition_gold.save(output_path_gold)

# Combine the images for the second composition (bronze overlay)
composition_bronze = Image.new("RGBA", sky_background.size)
composition_bronze.paste(sky_background, (0, 0))
composition_bronze.paste(common_items_image, (0, 0), item_overlay)
composition_bronze.paste(bronze_overlay, (0, 0), bronze_overlay)

# Generate the output file name for the second composition, replacing spaces with underscores
output_filename_bronze = f"common_items_other_composition_bronze.png"
output_path_bronze = os.path.join(output_dir, output_filename_bronze)

# Save the second composition with bronze overlay
composition_bronze.save(output_path_bronze)
                

# Close the images
sky_background.close()
gold_overlay.close()
bronze_overlay.close()
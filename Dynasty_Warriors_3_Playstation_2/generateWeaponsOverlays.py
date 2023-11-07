from PIL import Image
import os

# Path to the sky background image
sky_background_path = "Generated/BlackBackground.png"  # Replace with the path to your sky background image

# Path to the gold overlay image
gold_overlay_path = "../Overlays/Gold Overlay.png"  # Replace with the path to your gold overlay image

# Directory containing item overlays
gold_weapons_overlay_dir = "Generated/Weapons/Gold"
silver_weapons_overlay_dir = "Generated/Weapons/Silver"

# Directory to save the final compositions
output_dir = "Output"

# Path to the bronze overlay image
silver_overlay_path = "../Overlays/Silver Overlay.png"  # Replace with the path to your bronze overlay image

# Open the sky background image, gold overlay, and bronze overlay
sky_background = Image.open(sky_background_path)
gold_overlay = Image.open(gold_overlay_path)
silver_overlay = Image.open(silver_overlay_path)

def weapon_generation(weapon_directory, overlay, suffix):
    # Iterate through the images in the item overlay directory
    for weapon_overlay_filename in os.listdir(weapon_directory):
        if weapon_overlay_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
            weapon_overlay_path = os.path.join(weapon_directory, weapon_overlay_filename)

            # Open the item overlay image
            item_overlay = Image.open(weapon_overlay_path)

            # Combine the images for the first composition (gold overlay)
            composition = Image.new("RGBA", sky_background.size)
            composition.paste(sky_background, (0, 0))
            composition.paste(item_overlay, (0, 0), item_overlay)
            composition.paste(overlay, (0, 0), overlay)

            # Generate the output file name, replacing spaces with underscores
            item_overlay_name = weapon_overlay_filename.replace(" ", "_")
            output_filename = f"{item_overlay_name}_composition_{suffix}.png"
            output_path = os.path.join(output_dir, output_filename)

            # Save the first composition with gold overlay
            composition.save(output_path)

weapon_generation(gold_weapons_overlay_dir, gold_overlay, "gold")
weapon_generation(silver_weapons_overlay_dir, silver_overlay, "silver")


# Close the images
sky_background.close()
gold_overlay.close()
silver_overlay.close()
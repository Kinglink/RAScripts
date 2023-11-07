from PIL import Image
import os

# Path to the sky background image
sky_background_path = "Generated/BlackBackground.png"  # Replace with the path to your sky background image

# Path to the gold overlay image
gold_overlay_path = "../Overlays/Gold Overlay.png"  # Replace with the path to your gold overlay image

# Path to the silver overlay image
silver_overlay_path = "../Overlays/Silver Overlay.png"  # Replace with the path to your silver overlay image

# Directory to save the final compositions
output_dir = "Output"

# Path to the class16 overlay image
class16_path = "Generated/Additional/Class 16.png"  # Replace with the path to your class16 overlay image

# Path to the thousand overlay image
thousand_path = "Generated/Additional/1000.png"  # Replace with the path to your thousand overlay image

# Path to the pacifist overlay image
pacifist_path = "Generated/Additional/pacifist.png"  # Replace with the path to your pacifist overlay image

diaochan_path = "Generated/Additional/DiaoChanCharacter.png"
food_path = "Generated/Additional/food.png"


# Open the sky background image, gold overlay, silver overlay, class16 overlay, thousand overlay, and pacifist overlay
sky_background = Image.open(sky_background_path)
gold_overlay = Image.open(gold_overlay_path)
silver_overlay = Image.open(silver_overlay_path)
class16_image = Image.open(class16_path)
thousand_image = Image.open(thousand_path)
pacifist_image = Image.open(pacifist_path)
diaochan_image = Image.open(diaochan_path)
food_image = Image.open(food_path)

# Combine the images for the first composition (class16 overlay)
composition_class16 = Image.new("RGBA", sky_background.size)
composition_class16.paste(sky_background, (0, 0))
composition_class16.paste(class16_image, (0, 0), class16_image)
composition_class16.paste(gold_overlay, (0, 0), gold_overlay)

# Generate the output file name for the first composition, replacing spaces with underscores
output_filename_class16 = "class_16_composition_gold.png"
output_path_class16 = os.path.join(output_dir, output_filename_class16)

# Save the first composition with gold overlay
composition_class16.save(output_path_class16)

# Combine the images for the second composition (thousand overlay)
composition_thousand = Image.new("RGBA", sky_background.size)
composition_thousand.paste(sky_background, (0, 0))
composition_thousand.paste(thousand_image, (0, 0), thousand_image)
composition_thousand.paste(gold_overlay, (0, 0), gold_overlay)

# Generate the output file name for the second composition, replacing spaces with underscores
output_filename_thousand = "thousand_composition_gold.png"
output_path_thousand = os.path.join(output_dir, output_filename_thousand)

# Save the second composition with gold overlay
composition_thousand.save(output_path_thousand)

# Combine the images for the third composition (pacifist overlay)
composition_pacifist = Image.new("RGBA", sky_background.size)
composition_pacifist.paste(sky_background, (0, 0))
composition_pacifist.paste(pacifist_image, (0, 0), pacifist_image)
composition_pacifist.paste(silver_overlay, (0, 0), silver_overlay)

# Generate the output file name for the third composition, replacing spaces with underscores
output_filename_pacifist = "pacifist_composition_silver.png"
output_path_pacifist = os.path.join(output_dir, output_filename_pacifist)

# Save the third composition with silver overlay
composition_pacifist.save(output_path_pacifist)

# Combine the images for the third composition (food overlay)
composition_food = Image.new("RGBA", sky_background.size)
composition_food.paste(sky_background, (0, 0))
composition_food.paste(food_image, (0, 0), food_image)
composition_food.paste(silver_overlay, (0, 0), silver_overlay)

# Generate the output file name for the third composition, replacing spaces with underscores
output_filename_food = "food_composition_silver.png"
output_path_food = os.path.join(output_dir, output_filename_food)

# Save the third composition with silver overlay
composition_food.save(output_path_food)


# Combine the images for the third composition (diaochan overlay)
composition_diaochan = Image.new("RGBA", sky_background.size)
composition_diaochan.paste(sky_background, (0, 0))
composition_diaochan.paste(diaochan_image, (0, 0), diaochan_image)

# Generate the output file name for the third composition, replacing spaces with underscores
output_filename_diaochan = "diaochan_composition.png"
output_path_diaochan = os.path.join(output_dir, output_filename_diaochan)

# Save the third composition with silver overlay
composition_diaochan.save(output_path_diaochan)

# Close the images
sky_background.close()
gold_overlay.close()
silver_overlay.close()
class16_image.close()
thousand_image.close()
pacifist_image.close()

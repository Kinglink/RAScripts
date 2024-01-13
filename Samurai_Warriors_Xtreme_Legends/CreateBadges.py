from PIL import Image
import os

def resize_and_apply_alpha_overlay(input_directory, overlay_path, output_directory):
    # Ensure the output directory exists
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Load the overlay image
    overlay_image = Image.open(overlay_path).convert("RGBA")

    # Process each PNG image in the input directory
    for input_image_name in os.listdir(input_directory):
        if input_image_name.lower().endswith('.png'):
            input_image_path = os.path.join(input_directory, input_image_name)
            
            # Resize the input image to 64x64
            input_image = Image.open(input_image_path)
            input_image = input_image.resize((64, 64), resample=Image.LANCZOS)

            # Apply the overlay
            result_image = Image.alpha_composite(input_image.convert("RGBA"), overlay_image.resize(input_image.size))

            # Save the result
            result_image_path = os.path.join(output_directory, input_image_name)
            result_image.save(result_image_path)

# Example usage
resize_and_apply_alpha_overlay("Clips", "../Overlays/Gold Overlay.png", "Output")

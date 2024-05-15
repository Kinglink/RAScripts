from PIL import Image
import os

def resize_apply_black_background_and_alpha_overlay(input_directory, overlay_path, output_directory, suffix=None):
    # Ensure the output directory exists
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Process each PNG image in the input directory
    for input_image_name in os.listdir(input_directory):
        if input_image_name.lower().endswith('.png'):
            input_image_path = os.path.join(input_directory, input_image_name)
            
            # Resize the input image to 64x64
            input_image = Image.open(input_image_path)
            input_image = input_image.resize((64, 64), resample=Image.LANCZOS)
            input_image_rgba = input_image.convert("RGBA")

            # Create a white background
            white_background = Image.new("RGBA", input_image.size, (255, 255, 255, 255))

            # Blend the white background with the input image using its alpha layer
            composite_image = Image.alpha_composite(white_background, input_image_rgba)

            # Define the new file name with suffix if provided
            if suffix:
                base_name = os.path.splitext(input_image_name)[0]
                new_file_name = f"{base_name}.png"
            else:
                new_file_name = input_image_name

            # Save the result
            result_image_path = os.path.join(output_directory, new_file_name)
            composite_image.save(result_image_path)

# Example usage
resize_apply_black_background_and_alpha_overlay("Generated", "../Overlays/Gold_Overlay.png", "Output", "Gold")

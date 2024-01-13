from PIL import Image
import os

def process_images(input_directory, output_directory):
    # Create the output directory if it does not exist
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    for filename in os.listdir(input_directory):
        if filename.endswith('.png'):
            file_path = os.path.join(input_directory, filename)
            with Image.open(file_path) as img:
                # Get image dimensions
                img_width, img_height = img.size

                # Processing for different sizes
                sizes = [(350,200), (640,440)]
                for width, height in sizes:
                    if img_width >= width and img_height >= height:
                        process_and_save(img, filename, output_directory, width, height)

def process_and_save(img, filename, output_directory, width, height):
    cropped_img = img.crop((0, 0, width, height))
    if cropped_img.mode == 'RGBA':
        # Update alpha channel
        r, g, b, a = cropped_img.split()
        a = a.point(lambda p: 255 if p < 255 else p)
        cropped_img = Image.merge('RGBA', (r, g, b, a))
    save_path = os.path.join(output_directory, filename.replace('.png', f'_{width}x{height}.png'))
    cropped_img.save(save_path)

# Replace 'your_input_directory_path' with the path to your directory containing the PNG images
# Replace 'your_output_directory_path' with the path to your directory where you want to save the processed images
process_images('SLUS-21080', 'Generated3')

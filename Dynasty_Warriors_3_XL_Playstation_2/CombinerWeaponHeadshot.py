from PIL import Image
import os

generated_dir = "Generated"
headshots_dir = "HeadshotsResized"
output_dir_32 = "GeneratedOverlay_32"
output_dir_20 = "GeneratedOverlay_20"

canvas_size_32 = (32, 32)
canvas_size_20 = (20, 20)

# Map Generated filename (weapon) to headshot filename (character)
overlay_mapping = {
    "Blue Steel": "Cao Cao",
    "Raven Feather": "Sima Yi",
    "Beast Axe": "Dian Wei",
    "Tempest Sword": "Xiahou Dun",
    "Dragon Star": "Liu Bei",
    "Divine Dragon": "Guan Yu",
    "Black Steel": "Dong Zhuo",
    "Demon Slayer": "Lu Bu",
    "Dragon God": "Zhang Liao",
    "Dragon Rapier": "Nu Wa",
    "Dragon Slayer": "Fu Xi",
    "Blue Grace": "Xiao Qiao",
    "Earthly Mace": "Xu Zhu",
    "Elder Moon": "Zhou Yu",
    "Fighting Tiger": "Lu Meng",
    "Flash Blade": "Lu Xun",
    "God of War": "Sun Ce",
    "Griffin Feather": "Zhuge Liang",
    "Half Moon Flute": "Zhen Ji",
    "Heavenly Wolf": "Sun Quan",
    "Imperial Mace": "Diao Chan",
    "Imperial Saber": "Yuan Shao",
    "Lightning Spear": "Ma Chao",
    "Lightning Staff": "Pang Tong",
    "Mystic Blade": "Huang Zhong",
    "Mystic Fang": "Xiahou Yuan",
    "Phoenix Talon": "Zhang He",
    "Serpent Blade": "Zhang Fei",
    "Seven Seas Blade": "Gan Ning",
    "Shadow Beast": "Meng Huo",
    "Spiked Mace": "Huang Gai",
    "Starlight Pike": "Jiang Wei",
    "Tempest Sword": "Xiahou Dun",
    "Thunder Staff": "Zhang Jiao",
    "Tiger Fang": "Xu Huang",
    "Tiger Wolf": "Taishi Ci",
    "Tri Blade": "Zhu Rong",
    "Twin Stars": "Wei Yan",
    "War Dragon": "Zhao Yun",
    "Wolf Blade": "Sun Jian",
    "Yellow Beauty": "Da Qiao"
}

def overlay_headshot(base_img_path, headshot_name, size, output_path):
    base_img = Image.open(base_img_path).convert("RGBA")
    headshot_path = os.path.join(headshots_dir, headshot_name + ".png")
    if not os.path.exists(headshot_path):
        print(f"Headshot not found: {headshot_path}")
        return

    headshot = Image.open(headshot_path).convert("RGBA")
    headshot = headshot.resize(size, Image.LANCZOS)

    # Paste headshot in bottom-left corner
    position = (0, base_img.height - size[1])
    base_img.paste(headshot, position, headshot)

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    base_img.save(output_path)

for base_filename in os.listdir(generated_dir):
    name, ext = os.path.splitext(base_filename)
    if name in overlay_mapping:
        base_path = os.path.join(generated_dir, base_filename)
        headshot_name = overlay_mapping[name]

        # 32x32 version
        output_path_32 = os.path.join(output_dir_32, base_filename)
        overlay_headshot(base_path, headshot_name, canvas_size_32, output_path_32)

        # 20x20 version
        output_path_20 = os.path.join(output_dir_20, base_filename)
        overlay_headshot(base_path, headshot_name, canvas_size_20, output_path_20)

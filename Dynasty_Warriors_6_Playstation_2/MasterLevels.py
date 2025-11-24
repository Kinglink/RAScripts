import os
from PIL import Image

# Folders
stage_folder = "Intermediates/Tinted_Stages"           # stage images
character_folder = "Intermediates/Characters"
output_folder = "Output"
os.makedirs(output_folder, exist_ok=True)

# Image sizes
BG_SIZE = (64, 64)
CHAR_SIZE = (32, 32)
PADDING = 0  # optional padding from bottom-right

# Load the Musou stage list you made
achievement_master_stages = {
    # --- Wei ---
    "Xu_Zhu": ["Battle_of_He_Fei"],                   # Iron Fist of Wei
    "Xiahou_Yuan": ["Battle_of_Mt._Ding_Jun"],        # DingJun Assault
    "Xu_Huang": ["Battle_of_Jie_Ting"],               # Jie Ting Siege
    "Cao_Ren": ["Battle_of_He_Fei"],                  # Iron Wall of Hefei

    # --- Wu ---
    "Lu_Meng": ["Battle_of_He_Fei"],                  # River Phantom (Sun Jian’s forces but same map)
    "Huang_Gai": ["Battle_of_Chi_Bi"],                # Flame of Chi Bi
    "Zhou_Tai": ["Conquest_of_Wu"],                   # Sun Ce's Vanguard
    "Sun_Ce": ["Conquest_of_Wu"],                     # Conquerer's Glory
    "Sun_Quan": ["Battle_of_He_Fei_Castle"],          # Wu's Brightest Sun

    # --- Shu ---
    "Huang_Zhong": ["Battle_of_Mt._Ding_Jun"],        # Iron Archer of Shu
    "Wei_Yan": ["Battle_of_Wu_Zhang_Plains"],         # Candle in the Wind
    "Guan_Ping": ["Battle_of_Fan_Castle"],            # Shadow of the Castle
    "Pang_Tong": ["Pacification_of_Cheng_Du"],        # Cunning Strike

    # --- Others / Special ---
    "Dong_Zhuo": ["Battle_of_HuLaoGate"],             # Hulao Horror
    "Yuan_Shao": ["Battle_of_Guan_Du"],               # The Northern Lion
    "Zhang_Jiao": ["Battle_of_Wu_Zhang_Plains"],      # Heaven's Fury
    "Zhen_Ji": ["Invasion_of_Xu_Chang"],              # Wu's Nightingale
    "Xiao_Qiao": ["Battle_of_Shi_Ting"],              # Veil of Grace
}



# Function to resize and crop center
def shrink_and_center(img, target_height):
    w, h = img.size
    scale = target_height / h
    new_w = int(w * scale)
    img = img.resize((new_w, target_height), Image.LANCZOS)

    # Crop center horizontally if needed
    left = max((new_w - target_height) // 2, 0)
    right = left + target_height
    img_cropped = img.crop((left, 0, right, target_height))
    return img_cropped

# Processing loop
for char_name, stages in achievement_master_stages.items():
    char_path = os.path.join(character_folder, f"{char_name}.png")
    if not os.path.exists(char_path):
        print(f"Missing character image: {char_name}")
        continue

    char_img_orig = Image.open(char_path).convert("RGBA")
    char_img = shrink_and_center(char_img_orig, 32)

    # --- Normal & Master (last stage only) ---
    for suffix, stage_index in [("Master", -1)]:
        stage_name = stages[stage_index]
        stage_path = os.path.join(stage_folder, f"{stage_name}_{suffix}.png")
        if not os.path.exists(stage_path):
            print(f"Missing stage image: {stage_name}_{suffix}")
            continue

        stage_img_orig = Image.open(stage_path).convert("RGBA")
        stage_img = shrink_and_center(stage_img_orig, 64)

        # Paste character in lower-left
        stage_img.paste(char_img, (0, 64 - 32), char_img)

        # Save
        out_name = f"{char_name}_{suffix}.png"
        stage_img.save(os.path.join(output_folder, out_name))

print("✅ Finished processing all images!")
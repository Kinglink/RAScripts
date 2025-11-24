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
musou_stages = {
    # --- Shu ---
    "Zhao_Yun": [
        "Battle_of_HuLaoGate",
        "Battle_of_Chang_Ban",
        "Pacification_of_Cheng_Du",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Yi_Ling",
        "Battle_of_Han_Zhong"
    ],
    "Guan_Yu": [
        "Yellow_Turban",
        "Battle_of_HuLaoGate",
        "Battle_of_Guan_Du",
        "Battle_of_Chi_Bi",
        "Battle_of_Fan_Castle",
        "Battle_of_Wu_Zhang_Plains"
    ],
    "Zhang_Fei": [
        "Yellow_Turban",
        "Battle_of_Xia_Pi",
        "Campaign_Against_Yuan_Shu",
        "Battle_of_Chang_Ban",
        "Battle_of_Yi_Ling",
        "Battle_of_Han_Zhong"
    ],
    "Zhuge_Liang": [
        "Battle_of_Chang_Ban",
        "Battle_of_Chi_Bi",
        "Pacification_of_Cheng_Du",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Yi_Ling",
        "Battle_of_Wu_Zhang_Plains"
    ],
    "Liu_Bei": [
        "Yellow_Turban",
        "Campaign_Against_Yuan_Shu",
        "Battle_of_Chang_Ban",
        "Pacification_of_Cheng_Du",
        "Battle_of_Yi_Ling",
        "Battle_of_Wu_Zhang_Plains"
    ],

    # --- Wei ---
    "Xiahou_Dun": [
        "Battle_of_HuLaoGate",
        "Battle_of_Xia_Pi",
        "Battle_of_Guan_Du",
        "Battle_of_Chang_Ban",
        "Battle_of_He_Fei",
        "Battle_of_Wu_Zhang_Plains"
    ],
    "Dian_Wei": [
        "Yellow_Turban",
        "Battle_of_Guan_Du",
        "Battle_of_Chang_Ban",
        "Battle_of_Chi_Bi",
        "Battle_of_Fan_Castle",
        "Battle_of_He_Fei_Castle"
    ],
    "Sima_Yi": [
        "Battle_of_Chi_Bi",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Fan_Castle",
        "Battle_of_Han_Zhong",
        "Battle_of_Wu_Zhang_Plains",
        "Invasion_of_Xu_Chang"
    ],
    "Zhang_Liao": [
        "Battle_of_Guan_Du",
        "Battle_of_Chang_Ban",
        "Battle_of_Chi_Bi",
        "Battle_of_He_Fei",
        "Battle_of_Shi_Ting",
        "Battle_of_He_Fei_Castle"
    ],
    "Cao_Cao": [
        "Battle_of_HuLaoGate",
        "Battle_of_Guan_Du",
        "Battle_of_Chi_Bi",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Shi_Ting",
        "Battle_of_Wu_Zhang_Plains"
    ],

    # --- Wu ---
    "Lu_Xun": [
        "Invasion_of_Xu_Chang",
        "Battle_of_Jing_Province",
        "Battle_of_Fan_Castle",
        "Battle_of_Yi_Ling",
        "Battle_of_Shi_Ting",
        "Battle_of_He_Fei_Castle"
    ],
    "Zhou_Yu": [
        "Battle_of_HuLaoGate",
        "Conquest_of_Wu",
        "Invasion_of_Xu_Chang",
        "Battle_of_Chi_Bi",
        "Battle_of_Jing_Province",
        "Battle_of_Yi_Ling"
    ],
    "Sun_Shang_Xiang": [
        "Conquest_of_Wu",
        "Invasion_of_Xu_Chang",
        "Battle_of_Chi_Bi",
        "Pacification_of_Cheng_Du",
        "Battle_of_Yi_Ling",
        "Battle_of_He_Fei_Castle"
    ],
    "Gan_Ning": [
        "Battle_of_Chi_Bi",
        "Battle_of_Jing_Province",
        "Battle_of_He_Fei",
        "Battle_of_Fan_Castle",
        "Battle_of_Shi_Ting",
        "Battle_of_He_Fei_Castle"
    ],
    "Sun_Jian": [
        "Yellow_Turban",
        "Battle_of_HuLaoGate",
        "Battle_of_Xia_Pi",
        "Battle_of_Jing_Province",
        "Battle_of_Fan_Castle",
        "Battle_of_He_Fei"
    ],

    # --- Other ---
    "Diao_Chan": [
        "Battle_of_Xia_Pi",
        "Battle_of_He_Fei",
        "Battle_of_Jing_Province",
        "Battle_of_Han_Zhong",
        "Battle_of_Fan_Castle",
        "Battle_of_Han_Zhong"
    ],
    "Lu_Bu": [
        "Battle_of_Xia_Pi",
        "Battle_of_Guan_Du",
        "Battle_of_Shi_Ting",
        "Battle_of_Chi_Bi",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_HuLaoGate"
    ],
    "Ma_Chao": [
        "Battle_of_Tong_Gate",
        "Pacification_of_Cheng_Du",
        "Battle_of_Jing_Province",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Yi_Ling",
        "Battle_of_Jie_Ting"
    ],
    "Yue_Ying": [
        "Battle_of_Chang_Ban",
        "Battle_of_Chi_Bi",
        "Battle_of_Jing_Province",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Han_Zhong",
        "Battle_of_Wu_Zhang_Plains"
    ],
    "Zhang_He": [
        "Battle_of_Guan_Du",
        "Battle_of_Chi_Bi",
        "Battle_of_Mt._Ding_Jun",
        "Battle_of_Han_Zhong",
        "Battle_of_Jie_Ting",
        "Battle_of_Wu_Zhang_Plains"
    ],
    "Cao_Pi": [
        "Battle_of_Xia_Pi",
        "Struggle_at_He_Bei",
        "Battle_of_Fan_Castle",
        "Battle_of_Shi_Ting",
        "Battle_of_Wu_Zhang_Plains",
        "Invasion_of_Xu_Chang"
    ],
    "Taishi_Ci": [
        "Yellow_Turban",
        "Battle_of_Jiang_Dong",
        "Battle_of_Xia_Pi",
        "Invasion_of_Xu_Chang",
        "Battle_of_He_Fei",
        "Battle_of_Fan_Castle"
    ],
    "Ling_Tong": [
        "Battle_of_Chi_Bi",
        "Battle_of_Jing_Province",
        "Battle_of_He_Fei",
        "Battle_of_Ru_Xu_Kou",
        "Battle_of_Fan_Castle",
        "Battle_of_Yi_Ling"
    ]
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
for char_name, stages in musou_stages.items():
    char_path = os.path.join(character_folder, f"{char_name}.png")
    if not os.path.exists(char_path):
        print(f"Missing character image: {char_name}")
        continue

    char_img_orig = Image.open(char_path).convert("RGBA")
    char_img = shrink_and_center(char_img_orig, 32)

    # --- Normal & Master (last stage only) ---
    for suffix, stage_index in [("Normal", -1), ("Master", -1)]:
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

    # --- Chaos (all stages, suffix Chaos) ---
    for stage_index, stage_name in enumerate(stages):
        stage_path = os.path.join(stage_folder, f"{stage_name}_Chaos.png")
        if not os.path.exists(stage_path):
            print(f"Missing Chaos stage image: {stage_name}_Chaos")
            continue

        stage_img_orig = Image.open(stage_path).convert("RGBA")
        stage_img = shrink_and_center(stage_img_orig, 64)

        # Paste character in lower-left
        stage_img.paste(char_img, (0, 64 - 32), char_img)

        # Save
        out_name = f"{char_name}_Chaos_{stage_index + 1}_{stage_name}.png"
        stage_img.save(os.path.join(output_folder, out_name))

print("✅ Finished processing all images!")
// Dynasty Warriors: Gundam 2
// #ID = 20794

// Helper function 
function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// DATA TAGS
ID = "ID"
NAME = "ACHIEVEMENT_NAME"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
MISSIONS = "MISSIONS"
CHARACTER = "CHARACTER"
SUIT = "SUIT"
HALF_NAME = "HALF_NAME"
FULL_NAME = "FULL_NAME"
HALF_DESCRIPTION = "HALF_DESCRIPTION"
FULL_DESCRIPTION = "FULL_DESCRIPTION"
HALF_POINTS = "HALF_POINTS"
FULL_POINTS = "FULL_POINTS"
UNLOCK = "UNLOCK"
PARTS = "PARTS"

AMURO_RAY = 0x00
CHAR_AZNABLE = 0x01
KAMILLE_BIDAN = 0x02
PAPTIMUS_SCIROCCO = 0x03
HAMAN_KARN = 0x04
JUDAU_ASHTA = 0x05
DOMON_KASSHU = 0x06
MASTER_ASIA = 0x07
HEERO_YUY = 0x08
MILLIARDO_PEACECRAFT = 0x09
LORAN_CEHACK = 0x0a
EMMA_SHEEN = 0x0b
JERID_MESSA = 0x0c
ELPEO_PURU = 0x0d
PURU_TWO = 0x0e
ROUX_LOUKA = 0x0f
KIRA_YAMATO = 0x10
ATHRUN_ZALA = 0x11
SHINN_ASUKA = 0x12
SEABOOK_ARNO = 0x13
USO_EWIN = 0x14
KAI_SHIDEN = 0x15
HAYATO_KOBAYASHI = 0x16
M_QUVE = 0x17
RAMBA_RAL = 0x18
YAZAN_GABLE = 0x19
SARAH_ZABIAROV = 0x1a
RECCOA_LONDE = 0x1b
GLEMY_TOTO = 0x1c
QUESS_PARAYA = 0x1d
GYUNEI_GUSS = 0x1e
DOZLE_ZABI = 0x1f
SLEGGAR_LAW = 0x20
FOUR_MURASAME = 0x21
ROSAMIA_BADAM = 0x22
GYM_GHINGHAM = 0x23
LACUS_CLYNE = 0x24
LUNAMARIA_HAWKE = 0x25
CECILY_FAIRCHILD = 0x26
KATEJINA_LOOS = 0x27
JOHNNY_RIDDEN = 0x28
FA_YUIRY = 0x29
LALAH_SUNE = 0x2a
GAIA = 0x2b
ORTEGA = 0x2c
MASH = 0x2d
ROBERTO = 0x2e
APOLLY_BAY = 0x2f
KACRICON_CACOOLER = 0x30
DUNKEL_COOPER = 0x31
RAMSUS_HASR = 0x32
BEECHA_OLEG = 0x33
ELLE_VIANNO = 0x34
REZIN_SCHNYDER = 0x35
KAYRA_SU = 0x36
CHAN_AGI = 0x37
HATHAWAY_NOA = 0x38
KYOJI_KASSHU = 0x39
CROWN = 0x3a
BRIGHT_NOA = 0x3b
FRAW_BOW = 0x3c
KYCILIA_ZABI = 0x3d
TORRES = 0x3e
HENKEN_BEKKENER = 0x3f
RAIN_MIKAMURA = 0x40
NANAI_MIGUEL = 0x41
LEINA_ASHTA = 0x42
ASTONAIGE_MEDOZ = 0x43
GIHREN_ZABI = 0x44
BASK_OM = 0x45
RELENA_DARLIAN = 0x46
DIANNA_SORIEL = 0x47

FIRST_CHARACTER_INDEX = AMURO_RAY
FINAL_SELECTABLE_CHARACTER_INDEX = KATEJINA_LOOS
FINAL_CHARACTER_INDEX = DIANNA_SORIEL

characterList = 
{
    AMURO_RAY: "Amuro Ray",
    CHAR_AZNABLE: "Char Aznable",
    KAMILLE_BIDAN: "Kamille Bidan",
    PAPTIMUS_SCIROCCO: "Paptimus Scirocco",
    HAMAN_KARN: "Haman Karn",
    JUDAU_ASHTA: "Judau Ashta",
    DOMON_KASSHU: "Domon Kasshu",
    MASTER_ASIA: "Master Asia",
    HEERO_YUY: "Heero Yuy",
    MILLIARDO_PEACECRAFT: "Milliardo Peacecraft",
    LORAN_CEHACK: "Loran Cehack",
    EMMA_SHEEN: "Emma Sheen",
    JERID_MESSA: "Jerid Messa",
    ELPEO_PURU: "Elpeo Puru",
    PURU_TWO: "Puru Two",
    ROUX_LOUKA: "Roux Louka",
    KIRA_YAMATO: "Kira Yamato",
    ATHRUN_ZALA: "Athrun Zala",
    SHINN_ASUKA: "Shinn Asuka",
    SEABOOK_ARNO: "Seabook Arno",
    USO_EWIN: "Uso Ewin",
    KAI_SHIDEN: "Kai Shiden",
    HAYATO_KOBAYASHI: "Hayato Kobayashi",
    M_QUVE: "M'Quve",
    RAMBA_RAL: "Ramba Ral",
    YAZAN_GABLE: "Yazan Gable",
    SARAH_ZABIAROV: "Sarah Zabiarov",
    RECCOA_LONDE: "Reccoa Londe",
    GLEMY_TOTO: "Glemy Toto",
    QUESS_PARAYA: "Quess Paraya",
    GYUNEI_GUSS: "Gyunei Guss",
    DOZLE_ZABI: "Dozle Zabi",
    SLEGGAR_LAW: "Sleggar Law",
    FOUR_MURASAME: "Four Murasame",
    ROSAMIA_BADAM: "Rosamia Badam",
    GYM_GHINGHAM: "Gym Ghingham",
    LACUS_CLYNE: "Lacus Clyne", // Final playable. 
    LUNAMARIA_HAWKE: "Lunamaria Hawke",
    CECILY_FAIRCHILD: "Cecily Fairchild",
    KATEJINA_LOOS: "Katejina Loos",
    JOHNNY_RIDDEN: "Johnny Ridden",
    FA_YUIRY: "Fa Yuiry",
    LALAH_SUNE: "Lalah Sune",
    GAIA: "Gaia",
    ORTEGA: "Ortega",
    MASH: "Mash",
    ROBERTO: "Roberto",
    APOLLY_BAY: "Apolly Bay",
    KACRICON_CACOOLER: "Kacricon Cacooler",
    DUNKEL_COOPER: "Dunkel Cooper",
    RAMSUS_HASR: "Ramsus Hasr",
    BEECHA_OLEG: "Beecha Oleg",
    ELLE_VIANNO: "Elle Vianno",
    REZIN_SCHNYDER: "Rezin Schnyder",
    KAYRA_SU: "Kayra Su",
    CHAN_AGI: "Chan Agi",
    HATHAWAY_NOA: "Hathaway Noa",
    KYOJI_KASSHU: "Kyoji Kasshu",
    CROWN: "Crown",
    BRIGHT_NOA: "Bright Noa",
    FRAW_BOW: "Fraw Bow",
    KYCILIA_ZABI: "Kycilia Zabi",
    TORRES: "Torres",
    HENKEN_BEKKENER: "Henken Bekkener",
    RAIN_MIKAMURA: "Rain Mikamura",
    NANAI_MIGUEL: "Nanai Miguel",
    LEINA_ASHTA: "Leina Ashta",
    ASTONAIGE_MEDOZ: "Astonaige Medoz",
    GIHREN_ZABI: "Gihren Zabi",
    BASK_OM: "Bask Om",
    RELENA_DARLIAN: "Relena Darlian",
    DIANNA_SORIEL: "Dianna Soriel"
}

characterShortNameLookup = 
{
    AMURO_RAY: "Amuro",
    CHAR_AZNABLE: "Char",
    KAMILLE_BIDAN: "Kamille",
    JUDAU_ASHTA: "Judau"
    
}

missionNameLookup =
{
    0x00: "Re-entry to Earth",
    0x01: "The Battle of Odessa",
    0x02: "Tragedy in Jaburo",
    0x03: "Big Zam's Last Stand",
    0x04: "The Duel in Texas",
    0x05: "A Cosmic Glow",
    0x06: "Space Fortress: A Baoa Qu",
    0x07: "Luna 2 Surrenders: Axis Accelerates",
    0x08: "Londo Bell Reacts: Axis Falls",
    0x09: "Re-entry to Earth",
    0x0A: "The Duel in Texas",
    0x0B: "A Cosmic Glow",
    0x0C: "Re-entry to Earth (Redux)",
    0x0D: "Winds of Jaburo",
    0x0E: "The Storm over Kilimanjaro",
    0x0F: "Run through the Cosmos",
    0x10: "Enemy Encounter at 5th Luna",
    0x11: "Luna 2 Surrenders: Axis Accelerates",
    0x12: "Londo Bell Reacts: Axis Falls",
    0x13: "Re-entry to Earth",
    0x14: "Winds of Jaburo",
    0x15: "Hong Kong city",
    0x16: "Cinderella Four",
    0x17: "The Storm over Kilimanjaro",
    0x18: "Scirocco Steps Forward",
    0x19: "The Mirror of Rosamia",
    0x1A: "Run through the Cosmos",
    0x1B: "The Burning Earth",
    0x1C: "Puru Two in Gravity",
    0x1D: "Vibration",
    0x1E: "Warriors Again (Prelude)",
    0x1F: "Warriors Again (Epilogue)",
    0x20: "Psycoframe Light",
    0x21: "Wings of Life",
    0x22: "The Fist That Hopes to Grasp Victory",
    0x23: "Guiding Light to the Future",
    0x24: "Will Makes Miracles Happen",
    0x25: "Char's Will",
    0x26: "A Unique Man",
    0x27: "A Vision of Lalah",
    0x28: "The Power of a Newtype",
    0x29: "Char, The Red Comet",
    0x2A: "What’s Wrong with Kamille Being a Man’s Name?",
    0x2B: "This Is Why!",
    0x2C: "You Aren't So Special!",
    0x2D: "I'll Show All of You!",
    0x2E: "This Isn’t a Game to Me!",
    0x2F: "Departure",
    0x30: "The Threat of the Tomboy",
    0x31: "Broken Bonds",
    0x32: "To the Gravity Well",
    0x33: "Scirocco Lands on Earth",
    0x34: "Concord",
    0x35: "Ideal",
    0x36: "Thought",
    0x37: "Sympathy",
    0x38: "Glory",
    0x39: "Sanc Kingdom Knight",
    0x3A: "Fabricated Bloodline, Destiny Plan",
    0x3B: "2500 Years of Samurai Family History",
    0x3C: "Rise up! Hail Zeon!",
    0x3D: "A World Without Friend or Foe",
    0x3E: "Domon Kasshu, Surpass your Master!",
    0x3F: "Proof of Friendship",
    0x40: "I'll Speak with My Fists!",
    0x41: "Master Asia Dies at Dawn?",
    0x42: "Teacher and Pupil Bond! Last Fight Tears",
    0x43: "Punishment at Jaburo",
    0x44: "Love Megapunch",
    0x45: "Cute Fighter Girl",
    0x46: "Fist of Tears Explodes",
    0x47: "Master Asia's Name",
    0x48: "Those Who Oppose War",
    0x49: "Those Who Seek Battle",
    0x4A: "Those Who Seek to be Rescued",
    0x4B: "Those Who Face Disaster",
    0x4C: "Those Who Guide Us to Peace",
    0x4D: "Chivalry Is Bravery",
    0x4E: "Chivalry Is Fairness",
    0x4F: "Chivalry Is Devotion",
    0x50: "Chivalry Is Courage",
    0x51: "Chivalry Is Politeness",
    0x52: "Brothers Reunited",
    0x53: "Winds of Battle",
    0x54: "Coexistence with Others",
    0x55: "As the People of the Moon",
    0x56: "Preserving the Species",
    0x57: "Atmospheric Combat",
    0x58: "Fighting Giant Enemies",
    0x59: "Special Soldier Gundam",
    0x5A: "One Year War: Operation Star One",
    0x5B: "Colony Laser Duel",
    0x5C: "Predestination",
    0x5D: "Prison Break",
    0x5E: "The Discipline of a Soldier",
    0x5F: "Torn Between Bond and Trust",
    0x60: "Day of Decision",
    0x61: "Desperate Courage",
    0x62: "Perplexed Girl",
    0x63: "Never-ending Conflict",
    0x64: "Discord",
    0x65: "Red and Black",
    0x66: "Menace on the Battlefield",
    0x67: "Hearts Passing By",
    0x68: "Irritation",
    0x69: "Skies of Confusion",
    0x6A: "Red and Black",
    0x6B: "Double Zeta, Run Away!",
    0x6C: "The Valley of the Iceberg",
    0x6D: "Judau, Come out!",
    0x6E: "You're So Stubborn",
    0x6F: "Time to Find Out! Lover, Friend, Rival?",
    0x70: "The Fight to End All Fights",
    0x71: "Tears on the Battlefield",
    0x72: "Peace Singing Singstress",
    0x73: "Fighting Breeds More Fighting",
    0x74: "A Future Before the Battle",
    0x75: "In the Sandstorm",
    0x76: "Deathmatch at Killmanjaro",
    0x77: "Freedom, Justice and Truth",
    0x78: "Gates to a New World",
    0x79: "Crimson Soaked Cosmos",
    0x7A: "Eternal Conflict",
    0x7B: "An Era Without Light",
    0x7C: "Contradicting Justice",
    0x7D: "World in Peace",
    0x7E: "Eternal Fate",
    0x7F: "MAYDAY",
    0x80: "A Child Lost in the Universe",
    0x81: "White Fang",
    0x82: "Miracle Encounter",
    0x83: "Ghost of Disturbance",
    0x84: "Humankind Despairs",
    0x85: "Time Passes Remorselessly",
    0x86: "Boys and Girls from the Battlefield",
    0x87: "Beyond the Time",
    0x88: "Connecting Many Lives",
    0x89: "Heroes of the One Year War 1",
    0x8A: "Heroes of the One Year War 2",
    0x8B: "M'Quve's Vase",
    0x8C: "A Soldier's Heart",
    0x8D: "The General and the Beast (Yazan)",
    0x8E: "Frontline Beast",
    0x8F: "The General and the Beast (Gym)",
    0x90: "For the Loved One",
    0x91: "Farewell, Loved One",
    0x92: "Infiltration in Jupritis",
    0x93: "Too Much of a Woman",
    0x94: "Attracted By the Scent of Flowers",
    0x95: "Goodbye Days of Youth",
    0x96: "Newtype Playground",
    0x97: "Gyunei's Ambition 1",
    0x98: "Gyunei's Ambition 2",
    0x99: "The Prestige of the Zabi Family 1",
    0x9A: "The Prestige of the Zabi Family 1",  // This is correct.
    0x9B: "Sleggar and the Return to Jupiter",
    0x9C: "Sleggar and the Cyber-Newtype",
    0x9D: "Sleggar and the Lovers",
    0x9E: "Sleggar and the Scary Woman",
    0x9F: "Sleggar and the Red Comet",
    0xA0: "Spellbound",
    0xA1: "Brothers and Sisters",
    0xA2: "Find the Songstress",
    0xA3: "Friend Yesterday, Enemy Today?",
    0xA4: "Private Lesson",
    0xA5: "A Future for Two",
    0xA6: "Beautiful Face",
    0xA7: "Younger Boy",
    0xA8: "Piloting Practice",
    0xA9: "Beginner Battle Drill - Surface",
    0xAA: "Beginner Battle Drill - Space",
    0xAB: "Intermediate Battle Drill - Surface",
    0xAC: "Intermediate Battle Drill - Space",
    0xAD: "Advanced Battle Drill - Surface",
    0xAE: "Advanced Battle Drill - Space",
    0xAF: "1,000 Shot Down Enemies",
    0xB0: "5,000 Shot Down Enemies",
    0xB1: "10,000 Shot Down Enemies",
    0xB2: "20,000 Shot Down Enemies",
    0xB3: "30,000 Shot Down Enemies",
    0xB4: "40,000 Shot Down Enemies",
    0xB5: "50,000 Shot Down Enemies",
    0xB6: "10 Completed Missions",
    0xB7: "50 Completed Missions",
    0xB8: "100 Completed Missions",
    0xB9: "200 Total Completed Missions",
    0xBA: "300 Total Completed Missions",
    0xBB: "Forced Evolution",
    0xBC: "Human Reform",
    0xBD: "Char's Challenge",
    0xBE: "Soldier's Battlefield 1",
    0xBF: "Soldier's Battlefield 2",
    0xC0: "Soldier's Battlefield 3",
    0xC1: "Soldier's Battlefield 4",
    0xC2: "Black Tetra-Stars 1",
    0xC3: "Black Tetra-Stars 2",
    0xC4: "A Veteran's Deed 1",
    0xC5: "A Veteran's Deed 2",
    0xC6: "The Fourth Yazan Crewman 1",
    0xC7: "The Fourth Yazan Crewman 2",
    0xC8: "Remember the Past 1",
    0xC9: "Remember the Past 2",
    0xCA: "Remember the Past 3",
    0xCB: "Remember the Past 4",
    0xCC: "Remember the Past 5",
    0xCD: "Remember the Past 6",
    0xCE: "Remember the Past 7",
    0xCF: "The Monster of Zeon",
    0xD0: "Heroes of the Federation",
    0xD1: "The Messenger From Axis",
    0xD2: "Mass Production Gundam?",
    0xD3: "This Is No Zaku, My Friend!",
    0xD4: "Giant Revealed",
    0xD5: "For the Glory of Zeon!",
    0xD6: "Guardians of Nature",
    0xD7: "Under Neo Zeon's Flag",
    0xD8: "Jet Stream Attack!",
    0xD9: "Soaring Dragon",
    0xDA: "A.E.U.G's Pride",
    0xDB: "Knights of the Principality",
    0xDC: "The Genius from Jupritis",
    0xDD: "Coming from Underwater",
    0xDE: "Women's War",
    0xDF: "Hunter",
    0xE0: "Z Gundam Returns",
    0xE1: "Char Collection",
    0xE2: "Red Tri-Stars?",
    0xE3: "Jerid's Soul Pilgrimage",
    0xE4: "The Snake and the Spider",
    0xE5: "Ultimate Brothers",
    0xE6: "Zaku Lover's Club 1",
    0xE7: "Zaku Lover's Club 2",
    0xE8: "Qubeley Storm",
    0xE9: "Solo in Red 1",
    0xEA: "Solo in Red 2",
    0xEB: "The Path to Legend 1",
    0xEC: "The Path to Legend 2",
    0xED: "Red Comet's Glory 1",
    0xEE: "Red Comet's Glory 2",
    0xEF: "Legendary Successor 1",
    0xF0: "Legendary Successor 2",
    0xF1: "A Hundred Years' Radiance 1",
    0xF2: "A Hundred Years' Radiance 2",
    0xF3: "Zeta's Pulse 1",
    0xF4: "Zeta's Pulse 2",
    0xF5: "God's Will",
    0xF6: "Axis' Mother Nature",
    0xF7: "The Ultimate Power 1",
    0xF8: "The Ultimate Power 2",
    0xF9: "Battle Girl",
    0xFA: "The Strongest Gundam 1",
    0xFB: "The Strongest Gundam 2",
    0xFC: "Crimson Rebels 1",
    0xFD: "Crimson Rebels 2",
    0xFE: "Formula Program",
    0xFF: "Gundam Calls Victory",
    0x100: "The Fist Dwelling God",
    0x101: "The Practitioner's Teachings",
    0x102: "Give Me Your Wings",
    0x103: "Path to the Future",
    0x104: "The Legacy of the Dark History",
    0x105: "The Messenger of Freedom",
    0x106: "Sword of Justice",
    0x107: "Fate Connection",
    0x108: "Aratama",
    0x109: "Nigitama",
    0x10A: "Good Luck, Loser!",
    0x10B: "Just Wanted to Get Along...",
    0x10C: "Hedgehog's Dilemma",
    0x10D: "Love Duel",
    0x10E: "Love Special Attack!",
    0x10F: "Boys, Be Ambitious",
    0x110: "Women Who Look Good Armed",
    0x111: "Voices of the Young",
    0x112: "Last Generation",
    0x113: "Coward! 1",
    0x114: "Coward! 2",
    0x115: "Hayato's Request",
    0x116: "Kycilia's Secret Request",
    0x117: "Dozle's Secret Request",
    0x118: "Yazan's Crew Test",
    0x119: "Sarah Might Forgive You, but I Won’t!",
    0x11A: "Glemy's Ambition",
    0x11B: "Gyunei's Rescue",
    0x11C: "Sleggar's Final Attack",
    0x11D: "Things to Protect",
    0x11E: "Devil Machine",
    0x11F: "Ghingham's Big Comeback",
    0x120: "Do You Love Super Aces?",
    0x121: "I Can Hear Your Song",
    0x122: "Power in Hand 1",
    0x123: "Power in Hand 2",
    0x124: "Earth Domination 1",
    0x125: "Earth Domination 2",
    0x126: "Earth Domination 3",
    0x127: "Eternal Comet",
    0x128: "Earth Conquest 1",
    0x129: "Earth Conquest 2",
    0x12A: "Earth Conquest 3",
    0x12B: "Char's Offering",
    0x12C: "Freedom to Space 1",
    0x12D: "Freedom to Space 2",
    0x12E: "Freedom to Space 3",
    0x12F: "The Earth is my Birthplace 1",
    0x130: "The Earth is my Birthplace 2",
    0x131: "The Earth is my Birthplace 3",
    0x132: "Cold Machiavellian",
    0x133: "Faith 1",
    0x134: "Faith 2",
    0x135: "Freedom to Space 4",
    0x136: "Freedom to Space 5",
    0x137: "Junk Dealers 1",
    0x138: "Junk Dealers 2",
    0x139: "Stop Acting Like That, Brother!",
    0x13A: "Stop Acting Like That, Judau!",
    0x13B: "For Whom the Bell Tolls 1",
    0x13C: "For Whom the Bell Tolls 2",
    0x13D: "White Fangs Rip the Cosmos",
    0x13E: "Abominable Memories 1",
    0x13F: "Abominable Memories 2",
    0x140: "Those Who Disturb the Skies 1",
    0x141: "Those Who Disturb the Skies 2",
    0x142: "Those Who Disturb the Skies 3",
    0x143: "To the Victor 1",
    0x144: "To the Victor 2",
    0x145: "Operation Giant Roller!",
    0x146: "Gundam Fight: First Round",
    0x147: "Gundam Fight: Semifinals",
    0x148: "Gundam Fight: Finals",
    0x149: "Behind the Scenes",
    0x14A: "Bewildered Soldiers",
    0x14B: "The Glass Kingdom",
    0x14C: "Endless Waltz",
    0x14D: "Operation Return to Earth 1",
    0x14E: "Operation Return to Earth 2",
    0x14F: "All of the Cosmos 1",
    0x150: "All of the Cosmos 2",
    0x151: "The Great Escape",
    0x152: "The Great Pursuit",
    0x153: "All of the Cosmos 3",
    0x154: "A Song of Peace 1",
    0x155: "A Song of Peace 2",
    0x156: "A Song of Peace 3",
    0x157: "The Mightiest Surface Weapon",
    0x158: "Ball Is Your Friend!",
    0x159: "Seeking the Ultimate Zaku",
    0x15A: "Eternal Binary Star",
    0x15B: "A.E.U.G's Hope",
    0x15C: "Don Quijote",
    0x15D: "I'm a Newtype... A Cyber-Newtype!",
    0x15E: "Char's Challenge 2",
    0x15F: "A Dangerous Young Lady",
    0x160: "Captive Princess",
    0x161: "Burn, Dragon",
    0x162: "War Goddess",
    0x163: "Yazan’s Strike Force Is Immortal!",
    0x164: "Towards Tomorrow",
    0x165: "Fighting Spirit",
    0x166: "Crimson Lightning",
    0x167: "You're in my way!",
    0x168: "The Shocking Dark History",
    0x169: "King of Hearts' Challenge",
    0x16A: "Look! The East Burns Crimson Red!",
    0x16B: "C'mon, C'mon! Bring it on!",
    0x16C: "White Devil",
    0x16D: "The Final Victor",
    0x16E: "Moonlight Butterfly vs. Wings of Fire",
    0x16F: "The Final Power",
    0x170: "Persevering Justice",
    0x171: "Zero vs. Epyon",
    0x172: "Get Along!",
    0x173: "It’s Not Anime!",
    0x174: "Zeta's First Launch",
    0x175: "Don't Underestimate it!",
    0x176: "Scirocco's Utopia",
    0x177: "Giant Red Star",
    0x178: "Great Freedom, Great Responsibility",
    0x179: "Amuro Ray",
    0x17A: "Challenge the Legend",
    0x17B: "One Man Army",
    0x17C: "The Power of Bonds",
    0x17D: "The True DYNASTY WARRIORS: Gundam",
    0x17E: "A General's Dignity"
}

RE_ENTRY_TO_EARTH_AMURO = 0x00
THE_BATTLE_OF_ODESSA = 0x01
TRAGEDY_IN_JABURO = 0x02
BIG_ZAMS_LAST_STAND = 0x03
THE_DUEL_IN_TEXAS_AMURO = 0x04
A_COSMIC_GLOW_AMURO = 0x05
SPACE_FORTRESS_A_BAOA_QU = 0x06
LUNA_2_SURRENDERS_AXIS_ACCELERATES_AMURO = 0x07
LONDO_BELL_REACTS_AXIS_FALLS_AMURO = 0x08
RE_ENTRY_TO_EARTH_CHAR = 0x09
THE_DUEL_IN_TEXAS_CHAR = 0x0A
A_COSMIC_GLOW_CHAR = 0x0B
RE_ENTRY_TO_EARTH_CHAR2 = 0x0C
WINDS_OF_JABURO_CHAR = 0x0D
THE_STORM_OVER_KILIMANJARO_CHAR = 0x0E
RUN_THROUGH_THE_COSMOS_CHAR = 0x0F
ENEMY_ENCOUNTER_AT_5TH_LUNA = 0x10
LUNA_2_SURRENDERS_AXIS_ACCELERATES_CHAR = 0x11
LONDO_BELL_REACTS_AXIS_FALLS_CHAR = 0x12
RE_ENTRY_TO_EARTH_KAMILLE = 0x13
WINDS_OF_JABURO_KAMILLE = 0x14
HONG_KONG_CITY = 0x15
CINDERELLA_FOUR = 0x16
THE_STORM_OVER_KILIMANJARO_KAMILLE = 0x17
SCIROCCO_STEPS_FORWARD = 0x18
THE_MIRROR_OF_ROSAMIA = 0x19
RUN_THROUGH_THE_COSMOS_KAMILLE = 0x1A
THE_BURNING_EARTH = 0x1B
PURU_TWO_IN_GRAVITY = 0x1C
VIBRATION = 0x1D
WARRIORS_AGAIN_PRELUDE = 0x1E
WARRIORS_AGAIN_EPILOGUE = 0x1F
PSYCOFRAME_LIGHT = 0x20
WINGS_OF_LIFE = 0x21
THE_FIST_THAT_HOPES_TO_GRASP_VICTORY = 0x22
GUIDING_LIGHT_TO_THE_FUTURE = 0x23
WILL_MAKES_MIRACLES_HAPPEN = 0x24
CHARS_WILL = 0x25
A_UNIQUE_MAN = 0x26
A_VISION_OF_LALAH = 0x27
THE_POWER_OF_A_NEWTYPE = 0x28
CHAR_THE_RED_COMET = 0x29
WHATS_WRONG_WITH_KAMILLE_BEING_A_MANS_NAME = 0x2A
THIS_IS_WHY = 0x2B
YOU_ARENT_SO_SPECIAL = 0x2C
ILL_SHOW_ALL_OF_YOU = 0x2D
THIS_ISNT_A_GAME_TO_ME = 0x2E
DEPARTURE = 0x2F
THE_THREAT_OF_THE_TOMBOY = 0x30
BROKEN_BONDS = 0x31
TO_THE_GRAVITY_WELL = 0x32
SCIROCCO_LANDS_ON_EARTH = 0x33
CONCORD = 0x34
IDEAL = 0x35
THOUGHT = 0x36
SYMPATHY = 0x37
GLORY = 0x38
SANC_KINGDOM_KNIGHT = 0x39
FABRICATED_BLOODLINE_DESTINY_PLAN = 0x3A
NUMBER_2500_YEARS_OF_SAMURAI_FAMILY_HISTORY = 0x3B
RISE_UP_HAIL_ZEON = 0x3C
A_WORLD_WITHOUT_FRIEND_OR_FOE = 0x3D
DOMON_KASSHU_SURPASS_YOUR_MASTER = 0x3E
PROOF_OF_FRIENDSHIP = 0x3F
ILL_SPEAK_WITH_MY_FISTS = 0x40
MASTER_ASIA_DIES_AT_DAWN = 0x41
TEACHER_AND_PUPIL_BOND_LAST_FIGHT_TEARS = 0x42
PUNISHMENT_AT_JABURO = 0x43
LOVE_MEGAPUNCH = 0x44
CUTE_FIGHTER_GIRL = 0x45
FIST_OF_TEARS_EXPLODES = 0x46
MASTER_ASIAS_NAME = 0x47
THOSE_WHO_OPPOSE_WAR = 0x48
THOSE_WHO_SEEK_BATTLE = 0x49
THOSE_WHO_SEEK_TO_BE_RESCUED = 0x4A
THOSE_WHO_FACE_DISASTER = 0x4B
THOSE_WHO_GUIDE_US_TO_PEACE = 0x4C
CHIVALRY_IS_BRAVERY = 0x4D
CHIVALRY_IS_FAIRNESS = 0x4E
CHIVALRY_IS_DEVOTION = 0x4F
CHIVALRY_IS_COURAGE = 0x50
CHIVALRY_IS_POLITENESS = 0x51
BROTHERS_REUNITED = 0x52
WINDS_OF_BATTLE = 0x53
COEXISTENCE_WITH_OTHERS = 0x54
AS_THE_PEOPLE_OF_THE_MOON = 0x55
PRESERVING_THE_SPECIES = 0x56
ATMOSPHERIC_COMBAT = 0x57
FIGHTING_GIANT_ENEMIES = 0x58
SPECIAL_SOLDIER_GUNDAM = 0x59
ONE_YEAR_WAR_OPERATION_STAR_ONE = 0x5A
COLONY_LASER_DUEL = 0x5B
PREDESTINATION = 0x5C
PRISON_BREAK = 0x5D
THE_DISCIPLINE_OF_A_SOLDIER = 0x5E
TORN_BETWEEN_BOND_AND_TRUST = 0x5F
DAY_OF_DECISION = 0x60
DESPERATE_COURAGE = 0x61
PERPLEXED_GIRL = 0x62
NEVER_ENDING_CONFLICT = 0x63
DISCORD = 0x64
RED_AND_BLACK_PURU = 0x65
MENACE_ON_THE_BATTLEFIELD = 0x66
HEARTS_PASSING_BY = 0x67
IRRITATION = 0x68
SKIES_OF_CONFUSION = 0x69
RED_AND_BLACK_PURU_TWO = 0x6A
DOUBLE_ZETA_RUN_AWAY = 0x6B
THE_VALLEY_OF_THE_ICEBERG = 0x6C
JUDAU_COME_OUT = 0x6D
YOURE_SO_STUBBORN = 0x6E
TIME_TO_FIND_OUT_LOVER_FRIEND_RIVAL = 0x6F
THE_FIGHT_TO_END_ALL_FIGHTS = 0x70
TEARS_ON_THE_BATTLEFIELD = 0x71
PEACE_SINGING_SINGSTRESS = 0x72
FIGHTING_BREEDS_MORE_FIGHTING = 0x73
A_FUTURE_BEFORE_THE_BATTLE = 0x74
IN_THE_SANDSTORM = 0x75
DEATHMATCH_AT_KILLMANJARO = 0x76
FREEDOM_JUSTICE_AND_TRUTH = 0x77
GATES_TO_A_NEW_WORLD = 0x78
CRIMSON_SOAKED_COSMOS = 0x79
ETERNAL_CONFLICT = 0x7A
AN_ERA_WITHOUT_LIGHT = 0x7B
CONTRADICTING_JUSTICE = 0x7C
WORLD_IN_PEACE = 0x7D
ETERNAL_FATE = 0x7E
MAYDAY = 0x7F
A_CHILD_LOST_IN_THE_UNIVERSE = 0x80
WHITE_FANG = 0x81
MIRACLE_ENCOUNTER = 0x82
GHOST_OF_DISTURBANCE = 0x83
HUMANKIND_DESPAIRS = 0x84
TIME_PASSES_REMORSELESSLY = 0x85
BOYS_AND_GIRLS_FROM_THE_BATTLEFIELD = 0x86
BEYOND_THE_TIME = 0x87
CONNECTING_MANY_LIVES = 0x88
HEROES_OF_THE_ONE_YEAR_WAR_1 = 0x89
HEROES_OF_THE_ONE_YEAR_WAR_2 = 0x8A
MQUVES_VASE = 0x8B
A_SOLDIERS_HEART = 0x8C
THE_GENERAL_AND_THE_BEAST_YAZAN = 0x8D
FRONTLINE_BEAST = 0x8E
THE_GENERAL_AND_THE_BEAST_GHINGHAM = 0x8F
FOR_THE_LOVED_ONE = 0x90
FAREWELL_LOVED_ONE = 0x91
INFILTRATION_IN_JUPRITIS = 0x92
TOO_MUCH_OF_A_WOMAN = 0x93
ATTRACTED_BY_THE_SCENT_OF_FLOWERS = 0x94
GOODBYE_DAYS_OF_YOUTH = 0x95
NEWTYPE_PLAYGROUND = 0x96
GYUNEIS_AMBITION_1 = 0x97
GYUNEIS_AMBITION_2 = 0x98
THE_PRESTIGE_OF_THE_ZABI_FAMILY_1 = 0x99
THE_PRESTIGE_OF_THE_ZABI_FAMILY_1_ALT = 0x9A
SLEGGAR_AND_THE_RETURN_TO_JUPITER = 0x9B
SLEGGAR_AND_THE_CYBER_NEWTYPE = 0x9C
SLEGGAR_AND_THE_LOVERS = 0x9D
SLEGGAR_AND_THE_SCARY_WOMAN = 0x9E
SLEGGAR_AND_THE_RED_COMET = 0x9F
SPELLBOUND = 0xA0
BROTHERS_AND_SISTERS = 0xA1
FIND_THE_SONGSTRESS = 0xA2
FRIEND_YESTERDAY_ENEMY_TODAY = 0xA3
PRIVATE_LESSON = 0xA4
A_FUTURE_FOR_TWO = 0xA5
BEAUTIFUL_FACE = 0xA6
YOUNGER_BOY = 0xA7
PILOTING_PRACTICE = 0xA8
BEGINNER_BATTLE_DRILL___SURFACE = 0xA9
BEGINNER_BATTLE_DRILL___SPACE = 0xAA
INTERMEDIATE_BATTLE_DRILL___SURFACE = 0xAB
INTERMEDIATE_BATTLE_DRILL___SPACE = 0xAC
ADVANCED_BATTLE_DRILL___SURFACE = 0xAD
ADVANCED_BATTLE_DRILL___SPACE = 0xAE
NUMBER_1000_SHOT_DOWN_ENEMIES = 0xAF
NUMBER_5000_SHOT_DOWN_ENEMIES = 0xB0
NUMBER_10000_SHOT_DOWN_ENEMIES = 0xB1
NUMBER_20000_SHOT_DOWN_ENEMIES = 0xB2
NUMBER_30000_SHOT_DOWN_ENEMIES = 0xB3
NUMBER_40000_SHOT_DOWN_ENEMIES = 0xB4
NUMBER_50000_SHOT_DOWN_ENEMIES = 0xB5
NUMBER_10_COMPLETED_MISSIONS = 0xB6
NUMBER_50_COMPLETED_MISSIONS = 0xB7
NUMBER_100_COMPLETED_MISSIONS = 0xB8
NUMBER_200_TOTAL_COMPLETED_MISSIONS = 0xB9
NUMBER_300_TOTAL_COMPLETED_MISSIONS = 0xBA
FORCED_EVOLUTION = 0xBB
HUMAN_REFORM = 0xBC
CHARS_CHALLENGE = 0xBD
SOLDIERS_BATTLEFIELD_1 = 0xBE
SOLDIERS_BATTLEFIELD_2 = 0xBF
SOLDIERS_BATTLEFIELD_3 = 0xC0
SOLDIERS_BATTLEFIELD_4 = 0xC1
BLACK_TETRA_STARS_1 = 0xC2
BLACK_TETRA_STARS_2 = 0xC3
A_VETERANS_DEED_1 = 0xC4
A_VETERANS_DEED_2 = 0xC5
THE_FOURTH_YAZAN_CREWMAN_1 = 0xC6
THE_FOURTH_YAZAN_CREWMAN_2 = 0xC7
REMEMBER_THE_PAST_1 = 0xC8
REMEMBER_THE_PAST_2 = 0xC9
REMEMBER_THE_PAST_3 = 0xCA
REMEMBER_THE_PAST_4 = 0xCB
REMEMBER_THE_PAST_5 = 0xCC
REMEMBER_THE_PAST_6 = 0xCD
REMEMBER_THE_PAST_7 = 0xCE
THE_MONSTER_OF_ZEON = 0xCF
HEROES_OF_THE_FEDERATION = 0xD0
THE_MESSENGER_FROM_AXIS = 0xD1
MASS_PRODUCTION_GUNDAM = 0xD2
THIS_IS_NO_ZAKU_MY_FRIEND = 0xD3
GIANT_REVEALED = 0xD4
FOR_THE_GLORY_OF_ZEON = 0xD5
GUARDIANS_OF_NATURE = 0xD6
UNDER_NEO_ZEONS_FLAG = 0xD7
JET_STREAM_ATTACK = 0xD8
SOARING_DRAGON = 0xD9
A_E_U_GS_PRIDE = 0xDA
KNIGHTS_OF_THE_PRINCIPALITY = 0xDB
THE_GENIUS_FROM_JUPRITIS = 0xDC
COMING_FROM_UNDERWATER = 0xDD
WOMENS_WAR = 0xDE
HUNTER = 0xDF
Z_GUNDAM_RETURNS = 0xE0
CHAR_COLLECTION = 0xE1
RED_TRI_STARS = 0xE2
JERIDS_SOUL_PILGRIMAGE = 0xE3
THE_SNAKE_AND_THE_SPIDER = 0xE4
ULTIMATE_BROTHERS = 0xE5
ZAKU_LOVERS_CLUB_1 = 0xE6
ZAKU_LOVERS_CLUB_2 = 0xE7
QUBELEY_STORM = 0xE8
SOLO_IN_RED_1 = 0xE9
SOLO_IN_RED_2 = 0xEA
THE_PATH_TO_LEGEND_1 = 0xEB
THE_PATH_TO_LEGEND_2 = 0xEC
RED_COMETS_GLORY_1 = 0xED
RED_COMETS_GLORY_2 = 0xEE
LEGENDARY_SUCCESSOR_1 = 0xEF
LEGENDARY_SUCCESSOR_2 = 0xF0
A_HUNDRED_YEARS_RADIANCE_1 = 0xF1
A_HUNDRED_YEARS_RADIANCE_2 = 0xF2
ZETAS_PULSE_1 = 0xF3
ZETAS_PULSE_2 = 0xF4
GODS_WILL = 0xF5
AXIS_MOTHER_NATURE = 0xF6
THE_ULTIMATE_POWER_1 = 0xF7
THE_ULTIMATE_POWER_2 = 0xF8
BATTLE_GIRL = 0xF9
THE_STRONGEST_GUNDAM_1 = 0xFA
THE_STRONGEST_GUNDAM_2 = 0xFB
CRIMSON_REBELS_1 = 0xFC
CRIMSON_REBELS_2 = 0xFD
FORMULA_PROGRAM = 0xFE
GUNDAM_CALLS_VICTORY = 0xFF
THE_FIST_DWELLING_GOD = 0x100
THE_PRACTITIONERS_TEACHINGS = 0x101
GIVE_ME_YOUR_WINGS = 0x102
PATH_TO_THE_FUTURE = 0x103
THE_LEGACY_OF_THE_DARK_HISTORY = 0x104
THE_MESSENGER_OF_FREEDOM = 0x105
SWORD_OF_JUSTICE = 0x106
FATE_CONNECTION = 0x107
ARATAMA = 0x108
NIGITAMA = 0x109
GOOD_LUCK_LOSER = 0x10A
JUST_WANTED_TO_GET_ALONG___ = 0x10B
HEDGEHOGS_DILEMMA = 0x10C
LOVE_DUEL = 0x10D
LOVE_SPECIAL_ATTACK = 0x10E
BOYS_BE_AMBITIOUS = 0x10F
WOMEN_WHO_LOOK_GOOD_ARMED = 0x110
VOICES_OF_THE_YOUNG = 0x111
LAST_GENERATION = 0x112
COWARD_1 = 0x113
COWARD_2 = 0x114
HAYATOS_REQUEST = 0x115
KYCILIAS_SECRET_REQUEST = 0x116
DOZLES_SECRET_REQUEST = 0x117
YAZANS_CREW_TEST = 0x118
SARAH_MIGHT_FORGIVE_YOU_BUT_I_WONT = 0x119
GLEMYS_AMBITION = 0x11A
GYUNEIS_RESCUE = 0x11B
SLEGGARS_FINAL_ATTACK = 0x11C
THINGS_TO_PROTECT = 0x11D
DEVIL_MACHINE = 0x11E
GHINGHAMS_BIG_COMEBACK = 0x11F
DO_YOU_LOVE_SUPER_ACES = 0x120
I_CAN_HEAR_YOUR_SONG = 0x121
POWER_IN_HAND_1 = 0x122
POWER_IN_HAND_2 = 0x123
EARTH_DOMINATION_1 = 0x124
EARTH_DOMINATION_2 = 0x125
EARTH_DOMINATION_3 = 0x126
ETERNAL_COMET = 0x127
EARTH_CONQUEST_1 = 0x128
EARTH_CONQUEST_2 = 0x129
EARTH_CONQUEST_3 = 0x12A
CHARS_OFFERING = 0x12B
FREEDOM_TO_SPACE_1 = 0x12C
FREEDOM_TO_SPACE_2 = 0x12D
FREEDOM_TO_SPACE_3 = 0x12E
THE_EARTH_IS_MY_BIRTHPLACE_1 = 0x12F
THE_EARTH_IS_MY_BIRTHPLACE_2 = 0x130
THE_EARTH_IS_MY_BIRTHPLACE_3 = 0x131
COLD_MACHIAVELLIAN = 0x132
FAITH_1 = 0x133
FAITH_2 = 0x134
FREEDOM_TO_SPACE_4 = 0x135
FREEDOM_TO_SPACE_5 = 0x136
JUNK_DEALERS_1 = 0x137
JUNK_DEALERS_2 = 0x138
STOP_ACTING_LIKE_THAT_BROTHER = 0x139
STOP_ACTING_LIKE_THAT_JUDAU = 0x13A
FOR_WHOM_THE_BELL_TOLLS_1 = 0x13B
FOR_WHOM_THE_BELL_TOLLS_2 = 0x13C
WHITE_FANGS_RIP_THE_COSMOS = 0x13D
ABOMINABLE_MEMORIES_1 = 0x13E
ABOMINABLE_MEMORIES_2 = 0x13F
THOSE_WHO_DISTURB_THE_SKIES_1 = 0x140
THOSE_WHO_DISTURB_THE_SKIES_2 = 0x141
THOSE_WHO_DISTURB_THE_SKIES_3 = 0x142
TO_THE_VICTOR_1 = 0x143
TO_THE_VICTOR_2 = 0x144
OPERATION_GIANT_ROLLER = 0x145
GUNDAM_FIGHT_FIRST_ROUND = 0x146
GUNDAM_FIGHT_SEMIFINALS = 0x147
GUNDAM_FIGHT_FINALS = 0x148
BEHIND_THE_SCENES = 0x149
BEWILDERED_SOLDIERS = 0x14A
THE_GLASS_KINGDOM = 0x14B
ENDLESS_WALTZ = 0x14C
OPERATION_RETURN_TO_EARTH_1 = 0x14D
OPERATION_RETURN_TO_EARTH_2 = 0x14E
ALL_OF_THE_COSMOS_1 = 0x14F
ALL_OF_THE_COSMOS_2 = 0x150
THE_GREAT_ESCAPE = 0x151
THE_GREAT_PURSUIT = 0x152
ALL_OF_THE_COSMOS_3 = 0x153
A_SONG_OF_PEACE_1 = 0x154
A_SONG_OF_PEACE_2 = 0x155
A_SONG_OF_PEACE_3 = 0x156
THE_MIGHTIEST_SURFACE_WEAPON = 0x157
BALL_IS_YOUR_FRIEND = 0x158
SEEKING_THE_ULTIMATE_ZAKU = 0x159
ETERNAL_BINARY_STAR = 0x15A
A_E_U_GS_HOPE = 0x15B
DON_QUIJOTE = 0x15C
IM_A_NEWTYPE____A_CYBER_NEWTYPE = 0x15D
CHARS_CHALLENGE_2 = 0x15E
A_DANGEROUS_YOUNG_LADY = 0x15F
CAPTIVE_PRINCESS = 0x160
BURN_DRAGON = 0x161
WAR_GODDESS = 0x162
YAZANS_STRIKE_FORCE_IS_IMMORTAL = 0x163
TOWARDS_TOMORROW = 0x164
FIGHTING_SPIRIT = 0x165
CRIMSON_LIGHTNING = 0x166
YOURE_IN_MY_WAY = 0x167
THE_SHOCKING_DARK_HISTORY = 0x168
KING_OF_HEARTS_CHALLENGE = 0x169
LOOK_THE_EAST_BURNS_CRIMSON_RED = 0x16A
CMON_CMON_BRING_IT_ON = 0x16B
WHITE_DEVIL = 0x16C
THE_FINAL_VICTOR = 0x16D
MOONLIGHT_BUTTERFLY_VS__WINGS_OF_FIRE = 0x16E
THE_FINAL_POWER = 0x16F
PERSEVERING_JUSTICE = 0x170
ZERO_VS__EPYON = 0x171
GET_ALONG = 0x172
ITS_NOT_ANIME = 0x173
ZETAS_FIRST_LAUNCH = 0x174
DONT_UNDERESTIMATE_IT = 0x175
SCIROCCOS_UTOPIA = 0x176
GIANT_RED_STAR = 0x177
GREAT_FREEDOM_GREAT_RESPONSIBILITY = 0x178
AMURO_RAY_MISSION = 0x179
CHALLENGE_THE_LEGEND = 0x17A
ONE_MAN_ARMY = 0x17B
THE_POWER_OF_BONDS = 0x17C
THE_TRUE_DYNASTY_WARRIORS_GUNDAM = 0x17D
A_GENERALS_DIGNITY = 0x17E

amuroFirstStoryMissions = 
[
    RE_ENTRY_TO_EARTH_AMURO,
    THE_BATTLE_OF_ODESSA,
    TRAGEDY_IN_JABURO,
    BIG_ZAMS_LAST_STAND,
    THE_DUEL_IN_TEXAS_AMURO,
    A_COSMIC_GLOW_AMURO,
    SPACE_FORTRESS_A_BAOA_QU    
]

amuroSecondStoryMissions = 
[
    LUNA_2_SURRENDERS_AXIS_ACCELERATES_AMURO,
    LONDO_BELL_REACTS_AXIS_FALLS_AMURO
]

charFirstStoryMissions = 
[
    RE_ENTRY_TO_EARTH_CHAR,
    THE_DUEL_IN_TEXAS_CHAR,
    A_COSMIC_GLOW_CHAR,
    RE_ENTRY_TO_EARTH_CHAR2,
    WINDS_OF_JABURO_CHAR,
    THE_STORM_OVER_KILIMANJARO_CHAR,
    RUN_THROUGH_THE_COSMOS_CHAR
]

charSecondStoryMissions =
[
    ENEMY_ENCOUNTER_AT_5TH_LUNA,
    LUNA_2_SURRENDERS_AXIS_ACCELERATES_CHAR,
    LONDO_BELL_REACTS_AXIS_FALLS_CHAR
]

kamilleStoryMissions =
[
    RE_ENTRY_TO_EARTH_KAMILLE,
    WINDS_OF_JABURO_KAMILLE,
    HONG_KONG_CITY,
    CINDERELLA_FOUR,
    THE_STORM_OVER_KILIMANJARO_KAMILLE,
    SCIROCCO_STEPS_FORWARD,
    THE_MIRROR_OF_ROSAMIA,
    RUN_THROUGH_THE_COSMOS_KAMILLE
]

judauStoryMissions =
[
    THE_BURNING_EARTH,
    PURU_TWO_IN_GRAVITY,
    VIBRATION,
    WARRIORS_AGAIN_PRELUDE,
    WARRIORS_AGAIN_EPILOGUE
]

amuroMissionModeMissions =
[
    PSYCOFRAME_LIGHT,
    WINGS_OF_LIFE,
    THE_FIST_THAT_HOPES_TO_GRASP_VICTORY,
    GUIDING_LIGHT_TO_THE_FUTURE,
    WILL_MAKES_MIRACLES_HAPPEN
]

charMissionModeMissions =
[
    CHARS_WILL,
    A_UNIQUE_MAN,
    A_VISION_OF_LALAH,
    THE_POWER_OF_A_NEWTYPE,
    CHAR_THE_RED_COMET
]


kamilleMissionModeMissions =
[
    WHATS_WRONG_WITH_KAMILLE_BEING_A_MANS_NAME,
    THIS_IS_WHY,
    YOU_ARENT_SO_SPECIAL,
    ILL_SHOW_ALL_OF_YOU,
    THIS_ISNT_A_GAME_TO_ME
]

sciroccoMissionModeMissions = 
[
    DEPARTURE,
    THE_THREAT_OF_THE_TOMBOY,
    BROKEN_BONDS,
    TO_THE_GRAVITY_WELL,
    SCIROCCO_LANDS_ON_EARTH
]

hamanMissionModeMissions = 
[
    CONCORD,
    IDEAL,
    THOUGHT,
    SYMPATHY,
    GLORY
]

juduaMissionModeMissions = 
[
    SANC_KINGDOM_KNIGHT,
    FABRICATED_BLOODLINE_DESTINY_PLAN,
    NUMBER_2500_YEARS_OF_SAMURAI_FAMILY_HISTORY,
    RISE_UP_HAIL_ZEON,
    A_WORLD_WITHOUT_FRIEND_OR_FOE
]

domonMissionModeMissions = 
[
    DOMON_KASSHU_SURPASS_YOUR_MASTER,
    PROOF_OF_FRIENDSHIP,
    ILL_SPEAK_WITH_MY_FISTS,
    MASTER_ASIA_DIES_AT_DAWN,
    TEACHER_AND_PUPIL_BOND_LAST_FIGHT_TEARS
]

masterAsiaMissionModeMissions = 
[
    PUNISHMENT_AT_JABURO,
    LOVE_MEGAPUNCH,
    CUTE_FIGHTER_GIRL,
    FIST_OF_TEARS_EXPLODES,
    MASTER_ASIAS_NAME
]

heeroMissionModeMissions = 
[
    THOSE_WHO_OPPOSE_WAR,
    THOSE_WHO_SEEK_BATTLE,
    THOSE_WHO_SEEK_TO_BE_RESCUED,
    THOSE_WHO_FACE_DISASTER,
    THOSE_WHO_GUIDE_US_TO_PEACE
]

millardoMissionModeMissions = 
[
    CHIVALRY_IS_BRAVERY,
    CHIVALRY_IS_FAIRNESS,
    CHIVALRY_IS_DEVOTION,
    CHIVALRY_IS_COURAGE,
    CHIVALRY_IS_POLITENESS
]

loranMissionModeMissions = 
[
    BROTHERS_REUNITED,
    WINDS_OF_BATTLE,
    COEXISTENCE_WITH_OTHERS,
    AS_THE_PEOPLE_OF_THE_MOON,
    PRESERVING_THE_SPECIES
]

emmaMissionModeMissions = 
[
    ATMOSPHERIC_COMBAT,
    FIGHTING_GIANT_ENEMIES,
    SPECIAL_SOLDIER_GUNDAM,
    ONE_YEAR_WAR_OPERATION_STAR_ONE,
    COLONY_LASER_DUEL
]

jeridMissionModeMissions = 
[
    PREDESTINATION,
    PRISON_BREAK,
    THE_DISCIPLINE_OF_A_SOLDIER,
    TORN_BETWEEN_BOND_AND_TRUST,
    DAY_OF_DECISION
]

puruMissionModeMissions = 
[
    DESPERATE_COURAGE,
    PERPLEXED_GIRL,
    NEVER_ENDING_CONFLICT,
    DISCORD,
    RED_AND_BLACK_PURU
]

puruTwoMissionModeMissions =
[
    MENACE_ON_THE_BATTLEFIELD,
    HEARTS_PASSING_BY,
    IRRITATION,
    SKIES_OF_CONFUSION,
    RED_AND_BLACK_PURU_TWO
]

rouxMissionModeMissions = 
[
    DOUBLE_ZETA_RUN_AWAY,
    THE_VALLEY_OF_THE_ICEBERG,
    JUDAU_COME_OUT,
    YOURE_SO_STUBBORN,
    TIME_TO_FIND_OUT_LOVER_FRIEND_RIVAL
]

kiraMissionModeMissions = 
[
    THE_FIGHT_TO_END_ALL_FIGHTS,
    TEARS_ON_THE_BATTLEFIELD,
    PEACE_SINGING_SINGSTRESS,
    FIGHTING_BREEDS_MORE_FIGHTING,
    A_FUTURE_BEFORE_THE_BATTLE
]

athrunMissionModeMissions = 
[
    IN_THE_SANDSTORM,
    DEATHMATCH_AT_KILLMANJARO,
    FREEDOM_JUSTICE_AND_TRUTH,
    GATES_TO_A_NEW_WORLD,
    CRIMSON_SOAKED_COSMOS
]

shinnMissionModeMissions = 
[
    ETERNAL_CONFLICT,
    AN_ERA_WITHOUT_LIGHT,
    CONTRADICTING_JUSTICE,
    WORLD_IN_PEACE,
    ETERNAL_FATE
]

seabookMissionModeMissions = 
[
    MAYDAY,
    A_CHILD_LOST_IN_THE_UNIVERSE,
    WHITE_FANG,
    MIRACLE_ENCOUNTER,
    GHOST_OF_DISTURBANCE
]

usoMissionModeMissions = 
[
    HUMANKIND_DESPAIRS,
    TIME_PASSES_REMORSELESSLY,
    BOYS_AND_GIRLS_FROM_THE_BATTLEFIELD,
    BEYOND_THE_TIME,
    CONNECTING_MANY_LIVES
]

// These are special, they're duplicates
kaiMissionsModeMissions = 
[
    HEROES_OF_THE_ONE_YEAR_WAR_1,
    HEROES_OF_THE_ONE_YEAR_WAR_2
]

hayatoMissionsModeMissions = 
[
    HEROES_OF_THE_ONE_YEAR_WAR_1,
    HEROES_OF_THE_ONE_YEAR_WAR_2
]

mquveMissionModeMissions =
[
    MQUVES_VASE
]

rambaMissionModeMissions =
[
    A_SOLDIERS_HEART
]

yazanMissionModeMissions =
[
    THE_GENERAL_AND_THE_BEAST_YAZAN,
    FRONTLINE_BEAST
]

sarahMissionModeMissions =
[
    FOR_THE_LOVED_ONE,
    FAREWELL_LOVED_ONE
]

ReccoaMissionModeMissions =
[
    INFILTRATION_IN_JUPRITIS,
    TOO_MUCH_OF_A_WOMAN
]

glemyMissionModeMissions =
[
    ATTRACTED_BY_THE_SCENT_OF_FLOWERS,
    GOODBYE_DAYS_OF_YOUTH
]   

quessMissionModeMissions = 
[
    NEWTYPE_PLAYGROUND
]

gyuneiMissionModeMissions = 
[
    GYUNEIS_AMBITION_1,
    GYUNEIS_AMBITION_2
]

dozleMissionModeMissions =
[
    THE_PRESTIGE_OF_THE_ZABI_FAMILY_1,
    THE_PRESTIGE_OF_THE_ZABI_FAMILY_1_ALT
]

sleggarMissionModeMissions = 
[
    SLEGGAR_AND_THE_RETURN_TO_JUPITER,
    SLEGGAR_AND_THE_CYBER_NEWTYPE,
    SLEGGAR_AND_THE_LOVERS,
    SLEGGAR_AND_THE_SCARY_WOMAN,
    SLEGGAR_AND_THE_RED_COMET
]

fourMissionModeMissions = 
[
    SPELLBOUND
]

rosamiaMissionModeMissions = 
[
    BROTHERS_AND_SISTERS
]

gymMissionModeMissions = 
[
    THE_GENERAL_AND_THE_BEAST_GHINGHAM,
    A_GENERALS_DIGNITY
]

lacusMissionModeMissions = 
[
    FIND_THE_SONGSTRESS,
    FRIEND_YESTERDAY_ENEMY_TODAY
]

lunamariaMissionModeMissions = 
[
    PRIVATE_LESSON,
    A_FUTURE_FOR_TWO
]

cecilyMissionModeMissions =
[
    BEAUTIFUL_FACE
]

katejinaMissionModeMissions = 
[
    YOUNGER_BOY
]

freeMissionModeMissions =
[
    PILOTING_PRACTICE,
    BEGINNER_BATTLE_DRILL___SURFACE,
    BEGINNER_BATTLE_DRILL___SPACE,
    INTERMEDIATE_BATTLE_DRILL___SURFACE,
    INTERMEDIATE_BATTLE_DRILL___SPACE,
    ADVANCED_BATTLE_DRILL___SURFACE,
    ADVANCED_BATTLE_DRILL___SPACE,
    NUMBER_1000_SHOT_DOWN_ENEMIES,
    NUMBER_5000_SHOT_DOWN_ENEMIES,
    NUMBER_10000_SHOT_DOWN_ENEMIES,
    NUMBER_20000_SHOT_DOWN_ENEMIES,
    NUMBER_30000_SHOT_DOWN_ENEMIES,
    NUMBER_40000_SHOT_DOWN_ENEMIES,
    NUMBER_50000_SHOT_DOWN_ENEMIES,
    NUMBER_10_COMPLETED_MISSIONS,
    NUMBER_50_COMPLETED_MISSIONS,
    NUMBER_100_COMPLETED_MISSIONS,
    NUMBER_200_TOTAL_COMPLETED_MISSIONS,
    NUMBER_300_TOTAL_COMPLETED_MISSIONS,
    FORCED_EVOLUTION,
    HUMAN_REFORM,
    CHARS_CHALLENGE,
    SOLDIERS_BATTLEFIELD_1,
    SOLDIERS_BATTLEFIELD_2,
    SOLDIERS_BATTLEFIELD_3,
    SOLDIERS_BATTLEFIELD_4,
    BLACK_TETRA_STARS_1,
    BLACK_TETRA_STARS_2,
    A_VETERANS_DEED_1,
    A_VETERANS_DEED_2,
    THE_FOURTH_YAZAN_CREWMAN_1,
    THE_FOURTH_YAZAN_CREWMAN_2,
    REMEMBER_THE_PAST_1,
    REMEMBER_THE_PAST_2,
    REMEMBER_THE_PAST_3,
    REMEMBER_THE_PAST_4,
    REMEMBER_THE_PAST_5,
    REMEMBER_THE_PAST_6,
    REMEMBER_THE_PAST_7
]

collectionMissionModeMissions = 
[
    THE_MONSTER_OF_ZEON,
    HEROES_OF_THE_FEDERATION,
    THE_MESSENGER_FROM_AXIS,
    MASS_PRODUCTION_GUNDAM,
    THIS_IS_NO_ZAKU_MY_FRIEND,
    GIANT_REVEALED,
    FOR_THE_GLORY_OF_ZEON,
    GUARDIANS_OF_NATURE,
    UNDER_NEO_ZEONS_FLAG,
    JET_STREAM_ATTACK,
    SOARING_DRAGON,
    A_E_U_GS_PRIDE,
    KNIGHTS_OF_THE_PRINCIPALITY,
    THE_GENIUS_FROM_JUPRITIS,
    COMING_FROM_UNDERWATER,
    WOMENS_WAR,
    HUNTER,
    Z_GUNDAM_RETURNS,
    CHAR_COLLECTION,
    RED_TRI_STARS,
    JERIDS_SOUL_PILGRIMAGE,
    THE_SNAKE_AND_THE_SPIDER,
    ULTIMATE_BROTHERS,
    ZAKU_LOVERS_CLUB_1,
    ZAKU_LOVERS_CLUB_2,
    QUBELEY_STORM,
    SOLO_IN_RED_1,
    SOLO_IN_RED_2
]

licenseMissionModeMissions =
[
    THE_PATH_TO_LEGEND_1,
    THE_PATH_TO_LEGEND_2,
    RED_COMETS_GLORY_1,
    RED_COMETS_GLORY_2,
    LEGENDARY_SUCCESSOR_1,
    LEGENDARY_SUCCESSOR_2,
    A_HUNDRED_YEARS_RADIANCE_1,
    A_HUNDRED_YEARS_RADIANCE_2,
    ZETAS_PULSE_1,
    ZETAS_PULSE_2,
    GODS_WILL,
    AXIS_MOTHER_NATURE,
    THE_ULTIMATE_POWER_1,
    THE_ULTIMATE_POWER_2,
    BATTLE_GIRL,
    THE_STRONGEST_GUNDAM_1,
    THE_STRONGEST_GUNDAM_2,
    CRIMSON_REBELS_1,
    CRIMSON_REBELS_2,
    FORMULA_PROGRAM,
    GUNDAM_CALLS_VICTORY,
    THE_FIST_DWELLING_GOD,
    THE_PRACTITIONERS_TEACHINGS,
    GIVE_ME_YOUR_WINGS,
    PATH_TO_THE_FUTURE,
    THE_LEGACY_OF_THE_DARK_HISTORY,
    THE_MESSENGER_OF_FREEDOM,
    SWORD_OF_JUSTICE,
    FATE_CONNECTION,
    ARATAMA,
    NIGITAMA
]

friendshipMissionModeMissions =
[
     GOOD_LUCK_LOSER,
    JUST_WANTED_TO_GET_ALONG___,
    HEDGEHOGS_DILEMMA,
    LOVE_DUEL,
    LOVE_SPECIAL_ATTACK,
    BOYS_BE_AMBITIOUS,
    WOMEN_WHO_LOOK_GOOD_ARMED,
    VOICES_OF_THE_YOUNG,
    LAST_GENERATION,
    COWARD_1,
    COWARD_2,
    HAYATOS_REQUEST,
    KYCILIAS_SECRET_REQUEST,
    DOZLES_SECRET_REQUEST,
    YAZANS_CREW_TEST,
    SARAH_MIGHT_FORGIVE_YOU_BUT_I_WONT,
    GLEMYS_AMBITION,
    GYUNEIS_RESCUE,
    SLEGGARS_FINAL_ATTACK,
    THINGS_TO_PROTECT,
    DEVIL_MACHINE,
    GHINGHAMS_BIG_COMEBACK,
    DO_YOU_LOVE_SUPER_ACES,
    I_CAN_HEAR_YOUR_SONG,
    POWER_IN_HAND_1,
    POWER_IN_HAND_2,
    EARTH_DOMINATION_1,
    EARTH_DOMINATION_2,
    EARTH_DOMINATION_3,
    ETERNAL_COMET,
    EARTH_CONQUEST_1,
    EARTH_CONQUEST_2,
    EARTH_CONQUEST_3,
    CHARS_OFFERING,
    FREEDOM_TO_SPACE_1,
    FREEDOM_TO_SPACE_2,
    FREEDOM_TO_SPACE_3,
    THE_EARTH_IS_MY_BIRTHPLACE_1,
    THE_EARTH_IS_MY_BIRTHPLACE_2,
    THE_EARTH_IS_MY_BIRTHPLACE_3,
    COLD_MACHIAVELLIAN,
    FAITH_1,
    FAITH_2,
    FREEDOM_TO_SPACE_4,
    FREEDOM_TO_SPACE_5,
    JUNK_DEALERS_1,
    JUNK_DEALERS_2,
    STOP_ACTING_LIKE_THAT_BROTHER,
    STOP_ACTING_LIKE_THAT_JUDAU,
    FOR_WHOM_THE_BELL_TOLLS_1,
    FOR_WHOM_THE_BELL_TOLLS_2,
    WHITE_FANGS_RIP_THE_COSMOS,
    ABOMINABLE_MEMORIES_1,
    ABOMINABLE_MEMORIES_2,
    THOSE_WHO_DISTURB_THE_SKIES_1,
    THOSE_WHO_DISTURB_THE_SKIES_2,
    THOSE_WHO_DISTURB_THE_SKIES_3,
    TO_THE_VICTOR_1,
    TO_THE_VICTOR_2,
    OPERATION_GIANT_ROLLER,
    GUNDAM_FIGHT_FIRST_ROUND,
    GUNDAM_FIGHT_SEMIFINALS,
    GUNDAM_FIGHT_FINALS,
    BEHIND_THE_SCENES,
    BEWILDERED_SOLDIERS,
    THE_GLASS_KINGDOM,
    ENDLESS_WALTZ,
    OPERATION_RETURN_TO_EARTH_1,
    OPERATION_RETURN_TO_EARTH_2,
    ALL_OF_THE_COSMOS_1,
    ALL_OF_THE_COSMOS_2,
    THE_GREAT_ESCAPE,
    THE_GREAT_PURSUIT,
    ALL_OF_THE_COSMOS_3,
    A_SONG_OF_PEACE_1,
    A_SONG_OF_PEACE_2,
    A_SONG_OF_PEACE_3
]


extraMissionModeMissions = 
[
    THE_MIGHTIEST_SURFACE_WEAPON,
    BALL_IS_YOUR_FRIEND,
    SEEKING_THE_ULTIMATE_ZAKU,
    ETERNAL_BINARY_STAR,
    A_E_U_GS_HOPE,
    DON_QUIJOTE,
    IM_A_NEWTYPE____A_CYBER_NEWTYPE,
    CHARS_CHALLENGE_2,
    A_DANGEROUS_YOUNG_LADY,
    CAPTIVE_PRINCESS,
    BURN_DRAGON,
    WAR_GODDESS,
    YAZANS_STRIKE_FORCE_IS_IMMORTAL,
    TOWARDS_TOMORROW,
    FIGHTING_SPIRIT,
    CRIMSON_LIGHTNING,
    YOURE_IN_MY_WAY,
    THE_SHOCKING_DARK_HISTORY,
    KING_OF_HEARTS_CHALLENGE,
    LOOK_THE_EAST_BURNS_CRIMSON_RED,
    CMON_CMON_BRING_IT_ON,
    WHITE_DEVIL,
    THE_FINAL_VICTOR,
    MOONLIGHT_BUTTERFLY_VS__WINGS_OF_FIRE,
    THE_FINAL_POWER,
    PERSEVERING_JUSTICE,
    ZERO_VS__EPYON,
    GET_ALONG,
    ITS_NOT_ANIME,
    ZETAS_FIRST_LAUNCH,
    DONT_UNDERESTIMATE_IT,
    SCIROCCOS_UTOPIA,
    GIANT_RED_STAR,
    GREAT_FREEDOM_GREAT_RESPONSIBILITY,
    AMURO_RAY_MISSION,
    CHALLENGE_THE_LEGEND,
    ONE_MAN_ARMY,
    THE_POWER_OF_BONDS,
    THE_TRUE_DYNASTY_WARRIORS_GUNDAM,
]

FIRST_ORIGINAL_MODE_MISSION_INDEX = RE_ENTRY_TO_EARTH_AMURO
LAST_ORIGINAL_MODE_MISSION_INDEX = WARRIORS_AGAIN_EPILOGUE

FIRST_MISSION_MODE_MISSION_INDEX = PSYCOFRAME_LIGHT
LAST_MISSION_MODE_MISSION_INDEX = A_GENERALS_DIGNITY

MISSION_VALUE =
{
    1: 3,
    2: 4,
    3: 5,
    4: 5,  
    5: 5,
    6: 10,
    7: 10,
    8: 10
}

MISSION_DIFFICULTY = 
{
    RE_ENTRY_TO_EARTH_AMURO: 1,
    THE_BATTLE_OF_ODESSA: 1,
    TRAGEDY_IN_JABURO: 2,
    BIG_ZAMS_LAST_STAND: 3,
    THE_DUEL_IN_TEXAS_AMURO: 3,
    A_COSMIC_GLOW_AMURO: 4,
    SPACE_FORTRESS_A_BAOA_QU: 5,
    LUNA_2_SURRENDERS_AXIS_ACCELERATES_AMURO: 5,
    LONDO_BELL_REACTS_AXIS_FALLS_AMURO: 5,
    RE_ENTRY_TO_EARTH_CHAR: 1,
    THE_DUEL_IN_TEXAS_CHAR: 1,
    A_COSMIC_GLOW_CHAR: 2,
    RE_ENTRY_TO_EARTH_CHAR2: 2,
    WINDS_OF_JABURO_CHAR: 3,
    THE_STORM_OVER_KILIMANJARO_CHAR: 4,
    RUN_THROUGH_THE_COSMOS_CHAR: 5,
    ENEMY_ENCOUNTER_AT_5TH_LUNA: 4,
    LUNA_2_SURRENDERS_AXIS_ACCELERATES_CHAR: 5,
    LONDO_BELL_REACTS_AXIS_FALLS_CHAR: 5,
    RE_ENTRY_TO_EARTH_KAMILLE: 1,
    WINDS_OF_JABURO_KAMILLE: 1,
    HONG_KONG_CITY: 2,
    CINDERELLA_FOUR: 2,
    THE_STORM_OVER_KILIMANJARO_KAMILLE: 3,
    SCIROCCO_STEPS_FORWARD: 4,
    THE_MIRROR_OF_ROSAMIA: 5,
    RUN_THROUGH_THE_COSMOS_KAMILLE: 5,
    THE_BURNING_EARTH: 1,
    PURU_TWO_IN_GRAVITY: 2,
    VIBRATION: 3,
    WARRIORS_AGAIN_PRELUDE: 4,
    WARRIORS_AGAIN_EPILOGUE: 5,
    PSYCOFRAME_LIGHT: 3,
    WINGS_OF_LIFE: 3,
    THE_FIST_THAT_HOPES_TO_GRASP_VICTORY: 4,
    GUIDING_LIGHT_TO_THE_FUTURE: 4,
    WILL_MAKES_MIRACLES_HAPPEN: 5,
    CHARS_WILL: -1,
    A_UNIQUE_MAN: -1,
    A_VISION_OF_LALAH: -1,
    THE_POWER_OF_A_NEWTYPE: -1,
    CHAR_THE_RED_COMET: -1,
    WHATS_WRONG_WITH_KAMILLE_BEING_A_MANS_NAME: -1,
    THIS_IS_WHY: -1,
    YOU_ARENT_SO_SPECIAL: -1,
    ILL_SHOW_ALL_OF_YOU: -1,
    THIS_ISNT_A_GAME_TO_ME: -1,
    DEPARTURE: -1,
    THE_THREAT_OF_THE_TOMBOY: -1,
    BROKEN_BONDS: -1,
    TO_THE_GRAVITY_WELL: -1,
    SCIROCCO_LANDS_ON_EARTH: -1,
    CONCORD: -1,
    IDEAL: -1,
    THOUGHT: -1,
    SYMPATHY: -1,
    GLORY: -1,
    SANC_KINGDOM_KNIGHT: -1,
    FABRICATED_BLOODLINE_DESTINY_PLAN: -1,
    NUMBER_2500_YEARS_OF_SAMURAI_FAMILY_HISTORY: -1,
    RISE_UP_HAIL_ZEON: -1,
    A_WORLD_WITHOUT_FRIEND_OR_FOE: -1,
    DOMON_KASSHU_SURPASS_YOUR_MASTER: -1,
    PROOF_OF_FRIENDSHIP: -1,
    ILL_SPEAK_WITH_MY_FISTS: -1,
    MASTER_ASIA_DIES_AT_DAWN: -1,
    TEACHER_AND_PUPIL_BOND_LAST_FIGHT_TEARS: -1,
    PUNISHMENT_AT_JABURO: -1,
    LOVE_MEGAPUNCH: -1,
    CUTE_FIGHTER_GIRL: -1,
    FIST_OF_TEARS_EXPLODES: -1,
    MASTER_ASIAS_NAME: -1,
    THOSE_WHO_OPPOSE_WAR: 1,
    THOSE_WHO_SEEK_BATTLE: 2,
    THOSE_WHO_SEEK_TO_BE_RESCUED: 3,
    THOSE_WHO_FACE_DISASTER: 3,
    THOSE_WHO_GUIDE_US_TO_PEACE: 4,
    CHIVALRY_IS_BRAVERY: -1,
    CHIVALRY_IS_FAIRNESS: -1,
    CHIVALRY_IS_DEVOTION: -1,
    CHIVALRY_IS_COURAGE: -1,
    CHIVALRY_IS_POLITENESS: -1,
    BROTHERS_REUNITED: -1,
    WINDS_OF_BATTLE: -1,
    COEXISTENCE_WITH_OTHERS: -1,
    AS_THE_PEOPLE_OF_THE_MOON: -1,
    PRESERVING_THE_SPECIES: -1,
    ATMOSPHERIC_COMBAT: -1,
    FIGHTING_GIANT_ENEMIES: -1,
    SPECIAL_SOLDIER_GUNDAM: -1,
    ONE_YEAR_WAR_OPERATION_STAR_ONE: -1,
    COLONY_LASER_DUEL: -1,
    PREDESTINATION: -1,
    PRISON_BREAK: -1,
    THE_DISCIPLINE_OF_A_SOLDIER: -1,
    TORN_BETWEEN_BOND_AND_TRUST: -1,
    DAY_OF_DECISION: -1,
    DESPERATE_COURAGE: -1,
    PERPLEXED_GIRL: -1,
    NEVER_ENDING_CONFLICT: -1,
    DISCORD: -1,
    RED_AND_BLACK_PURU: -1,
    MENACE_ON_THE_BATTLEFIELD: -1,
    HEARTS_PASSING_BY: -1,
    IRRITATION: -1,
    SKIES_OF_CONFUSION: -1,
    RED_AND_BLACK_PURU_TWO: -1,
    DOUBLE_ZETA_RUN_AWAY: -1,
    THE_VALLEY_OF_THE_ICEBERG: -1,
    JUDAU_COME_OUT: -1,
    YOURE_SO_STUBBORN: -1,
    TIME_TO_FIND_OUT_LOVER_FRIEND_RIVAL: -1,
    THE_FIGHT_TO_END_ALL_FIGHTS: -1,
    TEARS_ON_THE_BATTLEFIELD: -1,
    PEACE_SINGING_SINGSTRESS: -1,
    FIGHTING_BREEDS_MORE_FIGHTING: -1,
    A_FUTURE_BEFORE_THE_BATTLE: -1,
    IN_THE_SANDSTORM: -1,
    DEATHMATCH_AT_KILLMANJARO: -1,
    FREEDOM_JUSTICE_AND_TRUTH: -1,
    GATES_TO_A_NEW_WORLD: -1,
    CRIMSON_SOAKED_COSMOS: -1,
    ETERNAL_CONFLICT: -1,
    AN_ERA_WITHOUT_LIGHT: -1,
    CONTRADICTING_JUSTICE: -1,
    WORLD_IN_PEACE: -1,
    ETERNAL_FATE: -1,
    MAYDAY: -1,
    A_CHILD_LOST_IN_THE_UNIVERSE: -1,
    WHITE_FANG: -1,
    MIRACLE_ENCOUNTER: -1,
    GHOST_OF_DISTURBANCE: -1,
    HUMANKIND_DESPAIRS: -1,
    TIME_PASSES_REMORSELESSLY: -1,
    BOYS_AND_GIRLS_FROM_THE_BATTLEFIELD: -1,
    BEYOND_THE_TIME: -1,
    CONNECTING_MANY_LIVES: -1,
    HEROES_OF_THE_ONE_YEAR_WAR_1: -1,
    HEROES_OF_THE_ONE_YEAR_WAR_2: -1,
    MQUVES_VASE: -1,
    A_SOLDIERS_HEART: -1,
    THE_GENERAL_AND_THE_BEAST_YAZAN: -1,
    FRONTLINE_BEAST: -1,
    THE_GENERAL_AND_THE_BEAST_GHINGHAM: -1,
    FOR_THE_LOVED_ONE: -1,
    FAREWELL_LOVED_ONE: -1,
    INFILTRATION_IN_JUPRITIS: -1,
    TOO_MUCH_OF_A_WOMAN: -1,
    ATTRACTED_BY_THE_SCENT_OF_FLOWERS: -1,
    GOODBYE_DAYS_OF_YOUTH: -1,
    NEWTYPE_PLAYGROUND: -1,
    GYUNEIS_AMBITION_1: -1,
    GYUNEIS_AMBITION_2: -1,
    THE_PRESTIGE_OF_THE_ZABI_FAMILY_1: -1,
    THE_PRESTIGE_OF_THE_ZABI_FAMILY_1_ALT: -1,
    SLEGGAR_AND_THE_RETURN_TO_JUPITER: -1,
    SLEGGAR_AND_THE_CYBER_NEWTYPE: -1,
    SLEGGAR_AND_THE_LOVERS: -1,
    SLEGGAR_AND_THE_SCARY_WOMAN: -1,
    SLEGGAR_AND_THE_RED_COMET: -1,
    SPELLBOUND: -1,
    BROTHERS_AND_SISTERS: -1,
    FIND_THE_SONGSTRESS: -1,
    FRIEND_YESTERDAY_ENEMY_TODAY: -1,
    PRIVATE_LESSON: -1,
    A_FUTURE_FOR_TWO: -1,
    BEAUTIFUL_FACE: -1,
    YOUNGER_BOY: -1,
    PILOTING_PRACTICE: 0,
    BEGINNER_BATTLE_DRILL___SURFACE: 1,
    BEGINNER_BATTLE_DRILL___SPACE: 1,
    INTERMEDIATE_BATTLE_DRILL___SURFACE: 3,
    INTERMEDIATE_BATTLE_DRILL___SPACE: 3,
    ADVANCED_BATTLE_DRILL___SURFACE: 5,
    ADVANCED_BATTLE_DRILL___SPACE: 5,
    NUMBER_1000_SHOT_DOWN_ENEMIES: 1,
    NUMBER_5000_SHOT_DOWN_ENEMIES: 3,
    NUMBER_10000_SHOT_DOWN_ENEMIES: 3,
    NUMBER_20000_SHOT_DOWN_ENEMIES: 4,
    NUMBER_30000_SHOT_DOWN_ENEMIES: 4,
    NUMBER_40000_SHOT_DOWN_ENEMIES: 5,
    NUMBER_50000_SHOT_DOWN_ENEMIES: 5,
    NUMBER_10_COMPLETED_MISSIONS: 1,
    NUMBER_50_COMPLETED_MISSIONS: 2,
    NUMBER_100_COMPLETED_MISSIONS: 3,
    NUMBER_200_TOTAL_COMPLETED_MISSIONS: 3,
    NUMBER_300_TOTAL_COMPLETED_MISSIONS: 4,
    FORCED_EVOLUTION: 2,
    HUMAN_REFORM: 2,
    CHARS_CHALLENGE: -1,
    SOLDIERS_BATTLEFIELD_1: 2,
    SOLDIERS_BATTLEFIELD_2: 4,
    SOLDIERS_BATTLEFIELD_3: 4,
    SOLDIERS_BATTLEFIELD_4: 5,
    BLACK_TETRA_STARS_1: 4,
    BLACK_TETRA_STARS_2: 5,
    A_VETERANS_DEED_1: 4,
    A_VETERANS_DEED_2: 5,
    THE_FOURTH_YAZAN_CREWMAN_1: 4,
    THE_FOURTH_YAZAN_CREWMAN_2: 5,
    REMEMBER_THE_PAST_1: 4,
    REMEMBER_THE_PAST_2: 4,
    REMEMBER_THE_PAST_3: 4,
    REMEMBER_THE_PAST_4: 4,
    REMEMBER_THE_PAST_5: 4,
    REMEMBER_THE_PAST_6: 4,
    REMEMBER_THE_PAST_7: 6,
    THE_MONSTER_OF_ZEON: 1,
    HEROES_OF_THE_FEDERATION: 1,
    THE_MESSENGER_FROM_AXIS: 2,
    MASS_PRODUCTION_GUNDAM: 2,
    THIS_IS_NO_ZAKU_MY_FRIEND: 2,
    GIANT_REVEALED: 2,
    FOR_THE_GLORY_OF_ZEON: 3,
    GUARDIANS_OF_NATURE: 3,
    UNDER_NEO_ZEONS_FLAG: 3,
    JET_STREAM_ATTACK: 3,
    SOARING_DRAGON: 4,
    A_E_U_GS_PRIDE: 4,
    KNIGHTS_OF_THE_PRINCIPALITY: 4,
    THE_GENIUS_FROM_JUPRITIS: 5,
    COMING_FROM_UNDERWATER: 4,
    WOMENS_WAR: 4,
    HUNTER: 5,
    Z_GUNDAM_RETURNS: 5,
    CHAR_COLLECTION: -1,
    RED_TRI_STARS: 4,
    JERIDS_SOUL_PILGRIMAGE: 5,
    THE_SNAKE_AND_THE_SPIDER: 4,
    ULTIMATE_BROTHERS: 4,
    ZAKU_LOVERS_CLUB_1: 3,
    ZAKU_LOVERS_CLUB_2: 5,
    QUBELEY_STORM: -1,
    SOLO_IN_RED_1: 4,
    SOLO_IN_RED_2: 5,
    THE_PATH_TO_LEGEND_1: 2,
    THE_PATH_TO_LEGEND_2: 3,
    RED_COMETS_GLORY_1: 2,
    RED_COMETS_GLORY_2: 3,
    LEGENDARY_SUCCESSOR_1: 2,
    LEGENDARY_SUCCESSOR_2: 3,
    A_HUNDRED_YEARS_RADIANCE_1: 2,
    A_HUNDRED_YEARS_RADIANCE_2: 3,
    ZETAS_PULSE_1: 2,
    ZETAS_PULSE_2: 3,
    GODS_WILL: 3,
    AXIS_MOTHER_NATURE: 3,
    THE_ULTIMATE_POWER_1: 2,
    THE_ULTIMATE_POWER_2: 3,
    BATTLE_GIRL: 3,
    THE_STRONGEST_GUNDAM_1: 3,
    THE_STRONGEST_GUNDAM_2: 4,
    CRIMSON_REBELS_1: 3,
    CRIMSON_REBELS_2: 4,
    FORMULA_PROGRAM: 3,
    GUNDAM_CALLS_VICTORY: 3,
    THE_FIST_DWELLING_GOD: 3,
    THE_PRACTITIONERS_TEACHINGS: 3,
    GIVE_ME_YOUR_WINGS: -1,
    PATH_TO_THE_FUTURE: 3,
    THE_LEGACY_OF_THE_DARK_HISTORY: 3,
    THE_MESSENGER_OF_FREEDOM: 3,
    SWORD_OF_JUSTICE: 3,
    FATE_CONNECTION: 3,
    ARATAMA: 6,
    NIGITAMA: 6,
    GOOD_LUCK_LOSER: 1,
    JUST_WANTED_TO_GET_ALONG___: 1,
    HEDGEHOGS_DILEMMA: 1,
    LOVE_DUEL: 2,
    LOVE_SPECIAL_ATTACK: 3,
    BOYS_BE_AMBITIOUS: 3,
    WOMEN_WHO_LOOK_GOOD_ARMED: 3,
    VOICES_OF_THE_YOUNG: 3,
    LAST_GENERATION: 3,
    COWARD_1: 2,
    COWARD_2: 3,
    HAYATOS_REQUEST: 2,
    KYCILIAS_SECRET_REQUEST: 2,
    DOZLES_SECRET_REQUEST: 2,
    YAZANS_CREW_TEST: 4,
    SARAH_MIGHT_FORGIVE_YOU_BUT_I_WONT: 2,
    GLEMYS_AMBITION: 3,
    GYUNEIS_RESCUE: -1,
    SLEGGARS_FINAL_ATTACK: -1,
    THINGS_TO_PROTECT: -1,
    DEVIL_MACHINE: 3,
    GHINGHAMS_BIG_COMEBACK: 3,
    DO_YOU_LOVE_SUPER_ACES: 2,
    I_CAN_HEAR_YOUR_SONG: -1,
    POWER_IN_HAND_1: 2,
    POWER_IN_HAND_2: 4,
    EARTH_DOMINATION_1: 1,
    EARTH_DOMINATION_2: 2,
    EARTH_DOMINATION_3: 4,
    ETERNAL_COMET: -1,
    EARTH_CONQUEST_1: 1,
    EARTH_CONQUEST_2: 2,
    EARTH_CONQUEST_3: 4,
    CHARS_OFFERING: 5,
    FREEDOM_TO_SPACE_1: 1,
    FREEDOM_TO_SPACE_2: 2,
    FREEDOM_TO_SPACE_3: 4,
    THE_EARTH_IS_MY_BIRTHPLACE_1: 1,
    THE_EARTH_IS_MY_BIRTHPLACE_2: 2,
    THE_EARTH_IS_MY_BIRTHPLACE_3: 4,
    COLD_MACHIAVELLIAN: 5,
    FAITH_1: 1,
    FAITH_2: 3,
    FREEDOM_TO_SPACE_4: 2,
    FREEDOM_TO_SPACE_5: 4,
    JUNK_DEALERS_1: 3,
    JUNK_DEALERS_2: 5,
    STOP_ACTING_LIKE_THAT_BROTHER: 3,
    STOP_ACTING_LIKE_THAT_JUDAU: 5,
    FOR_WHOM_THE_BELL_TOLLS_1: 1,
    FOR_WHOM_THE_BELL_TOLLS_2: 3,
    WHITE_FANGS_RIP_THE_COSMOS: -1,
    ABOMINABLE_MEMORIES_1: 1,
    ABOMINABLE_MEMORIES_2: 3,
    THOSE_WHO_DISTURB_THE_SKIES_1: 2,
    THOSE_WHO_DISTURB_THE_SKIES_2: 3,
    THOSE_WHO_DISTURB_THE_SKIES_3: 5,
    TO_THE_VICTOR_1: 1,
    TO_THE_VICTOR_2: 3,
    OPERATION_GIANT_ROLLER: -1,
    GUNDAM_FIGHT_FIRST_ROUND: 3,
    GUNDAM_FIGHT_SEMIFINALS: 4,
    GUNDAM_FIGHT_FINALS: 7,
    BEHIND_THE_SCENES: 6,
    BEWILDERED_SOLDIERS: -1,
    THE_GLASS_KINGDOM: -1,
    ENDLESS_WALTZ: -1,
    OPERATION_RETURN_TO_EARTH_1: 3,
    OPERATION_RETURN_TO_EARTH_2: 4,
    ALL_OF_THE_COSMOS_1: 2,
    ALL_OF_THE_COSMOS_2: 4,
    THE_GREAT_ESCAPE: 3,
    THE_GREAT_PURSUIT: 3,
    ALL_OF_THE_COSMOS_3: 5,
    A_SONG_OF_PEACE_1: 2,
    A_SONG_OF_PEACE_2: 3,
    A_SONG_OF_PEACE_3: 4,
    THE_MIGHTIEST_SURFACE_WEAPON: 5,
    BALL_IS_YOUR_FRIEND: 5,
    SEEKING_THE_ULTIMATE_ZAKU: -1,
    ETERNAL_BINARY_STAR: 6,
    A_E_U_GS_HOPE: 6,
    DON_QUIJOTE: 6,
    IM_A_NEWTYPE____A_CYBER_NEWTYPE: 7,
    CHARS_CHALLENGE_2: -1,
    A_DANGEROUS_YOUNG_LADY: -1,
    CAPTIVE_PRINCESS: 7,
    BURN_DRAGON: -1,
    WAR_GODDESS: 7,
    YAZANS_STRIKE_FORCE_IS_IMMORTAL: 7,
    TOWARDS_TOMORROW: 7,
    FIGHTING_SPIRIT: 7,
    CRIMSON_LIGHTNING: 7,
    YOURE_IN_MY_WAY: 7,
    THE_SHOCKING_DARK_HISTORY: -1,
    KING_OF_HEARTS_CHALLENGE: 7,
    LOOK_THE_EAST_BURNS_CRIMSON_RED: 7,
    CMON_CMON_BRING_IT_ON: 7,
    WHITE_DEVIL: 7,
    THE_FINAL_VICTOR: 7,
    MOONLIGHT_BUTTERFLY_VS__WINGS_OF_FIRE: 7,
    THE_FINAL_POWER: -1,
    PERSEVERING_JUSTICE: 7,
    ZERO_VS__EPYON: -1,
    GET_ALONG: -1,
    ITS_NOT_ANIME: 7,
    ZETAS_FIRST_LAUNCH: -1,
    DONT_UNDERESTIMATE_IT: 8,
    SCIROCCOS_UTOPIA: -1,
    GIANT_RED_STAR: 8,
    GREAT_FREEDOM_GREAT_RESPONSIBILITY: 8,
    AMURO_RAY_MISSION: 8,
    CHALLENGE_THE_LEGEND: 8,
    ONE_MAN_ARMY: 8,
    THE_POWER_OF_BONDS: 8,
    THE_TRUE_DYNASTY_WARRIORS_GUNDAM: 8,
    A_GENERALS_DIGNITY: -1,
}

GUNDAM = 0x00
ZAKU_II_CHAR = 0x01
GELGOOG_CHAR = 0x02
GUNDAM_MK_II = 0x03
Z_GUNDAM = 0x04
HYAKU_SHIKI = 0x05
GUNDAM_MK_II_Titans = 0x06
THE_O = 0x07
QUBELEY = 0x08
ΖΖ_GUNDAM = 0x09
QUBELEY_MK_II_Puru = 0x0A
QUBELEY_MK_II_Puru_Two = 0x0B
NU_GUNDAM = 0x0C
SAZABI = 0x0D
GUNDAM_F91 = 0x0E
V2_GUNDAM = 0x0F
BURNING_GUNDAM = 0x10
MASTER_GUNDAM = 0x11
WING_GUNDAM_ZERO = 0x12
GUNDAM_EPYON = 0x13
TURN_A_GUNDAM = 0x14
STRIKE_FREEDOM_GUNDAM = 0x15
INFINITE_JUSTICE_GUNDAM = 0x16
DESTINY_GUNDAM = 0x17
MUSHA_GUNDAM = 0x18
MUSHA_GUNDAM_MK_II = 0x19
GUNCANNON = 0x1A
ZGOK_CHAR = 0x1B
ZEONG = 0x1C
GELGOOG_JOHNNY = 0x1D
HAMBRABI = 0x1E
BYARLANT = 0x1F
BAUND_DOC = 0x20
BOLINOAK_SAMMAHN = 0x21
PALLAS_ATHENE = 0x22
BAWOO = 0x23
RE_GZ = 0x24
JAGD_DOGA_GYUNEI = 0x25
JAGD_DOGA_QUESS = 0x26
GOTTRLATAN = 0x27
TURN_X = 0x28
GM = 0x29
BALL = 0x2A
ZAKU_II = 0x2B
GOUF = 0x2C
DOM = 0x2D
// RICK_DOM = 0xFF // NOT actually in the game. 
ZGOK = 0x2E
GYAN = 0x2F
GELGOOG = 0x30
ZAKU_TANK = 0x31
GM_COMMAND = 0x32
GOUF_FLIGHT_TYPE = 0x33
GM_II = 0x34
NEMO = 0x35
RICK_DIAS = 0x36
HIZACK = 0x37
MARASAI = 0x38
BARZAM = 0x39
GAZA_C = 0x3A
MP_QUBELEY = 0x3B
MP_BAWOO_GLEMY = 0x3C
MP_BAWOO_AXIS = 0x3D
GAZA_D = 0x3E
JEGAN = 0x3F
GEARA_DOGA_REZIN = 0x40
GEARA_DOGA = 0x41
BIG_ZAM = 0x42
PSYCO_GUNDAM = 0x43
PSYCO_GUNDAM_MK_II = 0x44
QUIN_MANTHA = 0x45
ALPHA_AZIERU = 0x46
DARK_GUNDAM = 0x47


suitNameLookup =
{
    GUNDAM: "Gundam",
    ZAKU_II_CHAR: "Zaku II (Char)",
    GELGOOG_CHAR: "Gelgoog (Char)",
    GUNDAM_MK_II: "Gundam Mk-II",
    Z_GUNDAM: "Z Gundam",
    HYAKU_SHIKI: "Hyaku Shiki",
    GUNDAM_MK_II_Titans: "Gundam Mk-II (Titans)",
    THE_O: "The O",
    QUBELEY: "Qubeley",
    ΖΖ_GUNDAM: "ΖΖ Gundam",
    QUBELEY_MK_II_Puru: "Qubeley Mk-II (Puru)",
    QUBELEY_MK_II_Puru_Two: "Qubeley Mk-II (Puru Two)",
    NU_GUNDAM: "Nu Gundam",
    SAZABI: "Sazabi",
    GUNDAM_F91: "Gundam F91",
    V2_GUNDAM: "V2 Gundam",
    BURNING_GUNDAM: "Burning Gundam",
    MASTER_GUNDAM: "Master Gundam",
    WING_GUNDAM_ZERO: "Wing Gundam Zero",
    GUNDAM_EPYON: "Gundam Epyon",
    TURN_A_GUNDAM: "Turn A Gundam",
    STRIKE_FREEDOM_GUNDAM: "Strike Freedom Gundam",
    INFINITE_JUSTICE_GUNDAM: "Infinite Justice Gundam",
    DESTINY_GUNDAM: "Destiny Gundam",
    MUSHA_GUNDAM: "Musha Gundam",
    MUSHA_GUNDAM_MK_II: "Musha Gundam Mk-II",
    GUNCANNON: "Guncannon",
    ZGOK_CHAR: "Z'Gok (Char)",
    ZEONG: "Zeong",
    GELGOOG_JOHNNY: "Gelgoog (Johnny)",
    HAMBRABI: "Hambrabi",
    BYARLANT: "Byarlant",
    BAUND_DOC: "Baund Doc",
    BOLINOAK_SAMMAHN: "Bolinoak Sammahn",
    PALLAS_ATHENE: "Pallas Athene",
    BAWOO: "Bawoo",
    RE_GZ: "Re-GZ",
    JAGD_DOGA_GYUNEI: "Jagd Doga (Gyunei)",
    JAGD_DOGA_QUESS: "Jagd Doga (Quess)",
    GOTTRLATAN: "Gottrlatan",
    TURN_X: "Turn X",
    GM: "GM",
    BALL: "Ball",
    ZAKU_II: "Zaku II",
    GOUF: "Gouf",
    DOM: "Dom",
    ZGOK: "Z'Gok",
    GYAN: "Gyan",
    GELGOOG: "Gelgoog",
    ZAKU_TANK: "Zaku Tank",
    GM_COMMAND: "GM Command",
    GOUF_FLIGHT_TYPE: "Gouf Flight Type",
    GM_II: "GM II",
    NEMO: "Nemo",
    RICK_DIAS: "Rick Dias",
    HIZACK: "Hizack",
    MARASAI: "Marasai",
    BARZAM: "Barzam",
    GAZA_C: "Gaza C",
    MP_QUBELEY: "MP Qubeley",
    MP_BAWOO_GLEMY: "MP Bawoo (Glemy)",
    MP_BAWOO_AXIS: "MP Bawoo (Axis)",
    GAZA_D: "Gaza D",
    JEGAN: "Jegan",
    GEARA_DOGA_REZIN: "Geara Doga (Rezin)",
    GEARA_DOGA: "Geara Doga",   // Last selectable
    BIG_ZAM: "Big Zam",
    PSYCO_GUNDAM: "Psyco Gundam",
    PSYCO_GUNDAM_MK_II: "Psyco Gundam Mk II",
    QUIN_MANTHA: "Quin Mantha",
    ALPHA_AZIERU: "Alpha Azieru",
    DARK_GUNDAM: "Dark Gundam"
}

FIRST_SELECTABLE_SUIT_INDEX = 0x00
LAST_SELECTABLE_SUIT_INDEX = 0x42

// $3B4CE8: (8-bit) Mode Selected.
//          
//          0x00 = Original Mode
//          0x01 = Mission Mode
//          0x02 = Versus Mode
//          0x03 = Gallery
//          0x04 = Options
//          0x05 = Restart (Interim Continue)
function gameModeSelected() => byte(0x3B4CE8)
ORIGINAL_MODE_VALUE = 0x00
MISSION_MODE_VALUE = 0x01
ITERIM_CONTINUE_VALUE = 0x05
VERSUS_MODE_VALUE = 0x02

function isOriginalMode() => gameModeSelected() == ORIGINAL_MODE_VALUE
function isMissionMode() => gameModeSelected() == MISSION_MODE_VALUE
function isIterimMode() => gameModeSelected() == ITERIM_CONTINUE_VALUE 
function isVersusMode() => gameModeSelected() == VERSUS_MODE_VALUE

function isOriginalMissionOrIterimContinue()  => isOriginalMode() || 
                                                 isMissionMode() || 
                                                 isIterimMode()

function isOriginalOrIterimMode() => isOriginalMode() || 
                                     isIterimMode()

function isMissionOrIterimMode() => isMissionMode() || 
                                    isIterimMode()  

// $50ff4a: (16-bit)  Total KOs in a Mission
function totalKOsInMission() => word(0x50ff4a)


// $62cb98: (32-bit) Frames SInce beginning of Mission
function framesSinceMissionStart() => dword(0x62cb98)

// $648FE8: (8-bit) Save Indicator 1
//          
//          0x00 = Not Loading
//          0x01 = Loading a Save File
function saveIndicator1() => byte(0x648FE8)
SAVE_INDICATOR_1_NOT_OK_VALUE = 0x01

function isSaveIndicator1OK() => saveIndicator1() != SAVE_INDICATOR_1_NOT_OK_VALUE

// $64AAE8: (8-bit) Save Indicator 2
//          
//          0x00 = Not Loading
//          0x01 = Loading a Save File
function saveIndicator2() => byte(0x64AAE8)
SAVE_INDICATOR_2_NOT_OK_VALUE = 0x01

function isSaveIndicator2OK() => saveIndicator2() != SAVE_INDICATOR_2_NOT_OK_VALUE

// $682210: (8-bit) Mission Complete markers.
//          
//          0x00 = Has not won.
//          0x01 = Won Mission
//          
//          Doesn't appear to be saved out.
//          Does not appear to be cleared until you join the next mission.
//          
//          This is a control for "Mission Complete" or "Mission failure" that pops up.
function missionCompleteMarker() => byte(0x682210)
IN_GAME_NOT_WON_MISSION_VALUE = 0x00
IN_GAME_WON_MISSION_VALUE = 0x01

function justWonMission() => prev(missionCompleteMarker()) == IN_GAME_NOT_WON_MISSION_VALUE &&
                             missionCompleteMarker() == IN_GAME_WON_MISSION_VALUE

// Values are below.
AMURO_RAY_NAME_MEMORY_LOCATION = 0x68DA26
CHAR_AZNABLE_NAME_MEMORY_LOCATION = 0x68DA76
CHARACTER_MEMORY_OFFSET = CHAR_AZNABLE_NAME_MEMORY_LOCATION - AMURO_RAY_NAME_MEMORY_LOCATION
AMURO_LICENSE_BITFIELD_MEMORY_LOCATION = 0x68DA28
CHARACTER_LICENSE_OFFSET = AMURO_LICENSE_BITFIELD_MEMORY_LOCATION - AMURO_RAY_NAME_MEMORY_LOCATION
AMURO_MISSION_INFO_MEMORY_LOCATION = 0x68DA2C
CHARACTER_MISSION_INFO_OFFSET = AMURO_MISSION_INFO_MEMORY_LOCATION - AMURO_RAY_NAME_MEMORY_LOCATION
AMURO_LEVEL_MEMORY_LOCATION = 0x68DA33
CHARACTER_LEVEL_OFFSET = AMURO_LEVEL_MEMORY_LOCATION - AMURO_RAY_NAME_MEMORY_LOCATION
AMURO_SKILL_LIST_MEMORY_LOCATION = 0x68DA48
CHARACTER_SKILL_LIST_OFFSET = AMURO_SKILL_LIST_MEMORY_LOCATION - AMURO_RAY_NAME_MEMORY_LOCATION
FINAL_CHARACTER_SKILL_LIST_OFFSET = CHARACTER_SKILL_LIST_OFFSET + 5
FINAL_CHARACTER_LICENSE_OFFSET = CHARACTER_LICENSE_OFFSET + 2


FULL_SKILL_COUNT = 36
HALF_SKILL_COUNT = 18
FULL_LICENSE_COUNT = 24
HALF_LICENSE_COUNT = 12
function characterValueMemory(character, offset) => AMURO_RAY_NAME_MEMORY_LOCATION + (character * CHARACTER_MEMORY_OFFSET) + offset

function characterSkillCount(character) => sum_of( range(CHARACTER_SKILL_LIST_OFFSET, FINAL_CHARACTER_SKILL_LIST_OFFSET), offset => bitcount(characterValueMemory(character, offset)))
function characterPrevSkillCount(character) => sum_of(range(CHARACTER_SKILL_LIST_OFFSET, FINAL_CHARACTER_SKILL_LIST_OFFSET), offset => prev(bitcount(characterValueMemory(character, offset))))

function characterLicenseCount(character) => sum_of(range(CHARACTER_LICENSE_OFFSET, FINAL_CHARACTER_LICENSE_OFFSET), offset => bitcount(characterValueMemory(character, offset)))
function characterPrevLicenseCount(character) => sum_of(range(CHARACTER_LICENSE_OFFSET, FINAL_CHARACTER_LICENSE_OFFSET), offset => prev(bitcount(characterValueMemory(character, offset))))

// $68DA26: (16-bit) Amuro Ray's Name and character model.
// function amuroRayName() => word(0x68DA26)

// $68DA28: (24-bit bitfield)  Amuro Ray's License Bitfield.
//          
//          0xffffff = All Licenses.
//          
//          Bit0 =Gundam
//          Bit1 = Char Zaku II
// function amuroRayLicenseBitfield() => tbyte(0x68DA28)

// $68DA2C: (bitfield) Amuro Ray Mission information
//          
//          bit1 = Selectable
//          bit3 = New tag (goes away after usage)
//          bit6 = Change Outfits
//          
//          Becomes 0x22b when unlocked, but becomes 0x0203 after clicking on the mission list (don't know what the first 2 is but it disappears).
//          
//          Follows based on list of people at 0x006ce470 So 6 more and you get Domon Kasshu
// function amuroRayMissionInfo() => byte(0x68DA2C)

// $68DA33: (8-bit) Amuro Ray's Level
//          
//          0x00 = Level 1
//          0x01 = Level 2
//          0x02 = Level 3
// function amuroRayLevel() => byte(0x68DA33)

// $68DA34: (32-bit) Amuro Ray's Experience points
// function amuroRayExperiencePoints() => dword(0x68DA34)

// $68DA48: (36-bit bitfield) Amuro Ray Skill list
//          
//          Max = 0x1fdfffffff  (That's 36 bits)
//          
//          Note: Specific order is unknown, and not investigates
// function amuroRaySkillList() => byte(0x68DA48)

// $68DA76: (16-bit) Char Azable Name
//          
//          Saved for offset.
//function charAzableName() => word(0x68DA76)

// $68DA7C: (bitfield) Char Aznable Mission informatikon
//          
//          bit1 = Selectable
//          bit3 = New tag (goes away after usage)
//          
//          Becomes 0x22b when unlocked, but becomes 0x0203 after clicking ont he mission list (don't know what the first 2 is but it disappears).
// function charAznableMissionInfo() => byte(0x68DA7C)

// $68DA83: Char Anz
// function charAznableLevel() => byte(0x68DA83)

// $691A30: (16-bit) Gundam (Suit 1) Display image
//          
//          0x00 = Gundam
//          0x01 = Zaku 2
//          and so on.
function suit1DisplayImage() => word(0x691A30)

FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION = 0x691A30
SECOND_SUITE_DISPLAY_IMAGE_MEMORY_LOCATION = 0x691AC0
SUIT_DISPLAY_IMAGE_MEMORY_OFFSET = SECOND_SUITE_DISPLAY_IMAGE_MEMORY_LOCATION - FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION
FIRST_SUIT_OWNERSHIP_MEMORY_LOCATION = 0x691A56
SUIT_OWNERSHIP_OFFSET = FIRST_SUIT_OWNERSHIP_MEMORY_LOCATION - FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION
FIRST_SUIT_OWNED_PIECES_MEMORY_LOCATION = 0x691A68
SUIT_OWNED_PIECES_OFFSET = FIRST_SUIT_OWNED_PIECES_MEMORY_LOCATION - FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION
FIRST_SUIT_PART1_RANK_MEMORY_LOCATION = 0x691A73
PART_RANK_OFFSET = FIRST_SUIT_PART1_RANK_MEMORY_LOCATION - FIRST_SUIT_PART1_RANK_MEMORY_LOCATION
SUIT_PART1_RANK_OFFSET = FIRST_SUIT_PART1_RANK_MEMORY_LOCATION - FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION
FIRST_SUIT_PART2_RANK_MEMORY_LOCATION = 0x691A83
PART_MEMORY_OFFSET = FIRST_SUIT_PART2_RANK_MEMORY_LOCATION - FIRST_SUIT_PART1_RANK_MEMORY_LOCATION
FIRST_SUIT_PART1_ABILITY_MEMORY_LOCATION = 0x691A74
PART_ABILITY_OFFSET = FIRST_SUIT_PART1_ABILITY_MEMORY_LOCATION - FIRST_SUIT_PART1_RANK_MEMORY_LOCATION
FIRST_SUIT_PART1_SUIT_INDEX_MEMORY_LOCATION = 0x691A70
PART_SUIT_INDEX_OFFSET = FIRST_SUIT_PART1_SUIT_INDEX_MEMORY_LOCATION - FIRST_SUIT_PART1_RANK_MEMORY_LOCATION
FIRST_SUIT_PART1_TYPE_MEMORY_LOCATION = 0x691A72
PART_TYPE_OFFSET = FIRST_SUIT_PART1_TYPE_MEMORY_LOCATION - FIRST_SUIT_PART1_RANK_MEMORY_LOCATION
UNOWNED_PART_VALUE = 0x03E7
UNOWNED_PART_TYPE_VALUE = 0x05

function suitValueMemory(suit, offset) => FIRST_SUIT_DISPLAY_IMAGE_MEMORY_LOCATION + (suit * SUIT_DISPLAY_IMAGE_MEMORY_OFFSET) + offset

function suitUnlockValueMemory(suit) => bit0(suitValueMemory(suit, SUIT_OWNERSHIP_OFFSET))

function suitPartMemory(suit, part, offset) => suitValueMemory(suit, SUIT_PART1_RANK_OFFSET) + (part * PART_MEMORY_OFFSET) + offset

function suitPartRank(suit, part) => byte(suitPartMemory(suit, part, PART_RANK_OFFSET))

// Note this is true for all three part pieces as well as 5 part pieces. 
function checkRank4Part(suit, part) => suitPartRank(suit, part) == 0x03 && word(suitPartMemory(suit, part, PART_SUIT_INDEX_OFFSET)) != UNOWNED_PART_VALUE && byte(suitPartMemory(suit, part, PART_TYPE_OFFSET)) == part
function checkprevRank4Part(suit, part) => prev(suitPartRank(suit, part)) == 0x03 && prev(word(suitPartMemory(suit, part, PART_SUIT_INDEX_OFFSET))) != UNOWNED_PART_VALUE && prev(byte(suitPartMemory(suit, part, PART_TYPE_OFFSET))) == part

// $691A56: (bitfield) Gundam (Suit 1) Ownership
//          
//          bit0 = All parts obtained.
//          bit5 = Fourth Rank gear are UNLOCKED (not necessarily owned)
//          
// function suit1Ownership() => byte(0x691A56)

// $691A68: (40-bit, Array of 5 bytes) Gundam (Suit 1) Equips
//          
//          For the next equips
//          0x00 = Exists,
//          0x01 =Not owned yet.
//          
//          Torso, Left Arm, Right Arm, Left Leg, Right Leg
// function suit1ownedPieces() => byte(0x691A68)

// $691A70: (16-bit) Gundam (Suit 1) Part 1 Suit Index
//          0x03e7(999) = not owned. 
//          Same value as Suit Index if owned. (0x00 = Gundam, 0x01 = Char's Zaku II)


// $691A72: (8-bit) Gundam (Suit 1) Part 1 Type
//          
//          0x00 = Torso
//          0x01 = Left Arm
//          0x02 = Right Arm
//          0x03 = Left Leg
//          0x04 = Right Leg
// function suit1Part1Type() => byte(0x691A72)

// $691A73: (8-bit) Gundam (Suit 1) Part 1 Rank
//          
//          0x00 = Rank 1
//          0x01 = Rank 2
//          0x02 = Rank 3
//          0x03 = Rank 4
// function suit1Part1Rank() => byte(0x691A73)

// $691A74: (8-bit) Gundam (Suit 1) Part 1 Ability
//          
//          0xff = Disabled (None)
//          0x00 - 0x16 = Suit Skills.
// function suit1Part1Ability() => byte(0x691A74)

// $691A78: (16-bit) Gundam (Suit 1) Part 1 Power 1
//          
//          On Torso it's Armor
//          
//          Armor is divided by 10 to display.
// function suit1Part1Power1() => word(0x691A78)

// $691A7A: (16-bit) Gundam (Suit 1) Part 1 Power 2
//          
//          For Torso it's SP lvl
//          
//          0x00 = Sp Lv 1
//          0x01 = Sp Lv 2
//          0x03 = Sp Lv 3
// function suit1Part1Power2() => word(0x691A7A)

// $691A7C: (16-bit) Gundam (Suit 1) Part 1 Power 3
//          
//          On Torso it's Mobility
//function suit1Part1Power3() => word(0x691A7C)

// $691A82: (8-bit) Gundam (Suit 1) Part 2 Type
//          
//          0x00 = Torso
//          0x01 = Left Arm
//          0x02 = Right Arm
//          0x03 = Left Leg
//          0x04 = Right Leg
//function suit1Part2Type() => byte(0x691A82)

// $691A83: (8-bit) Gundam (Suit 1) Part 2 Rank
//          
//          0x00 = Rank 1
//          0x01 = Rank 2
//          0x02 = Rank 3
//          0x04 = Rank 4
//function suit1Part2Rank() => byte(0x691A83)

// $691A84: (8-bit) Gundam (Suit 1) Part 2 Ability
//          
//          0xff = Disabled (None)
//          0x00 - 0x16 = Suit Skills.
//function suit1Part2Ability() => byte(0x691A84)

// $691A88: (16-bit) Gundam (Suit 1) Part 2 Power 1
//          
//          Left Arm it's Melee
//function suit1Part2Power1() => word(0x691A88)

// $691A8A: (16-bit) Gundam (Suit 1) Part 2 Power 2
//          
//          Left Arm it's Shot
//function suit1Part2Power2() => word(0x691A8A)

// $691A8C: (16-bit) Gundam (Suit 1) Part 2 Power 3
//          
//          Left Arm it's Defense
//function suit1Part2Power3() => word(0x691A8C)

// $691A8E: (16-bit) Gundam (Suit 1) Part 2 Power 4
//          
//          Left Arm it's Thruster
//function suit1Part2Power4() => word(0x691A8E)

// $691AC0: (16-bit) Zaku II (Suit 2) Display image
//          
//          0x00 = Gundam
//          0x01 = Zaku II (Char)
//          and so on.
//function suit2DisplayImage() => word(0x691AC0)

// $6965E0: (8-bit) Amuro's 1st Story mission complete status.
//          
//          Set to 0x04 when player wins.
//          
//          0x01 doesn't appear to mark complete.
AMURO_FIRST_MISSION_COMPLETE_MEMORY_LOCATION = 0x6965E0
AMURO_FIRST_MISSION_TOTAL_MEMORY_LOCATION = 0x696630
AMURO_SECOND_MISSION_COMPLETE_MEMORY_LOCATION = 0x696634
MISSION_COMPLETE_MEMORY_OFFSET = AMURO_SECOND_MISSION_COMPLETE_MEMORY_LOCATION - AMURO_FIRST_MISSION_COMPLETE_MEMORY_LOCATION
MISSION_COMPLETE_CHARACTER_OFFSET = 1  // it's one byte.

function missionCompleteMemoryLookup(mission) => bit2(AMURO_FIRST_MISSION_TOTAL_MEMORY_LOCATION + (mission * MISSION_COMPLETE_MEMORY_OFFSET))

// Only should be used by Hayato or Kai. 
function missionCompleteCharacterMemoryLookup(mission, character) => bit2(AMURO_FIRST_MISSION_COMPLETE_MEMORY_LOCATION + (character * MISSION_COMPLETE_CHARACTER_OFFSET) + (mission * MISSION_COMPLETE_MEMORY_OFFSET))

function amuroFirstOriginalMission() => byte(0x6965E0)

// $696630: (8-bit) Amuro's 1st Story Total Mission complete status. 
//
//          Set to 0x04 when any player wins. 

// $696634: (8-bit) Amuro's 2nd Story mission complete status.
//          
//          Set to 0x04 when player wins.
function amuroSecondOriginalMission() => byte(0x696634)

// $69682C: (8-bit) Amuro's Second Story, 1st Story mission complete status.
//          
//          Set to 0x04 when player wins.
function amuroSecondStoryFirstMission() => byte(0x69682C)

// $696880: (8-bit) Amuro's Second Story, 2nd Story mission complete status.
//          
//          Set to 0x04 when player wins.
function amuroSecondStorySecondMission() => byte(0x696880)

// $697060: (bitfield) Amuro Ray's Mission Mode Psycoframe Light
//          
//          Starts around 0x3b  becomes 0x7 when Beaten
function amuroFirstMissionMode() => byte(0x697060)

AMURO_FRIEND_DISPLAY_MEMORY_LOCATION = 0x6A1DC0
CHAR_FRIEND_DISPLAY_MEMORY_LOCATION = 0x6A2460
AMURO_FRIEND_LEVEL_MEMORY_LOCATION = 0x6A1E10
FRIENDS_CHARACTER_OFFSET = CHAR_FRIEND_DISPLAY_MEMORY_LOCATION - AMURO_FRIEND_DISPLAY_MEMORY_LOCATION
FRIEND_VISIBLE_OFFSET = 1
FRIEND_LEVEL_OFFSET = 2

function calculateFriend(character, index)
{
    // return (byte(AMURO_FRIEND_DISPLAY_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_VISIBLE_OFFSET)  & 16) *
     //      word(AMURO_FRIEND_LEVEL_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_LEVEL_OFFSET) / (800 * 16)
    return word(AMURO_FRIEND_LEVEL_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_LEVEL_OFFSET) / 800    
}

function calculateVisibleFriend(character, index) =>  bit4(AMURO_FRIEND_DISPLAY_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_VISIBLE_OFFSET)

function calculatePrevFriend(character, index)
{
//    return prev(bit4(AMURO_FRIEND_DISPLAY_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_VISIBLE_OFFSET)) *
  //         prev(word(AMURO_FRIEND_LEVEL_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_LEVEL_OFFSET)) / 800
      return prev(word(AMURO_FRIEND_LEVEL_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_LEVEL_OFFSET)) / 800 
}

function calculatePrevVisibleFriend(character, index) =>  prev(bit4(AMURO_FRIEND_DISPLAY_MEMORY_LOCATION + (character * FRIENDS_CHARACTER_OFFSET) + index * FRIEND_VISIBLE_OFFSET))

// Removed Crown, Kacricon, and Kyoji  They are not friendable. 
friendList = 
[
    AMURO_RAY,
    CHAR_AZNABLE,
    KAMILLE_BIDAN,
    PAPTIMUS_SCIROCCO,
    HAMAN_KARN,
    JUDAU_ASHTA,
    DOMON_KASSHU,
    MASTER_ASIA,
    HEERO_YUY,
    MILLIARDO_PEACECRAFT,
    LORAN_CEHACK,
    EMMA_SHEEN,
    JERID_MESSA,
    ELPEO_PURU,
    PURU_TWO,
    ROUX_LOUKA,
    KIRA_YAMATO,
    ATHRUN_ZALA,
    SHINN_ASUKA,
    SEABOOK_ARNO,
    USO_EWIN,
    KAI_SHIDEN,
    HAYATO_KOBAYASHI,
    M_QUVE,
    RAMBA_RAL,
    YAZAN_GABLE,
    SARAH_ZABIAROV,
    RECCOA_LONDE,
    GLEMY_TOTO,
    QUESS_PARAYA,
    GYUNEI_GUSS,
    DOZLE_ZABI,
    SLEGGAR_LAW,
    FOUR_MURASAME,
    ROSAMIA_BADAM,
    GYM_GHINGHAM,
    LACUS_CLYNE,
    LUNAMARIA_HAWKE,
    CECILY_FAIRCHILD,
    KATEJINA_LOOS,
    JOHNNY_RIDDEN,
    FA_YUIRY,
    LALAH_SUNE,
    GAIA,
    ORTEGA,
    MASH,
    ROBERTO,
    APOLLY_BAY,
    DUNKEL_COOPER,
    RAMSUS_HASR,
    BEECHA_OLEG,
    ELLE_VIANNO,
    REZIN_SCHNYDER,
    KAYRA_SU,
    CHAN_AGI,
    HATHAWAY_NOA,
    BRIGHT_NOA,
    FRAW_BOW,
    KYCILIA_ZABI,
    TORRES,
    HENKEN_BEKKENER,
    RAIN_MIKAMURA,
    NANAI_MIGUEL,
    LEINA_ASHTA,
    ASTONAIGE_MEDOZ,
    GIHREN_ZABI,
    BASK_OM,
    RELENA_DARLIAN,
    DIANNA_SORIEL
]

function countFriends(character){
    return sum_of(friendList, friendIndex =>
                        calculateFriend(character, friendIndex) )
}

function countVisibleFriends(character){
    return sum_of(friendList, friendIndex => 
                        calculateVisibleFriend(character, friendIndex) )
}

function countPrevFriends(character){
    return sum_of(friendList, friendIndex => 
                        calculatePrevFriend(character, friendIndex))
}

function countPrevVisibleFriends(character){
    return sum_of(friendList, friendIndex => 
                        calculatePrevVisibleFriend(character, friendIndex) )
}


// $6A1DC0: (8-bitfield of 71 elements))  Amuro's Friend display status
//          
//          bit4 = Display friendship.
//          
//          See 0x006ce470 for order.
function amuroFriendDisplay() => byte(0x6A1DC0)

// $6A1E10: (16-bit array of 71 elements) Amuro Ray's "Friendship" level.
//          
//          Note, Amuro doesn't appear to be able to be friends with himself.  Makes sense.
//          
//          Ranges from 0x00 to 0x3e8 (1000)
//          
//          0xc7- (199) = Contempt
//          0x320+ (800) = Friend
//          See 0x006ce470 for order.
function amuroFriendLevel() => word(0x6A1E10)

// $6a2460: (8-bitfield of 71 elements))  Char's Friend display status
//
//          bit4 = Display friendship.
//
//          See 0x006ce470 for order.0x006a24600x006a1dc0
function charFriendDisplay() => byte(0x6A2460)

// $6C2FC4: (bitfield)(bitfield) Amuro Ray's Mission Mode message titled  "Chan - Emergency Launch Message"
//          
//          bit0 = Read
//          
//          Sets to 1b when read, which also activates the mission.  Once mission is activate, this check is no longer used, however this is how the mission gets activated the first time.
function amuroMissionModeMessage() => byte(0x6C2FC4)

// $6CD420: (32-bit) Amuro Ray's Total Shot Down
//          
//          Note: Signed Value
function amuroRayTotalShotDown() => dword(0x6CD420)

// $6CD424: (32-bit) Char Aznable's Total Shot Down
//          
//          Note: Signed Value
function charAznableTotalShotDown() => dword(0x6CD424)

// $6CD560: (32-bit) Mobile Suit 1 (Gundam) Total Shot Down
function mobileSuit1TotalShotDown() => dword(0x6CD560)

// $6CD564: (32-bit) Mobile Suit 2 (Zaku II (Char)) Total Shot Down
function mobileSuit2TotalShotDown() => dword(0x6CD564)

// $6CD7E0: (32-bit) Mobile Suit 1 (Gundam) Total Missions
function mobileSuit1TotalMissions() => dword(0x6CD7E0)

// $6CD7E4: (32-bit) Mobile Suit 2 (Zaku II (Char))Total Mission
function mobileSuit2TotalMissions() => dword(0x6CD7E4)

// $6CE0A0: (8-bit) Amuro Total Number of Missions complete
function amuroTotalMissionsComplete() => byte(0x6CE0A0)

// $6CE470: (8-bit) Selected character in Mission Mode
//          
//          Control in Mission mode, Not a control in Official mode.
//          
//          Note: Some of these might not have mission modes.
//          
//          0x00 = Amuro Ray
//          0x01 = Char Aznable
//          0x02 = Kamille Bidan
//          0x03 = Paptimus Scirocco
//          0x04 = Haman Karn
//          0x05 = Judau Ashta
//          0x06 = Domon Kasshu
//          0x07 = Master Asia
//          0x08 = Heero Yuy
//          0x09 = Milliardo Peacecraft
//          0x0a = Loran Cehack
//          0x0b = Emma Sheen
//          0x0c = Jerid Messa
//          0x0d = Elpeo Puru
//          0x0e = Puru Two
//          0x0f = Roux Louka
//          0x10 = Kira Yamato
//          0x11 = Athrun Zala
//          0x12 = Shinn Asuka
//          0x13 = Seabook Arno
//          0x14 = Uso Ewin
//          0x15 = Kai Shiden
//          0x16 = Hayato Kobayashi
//          0x17 = M'Quve
//          0x18 = Ramba Ral
//          0x19 = Yazan Gable
//          0x1a = Sarah Zabiarov
//          0x1b = Reccoa Londe
//          0x1c = Glemy Toto
//          0x1d = Quess Paraya
//          0x1e = Gyunei Guss
//          0x1f = Dozle Zabi
//          0x20 = Sleggar Law
//          0x21 = Four Murasame
//          0x22 = Rosamia Badam
//          0x23 = Gym Ghingham
//          0x24 = Lacus Clyne
//          0x25 = Lunamaria Hawke
//          0x26 = Cecily Fairchild
//          0x27 = Katejina Loos
//          0x28 = Johnny Ridden
//          0x29 = Fa Yuiry
//          0x2a = Lalah Sune
//          0x2b = Gaia
//          0x2c = Ortega
//          0x2d = Mash
//          0x2e = Roberto
//          0x2f = Apolly Bay
//          0x30 = Kacricon Cacooler
//          0x31 = Dunkel Cooper
//          0x32 = Ramsus Hasr
//          0x33 = Beecha Oleg
//          0x34 = Elle Vianno
//          0x35 = Rezin Schnyder
//          0x36 = Kayra Su
//          0x37 = Chan Agi
//          0x38 = Hathaway Noa
//          0x39 = Kyoji Kasshu
//          0x3a = Crown
//          0x3b = Bright Noa
//          0x3c = Fraw Bow
//          0x3d = Kycilia Zabi
//          0x3e = Torres
//          0x3f = Henken Bekkener
//          0x40 = Rain Mikamura
//          0x41 = Nanai Miguel
//          0x42 = Leina Ashta
//          0x43 = Astonaige Medoz
//          0x44 = Gihren Zabi
//          0x45 = Bask Om
//          0x46 = Relena Darlian
//          0x47 = Dianna Soriel
function selectedCharacter() => byte(0x6CE470)

// $6CE47C: (8-bit) Difficulty Selected
//          
//          0x00 = Easy
//          0x01 = Medium
//          0x02 = Hard
function difficultySelected() => byte(0x6CE47C)
HARD_DIFFICULTY_VALUE = 0x02
function isHardDifficulty() => difficultySelected() == HARD_DIFFICULTY_VALUE

// $6CE484: (8-bit) Which mission is chosen from the menu.
//          
//          Note: Appears to be correct for Official, and can be used for in game.
//          
//          0x00 = Re-entry to Earth
//          0x01 = The battle of Odessa
//          0x02 = Tragedy in Jaburo
//          0x03 = Big Zam's Last Stand
//          0x04 = The Duel in Texas
//          0x05 = A Cosmic Glow
//          0x06 = Space Fortress: A Baoa Qu
//          0x07 = Luna 2 Surrenders: Axis Accelerates
//          0x08 = Londo Bell Reacts: Axis Falls
//          0x09 = Re-entry to Earth
//          0x0A = The Duel in Texas
//          0x0B = A Cosmic Glow
//          0x0C = Re-entry to Earth
//          0x0D = Winds of Jaburo
//          0x0E = The Storm over Kilimanjaro
//          0x0F = Run through the Cosmos
//          0x10 = Enemy encounter at 5th Luna
//          0x11 = Luna 2 Surrenders: Axis Accelerates
//          0x12 = Londo Bell Reacts: Axis Falls
//          0x13 = Re-entry to Earth
//          0x14 = Winds of Jaburo
//          0x15 = Hong Kong city
//          0x16 = Cinderella Four
//          0x17 = The Storm over Kilimanjaro
//          0x18 = Scirocco Steps Forward
//          0x19 = The mirror of Rosamia
//          0x1A = Run through the Cosmos
//          0x1B = The Burning Earth
//          0x1C = Puru Two in Gravity
//          0x1D = Vibration
//          0x1E = Warriors Again (Prelude)
//          0x1F = Warriors Again (Epilogue)
//          0x20 = Psycoframe Light
//          0x21 = Wings of Life
//          0x22 = The Fist that Hopes to Grasp Victory
//          0x23 = Guiding Light to the Future
//          0x24 = Will Makes Miracles Happen
//          0x25 = Char's Will
//          0x26 = A Unique Man
//          0x27 = A Vision of Lalah
//          0x28 = The Power of a Newtype
//          0x29 = Char, The Red Comet
//          0x2A = What's wrong with Kamille being a man's name?
//          0x2B = This is why!
//          0x2C = You Aren't So Special!
//          0x2D = I'll Show All of You!
//          0x2E = This isn't a game to me!
//          0x2F = Departure
//          0x30 = The Threat of the Tomboy
//          0x31 = Broken Bonds
//          0x32 = To the Gravity Well
//          0x33 = Scirocco Lands on Earth
//          0x34 = Concord
//          0x35 = Ideal
//          0x36 = Thought
//          0x37 = Sympathy
//          0x38 = Glory
//          0x39 = Sanc Kingdom Knight
//          0x3A = Fabricated Bloodline, Destiny Plan
//          0x3B = 2500 Years of Samurai Family History
//          0x3C = Rise up! Hail Zeon!
//          0x3D = A World Without Friend or Foe
//          0x3E = Domon Kasshu, Surpass your Master!
//          0x3F = Proof of Friendship
//          0x40 = I'll Speak with my fists!
//          0x41 = Master Asia dies at dawn?
//          0x42 = Teacher and Pupil Bond! Last Fight Tears
//          0x43 = Punishment at Jaburo
//          0x44 = Love Megapunch
//          0x45 = Cute Fighter Girl
//          0x46 = Fist of Tears Explodes
//          0x47 = Master Asia's Name
//          0x48 = Those Who Oppose War
//          0x49 = Those Who Seek Battle
//          0x4A = Those Who Seek to be Rescued
//          0x4B = Those Who Face Disaster
//          0x4C = Those Who Guide Us to Peace
//          0x4D = Chivalry is Bravery
//          0x4E = Chivalry is Fairness
//          0x4F = Chivalry is Devotion
//          0x50 = Chivalry is Courage
//          0x51 = Chivalry is Politeness
//          0x52 = Brothers Reunited
//          0x53 = Winds of Battle
//          0x54 = Coexistence with Others
//          0x55 = As the People of the Moon
//          0x56 = Preserving the Species
//          0x57 = Atmospheric Combat
//          0x58 = Fighting Giant Enemies
//          0x59 = Special Soldier Gundam
//          0x5A = One Year War: Operation Star One
//          0x5B = Colony Laser Duel
//          0x5C = Predestination
//          0x5D = Prison Break
//          0x5E = The Discipline of a Soldier
//          0x5F = Torn Between Bond and Trust
//          0x60 = Day of Decision
//          0x61 = Desperate Courage
//          0x62 = Perplexed Girl
//          0x63 = Never-ending Conflict
//          0x64 = Discord
//          0x65 = Red and Black
//          0x66 = Menace on the Battlefield
//          0x67 = Hearts Passing By
//          0x68 = Irritation
//          0x69 = Skies of Confusion
//          0x6A = Red and Black
//          0x6B = Double Zeta, Run Away!
//          0x6C = The Valley of the Iceberg
//          0x6D = Judau, Come out!
//          0x6E = You're So Stubborn
//          0x6F = Time to Find Out! Lover, Friend, Rival?
//          0x70 = The Fight to End All Fights
//          0x71 = Tears on the Battlefield
//          0x72 = Peace Singing Singstress
//          0x73 = Fighting Breeds More Fighting
//          0x74 = A Future Before the Battle
//          0x75 = In the Sandstorm
//          0x76 = Deathmatch at Killmanjaro
//          0x77 = Freedom, Justice and Truth
//          0x78 = Gates to a New World
//          0x79 = Crimson Soaked Cosmos
//          0x7A = Eternal Conflict
//          0x7B = An Era Without Light
//          0x7C = Contradicting Justice
//          0x7D = World in Peace
//          0x7E = Eternal Fate
//          0x7F = MAYDAY
//          0x80 = A Child Lost in the Universe
//          0x81 = White Fang
//          0x82 = Miracle Encounter
//          0x83 = Ghost of Disturbance
//          0x84 = Humankind Despairs
//          0x85 = Time Passes Remorselessly
//          0x86 = Boys and Girls from the Battlefield
//          0x87 = Beyond the Time
//          0x88 = Connecting Many Lives
//          0x89 = Heroes of the One Year War 1
//          0x8A = Heroes of the One Year War 2
//          0x8B = M'Quve's Vase
//          0x8C = A Soldier's Heart
//          0x8D = The General and the Beast
//          0x8E = Frontline Beast
//          0x8F = The General and the Beast
//          0x90 = For the Loved One
//          0x91 = Farewell, Loved One
//          0x92 = Infiltration in Jupritis
//          0x93 = Too Much of a Woman
//          0x94 = Attracted By the Scent of Flowers
//          0x95 = Goodbye Days of Youth
//          0x96 = Newtype Playground
//          0x97 = Gyunei's Ambition 1
//          0x98 = Gyunei's Ambition 2
//          0x99 = The Prestige of the Zabi Family 1
//          0x9A = The Prestige of the Zabi Family 1  // This is correct.
//          0x9B = Sleggar and the Return to Jupiter
//          0x9C = Sleggar and the Cyber-Newtype
//          0x9D = Sleggar and the Lovers
//          0x9E = Sleggar and the Scary Woman
//          0x9F = Sleggar and the Red Comet
//          0xA0 = Spellbound
//          0xA1 = Brothers and Sisters
//          0xA2 = Find the Songstress
//          0xA3 = Friend Yesterday, Enemy Today?
//          0xA4 = Private Lesson
//          0xA5 = A Future for Two
//          0xA6 = Beautiful Face
//          0xA7 = Younger Boy
//          0xA8 = Piloting Practice
//          0xA9 = Beginner Battle Drill - Surface
//          0xAA = Beginner Battle Drill - Space
//          0xAB = Intermediate Battle Drill - Surface
//          0xAC = Intermediate Battle Drill - Space
//          0xAD = Advanced Battle Drill - Surface
//          0xAE = Advanced Battle Drill - Space
//          0xAF = 1,000 Shot Down Enemies
//          0xB0 = 5,000 Shot Down Enemies
//          0xB1 = 10,000 Shot Down Enemies
//          0xB2 = 20,000 Shot Down Enemies
//          0xB3 = 30,000 Shot Down Enemies
//          0xB4 = 40,000 Shot Down Enemies
//          0xB5 = 50,000 Shot Down Enemies
//          0xB6 = 10 Completed Missions
//          0xB7 = 50 Completed Missions
//          0xB8 = 100 Completed Missions
//          0xB9 = 200 Total Completed Missions
//          0xBA = 300 Total Completed Missions
//          0xBB = Forced Evolution
//          0xBC = Human Reform
//          0xBD = Char's Challenge
//          0xBE = Soldier's Battlefield 1
//          0xBF = Soldier's Battlefield 2
//          0xC0 = Soldier's Battlefield 3
//          0xC1 = Soldier's Battlefield 4
//          0xC2 = Black Tetra-Stars 1
//          0xC3 = Black Tetra-Stars 2
//          0xC4 = A Veteran's Deed 1
//          0xC5 = A Veteran's Deed 2
//          0xC6 = The Fourth Yazan Crewman 1
//          0xC7 = The Fourth Yazan Crewman 2
//          0xC8 = Remember the Past 1
//          0xC9 = Remember the Past 2
//          0xCA = Remember the Past 3
//          0xCB = Remember the Past 4
//          0xCC = Remember the Past 5
//          0xCD = Remember the Past 6
//          0xCE = Remember the Past 7
//          0xCF = The Monster of Zeon
//          0xD0 = Heroes of the Federation
//          0xD1 = The Messenger From Axis
//          0xD2 = Mass Production Gundam?
//          0xD3 = This is no Zaku, my Friend!
//          0xD4 = Giant Revealed
//          0xD5 = For the Glory of Zeon!
//          0xD6 = Guardians of Nature
//          0xD7 = Under Neo Zeon's Flag
//          0xD8 = Jet Stream Attack!
//          0xD9 = Soaring Dragon
//          0xDA = A.E.U.G's Pride
//          0xDB = Knights of the Principality
//          0xDC = The Genius from Jupritis
//          0xDD = Coming from Underwater
//          0xDE = Women's War
//          0xDF = Hunter
//          0xE0 = Z Gundam Returns
//          0xE1 = Char Collection
//          0xE2 = Red Tri-Stars?
//          0xE3 = Jerid's Soul Pilgrimage
//          0xE4 = The Snake and the Spider
//          0xE5 = Ultimate Brothers
//          0xE6 = Zaku Lover's Club 1
//          0xE7 = Zaku Lover's Club 2
//          0xE8 = Qubeley Storm
//          0xE9 = Solo in Red 1
//          0xEA = Solo in Red 2
//          0xEB = The Path to Legend 1
//          0xEC = The Path to Legend 2
//          0xED = Red Comet's Glory 1
//          0xEE = Red Comet's Glory 2
//          0xEF = Legendary Successor 1
//          0xF0 = Legendary Successor 2
//          0xF1 = A Hundred Years' Radiance 1
//          0xF2 = A Hundred Years' Radiance 2
//          0xF3 = Zeta's Pulse 1
//          0xF4 = Zeta's Pulse 2
//          0xF5 = God's Will
//          0xF6 = Axis' Mother Nature
//          0xF7 = The Ultimate Power 1
//          0xF8 = The Ultimate Power 2
//          0xF9 = Battle Girl
//          0xFA = The Strongest Gundam 1
//          0xFB = The Strongest Gundam 2
//          0xFC = Crimson Rebels 1
//          0xFD = Crimson Rebels 2
//          0xFE = Formula Program
//          0xFF = Gundam Calls Victory
//          0x100 = The Fist Dwelling God
//          0x101 = The Practitioner's Teachings
//          0x102 = Give Me Your Wings
//          0x103 = Path to the Future
//          0x104 = The Legacy of the Dark History
//          0x105 = The Messenger of Freedom
//          0x106 = Sword of Justice
//          0x107 = Fate Connection
//          0x108 = Aratama
//          0x109 = Nigitama
//          0x10A = Good Luck, Loser!
//          0x10B = Just wanted to get along...
//          0x10C = Hedgehog's Dilemma
//          0x10D = Love Duel
//          0x10E = Love Special Attack!
//          0x10F = Boys, Be Ambitious
//          0x110 = Women Who Look Good Armed
//          0x111 = Voices of the Young
//          0x112 = Last Generation
//          0x113 = Coward! 1
//          0x114 = Coward! 2
//          0x115 = Hayato's Request
//          0x116 = Kycilia's Secret Request
//          0x117 = Dozle's Secret Request
//          0x118 = Yazan's Crew Test
//          0x119 = Sarah might forgive you, but I won't!
//          0x11A = Glemy's Ambition
//          0x11B = Gyunei's Rescue
//          0x11C = Sleggar's Final Attack
//          0x11D = Things to Protect
//          0x11E = Devil Machine
//          0x11F = Ghingham's Big Comeback
//          0x120 = Do You Love Super Aces?
//          0x121 = I Can Hear Your Song
//          0x122 = Power in Hand 1
//          0x123 = Power in Hand 2
//          0x124 = Earth Domination 1
//          0x125 = Earth Domination 2
//          0x126 = Earth Domination 3
//          0x127 = Eternal Comet
//          0x128 = Earth Conquest 1
//          0x129 = Earth Conquest 2
//          0x12A = Earth Conquest 3
//          0x12B = Char's Offering
//          0x12C = Freedom to Space 1
//          0x12D = Freedom to Space 2
//          0x12E = Freedom to Space 3
//          0x12F = The Earth is my Birthplace 1
//          0x130 = The Earth is my Birthplace 2
//          0x131 = The Earth is my Birthplace 3
//          0x132 = Cold Machiavellian
//          0x133 = Faith 1
//          0x134 = Faith 2
//          0x135 = Freedom to Space 4
//          0x136 = Freedom to Space 5
//          0x137 = Junk Dealers 1
//          0x138 = Junk Dealers 2
//          0x139 = Stop acting like that, Brother!
//          0x13A = Stop acting like that, Judau!
//          0x13B = For Whom the Bell Tolls 1
//          0x13C = For Whom the Bell Tolls 2
//          0x13D = White Fangs Rip the Cosmos
//          0x13E = Abominable Memories 1
//          0x13F = Abominable Memories 2
//          0x140 = Those Who Disturb the Skies 1
//          0x141 = Those Who Disturb the Skies 2
//          0x142 = Those Who Disturb the Skies 3
//          0x143 = To the Victor 1
//          0x144 = To the Victor 2
//          0x145 = Operation Giant Roller!
//          0x146 = Gundam Fight: First Round
//          0x147 = Gundam Fight: Semifinals
//          0x148 = Gundam Fight: Finals
//          0x149 = Behind the Scenes
//          0x14A = Bewildered Soldiers
//          0x14B = The Glass Kingdom
//          0x14C = Endless Waltz
//          0x14D = Operation Return to Earth 1
//          0x14E = Operation Return to Earth 2
//          0x14F = All of the Cosmos 1
//          0x150 = All of the Cosmos 2
//          0x151 = The Great Escape
//          0x152 = The Great Pursuit
//          0x153 = All of the Cosmos 3
//          0x154 = A Song of Peace 1
//          0x155 = A Song of Peace 2
//          0x156 = A Song of Peace 3
//          0x157 = The Mightiest Surface Weapon
//          0x158 = Ball is your Friend!
//          0x159 = Seeking the Ultimate Zaku
//          0x15A = Eternal Binary Star
//          0x15B = A.E.U.G's Hope
//          0x15C = Don Quijote
//          0x15D = I'm a Newtype... A Cyber-Newtype!
//          0x15E = Char's Challenge 2
//          0x15F = A Dangerous Young Lady
//          0x160 = Captive Princess
//          0x161 = Burn, Dragon
//          0x162 = War Goddess
//          0x163 = Yazan's Strike Force is Immortal!
//          0x164 = Towards Tomorrow
//          0x165 = Fighting Spirit
//          0x166 = Crimson Lightning
//          0x167 = You're in my way!
//          0x168 = The Shocking Dark History
//          0x169 = King of Hearts' Challenge
//          0x16A = Look! The East burns Crimson Red!
//          0x16B = C'mon, c'mon! Bring it on!
//          0x16C = White Devil
//          0x16D = The Final Victor
//          0x16E = Moonlight Butterfly vs. Wings of Fire
//          0x16F = The Final Power
//          0x170 = Persevering Justice
//          0x171 = Zero vs. Epyon
//          0x172 = Get Along!
//          0x173 = It's not Anime!
//          0x174 = Zeta's First Launch
//          0x175 = Don't Underestimate it!
//          0x176 = Scirocco's Utopia
//          0x177 = Giant Red Star
//          0x178 = Great Freedom, Great Responsibility
//          0x179 = Amuro Ray
//          0x17A = Challenge the Legend
//          0x17B = One Man Army
//          0x17C = The Power of Bonds
//          0x17D = The True DYNASTY WARRIORS: Gundam
//          0x17E = A General's Dignity
function missionsSelected() => word(0x6CE484)

// $6CE485: (8-bit) Demo Detector
//          
//          Appears to be a detection for Demo mode
//          0x00 = Not Demo.
//          0x01 = Demo
//          
//          Probably shouldn't require it for MSL or anything else that might occur outside of a level.
function demoDetector() => byte(0x6CE485)
NOT_DEMO_MODE_VALUE = 0x00
function isNotDemoMode() => always_true() //demoDetector() == NOT_DEMO_MODE_VALUE 

// $6CE488: (8-bit) Selected character in Original Mode
//          
//          Note: Use  0x006ce470  instead, this is just information for the Original mode itself.
function selectedCharacterOriginalMission() => byte(0x6CE488)


// $6CE4C5: (8-bit)  Two Player Mode Detection
//
// 0x00 = Single Player (Or Versus) 
// 0x01 = Second Player Joining in Original Mode or Mission Mode. 
function twoPlayerMode() => byte(0x6CE4C5)
TWO_PLAYER_VALUE = 0x01

function isTwoPlayerMode() => twoPlayerMode() == TWO_PLAYER_VALUE || isVersusMode()

// $6CE4E2: (8-bit) Selected Suit
//          
//          0x00 = Gundam
//          0x01 = Zaku II (Char)
//          0x02 = Gelgoog (Char)
//          0x03 = Gundam Mk-II
//          0x04 = Z Gundam
//          0x05 = Hyaku Shiki
//          0x06 = Gundam Mk-II (Titans)
//          0x07 = The O
//          0x08 = Qubeley
//          0x09 = ΖΖ Gundam
//          0x0A = Qubeley Mk-II (Puru)
//          0x0B = Qubeley Mk-II (Puru Two)
//          0x0C = Nu Gundam
//          0x0D = Sazabi
//          0x0E = Gundam F91
//          0x0F = V2 Gundam
//          0x10 = Burning Gundam
//          0x11 = Master Gundam
//          0x12 = Wing Gundam Zero
//          0x13 = Gundam Epyon
//          0x14 = Turn A Gundam
//          0x15 = Strike Freedom Gundam
//          0x16 = Infinite Justice Gundam
//          0x17 = Destiny Gundam
//          0x18 = Musha Gundam
//          0x19 = Musha Gundam Mk-II
//          0x1A = Guncannon
//          0x1B = Z'Gok (Char)
//          0x1C = Zeong
//          0x1D = Gelgoog (Johnny)
//          0x1E = Hambrabi
//          0x1F = Byarlant
//          0x20 = Baund Doc
//          0x21 = Bolinoak Sammahn
//          0x22 = Pallas Athene
//          0x23 = Bawoo
//          0x24 = Re-GZ
//          0x25 = Jagd Doga (Gyunei)
//          0x26 = Jagd Doga (Quess)
//          0x27 = Gottrlatan
//          0x28 = Turn X
//          0x29 = GM
//          0x2A = Ball
//          0x2B = Zaku II
//          0x2C = Gouf
//          0x2D = Dom
//          0x2E = Rick Dom
//          0x2F = Z'Gok
//          0x30 = Gyan
//          0x31 = Gelgoog
//          0x32 = Zaku Tank
//          0x33 = GM Command
//          0x34 = Gouf Flight Type
//          0x35 = GM II
//          0x36 = Nemo
//          0x37 = Rick Dias
//          0x38 = Hizack
//          0x39 = Marasai
//          0x3A = Barzam
//          0x3B = Gaza C
//          0x3C = MP Qubeley
//          0x3D = MP Bawoo (Glemy)
//          0x3E = MP Bawoo (Axis)
//          0x3F = Gaza D
//          0x40 = Jegan
//          0x41 = Geara Doga (Rezin)
//          0x42 = Geara Doga
//          
//          Unselectable
//          0x43 = Big Zam
//          0x44 = Psyco Gundam
//          0x45 = Psyco Gundam Mk II
//          0x46 = Quin Mantha
//          0x47 = Alpha Azieru
//          0x48 = Dark Gundam
function selectedSuit() => byte(0x6CE4E2)

// $6CFC50: (16-bit) Mobile Suit Lab Level
//          
//          0x00 = Level 1
//          0x09 = Level 10
//          
//          May be more bits, but highest value will be 9
function mobileSuitLabLevel() => word(0x6CFC50)

MAX_MOBILE_SUIT_LAB_LEVEL = 0x09

function reachedMobileSuitLabLevel(level) => prev(mobileSuitLabLevel()) < level - 1 && mobileSuitLabLevel() == level - 1

// $6CFC54: (32-bit) Mobile Suit Lab Experience
//          
//          Values are not investigated, but more is better, doesn't appear to reset on level up.
function mobileSuitLabExp() => dword(0x6CFC54)

// $6CFDC6: (bitfield) Amuro Ray's First story
//          
//          bit0 = Visible (Note setting this to 0 will break the character select screen.
//          bit1 = New (Not used for This story.
//          bit2 = Suit Select
//          bit4 = Set when complete, unknown.
function amuroFirstStory() => byte(0x6CFDC6)

// $6CFDE6: (bitfield) Char Anzable's First story
//          
//          bit0 = Visible
//          bit1 = New (Not used for This story.
//          bit2 = Suit Select
//          bit4 = Set when complete, unknown.
function CharAnzableFirstStory() => byte(0x6CFDE6)

// $6CFE46: (bitfield) Amuro Ray's second campaign
//          
//          bit0 = Available
//          bit1 = New marker (Goes away after use)
function amuroSecondCampaign() => byte(0x6CFE46)

// $6CFE66: (8-bit) Char Aznable's second campaign
function charAznableSecondCampaign() => byte(0x6CFE66)

// $6D0F1C: (16-bit) Character Gallery First entry Amuro Ray Name
//          
//          0x00 - 0x02 =  Amuro Ray
//          0x03 = Char Aznable
//          0x04 = Quattro Bajeena
//
//          79 entries in the Character Gallery 
// function characterGalleryFirstEntryName() => word(0x6D0F1C)
CHARACTER_GALLERY_FIRST_NAME = 0x6D0F1C
CHARACTER_GALLERY_SECOND_NAME = 0x006d0f28 // trust me on this. 
CHARACTER_GALLERY_FIRST_UNLOCK = 0x6D0F20
CHARACTER_GALLERY_CHARACTER_OFFSET = CHARACTER_GALLERY_SECOND_NAME - CHARACTER_GALLERY_FIRST_NAME

FIRST_CHARACTER_GALLERY_INDEX = 0
LAST_CHARACTER_GALLERY_INDEX = 78
STARTING_CHARACTER_GALLERY_COUNT = 14

function characterGalleryEntryData(character) => bit0(CHARACTER_GALLERY_FIRST_UNLOCK + (CHARACTER_GALLERY_CHARACTER_OFFSET * character))

// $6D0F1E: (8-bit) Character Gallery First entry Amuro Ray Image
//          
//          0x00 = Original Amuro Ray
//          0x04 = Quattro Bajeena
// function acharacterGalleryFirstEntryImage() => byte(0x6D0F1E)

// $6D0F1F: (8-bit) Character Gallery First entry Amuro Ray Series
//          
//          0x00 = Mobile Suit Gundam
//          0x01 = Mobile Suit Zeta Gundam
//          0x02 = Mobile Suit Gundam ZZ
// function characterGalleryFirstEntrySeries() => byte(0x6D0F1F)

// $6D0F20: (bitfield) Character Gallery First entry Amuro Ray Display Value
//          
//          bit0 = Visible
//          bit1 = New
//          
//          Note these are NOT in order on the screen.
// function characterGalleryFirstEntryDisplay() => byte(0x6D0F20)

// $6D0F2C: (bitfield) Character Gallery Second entry Older Amuro Ray
//          
//          bit0 = Visible
//          bit1 = New.
// function characterGallerySecondEntryName() => byte(0x6D0F2C)

// $6D1520: (bitfield) Mobile Suit Gallery First Suit Gundam
//          
//          Gundam
//          
//          bit0 = Visible
//          bit1 = New
//
//          There are 72 Suits (including this one) 
//function mobileSuitGalleryFirstSuitVisible() => byte(0x6D1520)

// $6d1528: (32-bit) Gallery Loaded Check
// 
//          0x00000000 = Game is rebooted. 
//          0x00010101 = Gallery is loaded. 
function galleryLoadedCheck() => tbyte(0x6d1528)
GALLERY_LOADED_VALUE = 0x00010101

// This is the first numbers for the second Gundam Suit 
function galleryActive() => galleryLoadedCheck() == GALLERY_LOADED_VALUE

MOBILE_SUIT_GALLERY_FIRST_SUIT_VISIBILITY_MEMORY_LOCATION = 0x6D1520
MOBILE_SUIT_GALLERY_SECOND_SUIT_VISIBILITY_MEMORY_LOCATION = 0x6D152C
MOBILE_SUIT_GALLERY_SUIT_OFFSET = MOBILE_SUIT_GALLERY_SECOND_SUIT_VISIBILITY_MEMORY_LOCATION - MOBILE_SUIT_GALLERY_FIRST_SUIT_VISIBILITY_MEMORY_LOCATION

FIRST_MOBILE_SUIT_GALLERY_INDEX = 0
LAST_MOBILE_SUIT_GALLERY_INDEX = 71
STARTING_SUIT_GALLERY_COUNT = 14

function mobileSuitGallerySuitVisibility(suit) => bit0(MOBILE_SUIT_GALLERY_FIRST_SUIT_VISIBILITY_MEMORY_LOCATION + (MOBILE_SUIT_GALLERY_SUIT_OFFSET * suit))

// $6D152C: (bitfield) Mobile Suit Gallery Second Suit
//          
//          Zaku II(Char)
//          
//          bit0 = Visible
//          bit1 = New
//function mobileSuitGallerySecondSuitVisible() => byte(0x6D152C)

// $6D1B20: (bitfield) BattleShip Gallery First ship
//          
//          White Base
//          
//          bit0 = Visible
//          bit1 = New
// 
//          There are 10 ships 
//function battleshipGalleryFirstShip() => byte(0x6D1B20)

BATTLE_SHIP_GALLERY_FIRST_SHIP_VISIBILITY_MEMORY_LOCATION = 0x6D1B20
BATTLE_SHIP_GALLERY_SECOND_SHIP_VISIBILITY_MEMORY_LOCATION = 0x6D1B2C
BATTLE_SHIP_GALLERY_SHIP_OFFSET = BATTLE_SHIP_GALLERY_SECOND_SHIP_VISIBILITY_MEMORY_LOCATION - BATTLE_SHIP_GALLERY_FIRST_SHIP_VISIBILITY_MEMORY_LOCATION

FIRST_BATTLE_SHIP_GALLERY_INDEX = 0
LAST_BATTLE_SHIP_GALLERY_INDEX = 9

function battleshipGalleryShipVisibility(ship) => bit0(BATTLE_SHIP_GALLERY_FIRST_SHIP_VISIBILITY_MEMORY_LOCATION + (BATTLE_SHIP_GALLERY_SHIP_OFFSET * ship))


// $6D1B2C: (bitfield) BattleShip Gallery Second ship
//          
//          Salamis
//          
//          bit0 = Visible
//          bit1 = New
//function battleshipGallerySecondShip() => byte(0x6D1B2C)

// $6D1BDA: (8-bit) First movie in Movie Galary which movie.
//          
//          0x00 = Re-entry to Earth  Goes up to 0x47 (note it's not in order always, 47 and 46 are switched)
function firstMovieGalleryWhichMovie() => byte(0x6D1BDA)

// $6D1BDB: (8-bit) First movie in Movie Galary Movie Title
//          
//          0x00 = Re-entry to Earth  Goes up to 0x47 (note it's not in order always, 47 and 46 are switched)
function firstMovieGalleryTitle() => byte(0x6D1BDB)

// $6D1BDC: (8-bit) First movie in Movie Galary Movie Description
//          
//          0x00 = Re-entry to Earth  Goes up to 0x47 (note it's not in order always, 47 and 46 are switched)
function firstMovieGalleryDescription() => byte(0x6D1BDC)

// $6D1BDD: (8-bit bitfield)  Movie Gallery First movie Unlock
//          
//          bit0 = Visible
//          bit1 = New Flag
//          
//          Previous three bytes is repeating which movie it is.  Then the next movie.  For 64 movies.  Final movie display information at 0x006d1cd9
//function firstMovieGalleryUnlock() => byte(0x6D1BDD)

MOVIE_GALLERY_FIRST_MOVIE_UNLOCK_MEMORY_LOCATION =  0x6D1BDD
MOVIE_GALLERY_SECOND_MOVIE_UNLOCK_MEMORY_LOCATION = 0x6d1be1
MOVIE_GALLERY_MOVIE_OFFSET = MOVIE_GALLERY_SECOND_MOVIE_UNLOCK_MEMORY_LOCATION - MOVIE_GALLERY_FIRST_MOVIE_UNLOCK_MEMORY_LOCATION

FIRST_MOVIE_GALLERY_INDEX = 0
LAST_MOVIE_GALLERY_INDEX = 63

function movieGalleryUnlock(movie) => bit0(MOVIE_GALLERY_FIRST_MOVIE_UNLOCK_MEMORY_LOCATION + (MOVIE_GALLERY_MOVIE_OFFSET * movie))


// $6d1be1: (8-bit bitfield)  Movie Gallery Second movie Unlock
//
//          bit0 = Visible
//          bit1 = New Flag
// 
//          Previous three bytes is repeating which movie it is.  Then the next movie.  For 48 movies.  Final movie display information at 0x006d1cd9

// $6d1ccd: (8-bit bitfield)  Movie Gallery "Love is the Pulse of the Stars
// 
//          bit0 = Visible
//          bit1 = New Flag
// 
// 
function loveIsThePulseUnlock() => bit0(0x6D1CCD)

// $6f8b73: (8-bit) In Game check 
//          Only for use with RP 
//          Likely part of a handler. 
function inGameCheckRP() => byte(0x6F8B73)

// $6FDABF: (8-bit) Save Indicator 3
//          
//          0x00 = Not Loading
//          0x01 = Saving or Loading a Save File
//          
//          This one lingers for longer and used also for saving.  Should be safe to do both, but still appears to ONLY be for Save and load..
function saveIndicator3() => byte(0x6FDABF)

SAVE_INDICATOR_3_NOT_OK_VALUE = 0x01

function isSaveIndicator3Ok() => saveIndicator3() != SAVE_INDICATOR_3_NOT_OK_VALUE

// $1B1DBBC: (32-bit) Which message is being viewed in the Terminal
//           
//           0xbd = Dynasty Warriors: Gundam 2 Quiz
//           0xbe = Dynasty Warriors: Gundam 2 Quiz Expert 
function messageViewedTeriminal() => dword(0x1B1DBBC)
DYNASTY_WARRIORS_GUNDAM_2_NOVICE_QUIZ = 0xBD
DYNASTY_WARRIORS_GUNDAM_2_EXPERT_QUIZ = 0xBE

// $1B1E874: (8-bit) Number of correct answers to the Dynasty Warriors Gundam Quizes.
function correctAnswersQuiz() => byte(0x1B1E874)


function achievementActive() => galleryActive() && isSaveIndicator1OK() && isSaveIndicator2OK() && isSaveIndicator3Ok()
function achievementActiveForGallery() => isSaveIndicator1OK() && isSaveIndicator2OK() && isSaveIndicator3Ok()  // && isSaveIndicator1OK() && isSaveIndicator2OK() && isSaveIndicator3Ok()
// NOTE! don't mark anything missable with this. 
function singlePlayer() => !isTwoPlayerMode()

achievement( title = "One down, 381 to go",
             description = "Complete your first mission in single player",
             points = 1,
             trigger = achievementActive() &&
                       isNotDemoMode() &&
                       justWonMission() &&
                       singlePlayer() &&
                       isOriginalMissionOrIterimContinue()
)

originalMissionData =
[
    {
        ID: -1,
        NAME: "The White Devil",
        DESCRIPTION: "Amuro's The One Year War Story",
        POINTS: 5,
        MISSIONS: amuroFirstStoryMissions,
        CHARACTER: AMURO_RAY
    },
    {
        ID: -1,
        NAME: "The Red Comet",
        DESCRIPTION: "Char's The One Year War Story",
        POINTS: 5,
        MISSIONS: charFirstStoryMissions,
        CHARACTER: CHAR_AZNABLE
    },
    {
        ID: -1,
        NAME: "He's a Man!",
        DESCRIPTION: "Kamille's Original Story Missions",
        POINTS: 5,
        MISSIONS: kamilleStoryMissions,
        CHARACTER: KAMILLE_BIDAN
    },
    {
        ID: -1,
        NAME: "The Junk Man",
        DESCRIPTION: "Judau's Original Story Missions",
        POINTS: 5,
        MISSIONS: judauStoryMissions,
        CHARACTER: JUDAU_ASHTA
    },
    {
        ID: -1,
        NAME: "White Shooting Star",
        DESCRIPTION: "Amuro's Second Original Storyline",
        POINTS: 3,
        MISSIONS: amuroSecondStoryMissions,
        CHARACTER: AMURO_RAY
    },
    {
        ID: -1,
        NAME: "Quattro Bajeena",
        DESCRIPTION: "Char's Counterattack Original Storyline",
        POINTS: 4,
        MISSIONS: charSecondStoryMissions,
        CHARACTER: CHAR_AZNABLE
    
    }
]

function didAnyMissionReset(missionList) => any_of(missionList, 
                                                   missionIndex => prev(missionCompleteMemoryLookup(missionIndex)) == 1 &&
                                                                   missionCompleteMemoryLookup(missionIndex) == 0 )

function didAnyCharacterMissionReset(missionList, character) => any_of(missionList, 
                                                   missionIndex => prev(missionCompleteCharacterMemoryLookup(missionIndex, character)) == 1 &&
                                                                   missionCompleteCharacterMemoryLookup(missionIndex, character) == 0 )

function originalStoryAchievement(data)
{
    achievement( title = data[NAME],
                 description = format("Complete each mission in {0}", data[DESCRIPTION]),
                 points = data[POINTS],
                 type = "Progression",
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           isOriginalOrIterimMode() &&
                           any_of(data[MISSIONS], missionIndex => prev(missionCompleteMemoryLookup(missionIndex)) == 0) &&
                           measured(tally_of(data[MISSIONS], length(data[MISSIONS]), missionIndex => once(missionCompleteMemoryLookup(missionIndex) == 1))) &&
                           never(didAnyMissionReset(data[MISSIONS]))
    )
                 
}

for data in originalMissionData
{
    originalStoryAchievement(data)
}

achievement( title = "Love Conquers All",
             description = "Unlock the secret ending to Kamille's Original Mode Story",
             points = 5,
             trigger = achievementActive() &&
                       isNotDemoMode() &&
                       prev(loveIsThePulseUnlock()) == 0 &&
                       loveIsThePulseUnlock() == 1
)

// Mission Mode 
function missionModeDescription(name) => format("Complete each story mission in {0} Mission Mode", name)

missionModeData =
[
    {
        ID: -1,
        NAME: "White Unicorn",
        DESCRIPTION: "Amuro's",
        POINTS: 5,
        MISSIONS: amuroMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Char Deikun",
        DESCRIPTION: "Char's",
        POINTS: 5,
        MISSIONS: charMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "The Blue Titan",
        DESCRIPTION: "Kamille's",
        POINTS: 5,
        MISSIONS: kamilleMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Man from Jupiter",
        DESCRIPTION: "Scirooco's",
        POINTS: 5,
        MISSIONS: sciroccoMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Ghost of Zeon",
        DESCRIPTION: "Haman's",
        POINTS: 5,
        MISSIONS: hamanMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "Grey Stoke",
        DESCRIPTION: "Judau's",
        POINTS: 5,
        MISSIONS: juduaMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Gundam of Gundam",
        DESCRIPTION: "Domon's",
        POINTS: 5,
        MISSIONS: domonMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "Undefeated of the East",
        DESCRIPTION: "Master Asia's",
        POINTS: 5,
        MISSIONS: masterAsiaMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "Princess Aurora",
        DESCRIPTION: "Heero's",
        POINTS: 5,
        MISSIONS: heeroMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Lightning Count",
        DESCRIPTION: "Millardo's",
        POINTS: 5,
        MISSIONS: millardoMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Laura Rolla",
        DESCRIPTION: "Loran's",
        POINTS: 5,
        MISSIONS: loranMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Emmy",
        DESCRIPTION: "Emma's",
        POINTS: 5,
        MISSIONS: emmaMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Jerry Boy",
        DESCRIPTION: "Jerid's",
        POINTS: 5,
        MISSIONS: jeridMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Bath Girl",
        DESCRIPTION: "Puru Puru's",
        POINTS: 5,
        MISSIONS: puruMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Puru Squared",
        DESCRIPTION: "Puru Two's",
        POINTS: 5,
        MISSIONS: puruTwoMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Rock Lox",
        DESCRIPTION: "Roux's",
        POINTS: 5,
        MISSIONS: rouxMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Ace of the Songstresses Cavalry",
        DESCRIPTION: "Kira's",
        POINTS: 5,
        MISSIONS: kiraMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Alex Dino",
        DESCRIPTION: "Athrun's",
        POINTS: 5,
        MISSIONS: athrunMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The 'Freedom Killer'",
        DESCRIPTION: "Shinn's",
        POINTS: 5,
        MISSIONS: shinnMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Kincade Nau",
        DESCRIPTION: "Seabook's",
        POINTS: 5,
        MISSIONS: seabookMissionModeMissions
    },
    {
        ID: -1,
        NAME: "It's Uso! It's Uso!",
        DESCRIPTION: "Uso's",
        POINTS: 5,
        MISSIONS: usoMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Vase of M'Quve",
        DESCRIPTION: "M'Quve's",
        POINTS: 1,
        MISSIONS: mquveMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Blue Nova",
        DESCRIPTION: "Ramba's",
        POINTS: 1,
        MISSIONS: rambaMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "The Beast",
        DESCRIPTION: "Yazan's",
        POINTS: 3,
        MISSIONS: yazanMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Redhead Titan",
        DESCRIPTION: "Sarah's",
        POINTS: 3,
        MISSIONS: sarahMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Mia Archetto",
        DESCRIPTION: "Reccoa's",
        POINTS: 3,
        MISSIONS: ReccoaMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Zabi's Heir",
        DESCRIPTION: "Glemy's",
        POINTS: 3,
        MISSIONS: glemyMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "The Quess-tion",
        DESCRIPTION: "Quess's",
        POINTS: 1,
        MISSIONS: quessMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "Glarv Guss",
        DESCRIPTION: "Gyunei's",
        POINTS: 3,
        MISSIONS: gyuneiMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Zabi Brute",
        DESCRIPTION: "Dozle's",
        POINTS: 3,
        MISSIONS: dozleMissionModeMissions
    },
    {
        ID: -1, 
        NAME: "Lieutenent Junior Grade",
        DESCRIPTION: "Sleggar's",
        POINTS: 5,
        MISSIONS: sleggarMissionModeMissions
    },
    {
        ID: -1,
        NAME: "One, Two, Three...",
        DESCRIPTION: "Four's",
        POINTS: 1,
        MISSIONS: fourMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Rosammy",
        DESCRIPTION: "Rosamia's",
        POINTS: 1,
        MISSIONS: rosamiaMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Physical Education",
        DESCRIPTION: "Gym's",
        POINTS: 3,
        MISSIONS: gymMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Songstress",
        DESCRIPTION: "Lacus's",
        POINTS: 3,
        MISSIONS: lacusMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Luna",
        DESCRIPTION: "Lunamaria's",
        POINTS: 3,
        MISSIONS: lunamariaMissionModeMissions
    },
    {
        ID: -1,
        NAME: "Miss Countryside",
        DESCRIPTION: "Cecily's",
        POINTS: 1,
        MISSIONS: cecilyMissionModeMissions
    },
    {
        ID: -1,
        NAME: "The Navigator",
        DESCRIPTION: "Katejina's",
        POINTS: 1,
        MISSIONS: katejinaMissionModeMissions
    }
]

function missionModeAchievement(data) 
{
    achievement( title = data[NAME],
                 description = missionModeDescription(data[DESCRIPTION]),
                 points = data[POINTS],
                 type = "Progression",
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           isMissionOrIterimMode() &&
                           any_of(data[MISSIONS], missionIndex => prev(missionCompleteMemoryLookup(missionIndex)) == 0) &&
                           measured(tally_of(data[MISSIONS], length(data[MISSIONS]), missionIndex => once( missionCompleteMemoryLookup(missionIndex) == 1)))&&
                           never(didAnyMissionReset(data[MISSIONS]))
    )
}

for data in missionModeData
{
    missionModeAchievement(data)
}

missionModeSpecialCharactersData = 
[
    {
        ID: -1,
        NAME: "The Reporter",
        DESCRIPTION: "Kai's",
        POINTS: 3,
        MISSIONS: kaiMissionsModeMissions,
        CHARACTER: KAI_SHIDEN
    },
    {
        ID: -1,
        NAME: "The Guardian",
        DESCRIPTION: "Hayato's",
        POINTS: 3,
        MISSIONS: hayatoMissionsModeMissions,
        CHARACTER: HAYATO_KOBAYASHI
    }

]

function missionModeSpecialCharacterAchievement(data) 
{
    achievement( title = data[NAME],
                 description = missionModeDescription(data[DESCRIPTION]),
                 points = data[POINTS],
                 type = "Progression",
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           isMissionOrIterimMode() &&
                           any_of(data[MISSIONS], missionIndex => prev(missionCompleteCharacterMemoryLookup(missionIndex, data[CHARACTER])) == 0) &&
                           measured(tally_of(data[MISSIONS], length(data[MISSIONS]), missionIndex => once(missionCompleteCharacterMemoryLookup(missionIndex, data[CHARACTER]) == 1)))&&
                           never(didAnyCharacterMissionReset(data[MISSIONS], data[CHARACTER]))
    )
}

for data in missionModeSpecialCharactersData
{
    missionModeSpecialCharacterAchievement(data)
}


additionMissionsData =
[
    {
        ID: -1,
        HALF_NAME: "Free?  How About Half Price?",
        FULL_NAME: "Free?  I'll Take Them All",
        HALF_DESCRIPTION: "Complete half of the Free Missions",
        FULL_DESCRIPTION: "Complete all of the Free Missions",
        HALF_POINTS: 25, 
        FULL_POINTS: 50,
        MISSIONS: freeMissionModeMissions
    },
    {
        ID: -1, 
        HALF_NAME: "Gunpla Collector",
        FULL_NAME: "World-Class Collection",
        HALF_DESCRIPTION: "Complete half of the Collection Missions",
        FULL_DESCRIPTION: "Complete all of the Collection Missions",
        HALF_POINTS: 10,
        FULL_POINTS: 25,
        MISSIONS: collectionMissionModeMissions
    },
    {
        ID: -1,
        HALF_NAME: "License to Kill",
        FULL_NAME: "License to Thrill",
        HALF_DESCRIPTION: "Complete half of the License Missions",
        FULL_DESCRIPTION: "Complete all of the License Missions",
        HALF_POINTS: 10, 
        FULL_POINTS: 25,
        MISSIONS: licenseMissionModeMissions
    },
    {
        ID: -1,
        HALF_NAME: "Friendship is Magic",
        FULL_NAME: "The Real Treasure is the Friends We Made Along the Way",
        HALF_DESCRIPTION: "Complete half of the Friendship Missions",
        FULL_DESCRIPTION: "Complete all of the Friendship Missions",
        HALF_POINTS: 25, 
        FULL_POINTS: 50,
        MISSIONS: friendshipMissionModeMissions
    },
    {
        ID: -1,
        HALF_NAME: "Even More Missions",
        FULL_NAME: "And All The Rest",
        HALF_DESCRIPTION: "Complete half of the Extra Missions",
        FULL_DESCRIPTION: "Complete all of the Extra Missions",
        HALF_POINTS: 25, 
        FULL_POINTS: 50,
        MISSIONS: extraMissionModeMissions
    }
]

function additionMissionAchievements(data)
{
    half_target = length(data[MISSIONS]) / 2
    achievement( title = data[HALF_NAME],
                 description = data[HALF_DESCRIPTION],
                 points = data[HALF_POINTS],
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           isMissionOrIterimMode() &&
                           sum_of(data[MISSIONS], missionIndex => prev(missionCompleteMemoryLookup(missionIndex))) < half_target &&
                           measured(sum_of(data[MISSIONS], missionIndex => missionCompleteMemoryLookup(missionIndex)) == half_target)
    )
    
    achievement( title = data[FULL_NAME],
                 description = data[FULL_DESCRIPTION],
                 points = data[FULL_POINTS],
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           isMissionOrIterimMode() &&
                           any_of(data[MISSIONS], missionIndex => prev(missionCompleteMemoryLookup(missionIndex)) == 0) &&
                           measured(tally_of(data[MISSIONS], length(data[MISSIONS]), missionIndex => once(missionCompleteMemoryLookup(missionIndex) == 1)))&&
                           never(didAnyMissionReset(data[MISSIONS]))
    )
}

for data in additionMissionsData
{
    additionMissionAchievements(data)
}



unlockCharacterData =
[
   
    {
        CHARACTER: PAPTIMUS_SCIROCCO,
        ID: -1,
        NAME: "Paptimus Scirocco",
        DESCRIPTION: "Unlock Paptimus Scirocco for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: HAMAN_KARN,
        ID: -1,
        NAME: "Haman Karn",
        DESCRIPTION: "Unlock Haman Karn for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: EMMA_SHEEN,
        ID: -1,
        NAME: "Emma Sheen",
        DESCRIPTION: "Unlock Emma Sheen for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: JERID_MESSA,
        ID: -1,
        NAME: "Jerid Messa",
        DESCRIPTION: "Unlock Jerid Messa for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: ELPEO_PURU,
        ID: -1,
        NAME: "Elpeo Puru",
        DESCRIPTION: "Unlock Elpeo Puru for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: PURU_TWO,
        ID: -1,
        NAME: "Puru Two",
        DESCRIPTION: "Unlock Puru Two for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: ROUX_LOUKA,
        ID: -1,
        NAME: "Roux Louka",
        DESCRIPTION: "Unlock Roux Louka for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: KAI_SHIDEN,
        ID: -1,
        NAME: "Kai Shiden",
        DESCRIPTION: "Unlock Kai Shiden for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: HAYATO_KOBAYASHI,
        ID: -1,
        NAME: "Hayato Kobayashi",
        DESCRIPTION: "Unlock Hayato Kobayashi for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: M_QUVE,
        ID: -1,
        NAME: "M'Quve",
        DESCRIPTION: "Unlock M'Quve for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: RAMBA_RAL,
        ID: -1,
        NAME: "Ramba Ral",
        DESCRIPTION: "Unlock Ramba Ral for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: YAZAN_GABLE,
        ID: -1,
        NAME: "Yazan Gable",
        DESCRIPTION: "Unlock Yazan Gable for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: SARAH_ZABIAROV,
        ID: -1,
        NAME: "Sarah Zabiaraov",
        DESCRIPTION: "Unlock Sarah Zabiaraov for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: RECCOA_LONDE,
        ID: -1,
        NAME: "Reccoa Londe",
        DESCRIPTION: "Unlock Reccoa Londe for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: GLEMY_TOTO,
        ID: -1,
        NAME: "Glemy Toto",
        DESCRIPTION: "Unlock Glemy Toto for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: QUESS_PARAYA,
        ID: -1,
        NAME: "Quess Paraya",
        DESCRIPTION: "Unlock Quess Paraya for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: GYUNEI_GUSS,
        ID: -1,
        NAME: "Gyunei Guss",
        DESCRIPTION: "Unlock Gyunei Guss for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: DOZLE_ZABI,
        ID: -1,
        NAME: "Dozle Zabi",
        DESCRIPTION: "Unlock Dozle Zabi for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: SLEGGAR_LAW,
        ID: -1,
        NAME: "Sleggar Law",
        DESCRIPTION: "Unlock Sleggar Law for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: FOUR_MURASAME,
        ID: -1,
        NAME: "Four Murasame",
        DESCRIPTION: "Unlock Four Murasame for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: ROSAMIA_BADAM,
        ID: -1,
        NAME: "Rosamia Badam",
        DESCRIPTION: "Unlock Rosamia Badam for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: GYM_GHINGHAM,
        ID: -1,
        NAME: "Gym Gingham",
        DESCRIPTION: "Unlock Gym Gingham for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: LACUS_CLYNE,
        ID: -1,
        NAME: "Lacus Clyne",
        DESCRIPTION: "Unlock Lacus Clyne for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: LUNAMARIA_HAWKE,
        ID: -1,
        NAME: "Lunamaria Hawke",
        DESCRIPTION: "Unlock Lunamaria Hawke for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: CECILY_FAIRCHILD,
        ID: -1,
        NAME: "Cecily Fairchild",
        DESCRIPTION: "Unlock Cecily Fairchild for Mission Mode",
        POINTS: 1
    },
    {
        CHARACTER: KATEJINA_LOOS,
        ID: -1,
        NAME: "Katejina Loos",
        DESCRIPTION: "Unlock Katejina Loos for Mission Mode",
        POINTS: 1
    }
]

function characterUnlockAchievement(data)
{
    achievement( title = data[NAME],
                 description = data[DESCRIPTION],
                 points = data[POINTS],
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           prev(bit1(characterValueMemory(data[CHARACTER], CHARACTER_MISSION_INFO_OFFSET))) == 0 &&
                           bit1(characterValueMemory(data[CHARACTER], CHARACTER_MISSION_INFO_OFFSET)) == 1
    )
}

for data in unlockCharacterData
{
    characterUnlockAchievement(data)
}

mobileSuitData = 
[
    {
        SUIT: GUNDAM, 
        ID: -1,
        NAME: "RX-78-2 Gundam",
        UNLOCK: false
    },
    {
        SUIT: ZAKU_II_CHAR,
        ID: -1,
        NAME: "MS-06S Zaku II Commander Type",
        UNLOCK: false
    },
    {
        SUIT: GELGOOG_CHAR,
        ID: -1,
        NAME: "MS-14S Gelgoog Commander Type",
        UNLOCK: false
    },
    {
        SUIT: GUNDAM_MK_II,
        ID: -1,
        NAME: "RX-178 Gundam Mk-II Anti-Earth Union Group",
        UNLOCK: false
    },
    {
        SUIT: Z_GUNDAM,
        ID: -1,
        NAME: "MSZ-006 Zeta Gundam",
        UNLOCK: false
    },
    {
        SUIT: GUNDAM_MK_II_Titans,
        ID: -1,
        NAME: "RX-178 Gundam Mk-II Titans",
        UNLOCK: false
    },
    {
        SUIT: HYAKU_SHIKI,
        ID: -1,
        NAME: "MSN-00100 Hyaku Shiki",
        UNLOCK: false
    },
    {
        SUIT: THE_O,
        ID: -1,
        NAME: "PMX-003 The O",
        UNLOCK: true
    },
    {
        SUIT: QUBELEY,
        ID: -1,
        NAME: "AMX-004 Qubeley",
        UNLOCK: true
    },
    {
        SUIT: ΖΖ_GUNDAM,
        ID: -1,
        NAME: "MSZ-010 ΖΖ Gundam",
        UNLOCK: false
    },
    {
        SUIT: QUBELEY_MK_II_Puru,
        ID: -1,
        NAME: "AMX-004 Qubeley Mk-II Elpeo Ple",
        UNLOCK: true
    },
    {
        SUIT: QUBELEY_MK_II_Puru_Two,
        ID: -1,
        NAME: "AMX-004 Qubeley Mk-II Ple Two",
        UNLOCK: true
    },
    {
        SUIT: NU_GUNDAM,
        ID: -1,
        NAME: "RX-93 ν Gundam",
        UNLOCK: true
    },
    {
        SUIT: SAZABI,
        ID: -1,
        NAME: "MSN-04 Sazabi",
        UNLOCK: true
    },
    {
        SUIT: GUNDAM_F91,
        ID: -1,
        NAME: "F91 Gundam F91",
        UNLOCK: false
    },
    {
        SUIT: V2_GUNDAM,
        ID: -1,
        NAME: "LM314V21 Victory 2 Gundam",
        UNLOCK: false
    },
    {
        SUIT: BURNING_GUNDAM,
        ID: -1,
        NAME: "GF13-017NJII God Gundam",
        UNLOCK: false
    },
    {
        SUIT: MASTER_GUNDAM,
        ID: -1,
        NAME: "GF13-001NHII Master Gundam",
        UNLOCK: false
    },
    {
        SUIT: WING_GUNDAM_ZERO,
        ID: -1,
        NAME: "XXXG-00W0 Wing Gundam Zero",
        UNLOCK: false
    },
    {
        SUIT: GUNDAM_EPYON,
        ID: -1,
        NAME: "OZ-13MS Gundam Epyon",
        UNLOCK: false
    },
    {
        SUIT: TURN_A_GUNDAM,
        ID: -1,
        NAME: "WD-M01 Turn A Gundam",
        UNLOCK: false
    },
    {
        SUIT: STRIKE_FREEDOM_GUNDAM,
        ID: -1,
        NAME: "ZGMF-X20A Strike Freedom Gundam",
        UNLOCK: false
    },
    {
        SUIT: INFINITE_JUSTICE_GUNDAM,
        ID: -1,
        NAME: "ZGMF-X19A ∞ Justice Gundam",
        UNLOCK: false
    },
    {
        SUIT: DESTINY_GUNDAM,
        ID: -1,
        NAME: "ZGMF-X42S Destiny Gundam",
        UNLOCK: false
    },
    {
        SUIT: MUSHA_GUNDAM,
        ID: -1,
        NAME: "Shin Musha Gundam",
        UNLOCK: true
    },
    {
        SUIT: MUSHA_GUNDAM_MK_II,
        ID: -1,
        NAME: "Musha Gundam Mk-II",
        UNLOCK: true
    },
    {
        SUIT: GUNCANNON,
        ID: -1,
        NAME: "RX-77-2 Guncannon",
        UNLOCK: true
    },
    {
        SUIT: ZGOK_CHAR,
        ID: -1,
        NAME: "MSM-07S Z'Gok Commander Type",
        UNLOCK: true
    },
    {
        SUIT: ZEONG,
        ID: -1,
        NAME: "MSN-02 Zeong",
        UNLOCK: true,
        PARTS: 3
    },
    {
        SUIT: GELGOOG_JOHNNY,
        ID: -1,
        NAME: "MS-14B Gelgoog High Mobility Type",
        UNLOCK: true
    },
    {
        SUIT: HAMBRABI,
        ID: -1,
        NAME: "RX-139 Hambrabi",
        UNLOCK: true
    },
    {
        SUIT: BYARLANT,
        ID: -1,
        NAME: "RX-160 Byarlant",
        UNLOCK: true
    },
    {
        SUIT: BAUND_DOC,
        ID: -1,
        NAME: "NRX-055 Baund Doc",
        UNLOCK: true
    },
    {
        SUIT: BOLINOAK_SAMMAHN,
        ID: -1,
        NAME: "PMX-002 Bolinoak Sammahn",
        UNLOCK: true
    },
    {
        SUIT: PALLAS_ATHENE,
        ID: -1,
        NAME: "PMX-001 Pallas Athene",
        UNLOCK: true
    },
    {
        SUIT: BAWOO,
        ID: -1,
        NAME: "AMX-107 Bawoo",
        UNLOCK: true
    },
    {
        SUIT: RE_GZ,
        ID: -1,
        NAME: "RGZ-91 Re-GZ",
        UNLOCK: true
    },
    {
        SUIT: JAGD_DOGA_GYUNEI,
        ID: -1,
        NAME: "MSN-03 Jagd Doga (Gyunei Guss)",
        UNLOCK: true
    },
    {
        SUIT: JAGD_DOGA_QUESS,
        ID: -1,
        NAME: "MSN-03 Jagd Doga (Quess Paraya)",
        UNLOCK: true
    },
    {
        SUIT: GOTTRLATAN,
        ID: -1,
        NAME: "ZMT-S33S Gottrlatan",
        UNLOCK: true
    },
    {
        SUIT: TURN_X,
        ID: -1,
        NAME: "Concept-X 6-1-2 Turn X",
        UNLOCK: true
    },
    {
        SUIT: GM,
        ID: -1,
        NAME: "RGM-79 GM",
        UNLOCK: true
    },
    {
        SUIT: BALL,
        ID: -1,
        NAME: "RB-79 Ball",
        UNLOCK: true,
        PARTS: 3
    },
    {
        SUIT: ZAKU_II,
        ID: -1,
        NAME: "MS-06 Zaku II",
        UNLOCK: true
    },
    {
        SUIT: GOUF,
        ID: -1,
        NAME: "MS-07 Gouf",
        UNLOCK: true
    },
    {
        SUIT: DOM,
        ID: -1,
        NAME: "MS-09 Dom",
        UNLOCK: true
    },
    {
        SUIT: ZGOK,
        ID: -1,
        NAME: "MSM-07 Z'Gok",
        UNLOCK: true
    },
    {
        SUIT: GYAN,
        ID: -1,
        NAME: "YMS-15 Gyan",
        UNLOCK: true
    },
    {
        SUIT: GELGOOG,
        ID: -1,
        NAME: "MS-14A Gelgoog",
        UNLOCK: true
    },
    {
        SUIT: ZAKU_TANK,
        ID: -1,
        NAME: "MS-06V Zaku Tank",
        UNLOCK: true,
        PARTS: 3
    },
    {
        SUIT: GM_COMMAND,
        ID: -1,
        NAME: "RGM-79GS GM Command Space Type",
        UNLOCK: true
    },
    {
        SUIT: GOUF_FLIGHT_TYPE,
        ID: -1,
        NAME: "MS-07H Gouf Flight Test Type",
        UNLOCK: true
    },
    {
        SUIT: GM_II,
        ID: -1,
        NAME: "RMS-179/RGM-79R GM II",
        UNLOCK: true
    },
    {
        SUIT: NEMO,
        ID: -1,
        NAME: "MSA-003 Nemo",
        UNLOCK: true
    },
    {
        SUIT: RICK_DIAS,
        ID: -1,
        NAME: "RMS-099 Rick Dias",
        UNLOCK: true
    },
    {
        SUIT: HIZACK,
        ID: -1,
        NAME: "RMS-106 Hizack",
        UNLOCK: true
    },
    {
        SUIT: MARASAI,
        ID: -1,
        NAME: "RMS-108 Marasai",
        UNLOCK: true
    },
    {
        SUIT: BARZAM,
        ID: -1,
        NAME: "RMS-154 Barzam",
        UNLOCK: true
    },
    {
        SUIT: GAZA_C,
        ID: -1,
        NAME: "AMX-003 Gaza-C",
        UNLOCK: true
    },
    {
        SUIT: MP_QUBELEY,
        ID: -1,
        NAME: "AMX-004G Qubeley Mass Production Type",
        UNLOCK: true
    },
    {
        SUIT: MP_BAWOO_GLEMY,
        ID: -1,
        NAME: "AMX-107 Bawoo (Axis)",
        UNLOCK: true
    },
    {
        SUIT: MP_BAWOO_AXIS,
        ID: -1,
        NAME: "AMX-107 Bawoo (Glemy Faction)",
        UNLOCK: true
    },
    {
        SUIT: GAZA_D,
        ID: -1,
        NAME: "AMX-006 Gaza-D",
        UNLOCK: true
    },
    {
        SUIT: JEGAN,
        ID: -1,
        NAME: "RGM-89 Jegan",
        UNLOCK: true
    },
    {
        SUIT: GEARA_DOGA_REZIN,
        ID: -1,
        NAME: "AMS-119 Geara Doga Rezin Schnyder",
        UNLOCK: true
    },
    {
        SUIT: GEARA_DOGA,
        ID: -1,
        NAME: "AMS-119 Geara Doga",
        UNLOCK: true
    },
]

function mobileSuitAchievements(data)
{
    if(data[UNLOCK] == true) 
    {
        achievement( title = format("{0} Unlocked", data[NAME]),
                 description = format("Build or Unlock {0} for Mission Mode", data[NAME]),
                 points = 3,
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           prev(suitUnlockValueMemory(data[SUIT])) == 0 &&
                           suitUnlockValueMemory(data[SUIT]) == 1
        )
    }
    
    parts = 5
    if(ContainsKey(data, PARTS))
    {
        parts = data[PARTS]
    }
    achievement( title = format("{0} Complete", data[NAME]),
                 type = "Missable",
                 description = format("Have Rank 4 parts for all slots of {0}. 'The Power of Bonds' and 'The True DYNASTY WARRIORS: Gundam' must not be completed by any character", data[NAME]),
                 points = 5,
                 trigger = achievementActive() &&
                           isNotDemoMode() &&
                           // Neither of these can be complete. 
                           missionCompleteMemoryLookup(THE_TRUE_DYNASTY_WARRIORS_GUNDAM) == 0 && 
                           missionCompleteMemoryLookup(THE_POWER_OF_BONDS) == 0 &&
                           any_of(range(0, parts - 1), partIndex => !checkprevRank4Part(data[SUIT], partIndex)) &&
                           all_of(range(0, parts - 1), partIndex => checkRank4Part(data[SUIT], partIndex))
    )
}

for data in mobileSuitData
{
    mobileSuitAchievements(data)
}

fullCharacterGalleryCount = LAST_CHARACTER_GALLERY_INDEX - FIRST_CHARACTER_GALLERY_INDEX + 1 - STARTING_CHARACTER_GALLERY_COUNT
halfTargetCharacterGallery = (LAST_CHARACTER_GALLERY_INDEX - FIRST_CHARACTER_GALLERY_INDEX + 1) / 2


achievement( title = "Getting to Know the Gundam Characters",
             description = "Unlock half of the character gallery entries",
             points = 5,
             trigger = achievementActiveForGallery()  &&
                       sum_of(range(FIRST_CHARACTER_GALLERY_INDEX, LAST_CHARACTER_GALLERY_INDEX), characterIndex => prev(characterGalleryEntryData(characterIndex))) - STARTING_CHARACTER_GALLERY_COUNT < halfTargetCharacterGallery &&
                       measured(sum_of(range(FIRST_CHARACTER_GALLERY_INDEX, LAST_CHARACTER_GALLERY_INDEX), 
                                characterIndex => characterGalleryEntryData(characterIndex)) - STARTING_CHARACTER_GALLERY_COUNT >= halfTargetCharacterGallery,
                                when= galleryActive())
)

achievement( title = "My Character Collection",
             description = "Unlock all the character gallery entries",
             points = 10,
             trigger = achievementActiveForGallery()  &&
                       any_of(range(FIRST_CHARACTER_GALLERY_INDEX, LAST_CHARACTER_GALLERY_INDEX), characterIndex => prev(characterGalleryEntryData(characterIndex)) == 0) &&
                       // 14 characters are unlocked at the beginning. 
                       measured(sum_of(range(FIRST_CHARACTER_GALLERY_INDEX, LAST_CHARACTER_GALLERY_INDEX), 
                                characterIndex => characterGalleryEntryData(characterIndex))  - STARTING_CHARACTER_GALLERY_COUNT == fullCharacterGalleryCount,
                                when= galleryActive())
)
fullMobileSuitGalleryCount = LAST_MOBILE_SUIT_GALLERY_INDEX - FIRST_MOBILE_SUIT_GALLERY_INDEX + 1 - STARTING_SUIT_GALLERY_COUNT
halfTargetMobileSuitGallery =  (LAST_MOBILE_SUIT_GALLERY_INDEX - FIRST_MOBILE_SUIT_GALLERY_INDEX + 1) / 2

achievement( title = "Getting to Know the Gundam Suits",
             description = "Unlock half of the mobile suit gallery entries",
             points = 5,
             trigger = achievementActiveForGallery() &&
                       sum_of(range(FIRST_MOBILE_SUIT_GALLERY_INDEX, LAST_MOBILE_SUIT_GALLERY_INDEX), suitIndex => prev(mobileSuitGallerySuitVisibility(suitIndex))) - STARTING_SUIT_GALLERY_COUNT < halfTargetMobileSuitGallery  &&
                       measured(sum_of(range(FIRST_MOBILE_SUIT_GALLERY_INDEX, LAST_MOBILE_SUIT_GALLERY_INDEX), 
                                suitIndex => mobileSuitGallerySuitVisibility(suitIndex)) - STARTING_SUIT_GALLERY_COUNT  >= halfTargetMobileSuitGallery,
                                when= galleryActive())
)

achievement( title = "My Gunpla Collection",
             description = "Unlock all the mobile suit gallery entries",
             points = 10,
             trigger = achievementActiveForGallery() &&
                       any_of(range(FIRST_MOBILE_SUIT_GALLERY_INDEX, LAST_MOBILE_SUIT_GALLERY_INDEX), suitIndex => prev(mobileSuitGallerySuitVisibility(suitIndex)) == 0) &&
                       // 14 Suits are unlocked at the beginning. 
                       measured(sum_of(range(FIRST_MOBILE_SUIT_GALLERY_INDEX, LAST_MOBILE_SUIT_GALLERY_INDEX), 
                                suitIndex => mobileSuitGallerySuitVisibility(suitIndex))  - STARTING_SUIT_GALLERY_COUNT== fullMobileSuitGalleryCount,
                                when= galleryActive())
)

fullBattleShipGalleryCount = LAST_BATTLE_SHIP_GALLERY_INDEX - FIRST_BATTLE_SHIP_GALLERY_INDEX + 1

achievement( title = "My Battleship Collection",
             description = "Unlock all the battleship gallery entries",
             points = 10,
             trigger = achievementActiveForGallery() &&
                       any_of(range(FIRST_BATTLE_SHIP_GALLERY_INDEX, LAST_BATTLE_SHIP_GALLERY_INDEX), shipIndex => prev(battleshipGalleryShipVisibility(shipIndex)) == 0) &&
                       measured(sum_of(range(FIRST_BATTLE_SHIP_GALLERY_INDEX, LAST_BATTLE_SHIP_GALLERY_INDEX), shipIndex => battleshipGalleryShipVisibility(shipIndex)) == fullBattleShipGalleryCount,
                                when= galleryActive())
)

fullMovieGalleryCount = LAST_MOVIE_GALLERY_INDEX - FIRST_MOVIE_GALLERY_INDEX + 1
halfMovieGallery = (fullMovieGalleryCount) / 2

achievement( title = "Getting Started With Gundam Movies",
             description = "Unlock half of the movie gallery entries",
             points = 5,
             trigger = achievementActiveForGallery() &&
                       sum_of(range(FIRST_MOVIE_GALLERY_INDEX, LAST_MOVIE_GALLERY_INDEX), movieIndex => prev(movieGalleryUnlock(movieIndex))) < halfMovieGallery &&
                       measured(sum_of(range(FIRST_MOVIE_GALLERY_INDEX, LAST_MOVIE_GALLERY_INDEX), movieIndex => movieGalleryUnlock(movieIndex)) >= halfMovieGallery,
                                when= galleryActive())
)

achievement( title = "My Gundam Movie Collection",
             description = "Unlock all the movie gallery entries",
             points = 10,
             trigger = achievementActiveForGallery() &&
                       any_of(range(FIRST_MOVIE_GALLERY_INDEX, LAST_MOVIE_GALLERY_INDEX), movieIndex => prev(movieGalleryUnlock(movieIndex)) == 0) &&
                       measured(sum_of(range(FIRST_MOVIE_GALLERY_INDEX, LAST_MOVIE_GALLERY_INDEX), movieIndex => movieGalleryUnlock(movieIndex)) == fullMovieGalleryCount, 
                                when= galleryActive())
)

// this is a hack because all the leaderboard IDs are sequencial. 
LEADERBOARD_ID = 98302
ACHIEVEMENT_ID = 425441

skipTable =
{
    425528: 425530,
    425545: 425546,
    425557: 425558,
    425572: 425573,
    425582: 425583,
    425587: 425588,
    425604: 425605,
    425614: 425615,
    425616: 425617,
    425635: 425636,
    425640: 425641,
    425650: 425651,
    425678: 425679,
    425666: 425669,
    425663: 425664,
    
}

function achievementLeaderboardHardMode(missionName, missionID, description, mode)
{
    // Leaderboards can be iterim.
    modePlusIterim = (mode || isIterimMode()) 

    leaderboard(
        id = LEADERBOARD_ID,
        title = format("Most Kills on {0}",  missionName),
        description = format("Get the most kills on {0} and win the scenario as a single player", description),
        start = 
        (
            achievementActive() &&
            isNotDemoMode() &&
            modePlusIterim &&
            singlePlayer() &&
            missionsSelected() == missionID &&
            justWonMission()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalKOsInMission(),
        format = "VALUE"
    )
    LEADERBOARD_ID = LEADERBOARD_ID + 1

    leaderboard(
        id = LEADERBOARD_ID,
        title = format("Fastest Run on {0}", missionName),
        description = format("Get through the {0} the fastest as a single player", description),
        
        start  =
        (
            achievementActive() &&
            isNotDemoMode() &&
            modePlusIterim &&
            singlePlayer() &&
            missionsSelected() == missionID &&
            justWonMission()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = framesSinceMissionStart(),
        format = "FRAMES", 
        lower_is_better = true 
    )
    LEADERBOARD_ID = LEADERBOARD_ID + 1
    
    if ContainsKey(skipTable, ACHIEVEMENT_ID)
    {
        ACHIEVEMENT_ID = skipTable[ACHIEVEMENT_ID]
    }
  
    achievement( id = ACHIEVEMENT_ID,
                 title = format("{0} Mastered", missionName),
                 description = format("Complete Mission {0} on hard difficulty without using an interim save in single player", description),
                 points = 5,
                 trigger = achievementActive() &&
                         isNotDemoMode() &&
                         mode &&
                         isHardDifficulty() &&
                         singlePlayer() &&
                         missionsSelected() == missionID &&
                         trigger_when(justWonMission())
    )
    ACHIEVEMENT_ID = ACHIEVEMENT_ID + 1

    leaderboard(
        id = LEADERBOARD_ID,
        title = format("Hard: Most Kills on {0}",  missionName),
        description = format("Get the most kills on {0} and win the scenario on hard difficulty as a single player",  description),
        start = 
        (
            achievementActive() &&
            isNotDemoMode() &&
            modePlusIterim &&
            isHardDifficulty() &&
            singlePlayer() &&
            missionsSelected() == missionID &&
            justWonMission()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalKOsInMission(),
        format = "VALUE"
    )
    LEADERBOARD_ID = LEADERBOARD_ID + 1

    leaderboard(
        id = LEADERBOARD_ID,
        title = format("Hard: Fastest Run on {0}", missionName),
        description = format("Get through the {0} the fastest on hard difficulty as a single player", description),
        
        start  =
        (
            achievementActive() &&
            isNotDemoMode() &&
            modePlusIterim &&
            isHardDifficulty() &&
            singlePlayer() &&
            missionsSelected() == missionID &&
            justWonMission()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = framesSinceMissionStart(),
        format = "FRAMES", 
        lower_is_better = true 
    )
    LEADERBOARD_ID = LEADERBOARD_ID + 1
}

for data in originalMissionData
{
    for mission in data[MISSIONS]
    {
        achievementLeaderboardHardMode(format("{0}'s {1}", characterShortNameLookup[data[CHARACTER]], missionNameLookup[mission]), 
                                       mission, 
                                       format("{0} in {1} in Original Mode", missionNameLookup[mission], data[DESCRIPTION]),
                                       isOriginalMode())
        
    }
}

for data in missionModeData
{
    for mission in data[MISSIONS]
    {
            achievementLeaderboardHardMode(missionNameLookup[mission], 
                                       mission, 
                                       format("{0} in {1} Mission Mode", missionNameLookup[mission], data[DESCRIPTION]),
                                       isMissionMode())
    }
}

for data in additionMissionsData
{
    for mission in data[MISSIONS]
    {
        if (mission != PILOTING_PRACTICE)  // the Exception.
        {
            achievementLeaderboardHardMode(missionNameLookup[mission], 
                                           mission, 
                                           format("{0} in Mission Mode", missionNameLookup[mission]),
                                           isMissionMode())
        }
    }
}

function correctLicenseNumbers(characterIndex, licenses)
{
    if (characterIndex == AMURO_RAY || characterIndex == KAMILLE_BIDAN || characterIndex == JUDAU_ASHTA)
    {
        return 3
    }
    if (characterIndex == CHAR_AZNABLE)
    {
        return 5
    }
    
    return licenses
}

function checkSkillForCharacter(characterIndex, target) => characterSkillCount(characterIndex) >= target

function checkPrevSkillForCharacter(characterIndex, target) => characterPrevSkillCount(characterIndex) < target

function checkLicenseForCharacter(characterIndex, targetLicenses)
{
    if( targetLicenses == 2)
    {
        targetLicenses = correctLicenseNumbers(characterIndex, targetLicenses)
        
    }
    return characterLicenseCount(characterIndex) >= targetLicenses
}

function checkPrevLicenseForCharacter(characterIndex, targetLicenses)
{
    if( targetLicenses == 2 && characterIndex == AMURO_RAY || characterIndex == CHAR_AZNABLE)
    {
        targetLicense = 3
    }
    return characterPrevLicenseCount(characterIndex) < targetLicenses
}


achievement(title = "I learned something",
            description = "Earn your first skill for any character",
            points = 2,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => checkSkillForCharacter(characterIndex, 1) && 
                                               checkPrevSkillForCharacter(characterIndex, 1))
)

achievement(title = "Studious Pilot",
            description = "Earn half the skills for any character",
            points = 10,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => measured(checkSkillForCharacter(characterIndex, HALF_SKILL_COUNT), 
                                                        when=checkPrevSkillForCharacter(characterIndex, HALF_SKILL_COUNT) ))
)

achievement(title = "Skill Master",
            description = "Earn all the skills for any character",
            points = 25,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => measured(checkSkillForCharacter(characterIndex, FULL_SKILL_COUNT), 
                                                        when=checkPrevSkillForCharacter(characterIndex, FULL_SKILL_COUNT) ))
)

achievement(title = "I Got My Gundam License!",
            description = "Earn your second license for any character. Original Story characters will need one more than the starting number",
            points = 3,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => checkLicenseForCharacter(characterIndex, 2) && 
                             checkPrevLicenseForCharacter(characterIndex, 2))
)

achievement(title = "Multi-License Pilot",
            description = "Earn half the licenses for any character",
            points = 10,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => measured(checkLicenseForCharacter(characterIndex, HALF_LICENSE_COUNT), 
                                                        when=checkPrevLicenseForCharacter(characterIndex, HALF_LICENSE_COUNT)))
)

achievement(title = "I Can Drive Anything",
            description = "Earn all the licenses for any character",
            points = 25,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), 
                             characterIndex => measured(checkLicenseForCharacter(characterIndex, FULL_LICENSE_COUNT), 
                                                        when=checkPrevLicenseForCharacter(characterIndex, FULL_LICENSE_COUNT)))
)

// This is - 1 for the current character. (Note that's handled because Amuro is 0x00) 
// Three characters are not "Friendable", Crown Kyoji and Kacricorn Cacooler
TOTAL_FRIENDS = FINAL_CHARACTER_INDEX - 3  
HALF_FRIENDS = (TOTAL_FRIENDS) / 2    

achievement(title = "Mr. Popular",
            description = "Befriend half of all characters",
            points = 10,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      isMissionOrIterimMode() &&
                      countFriends(selectedCharacter()) >= HALF_FRIENDS &&  // Could be more than one that goes over the limit. 
                      countVisibleFriends(selectedCharacter()) >= HALF_FRIENDS && // Likely will be more. 
                      countPrevFriends(selectedCharacter()) < HALF_FRIENDS &&
                      selectedCharacter() == prev(selectedCharacter()) // This is due to a problem between Add Address Mem and Add Source Delta 
)
//  any_of(range(FIRST_CHARACTER_INDEX, FINAL_SELECTABLE_CHARACTER_INDEX), characterIndex =>  
//                                countFriends(characterIndex)  == HALF_FRIENDS && countPrevFriends(characterIndex) < (HALF_FRIENDS))

achievement(title = "Everyone Loves Me",
            description = "Befriend everyone with any character",
            points = 50,
            trigger = achievementActive() &&
                      isNotDemoMode() &&
                      isMissionOrIterimMode() &&
                      countFriends(selectedCharacter()) == TOTAL_FRIENDS &&  
                      countVisibleFriends(selectedCharacter()) >= TOTAL_FRIENDS && // Probably will never be > but maybe. 
                      countPrevFriends(selectedCharacter()) < TOTAL_FRIENDS &&
                      selectedCharacter() == prev(selectedCharacter()) // This is due to a problem between Add Address Mem and Add Source Delta 
                      
)

achievement(title = "Gundam Researcher",
            description = "Reach level 2 with the Mobile Suit Lab",
            points = 3,
            trigger = achievementActive() &&
                      reachedMobileSuitLabLevel(2)
)

achievement(title = "Gundam Engineer",
            description = "Reach level 5 with the Mobile Suit Lab",
            points = 5,
            trigger = achievementActive() &&
                      reachedMobileSuitLabLevel(5)
)

achievement(title = "Gundam Professor",
            description = "Reach level 10 with the Mobile Suit Lab",
            points = 10,
            trigger = achievementActive() &&
                      reachedMobileSuitLabLevel(10)
)


achievement(title = "Dynasty Warrior Gundam 2 Pub Quiz",
                    description = "Answer the ten Dynasty Warriors: Gundam 2 Quiz questions correctly in one attempt. Re-read the message to try again",
            points = 3,
            trigger = achievementActive() &&
                      messageViewedTeriminal() == DYNASTY_WARRIORS_GUNDAM_2_NOVICE_QUIZ &&
                      correctAnswersQuiz() == 10 &&
                      prev(correctAnswersQuiz()) == 9
)

achievement(title = "Dynasty Warrior Gundam 2 Game Show",
                    description = "Answer the ten Dynasty Warriors: Gundam 2 Expert Quiz questions correctly in one attempt. Re-read the message to try again",
            points = 5,
            trigger = achievementActive() &&
                      messageViewedTeriminal() == DYNASTY_WARRIORS_GUNDAM_2_EXPERT_QUIZ &&
                      correctAnswersQuiz() == 10 &&
                      prev(correctAnswersQuiz()) == 9
)

// Beat char with a zaku? 
// 
// Maybe beat a level in a ball and beat a level in a Zaku (not levels designed for them)
// 
// Befriend specific people? 


rich_presence_conditional_display(inGameCheckRP() == 0x00, "In the menus")

rich_presence_conditional_display(isVersusMode(), "In Versus Mode")

rich_presence_display("{0} is fighting in mission: {1} Time: {2} KOs: {3}",
                                    rich_presence_lookup("CharacterNameLookup", selectedCharacter(), characterList),
                                    rich_presence_lookup("MissionNameLookup", missionsSelected(), missionNameLookup),
                                    rich_presence_value("Time", framesSinceMissionStart(), format="FRAMES"),
                                    rich_presence_value("VALUE", totalKOsInMission())
                                 )

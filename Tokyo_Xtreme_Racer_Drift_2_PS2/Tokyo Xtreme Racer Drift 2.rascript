// Tokyo Xtreme Racer: Drift 2
// #ID = 20775

function bitOffset(InitialOffset, BitValue)
{
    offset = BitValue / 8
    
    targetBit = BitValue % 8
    targetLocation = InitialOffset+offset
    return bit(targetBit, targetLocation)
}

function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// only doing what I'll use currently.  All values are in the lookup
DAIHATSU_MIDGET_II_R_TYPE_K100P = 0x01
MITSUBISHI_MIRAGE_CYBORG_ZR = 0x27
TOYOTO_TRUENO_3DOOR_GT_APEX_AE86 = 0x94
HONDA_CIVIC_TYPE_R_EK9 = 0x0a
carLookup =
{
    0x00: "ASL Garaiya(Garaiya)",
    0x01: "Daihatsu Midget II R type(K100P)",
    0x02: "Daihatsu Mira TR-XX(L502S)",
    0x03: "Daihatsu Mira AVY RS(L260S)",
    0x04: "Daihatsu Copen(L880K)",
    0x05: "Daihatsu Storia X-4(M112S)",
    0x06: "Honda Beat(PP1)",
    0x07: "Honda City Turbo II",
    0x08: "Honda Fit(GD1)",
    0x09: "Honda Civic SiR II(EG6)",
    0x0a: "Honda Civic Type R(EK9)",
    0x0b: "Honda Civic Type R(EP3)",
    0x0c: "Honda CR-X SiR(EF8)",
    0x0d: "Honda Prelude Si VTEC(BB4)",
    0x0e: "Honda Prelude Type S(BB6)",
    0x0f: "Honda Integra Si VTEC(DB8)",
    0x10: "Honda Integra Type R(DC2)",
    0x11: "Honda Integra Type R(DC5)",
    0x12: "Honda Accord Euro R(CL1)",
    0x13: "Honda Accord Euro R(CL7)",
    0x14: "Honda S2000 2.0 Type V(AP1)",
    0x15: "Honda NSX Type R(NA1)",
    0x16: "Honda NSX Type S(NA2)",
    0x17: "Mazda AZ-1(PG6SA)",
    0x18: "Mazda Mazda2 (DY5W)",
    0x19: "Mazda Mazda3 (BK3P)",
    0x1a: "Mazda Mazda323(BG8Z)",
    0x1b: "Mazda MX-5 Miata (NA8C)",
    0x1c: "Mazda MX-5 Miata (NB8C)",
    0x1d: "Mazda MX-5 Miata (NB8C)",
    0x1e: "Mazda Mazda6 (GG3S)",
    0x1f: "Mazda RX-7 (SA22)",
    0x20: "Mazda RX-7 (FC3S)",
    0x21: "Mazda RX-7 (FC3S)",
    0x22: "Mazda RX-7 (FD3S)",
    0x23: "Mazda RX-7 (FD3S)",
    0x24: "Mazda RX-8 (SE3P)",
    0x25: "Mitsubishi Colt Sport X Version (Z28A)",
    0x26: "Mitsubishi Mirage Cyborg R (CA4A)",
    0x27: "Mitsubishi Mirage Cyborg ZR (CJ4A)",
    0x28: "Mitsubishi Mirage Asti RX (CJ4A)",
    0x29: "Mitsubishi FTO GP Ver.R (DE3A)",
    0x2a: "Mitsubishi Galant VR-4 (EC5A)",
    0x2b: "Mitsubishi Galant VR-4 (E39A)",
    0x2c: "Mitsubishi Lancer Evolution (CD9A)",
    0x2d: "Mitsubishi Lancer Evolution 2 (CE9A)",
    0x2e: "Mitsubishi Lancer Evolution 3 (CE9A)",
    0x2f: "Mitsubishi Lancer Evolution 4 (CN9A)",
    0x30: "Mitsubishi Lancer Evolution 5 (CP9A)",
    0x31: "Mitsubishi Lancer Evolution 6 (CP9A)",
    0x32: "Mitsubishi Lancer Evolution 7 (CT9A)",
    0x33: "Mitsubishi Lancer Evolution 8 (CT9A)",
    0x34: "Mitsubishi Lancer Evolution 8 MR (CT9A)",
    0x35: "Mitsubishi Eclipse GSR-4 (D32A)",
    0x36: "Mitsubishi Starion GSR-VR (A187A)",
    0x37: "Mitsubishi GTO Twin Turbo MR (Z15A)",
    0x38: "Nissan March R (EK10)",
    0x39: "Nissan March G# (HK11)",
    0x3a: "Nissan March 12SR (AK12)",
    0x3b: "Nissan Bluebird SSS-R (RNU12)",
    0x3c: "Nissan Pulsar GTI-R (RNN14)",
    0x3d: "Nissan Pulsar VZ-R N1 (JN15)",
    0x3e: "Nissan Sunny Truck (B122)",
    0x3f: "Nissan RZ-1 Twincam Type-B (EB12)",
    0x40: "Nissan Gazelle Turbo RS-X (S12)",
    0x41: "Nissan 180SX Type II (RS13)",
    0x42: "Nissan 180SX Type X (RPS13)",
    0x43: "Nissan 180SX Type X (RPS13)",
    0x44: "Nissan Silvia Turbo R-X.G (S12)",
    0x45: "Nissan Silvia K's (S13)",
    0x46: "Nissan Silvia Club K's (PS13)",
    0x47: "Nissan Silvia K's (S14)",
    0x48: "Nissan Silvia K's (CS14)",
    0x49: "Nissan Silvia Spec-R (S15)",
    0x4a: "Nissan Sileighty",
    0x4b: "Nissan Onevia",
    0x4c: "Nissan Primera 2.0Te (HP10)",
    0x4d: "Nissan Primera 20V (HP12)",
    0x4e: "Nissan Laurel Club S (EC33)",
    0x4f: "Nissan Laurel 25 Club S (GC34)",
    0x50: "Nissan Laurel 25 Club S (GC35)",
    0x51: "Nissan Cefiro Cruising (A31)",
    0x52: "Nissan Skyline Turbo RS-X (R30)",
    0x53: "Nissan Skyline GTS Turbo (R31)",
    0x54: "Nissan Skyline GTS-R (R31)",
    0x55: "Nissan Skyline GTS-t (HCR32)",
    0x56: "Nissan Skyline GT-R VspecII (BNR32)",
    0x57: "Nissan Skyline GTS25t (ECR33)",
    0x58: "Nissan Skyline GTS25t (ECR33)",
    0x59: "Nissan Skyline GT-R Vspec (BCNR33)",
    0x5a: "Nissan Skyline 25GT Turbo (ER34)",
    0x5b: "Nissan Skyline GT-R VspecII (BNR34)",
    0x5c: "Nissan Skyline 350GT (PV35)",
    0x5d: "Nissan Skyline Coupe 350GT (CPV35)",
    0x5e: "Nissan Stagea 260RS (WGNC34)",
    0x5f: "Nissan Stagea 350RX Four (NM35)",
    0x60: "Nissan Fairlady Z 240Z (HS30S)",
    0x61: "Nissan Fairlady Z 280Z-T (S130)",
    0x62: "Nissan Fairlady Z 300ZX (HZ31)",
    0x63: "Nissan Fairlady Z Version S (CZ32)",
    0x64: "Nissan Fairlady Z Version ST (Z33)",
    0x65: "Subaru Vivio RX-R (KK4)",
    0x66: "Subaru R2 S (RC2)",
    0x67: "Subaru Impreza WRX STi (GC8)",
    0x68: "Subaru Impreza WRX STi Ver2 (GC8)",
    0x69: "Subaru Impreza WRX STi Ver3 (GC8)",
    0x6a: "Subaru Impreza WRX STi Ver4 (GC8)",
    0x6b: "Subaru Impreza WRX STi Ver5 (GF-GC8)",
    0x6c: "Subaru Impreza WRX STi Ver6 (GF-GC8)",
    0x6d: "Subaru Impreza 22B STi (GF-GC8)",
    0x6e: "Subaru Impreza WRX STi (GDB)",
    0x6f: "Subaru Impreza STi (GDB)",
    0x70: "Subaru Impreza Wagon (GF8)",
    0x71: "Subaru Impreza Wagon (GH-GGB)",
    0x72: "Subaru Impreza Wagon (TA-GGA)",
    0x73: "Subaru Forester S/ tb STi2 (SF5)",
    0x74: "Subaru Forester STi (SG9)",
    0x75: "Subaru Legacy Touring Wagon (BF5)",
    0x76: "Subaru Legacy RS (BC5)",
    0x77: "Subaru Legacy Touring Wagon (BG5)",
    0x78: "Subaru Legacy RS (BD5)",
    0x79: "Subaru Legacy Touring Wagon (BH5)",
    0x7a: "Subaru Legacy B4 RSK (BE5)",
    0x7b: "Subaru Legacy Blitzen (BE5)",
    0x7c: "Subaru Legacy S401 (BE5)",
    0x7d: "Subaru Legacy B4 2.0GT specB (BL5)",
    0x7e: "Subaru Legacy Wagon (BP5)",
    0x7f: "Subaru Alcyone (AX9)",
    0x80: "Subaru Alcyone SVX (CXD)",
    0x81: "Suzuki Carry 660 Turbo (DA52T)",
    0x82: "Suzuki Alto Works RS/R (CP21S)",
    0x83: "Suzuki Alto Works RS-Z VVT (HA22S)",
    0x84: "Suzuki Kei Sport R (HN22S)",
    0x85: "Suzuki Swift Sport (HT51S)",
    0x86: "Suzuki Cappuccino (EA21R)",
    0x87: "Toyota Ist 1.5S (NCP61)",
    0x88: "Toyota Starlet Turbo S (EP71)",
    0x89: "Toyota Starlet GT (EP82)",
    0x8a: "Toyota Starlet GT (EP82)",
    0x8b: "Toyota Starlet Glanza V (EP91)",
    0x8c: "Toyota Vitz RS (NCP13)",
    0x8d: "Toyota Levin 1500SR (AE85)",
    0x8e: "Toyota Trueno 1500SR (AE85)",
    0x8f: "Toyota Levin 3Door GT-Apex (AE86)",
    0x90: "Toyota Levin 3Door GT-Apex (AE86)",
    0x91: "Toyota Levin 2Door GT-Apex (AE86)",
    0x92: "Toyota Levin 2Door GT-Apex (AE86)",
    0x93: "Toyota Sprinter 3Door GT-Apex (AE86)",
    0x94: "Toyota Trueno 3Door GT-Apex (AE86)",
    0x95: "Toyota Sprinter 2Door GT-Apex (AE86)",
    0x96: "Toyota Trueno 2Door GT-Apex (AE86)",
    0x97: "Toyota Levin 1.6 GT-Z (AE92)",
    0x98: "Toyota Trueno 1.6 GT-Z (AE92)",
    0x99: "Toyota Levin BZ-R (AE111)",
    0x9a: "Toyota Trueno BZ-R (AE111)",
    0x9b: "Toyota Celica GT-Four (ST165)",
    0x9c: "Toyota Celica GT-Four (ST185)",
    0x9d: "Toyota Celica GT-Four (ST205)",
    0x9e: "Toyota Celica SS-II (ZZT231)",
    0x9f: "Toyota Celica XX 2800GT (MA61)",
    0xa0: "Toyota Caldina GT-Four (ST246W)",
    0xa1: "Toyota MR2 G-Super Charger (AW11)",
    0xa2: "Toyota MR2 GT (SW20)",
    0xa3: "Toyota MR-S 1.8 V Edition (ZZW30)",
    0xa4: "Toyota MR-S VM180 Zagato (ZZW30)",
    0xa5: "Toyota Altezza RS200 (SXE10)",
    0xa6: "Toyota Mark II Tourer V (JZX90)",
    0xa7: "Toyota Mark II Tourer V (JZX100)",
    0xa8: "Toyota Mark II IR-V (JZX110)",
    0xa9: "Toyota Chaser Tourer V (JZX100)",
    0xaa: "Toyota Verossa 2.5 VR25 (JZX110)",
    0xab: "Toyota Soarer 3.0GT Limited (MZ20)",
    0xac: "Toyota Supra 2.5GT (JZA70)",
    0xad: "Toyota Supra RZ (JZA80)",
    0xae: "Volkswagen Golf R32 (1JBFHF)",
    0xaf: "Volkswagen New Beetle RSi (9CAXJ)",
    0xb0: "Audi S3 (8LBAMF)",
    0xb1: "Audi RS4 (8DAZBRF)",
    0xb2: "Audi RS6 (4BBCYF)",
    0xb3: "Audi TT Coupe 3.2 Quattro (8NBHEF)",
    0xb4: "Renault 5 Turbo II",
    0xb5: "Renault Clio V6 24V",
    0xb6: "Peugeot 205 Turbo 16",
    0xb7: "Fiat Coupe Turbo Plus (175A3)",
    0xb8: "Fiat Fiat Abarth 1000 TCR",
    0xb9: "Gemballa Turbo R-GT 320",
    0xba: "Opel Speedster (E00Z22)",
    0xbb: "Alfa Romeo 155 Q4 (167A2E)",
    0xbc: "Alfa Romeo 156 GTA (932AXB)",
    0xbd: "Alfa Romeo Crosswagon",
    0xbe: "Special Ridox Supra (JZA80)",
    0xbf: "Special Nob Silvia (S15)",
    0xc0: "Special Amemiya RX-7 (FD3S)",
    0xc1: "Special MCR GT-R (BNR34)",
    0xc2: "Special Fujitsubo Lancer (CT9A)",
    0xc3: "Special Fujitsubo Impreza (GDB)",
    0xc4: "Special Mines Skyline (BNR34)",
    0xc5: "Special 5Zigen Integra (DC5)",
    0xc6: "Special Genki S2000 (AP1)",
    0xc7: "Special HKS Silvia (S15)",
    0xc8: "Special HKS Altezza (SXE10)",
    0xc9: "Special Nomura Skyline (ER34)",
    0xca: "Special Yoshioka Levin (AE86)",
    0xcb: "Special Utsumi RX-7 (FD3S)",
    0xcc: "Special Hayashida Silvia (S15)",
    0xcd: "Special Izumida Fairlady Z (Z33)",
    0xce: "Special Lancer TGM (CT9A)",
    0xcf: "Special Lancer Evolution 9 SP (CT9A)",
    0xd0: "Special Citroen Xsara",
    0xd1: "Special Peugeot 206",
    0xd2: "Special Lancer Evo 8 SP (CT9A)",
    0xd3: "Special Starion 4WD",
    0xd4: "Special Impreza SP Version",
    0xd5: "Special Punto Rally",
    0xd6: "Special Opel Corsa Super 1600",
    0xd7: "Special Clio 1600",
    0xd8: "Special Ignis 1600",
    0xd9: "Special 190E Evolution II",
    0xda: "Special 190E Evolution I",
    0xdb: "Special RIV000",
    0xdc: "Special RIV014",
    0xdd: "Special RIV049",
    0xde: "Special RIV239",
    0xdf: "Special RIV320",
    0xe0: "Special RIV321",
    0xe1: "Special RIV012",
    0xe2: "Special RIV031",
    0xe3: "Special RIV066",
    0xe4: "Special RIV090",
    0xe5: "Special RIV115",
    0xe6: "Special RIV163",
    0xe7: "Special RIV193",
    0xe8: "Special RIV223",
    0xe9: "Special RIV265",
    0xea: "Special RIV290",
    0xeb: "Special RIV324",
    0xec: "Special RIV070",
    0xed: "Special RIV098",
    0xee: "Special RIV123",
    0xef: "Special RIV134",
    0xf0: "Special RIV173",
    0xf1: "Special RIV203",
    0xf2: "Special RIV230",
    0xf3: "Special RIV248",
    0xf4: "Special RIV273",
    0xf5: "Special RIV298",
    0xf6: "Special RIV340",
    0xf7: "Special RIV322",
    0xf8: "Special RIV071",
    0xf9: "Special RIV099",
    0xfa: "Special RIV124",
    0xfb: "Special RIV144",
    0xfc: "Special RIV174",
    0xfd: "Special RIV204",
    0xfe: "Special RIV231",
    0xff: "Special RIV249",
    0x100: "Special RIV274",
    0x101: "Special RIV299",
    0x102: "Special RIV323",
    0x103: "Special RIV332",
    0x104: "Special RIV349",
    0x105: "Special RIV350",
    0x106: "Special RIV351",
    0x107: "Special RIV352"
}

opponentLookup = 
{
    0x0: "Ground Zero",
    0x1: "Lil Giant",
    0x2: "Disciple 86",
    0x3: "Hi-Rev",
    0x4: "Drifty",
    0x5: "Melon Gripper",
    0x6: "Hi-Fi",
    0x7: "Tofu Maniac",
    0x8: "Eternal Splash",
    0x9: "Special Scent",
    0xa: "Mr. Switchback",
    0xb: "Kaniyana Blockbuster",
    0xc: "Mr. Mitsu",
    0xd: "Night Flight",
    0xe: "FR Benchmark",
    0xf: "Primal Hill",
    0x10: "Lightning Shift",
    0x11: "Keihin Shadow",
    0x12: "Miracle Runner",
    0x13: "Hakone King",
    0x14: "Terror Sign",
    0x15: "Kojiro Itsukujina",
    0x16: "River Ruler",
    0x17: "Gold Press",
    0x18: "Spring Storm",
    0x19: "Maple Red",
    0x1a: "Vorpal Weapon",
    0x1b: "Battleship Kure",
    0x1c: "Gogo Noroyana",
    0x1d: "Setouchi Queens",
    0x1e: "Whirlpool",
    0x1f: "Dominator",
    0x20: "Spring Wind",
    0x21: "Big Blue",
    0x22: "Hyper Crank",
    0x23: "Black Onyx",
    0x24: "Lash Messiah",
    0x25: "Mist Shower",
    0x26: "Sakura Sprinter",
    0x27: "Mt. Noro Emperess",
    0x28: "Yuushu Flirt",
    0x29: "Climb Hunter",
    0x2a: "Jet Set",
    0x2b: "Rocket Dash",
    0x2c: "Street Honage",
    0x2d: "Under the Stars",
    0x2e: "Ridge Pirate",
    0x2f: "Glittering Gaze",
    0x30: "Street Tester",
    0x31: "Metro Roller",
    0x32: "Valiant Inokuchi",
    0x33: "Autumn Lord",
    0x34: "Tail Cracker",
    0x35: "Ikaho Gatekeeper",
    0x36: "Death Sentence",
    0x37: "Groove 9",
    0x38: "Turbolicious",
    0x39: "Rage",
    0x3a: "Death",
    0x3b: "Destruction",
    0x3c: "Aerial R",
    0x3d: "Mad Dog",
    0x3e: "Local Hero",
    0x3f: "Haruna Moon",
    0x40: "Saudade",
    0x41: "Last Supper",
    0x42: "Guardian",
    0x43: "PT Sprint",
    0x44: "Natural Corner",
    0x45: "Drift Wood",
    0x46: "1st Kingdom",
    0x47: "Backstab",
    0x48: "Fake",
    0x49: "Rev SR",
    0x4a: "Total FR",
    0x4b: "Counter-rev",
    0x4c: "Highway Lyrics",
    0x4d: "Night Groove",
    0x4e: "Night Pressure",
    0x4f: "Night Rise",
    0x50: "Drift Source",
    0x51: "Lil Meteor",
    0x52: "Norma FR Style",
    0x53: "Konica FR Style",
    0x54: "Osaka FR Style",
    0x55: "Minor Hatch",
    0x56: "German Trend",
    0x57: "Pretty Boy",
    0x58: "Hog Muffler",
    0x59: "Silver Rose",
    0x5a: "Eternal Wanderer",
    0x5b: "Speed Raid",
    0x5c: "HC Top",
    0x5d: "D. Slick",
    0x5e: "Cyclone",
    0x5f: "Redeye",
    0x60: "Northern Lights",
    0x61: "Passing Night",
    0x62: "Heaven's Sword",
    0x63: "Bloodhound",
    0x64: "True Pleiades",
    0x65: "Hikam Strawberry",
    0x66: "Sugar Wind",
    0x67: "Blue Revolution",
    0x68: "Hake Creek",
    0x69: "Shifty One",
    0x6a: "Hillclimb Guy #2",
    0x6b: "Hillclimb Guy #3",
    0x6c: "Hillclimb Guy #4",
    0x6d: "Hillclimb Guy #1",
    0x6e: "Wild Range",
    0x6f: "Hell's Fury",
    0x70: "Master Pete",
    0x71: "Ever Clip",
    0x72: "Lyrical Style",
    0x73: "Alchemist",
    0x74: "Enchantress",
    0x75: "Wandering Destiny",
    0x76: "Dark Fear",
    0x77: "Rose Rain",
    0x78: "Brave Silence",
    0x79: "Hyper Beat",
    0x7a: "Nuts & Bolts",
    0x7b: "Gladiator",
    0x7c: "Gloomy Angel",
    0x7d: "Immortal Reaper",
    0x7e: "R Pride",
    0x7f: "Brake Fest",
    0x80: "Night Striker",
    0x81: "Tiny Kim",
    0x82: "FR Search",
    0x83: "Mohair Legend R",
    0x84: "Dynamite Fang",
    0x85: "Midnight Prowler",
    0x86: "Street Fossil",
    0x87: "Sign Love",
    0x88: "Gumma Giant",
    0x89: "Performance Shifter",
    0x8a: "Skill Factory",
    0x8b: "F2.8",
    0x8c: "Kayo Spark",
    0x8d: "Skirt Checker",
    0x8e: "Full-on C121",
    0x8f: "Bottom Feeder",
    0x90: "Heartbreaker",
    0x91: "Performance Drifter",
    0x92: "Indy A",
    0x93: "Night Requiem",
    0x94: "Bee Line",
    0x95: "Love Match",
    0x96: "Bloody Saturn",
    0x97: "MY",
    0x98: "Gulf Omen",
    0x99: "Customer Satisfaction",
    0x9a: "Insurgency",
    0x9b: "Downhill Guy #2",
    0x9c: "Downhill Guy #3",
    0x9d: "Downhill Guy #4",
    0x9e: "Downhill Guy #1",
    0x9f: "Winding Core",
    0xa0: "Impart",
    0xa1: "Racer's Sonata",
    0xa2: "Plasma Baby",
    0xa3: "Last Leg",
    0xa4: "Alter",
    0xa5: "X-Line",
    0xa6: "SS Middle Aged",
    0xa7: "Light Schneider",
    0xa8: "Book of Rhymes",
    0xa9: "Mortal Drift",
    0xaa: "Drift Core",
    0xab: "Flowerbed",
    0xac: "Spit Shine",
    0xad: "Act of War",
    0xae: "Dying Star",
    0xaf: "Gearhead",
    0xb0: "200-Miles",
    0xb1: "Shrine Dynamo",
    0xb2: "Deputy Shiga",
    0xb3: "Drift Survival",
    0xb4: "Ceasefire",
    0xb5: "Ca Rush",
    0xb6: "Street Review",
    0xb7: "Shining Tours",
    0xb8: "Love Christina",
    0xb9: "Street Rise",
    0xba: "Zenith Kukupa",
    0xbb: "Solar Barrage",
    0xbc: "Future Shock",
    0xbd: "Drift Rail",
    0xbe: "Keats Love",
    0xbf: "Drift Spot",
    0xc0: "Skywalker",
    0xc1: "New Moon",
    0xc2: "Dirty Version",
    0xc3: "Spooks",
    0xc4: "Razor Edge",
    0xc5: "Son of Pain",
    0xc6: "Holy Skills",
    0xc7: "Pure Power",
    0xc8: "Bloodshot",
    0xc9: "Sane Asylum",
    0xca: "Dope Color",
    0xcb: "King's Chariot",
    0xcc: "Midnight Rose",
    0xcd: "Chiba Hawaiian",
    0xce: "Meiji Force SR",
    0xcf: "Vintage Style",
    0xd0: "Bosworth Master",
    0xd1: "Nikon Premium",
    0xd2: "Workout",
    0xd3: "Napoleon Miyazawa",
    0xd4: "Club Koishikawa",
    0xd5: "Akira Nise",
    0xd6: "Early India",
    0xd7: "Quick Mouse",
    0xd8: "Wagon Counter",
    0xd9: "YM Spy R",
    0xda: "Sakurai Champ",
    0xdb: "Death Metal Greed",
    0xdc: "Magnitude 7",
    0xdd: "Stormy Boyz",
    0xde: "Pistol Rhyme",
    0xdf: "True Champion",
    0xe0: "Tribal",
    0xe1: "Lady Elliot",
    0xe2: "Death Ruse",
    0xe3: "Sacred Flurry",
    0xe4: "Benzo",
    0xe5: "Drop Knowledge",
    0xe6: "Executioner on Wheels",
    0xe7: "Tailgunner",
    0xe8: "Inline Fever",
    0xe9: "King Works",
    0xea: "4WD Chief",
    0xeb: "MR",
    0xec: "Mystery Princess",
    0xed: "True Warrior",
    0xee: "Gale Moment",
    0xef: "Legendary Schneider",
    0xf0: "Chougamori Breeze",
    0xf1: "Magical Karma",
    0xf2: "Yaita Slicer",
    0xf3: "King Steer",
    0xf4: "King Shift",
    0xf5: "King Foot",
    0xf6: "Tochigi Slicer",
    0xf7: "Animal Scent",
    0xf8: "Muhai Emblem",
    0xf9: "Shadow Eyes",
    0xfa: "Nana Beans",
    0xfb: "Tendo Storm",
    0xfc: "Everdrift",
    0xfd: "Storm Surge",
    0xfe: "Double AI",
    0xff: "Zoom Zoom Zoom",
    0x100: "Platinum Split",
    0x101: "Katta D1",
    0x102: "Whiteout",
    0x103: "Rusty Forest",
    0x104: "Zao Tempest",
    0x105: "King Kajou",
    0x106: "Frost Wave",
    0x107: "Snowman",
    0x108: "Divine Gorge",
    0x109: "Yeti Fang",
    0x10a: "Downhill Dinosaur",
    0x10b: "Wailing Pheonix",
    0x10c: "Solemn Tidings",
    0x10d: "Snowflake Road",
    0x10e: "Blue 'n Yellow 1",
    0x10f: "Blue 'n Yellow 2",
    0x110: "Blue 'n Yellow 3",
    0x111: "Lionel",
    0x112: "Grief Plate",
    0x113: "99VA",
    0x114: "Drift Slayer",
    0x115: "Moon Splash",
    0x116: "Foot Beat",
    0x117: "Scared Tree",
    0x118: "Distortion",
    0x119: "Ragga China",
    0x11a: "Lanevoism",
    0x11b: "Jizo's Fury",
    0x11c: "Right-Brained",
    0x11d: "Mighty Crown",
    0x11e: "Camellia",
    0x11f: "Taylor Ito",
    0x120: "Dabada Kafuri",
    0x121: "Club Bastard",
    0x122: "Reign Supreme",
    0x123: "Alt Bayern",
    0x124: "Live Counter",
    0x125: "Light Banshee",
    0x126: "Devil's Advocate",
    0x127: "Limp Grip",
    0x128: "Rotary Commander",
    0x129: "Dark Paladin",
    0x12a: "Timber Slash",
    0x12b: "Dream Fiend",
    0x12c: "Taushubetsu Star",
    0x12d: "Line Hysterics",
    0x12e: "Limestone Drip",
    0x12f: "Plasma Ratio",
    0x130: "Onnetou Glare",
    0x131: "El Matador",
    0x132: "Scuderia Spectre",
    0x133: "McCrash",
    0x134: "Rage of Nauman",
    0x135: "Tailslide Dash",
    0x136: "Cutoff Demon",
    0x137: "Team Steward",
    0x138: "Greatest Line",
    0x139: "Snowlight",
    0x13a: "Pride of Nupuka",
    0x13b: "Killer Kickback",
    0x13c: "Mountain Pride",
    0x13d: "Aurora Stream",
    0x13e: "LAT43N",
    0x13f: "Roy's Lover",
    0x140: "God Shift Bunta",
    0x141: "High Empress",
    0x142: "Kaido President",
    0x143: "Emperor Speed",
    0x144: "Blackout",
    0x145: "Shirakaba White",
    0x146: "Shall We Drift",
    0x147: "Crystal Wonder",
    0x148: "Venus Kirigamine",
    0x149: "Sawa Ghost",
    0x14a: "Peacful Marsh",
    0x14b: "Iceman",
    0x14c: "Ootsuka Demon",
    0x14d: "Alpen Hill",
    0x14e: "Killer Bee",
    0x14f: "I Scream Truck",
    0x150: "Wall of Murodou",
    0x151: "Tateyama DH1",
    0x152: "Kurobe Think Tank",
    0x153: "Big Catch",
    0x154: "Forbidden Spear",
    0x155: "Sagami Express",
    0x156: "Takosan Tengu",
    0x157: "Hammer of the Saint",
    0x158: "Yokuouin Keyman",
    0x159: "Gang S",
    0x15a: "Street Carriage",
    0x15b: "Tamba Track Line",
    0x15c: "GT",
    0x15d: "Sitar Kaneyama",
    0x15e: "Nightmare",
    0x15f: "Winter Tornado",
    0x160: "Haunted Shore",
    0x161: "Blacky",
    0x162: "Dream",
    0x163: "Funin",
    0x164: "Chief Musclehead",
    0x020f:"Twenty Master",
}
FIRST_RIVAL_INDEX = 0x0000
LAST_RIVAL_INDEX = 0x0164
GROUND_ZERO = 0x0
MELON_GRIPPER = 0x5
MR_MITSU = 0xc 
NIGHT_FLIGHT = 0xd
PRIMAL_HILL = 0xf
LIGHTNING_SHIFT = 0x10
HAKONE_KING = 0x13
VORPAL_WEAPON = 0x1a
SETOUCHI_QUEENS = 0x1d
DOMINATOR = 0x1f
BIG_BLUE = 0x21
BLACK_ONYX = 0x23
MIST_SHOWER = 0x25
SAKURA_SPRINTER = 0x26
MT_NORO_EMPERESS = 0x27
ROCKET_DASH = 0x2b
GLITTERING_GAZE = 0x2f
STREET_TESTER = 0x30
METRO_ROLLER = 0x31
TURBOLICIOUS = 0x38
DESTRUCTION = 0x3b
GUARDIAN = 0x42
PT_SPRINT = 0x43
DRIFT_WOOD = 0x45
FIRST_KINGDOM = 0x46
BACKSTAB = 0x47
TOTAL_FR = 0x4a
NIGHT_RISE = 0x4f
OSAKA_FR_STYLE = 0x54
ETERNAL_WANDERER = 0x5a
SPEED_RAID = 0x5b
D_SLICK = 0x5d
CYCLONE = 0x5e
REDEYE = 0x5f
NORTHERN_LIGHTS = 0x60
PASSING_NIGHT = 0x61
HEAVENS_SWORD = 0x62
BLOODHOUND = 0x63
HILLCLIMB_GUY_1 = 0x6d
ALCHEMIST = 0x73
ENCHANTRESS = 0x74
DARK_FEAR = 0x76
ROSE_RAIN = 0x77
BRAVE_SILENCE = 0x78
HYPER_BEAT = 0x79
NUTS_AND_BOLTS = 0x7a
GLADIATOR = 0x7b
GLOOMY_ANGEL = 0x7c
TINY_KIM = 0x81
MOHAIR_LEGEND_R = 0x83
STREET_FOSSIL = 0x86
F2_8 = 0x8b
KAYO_SPARK = 0x8c
FULL_ON_C121 = 0x8e
HEARTBREAKER = 0x90
GULF_OMEN = 0x98
DOWNHILL_GUY_1 = 0x9e
LAST_LEG = 0xa3
ALTER = 0xa4
X_LINE = 0xa5
LIGHT_SCHNEIDER = 0xa7
BOOK_OF_RHYMES = 0xa8
MORTAL_DRIFT = 0xa9
DRIFT_CORE = 0xaa
SPIT_SHINE = 0xac
ACT_OF_WAR = 0xad
DYING_STAR = 0xae
DEPUTY_SHIGA = 0xb2
FUTURE_SHOCK = 0xbc
NEW_MOON = 0xc1
DIRTY_VERSION = 0xc2
SPOOKS = 0xc3
HOLY_SKILLS = 0xc6
PURE_POWER = 0xc7
DOPE_COLOR = 0xca
KINGS_CHARIOT = 0xcb
MIDNIGHT_ROSE = 0xcc
BOSWORTH_MASTER = 0xd0
AKIRA_NISE = 0xd5
DEATH_METAL_GREED = 0xdb
TRUE_CHAMPION = 0xdf
TRIBAL = 0xe0
LADY_ELLIOT = 0xe1
BENZO = 0xe4
DROP_KNOWLEDGE = 0xe5
EXECUTIONER_ON_WHEELS = 0xe6
TAILGUNNER = 0xe7
INLINE_FEVER = 0xe8
FOUR_WHEEL_DRIVE_CHIEF = 0xea
MR = 0xeb
GALE_MOMENT = 0xee
LEGENDARY_SCHNEIDER = 0xef
KING_FOOT = 0xf5
TOCHIGI_SLICER = 0xf6
ANIMAL_SCENT = 0xf7
MUHAI_EMBLEM = 0xf8
SHADOW_EYES = 0xf9
DOUBLE_AI = 0xfe
ZAO_TEMPEST = 0x104
YETI_FANG = 0x109
DOWNHILL_DINOSAUR = 0x10a
WAILING_PHOENIX = 0x10b
SNOWFLAKE_ROAD = 0x10d
BLUE_N_YELLOW_3 = 0x110
LIONEL = 0x111
GRIEF_PLATE = 0x112
FOOT_BEAT = 0x116
JIZOS_FURY = 0x11b
CLUB_BASTARD = 0x121
REIGN_SUPREME = 0x122
ALT_BAYERN = 0x123
LIVE_COUNTER = 0x124
DEVILS_ADVOCATE = 0x126
LIMP_GRIP = 0x127
ROTARY_COMMANDER = 0x128
DARK_PALADIN = 0x129
TIMBER_SLASH = 0x12a
DREAM_FIEND = 0x12b
MCCRASH = 0x133
TEAM_STEWARD = 0x137
GOD_SHIFT_BUNTA = 0x140
HIGH_EMPRESS = 0x141
KAIDO_PRESIDENT = 0x142
EMPEROR_SPEED = 0x143
BLACKOUT = 0x144
VENUS_KIRIGAMINE = 0x148
PEACEFUL_MARSH = 0x14a
ICEMAN = 0x14b
OOTSUKA_DEMON = 0x14c
KUROBE_THINK_TANK = 0x152
FORBIDDEN_SPEAR = 0x154
YOKUOUIN_KEYMAN = 0x158
STREET_CARRIAGE = 0x15a
GT = 0x15c
SITAR_KANEYAMA = 0x15d
HAUNTED_SHORE = 0x160

ID = "ID"
TEAM_NAME = "TEAM_NAME"
POINTS = "POINTS"
CAR = "Car"
TRACK = "Track"
CREATOR = "Creator"
DIRECTION = "Direction"
ID = "AchievementID"
TIME = "Time"
ACHIEVEMENT_NAME = "Title"
WEATHER = "Weather"
TIMEOFDAY = "TimeOfDay"
TIMESTRING = "DisplayString"
MODE = "Mode"
SCORE = "Score"
NAME = "Name"
TITLE = "Title"
TRIGGER = "Trigger"
FROM = "FROM"
COURSE_NAME = "COURSE_NAME"
DESCRIPTION = "DESCRIPTION"
STAGES = "STAGES"
FASTEST_DESCRIPTION = "FASTEST_DESCRIPTION"
SHORTEST_DESCRIPTION = "SHORTEST_DESCRIPTION"

teamLeaderInfos =
[
    {
        ID: MELON_GRIPPER,
        TEAM_NAME: "Hakone Stalkers",
        POINTS:1
    },
    {
        ID: HAKONE_KING,
        TEAM_NAME: "h-dd",
        POINTS:1
    },
    {
        ID: VORPAL_WEAPON,
        TEAM_NAME: "Street Snap",
        POINTS:1
    },
    {
        ID: SETOUCHI_QUEENS,
        TEAM_NAME: "Wiz Raspberry",
        POINTS:1
    },
    {
        ID: ROCKET_DASH,
        TEAM_NAME: "Skyliner R",
        POINTS:1
    },
    {
        ID: TURBOLICIOUS,
        TEAM_NAME: "Spiral Sliders",
        POINTS:1
    },
    {
        ID: DESTRUCTION,
        TEAM_NAME: "Haruna Hillclimb Club",
        POINTS:1
    },
    {
        ID: TOTAL_FR,
        TEAM_NAME: "Haruna Starlights",
        POINTS:1
    },
    {
        ID: NIGHT_RISE,
        TEAM_NAME: "Ashanti Rise",
        POINTS:1
    },
    {
        ID: OSAKA_FR_STYLE,
        TEAM_NAME: "Nissan FR Style",
        POINTS:1
    },
    {
        ID: D_SLICK,
        TEAM_NAME: "Akagi Big Blue",
        POINTS:1
    },
    {
        ID: HILLCLIMB_GUY_1,
        TEAM_NAME: "Hillclimb Guys",
        POINTS:1
    },
    {
        ID: MOHAIR_LEGEND_R,
        TEAM_NAME: "Adult Night",
        POINTS:1
    },
    {
        ID: FULL_ON_C121,
        TEAM_NAME: "Love Boat",
        POINTS:1
    },
    {
        ID: GULF_OMEN,
        TEAM_NAME: "60 Seconds",
        POINTS:1
    },
    {
        ID: DOWNHILL_GUY_1,
        TEAM_NAME: "Downhill Guys",
        POINTS:1
    },
    {
        ID: SPIT_SHINE,
        TEAM_NAME: "Westside",
        POINTS:1
    },
    {
        ID: DEPUTY_SHIGA,
        TEAM_NAME: "LaVern",
        POINTS:1
    },
    {
        ID: FUTURE_SHOCK,
        TEAM_NAME: "Extra Large",
        POINTS:1
    },
    {
        ID: DOPE_COLOR,
        TEAM_NAME: "Street Dreams",
        POINTS:1
    },
    {
        ID: BOSWORTH_MASTER,
        TEAM_NAME: "God's Favorite",
        POINTS:1
    },
    {
        ID: AKIRA_NISE,
        TEAM_NAME: "True Shutoko Unit 1",
        POINTS:1
    },
    {
        ID: DEATH_METAL_GREED,
        TEAM_NAME: "True Shutoko Unit 2",
        POINTS:1
    },
    {
        ID: FOUR_WHEEL_DRIVE_CHIEF,
        TEAM_NAME: "The Presidents",
        POINTS:1
    },
    {
        ID: GALE_MOMENT,
        TEAM_NAME: "Bay Racing",
        POINTS:1
    },
    {
        ID: KING_FOOT,
        TEAM_NAME: "Extreme Seminar",
        POINTS:1
    },
    {
        ID: DOUBLE_AI,
        TEAM_NAME: "Black Eyed Beans",
        POINTS:1
    },
    {
        ID: ZAO_TEMPEST,
        TEAM_NAME: "Blue Avalanche",
        POINTS:1
    },
    {
        ID: BLUE_N_YELLOW_3,
        TEAM_NAME: "Snow Inspectors",
        POINTS:1
    },
    {
        ID: FOOT_BEAT,
        TEAM_NAME: "Breakform",
        POINTS:1
    },
    {
        ID: JIZOS_FURY,
        TEAM_NAME: "Wicked Skillz",
        POINTS:1
    },
    {
        ID: CLUB_BASTARD,
        TEAM_NAME: "Speed Usher",
        POINTS:1
    },
    {
        ID: MCCRASH,
        TEAM_NAME: "Team WR",
        POINTS:1
    },
    {
        ID: TEAM_STEWARD,
        TEAM_NAME: "Pleiades Spirits",
        POINTS:1
    },
    {
        ID: VENUS_KIRIGAMINE,
        TEAM_NAME: "Heavy Nation",
        POINTS:1
    },
    {
        ID: KUROBE_THINK_TANK,
        TEAM_NAME: "Quarterbank",
        POINTS:1
    },
    {
        ID: YOKUOUIN_KEYMAN,
        TEAM_NAME: "Fresh Air",
        POINTS:1
    },
    {
        ID: HAUNTED_SHORE,
        TEAM_NAME: "Sodom's Revival",
        POINTS:1
    }
]

slasherList =
[
    {
        ID:MR_MITSU,
        POINTS:1
    },
    {
        ID:DOMINATOR,
        POINTS:1
    },
    {
        ID:GUARDIAN,
        POINTS:1
    },
    {
        ID:ETERNAL_WANDERER,
        POINTS:1
    },
    {
        ID:ALCHEMIST,
        POINTS:1
    },
    {
        ID:LAST_LEG,
        POINTS:1
    },
    {
        ID:NEW_MOON,
        POINTS:1
    },
    {
        ID:TRUE_CHAMPION,
        POINTS:1
    }
]

kingdomTwelveList =
[
    {
        ID: FIRST_KINGDOM,
        POINTS:1
    },
    {
        ID: HEAVENS_SWORD,
        POINTS:1
    },
    {
        ID: GLADIATOR,
        POINTS:1
    },
    {
        ID: STREET_FOSSIL,
        POINTS:1
    },
    {
        ID: ACT_OF_WAR,
        POINTS:1
    },
    {
        ID: KINGS_CHARIOT,
        POINTS:1
    },
    {
        ID: EXECUTIONER_ON_WHEELS,
        POINTS:1
    },
    {
        ID: MUHAI_EMBLEM,
        POINTS:1
    },
    {
        ID: LIONEL,
        POINTS:1
    },
    {
        ID: TIMBER_SLASH,
        POINTS:1
    },
    {
        ID: KAIDO_PRESIDENT,
        POINTS:1
    },
    {
        ID: FORBIDDEN_SPEAR,
        POINTS:1
    }
]

thirteenDevilsList =
[
    {
        ID:BACKSTAB,
        POINTS:1
    },
    {
        ID:BLOODHOUND,
        POINTS:1
    },
    {
        ID:GLOOMY_ANGEL,
        POINTS:1
    },
    {
        ID:HEARTBREAKER,
        POINTS:1
    },
    {
        ID:DYING_STAR,
        POINTS:1
    },
    {
        ID:MIDNIGHT_ROSE,
        POINTS:1
    },
    {
        ID:TAILGUNNER,
        POINTS:1
    },
    {
        ID:SHADOW_EYES,
        POINTS:1
    },
    {
        ID:GRIEF_PLATE,
        POINTS:1
    },
    {
        ID:DREAM_FIEND,
        POINTS:1
    },
    {
        ID:EMPEROR_SPEED,
        POINTS:1
    },
    {
        ID:OOTSUKA_DEMON,
        POINTS:1
    },
    {
        ID:SITAR_KANEYAMA,
        POINTS:1
    }
]

eliteList =
[
    {
        ID:REIGN_SUPREME,
        POINTS:1
    },
    {
        ID:BLACKOUT,
        POINTS:1
    },
    {
        ID:GROUND_ZERO,  // This is out of order, but this is the order of "Progress" on the finale.,
        POINTS:1
    } 
]

tricksterList =
[
    {
        ID:PRIMAL_HILL,
        POINTS:1
    },
    {
        ID:LIGHTNING_SHIFT,
        POINTS:1
    },
    {
        ID:BLACK_ONYX,
        POINTS:1
    },
    {
        ID:MIST_SHOWER,
        POINTS:1
    },
    {
        ID:SAKURA_SPRINTER,
        POINTS:1
    },
    {
        ID:MT_NORO_EMPERESS,
        POINTS:1
    },
    {
        ID:STREET_TESTER,
        POINTS:1
    },
    {
        ID:METRO_ROLLER,
        POINTS:1
    },
    {
        ID:DRIFT_WOOD,
        POINTS:1
    },
    {
        ID:SPEED_RAID,
        POINTS:1
    },
    {
        ID:CYCLONE,
        POINTS:1
    },
    {
        ID:REDEYE,
        POINTS:1
    },
    {
        ID:NORTHERN_LIGHTS,
        POINTS:1
    },
    {
        ID:PASSING_NIGHT,
        POINTS:1
    },
    {
        ID:DARK_FEAR,
        POINTS:1
    },
    {
        ID:ROSE_RAIN,
        POINTS:1
    },
    {
        ID:BRAVE_SILENCE,
        POINTS:1
    },
    {
        ID:HYPER_BEAT,
        POINTS:1
    },
    {
        ID:NUTS_AND_BOLTS,
        POINTS:1
    },
    {
        ID:KAYO_SPARK,
        POINTS:1
    },
    {
        ID:ALTER,
        POINTS:1
    },
    {
        ID:X_LINE,
        POINTS:1
    },
    {
        ID:LIGHT_SCHNEIDER,
        POINTS:1
    },
    {
        ID:BOOK_OF_RHYMES,
        POINTS:1
    },
    {
        ID:MORTAL_DRIFT,
        POINTS:1
    },
    {
        ID:DRIFT_CORE,
        POINTS:1
    },
    {
        ID:SPOOKS,
        POINTS:1
    },
    {
        ID:HOLY_SKILLS,
        POINTS:1
    },
    {
        ID:PURE_POWER,
        POINTS:1
    },
    {
        ID:TRIBAL,
        POINTS:1
    },
    {
        ID:LADY_ELLIOT,
        POINTS:1
    },
    {
        ID:BENZO,
        POINTS:1
    },
    {
        ID:DROP_KNOWLEDGE,
        POINTS:1
    },
    {
        ID:INLINE_FEVER,
        POINTS:1
    },
    {
        ID:MR,
        POINTS:1
    },
    {
        ID:LEGENDARY_SCHNEIDER,
        POINTS:1
    },
    {
        ID:ANIMAL_SCENT,
        POINTS:1
    },
    {
        ID:YETI_FANG,
        POINTS:1
    },
    {
        ID:DOWNHILL_DINOSAUR,
        POINTS:1
    },
    {
        ID:WAILING_PHOENIX,
        POINTS:1
    },
    {
        ID:SNOWFLAKE_ROAD,
        POINTS:1
    },
    {
        ID:ALT_BAYERN,
        POINTS:1
    },
    {
        ID:DEVILS_ADVOCATE,
        POINTS:1
    },
    {
        ID:LIMP_GRIP,
        POINTS:1
    },
    {
        ID:ROTARY_COMMANDER,
        POINTS:1
    },
    {
        ID:DARK_PALADIN,
        POINTS:1
    },
    {
        ID:GOD_SHIFT_BUNTA,
        POINTS:1
    },
    {
        ID:HIGH_EMPRESS,
        POINTS:1
    },
    {
        ID:PEACEFUL_MARSH,
        POINTS:1
    },
    {
        ID:ICEMAN,
        POINTS:1
    },
    {
        ID:STREET_CARRIAGE,
        POINTS:1
    },
    {
        ID:GT,
        POINTS:1
    }
]



HAKONE_INDEX = 0
HIROSHIMA_INDEX = 1
HARUNA_INDEX = 2
AKAGI_INDEX = 3
URA_ROKKA_INDEX = 4
OMOTE_ROKKO_INDEX = 5
SHIGA_KUSATSU_INDEX = 6
NIKKO_INDEX = 7
ZAO_INDEX = 8
ASO_INDEX = 9
HOKKAIDO_INDEX = 10

// $3B3514: (8-bit) Index of Opponent in current team.
//          
//          For instance
//          
//          0x00 = Gogo Noroyama
//          0x01 = Setouchi Queen.
//          
//          For non teams if you reach 0x01 you've won the series
//          
//          NOTE: If this is frozen to 0. You won't befriend an opponent even if everything else is set up so you will.  No friend, no companion
function teamIndexOpponent() => byte(0x3B3514)

// $3B3520: (8-bit) Replay Indicator
//          
//          0x00 = Gameplay Active.
//          0x01 = Replay active
function replayIndicator() => byte(0x3B3520)
REPLAY_ACTIVE = 0x01
function replayActive() => replayIndicator() == REPLAY_ACTIVE

// $3B3524: (8-bit) Game Mode when in race
//          
//          0x01 = Conquest
//          0x02 = Time Record
//          0x03 = Time Challenge.
//          0x04 = Versus Mode
//          0x05 = Replay Viewer
//          
//          Doesn't appear to get changed AFTER a race, but may be incorrect before racing.
function gameModeInGame() => byte(0x3B3524)
CONQUEST_MODE = 0x01
RECORD_CHALLENGE_MODE = 0x02
RECORD_TOUR_MODE = 0x03
VERSUS_MODE = 0x04
REPLAY_VIEWER_MODE = 0x05

function conquestMode() => gameModeInGame() == CONQUEST_MODE
function recordChallengeMode() => gameModeInGame() == RECORD_CHALLENGE_MODE
function recordTourMode() => gameModeInGame() == RECORD_TOUR_MODE
function versusMode() => gameModeInGame() == VERSUS_MODE
function replayViewerMode() => gameModeInGame() == REPLAY_VIEWER_MODE

// $3B3525: (8-bit) In Game Course
//          
//          0x00 = Haruna
//          0x01 = Hakone
//          0x02 = Nikko
//          0x03 = Omote Rokko
//          0x04 = Akagi
//          0x05 = Aso
//          0x06 = Zao
//          0x08 = Gymkhana
//          0x09 = Hiroshima
//          0x0a = Ura Rokka
//          0x0b = Hokkaido
//          0x0c = Shiga Kusatsu
//          0x0d = Usuitrouge
//          0x0e = Myougisan
//          0x0f = Happogahara
//          0x10 = Yokohama
//          0x11 = Ohtarumi
//          0x12 = Yukinoohtani
//          0x13 = Kirigamine
//          0x14 = Hakone Nanamagari
// Value doesn't appear to change after race
function courseInGame() => byte(0x3B3525)
HARUNA_COURSE_INDEX = 0x00
HAKONE_COURSE_INDEX = 0x01
NIKKO_COURSE_INDEX = 0x02
OMOTE_ROKKO_COURSE_INDEX = 0x03
AKAGI_COURSE_INDEX = 0x04
ASO_COURSE_INDEX = 0x05
ZAO_COURSE_INDEX = 0x06
GYMKHANA_COURSE_INDEX = 0x08
HIROSHIMA_COURSE_INDEX = 0x09
URA_ROKKA_COURSE_INDEX = 0x0a
HOKKAIDO_COURSE_INDEX = 0x0b
SHIGA_KUSATSU_COURSE_INDEX = 0x0c
USUITROUGE_COURSE_INDEX = 0x0d
MYOGISAN_COURSE_INDEX = 0x0e
HAPPOGAHARA_COURSE_INDEX = 0x0f
YOKOHAMA_COURSE_INDEX = 0x10
OHTARUMI_COURSE_INDEX = 0x11
YUKINOOHTANI_COURSE_INDEX = 0x12
KIRIGAMINE_COURSE_INDEX = 0x13
HAKONE_NANAMAGARI_COURSE_INDEX = 0x14

ingameCourseLookup =
{
    HARUNA_COURSE_INDEX: "Haruna",
    HAKONE_COURSE_INDEX: "Hakone",
    NIKKO_COURSE_INDEX: "Nikko",
    OMOTE_ROKKO_COURSE_INDEX: "Omote Rokko",
    AKAGI_COURSE_INDEX: "Akagi",
    ASO_COURSE_INDEX: "Aso",
    ZAO_COURSE_INDEX: "Zao",
    GYMKHANA_COURSE_INDEX: "Gymkhana",
    HIROSHIMA_COURSE_INDEX: "Hiroshima",
    URA_ROKKA_COURSE_INDEX: "Ura Rokka",
    HOKKAIDO_COURSE_INDEX: "Hokkaido",
    SHIGA_KUSATSU_COURSE_INDEX: "Shiga Kusatsu",
    USUITROUGE_COURSE_INDEX: "Usuitrouge",
    MYOGISAN_COURSE_INDEX: "Myougisan",
    HAPPOGAHARA_COURSE_INDEX: "Happogahara",
    YOKOHAMA_COURSE_INDEX: "Yokohama",
    OHTARUMI_COURSE_INDEX: "Ohtarumi",
    YUKINOOHTANI_COURSE_INDEX: "Yukinoohtani",
    KIRIGAMINE_COURSE_INDEX: "Kirigamine",
    HAKONE_NANAMAGARI_COURSE_INDEX: "Hakone Nanamagari"
}

HAKONE_UNLOCK_BIT = 0
FIRST_RECORD_TOUR_COURSE = HAKONE_UNLOCK_BIT
HIROSHIMA_UNLOCK_BIT = 1
HARUNA_UNLOCK_BIT = 2
AKAGI_UNLOCK_BIT = 3
URA_ROKKA_UNLOCK_BIT = 4
OMOTE_ROKKO_UNLOCK_BIT = 5
SHIGA_KUSATSU_UNLOCK_BIT = 6
NIKKO_UNLOCK_BIT = 7
ZAO_UNLOCK_BIT = 8
ASO_UNLOCK_BIT = 9
HOKKAIDO_UNLOCK_BIT = 10
LAST_RECORD_TOUR_COURSE = HOKKAIDO_UNLOCK_BIT

recordTourLookup =
{
    HAKONE_UNLOCK_BIT: "Hakone",
    HIROSHIMA_UNLOCK_BIT: "Hiroshima",
    HARUNA_UNLOCK_BIT: "Haruna",
    AKAGI_UNLOCK_BIT: "Akagi",
    URA_ROKKA_UNLOCK_BIT: "Ura Rokka",
    OMOTE_ROKKO_UNLOCK_BIT: "Omote Rokko",
    SHIGA_KUSATSU_UNLOCK_BIT: "Shiga Kusatsu",
    NIKKO_UNLOCK_BIT: "Nikko",
    ZAO_UNLOCK_BIT: "Zao",
    ASO_UNLOCK_BIT: "Aso",
    HOKKAIDO_UNLOCK_BIT: "Hokkaido"
}

DOWNHILL_VALUE = 0
CLIMB_VALUE = 1

directionLookup =
{
    DOWNHILL_VALUE: "Downhill",
    CLIMB_VALUE: "Uphill"

}

shortCarNameLookup =
{
    MITSUBISHI_MIRAGE_CYBORG_ZR: "Mirage Cyborg ZR",
    DAIHATSU_MIDGET_II_R_TYPE_K100P: "Midget II",
    TOYOTO_TRUENO_3DOOR_GT_APEX_AE86: "Trueno GT",
    HONDA_CIVIC_TYPE_R_EK9: "Civic Type R"
}

SUNNY_VALUE = 0
RAIN_VALUE = 1
SNOW_VALUE = 2
CLOUDY_VALUE = 3
STORM_VALUE = 4
SNOWSTORM_VALUE = 5

weatherLookup =
{
    SUNNY_VALUE: "Fine",
    RAIN_VALUE: "Rain",
    SNOW_VALUE: "Snow",
    CLOUDY_VALUE: "Cloudy",
    STORM_VALUE: "Storm",
    SNOWSTORM_VALUE: "Snowstorm"
} 

DAYTIME_VALUE = 0
NIGHTTIME_VALUE = 1

timeOfDayLookup =
{
    DAYTIME_VALUE: "Day",
    NIGHTTIME_VALUE: "Night"
}

// $3C0070: (8-bit) Alternate Replay Indicator
//          
//          0x00 = Replay active
//          0x01 = Gameplay Active.
function altReplayIndicator() => byte(0x3C0070)

// $3FA984: (8-bit) Driving Indicator.
//          
//          0x00 = Currently on Front End
//          0x01 = Currently Driving
function inGameIndicator() => byte(0x3FA984)

IN_GAME_VALUE = 0x01
function isInGame() => inGameIndicator() == IN_GAME_VALUE
function wasInGame() => prev(inGameIndicator()) == IN_GAME_VALUE
function justFinishedGameplay() => !isInGame() && wasInGame()


// $3FAFE4: (32-bit) Save Game handler.
//          
//          This is a pointer to a handler for the save game.  Freezing this to 0x00 (or the upper bits of it) Will make the save game fail to load.
//          
//          If this is 0x00 then the save game/load game is no in progress.
//          If this is any other value, treat it as achievements should be invalid.
function saveGameIndicator() => dword(0x3FAFE4)
SAVE_GAME_NOT_ACTIVE = 0x00
function notSaving() => saveGameIndicator() == SAVE_GAME_NOT_ACTIVE

// $4CBE8C: (8-bit) Total Result Record Tour 1st player Score
//          
//          Only for the screen, not the actual sum.
//          
//          This changes before 0x003fa984 changes from 1 to 0.
function recordTourfirstPlayerScore() => byte(0x4CBE8C)
MAX_SCORE = 66
function maxPlayerScore() => recordTourfirstPlayerScore() == MAX_SCORE

// $4CBE90: (8-bit) Total Result Record Tour 1st player Score
//          
//          0x0b = Player.
function recordTourfirstPlayerId() => byte(0x4CBE90)
PLAYER_INDEX = 0x0b
function didPlayerWinRecordTour() => recordTourfirstPlayerId() == PLAYER_INDEX

// $4cbf25: (16-bit) Record Tour Winner of Stage 
// 
//         0x000b = Player
function recordTourStageWinner() => word(0x4CBF25)

function didPlayerWinRecordTourStage() => recordTourStageWinner() == PLAYER_INDEX

// $75CA38: (32-bit) Player Stat Total Earnings
function totalEarning() => dword(0x75CA38)

// $75CA3C: (32-bit) Player Stat: Total Spent
function totalSpent() => dword(0x75CA3C)

// $75CA40: (Float) Player Stat: Max speed in Kmph
//          
//          Converted to mph by multiplying by .6214
function maxSpeed() => float(0x75CA40)

// $75CA44: (Float) Player Stat: Total Distance in KM
//          
//          Converted to miles by multiplying by .6214
function totalDistance() => float(0x75CA44)

// $75CA98: (8-bit) Current Weather in quest mode
//          
//          0x00 = Sunny
//          0x01 = Cloudy
//          0x02 = Rain (Snow in some areas)
//          0x03 = Storm  (Snow Storm in some areas)
// Out of game.
function weatherQuestMode() => byte(0x75CA98)

// $75CAD0: (32-bit) Days played.
//          
//          Gets calculated into Months and Weeks as well.
//          
//          7 days a week, 28 days a month
function daysPlayed() => dword(0x75CAD0)

// $75CB30: (32-bit) CP (Cash)
//          
//          Money for the game.
function money() => dword(0x75CB30)

// $760784: (19-bit bitfield) Course Unlocks
//          
//          bit0 = Hakone
//          bit1 = Hiroshima
//          bit2 = Haruna
//          bit3 = Akagi
//          bit4 = Ura Rokko
//          bit5 = Omote Rokko
//          bit6 = Shiga Kusatsu
//          bit7 = Nikko
//          bit8 = Zao
//          bit9 = Aso
//          bit10 = Hokkaido
//          bit11= Hakone Nanamagari
//          bit12 = Usuitouge
//          bit13 = Myougisan
//          bit14 = Happogahara
//          bit15 = Yokohama
//          bit16 = Yukinoohtani
//          bit17 = Kirigamine
//          bit18 = Ohtarumi
//         
//          Stage 1:
//          Hakone
//          Hiroshima
//          
//          Stage 2:
//          Haruna
//          Akagi
//          Ura Rokko
//          
//          Stage 3:
//          Omote Rokko
//          Shiga Kusatsu
//          Nikko
//          
//          Stage 4: 
//          Zao
//          Aso
//          
//          Final Stage:
//          Hokkaido
COURSE_UNLOCKED_MEMORY_LOCATION = 0x760784
function courseUnlocked() => byte(COURSE_UNLOCKED_MEMORY_LOCATION)

function courseJustUnlocked(bitIndex) => bit(bitIndex, COURSE_UNLOCKED_MEMORY_LOCATION) == 1 && 
                                         prev(bit(bitIndex, COURSE_UNLOCKED_MEMORY_LOCATION)) == 0

function stage2JustUnlocked() => courseJustUnlocked(HARUNA_UNLOCK_BIT) && 
                                 courseJustUnlocked(AKAGI_UNLOCK_BIT) && 
                                 courseJustUnlocked(URA_ROKKA_UNLOCK_BIT)

function stage3JustUnlocked() => courseJustUnlocked(OMOTE_ROKKO_UNLOCK_BIT) && 
                                 courseJustUnlocked(SHIGA_KUSATSU_UNLOCK_BIT) && 
                                 courseJustUnlocked(NIKKO_UNLOCK_BIT)

function stage4JustUnlocked() => courseJustUnlocked(ZAO_UNLOCK_BIT) && 
                                 courseJustUnlocked(ASO_UNLOCK_BIT)

function finalStageJustUnlocked() => courseJustUnlocked(HOKKAIDO_UNLOCK_BIT)


// $76078C: (16-bit) losses to the first rival
//          
//          (48-bit) Data for the First Rival
//          
//          Note only 24 bits is confirmed, likely up to 48 but unsure if it's 24 bits after this, or 24 bits before this.
//          
//          This is the data for Ground Zero  If you have lost to him this is 0x01.
FIRST_RIVAL_LOSS_MEMORY_LOCATION = 0x76078C
FIRST_RIVAL_WIN_MEMORY_LOCATION = 0x76078E
FIRST_RIVAL_FRIEND_MEMORY_LOCATION = 0x760790
SECOND_RIVAL_WIN_MEMORY_LOCATION = 0x760794
RIVAL_MEMORY_SIZE = SECOND_RIVAL_WIN_MEMORY_LOCATION - FIRST_RIVAL_WIN_MEMORY_LOCATION
function lossesFirstRival() => word(lossesFirstRival)

function rivalLossData(rivalIndex) => word(FIRST_RIVAL_LOSS_MEMORY_LOCATION + (rivalIndex * RIVAL_MEMORY_SIZE))

// $76078E: (16-bit) First Rival Number of times Beaten
//          
//          This is the data for Ground Zero  If you have beat him this is 0x01.
function winsFirstRival() => word(FIRST_RIVAL_WIN_MEMORY_LOCATION)

function rivalWinData(rivalIndex) => word(FIRST_RIVAL_WIN_MEMORY_LOCATION + (rivalIndex * RIVAL_MEMORY_SIZE))

// $760790: (8-bit) Rival Met
//          
//          Appears to be 0x00.
//          0x01 = Has appeared but not challenged.  (Guess)
//          0x02 = Has been looked at in the Parking lot (Will appear on profile)
//          0x03 = FRIENDDDDD (Can borrow their car on the Rival List)
//          
//          Not a bitfield.
function firstRivalMetFriend() => byte(FIRST_RIVAL_FRIEND_MEMORY_LOCATION)

function rivalFriendData(rivalIndex) => byte(FIRST_RIVAL_FRIEND_MEMORY_LOCATION + (rivalIndex * RIVAL_MEMORY_SIZE))
FRIEND_VALUE = 0x03

function countCurrentFriends() => sum_of(range(FIRST_RIVAL_INDEX, LAST_RIVAL_INDEX), i => rivalFriendData(i) / FRIEND_VALUE)
function countPrevFriends() => sum_of(range(FIRST_RIVAL_INDEX, LAST_RIVAL_INDEX), i => prev(rivalFriendData(i)) / FRIEND_VALUE)

// $760794: (8-bit) Second Rival Win Information
//          
//          This is the information for Lil Giant
function winsSecondRival() => byte(0x760794)

// $7615F8: (32-bit) Current level of Twenty Masters
//          
//          Unknown how high it can go.
function twentyMastersLevel() => dword(0x7615F8)

// $768C0C: (40-bit Bitfield) Available Sponsors
//          
//          Will be all 0xff if you've met all the sponsors.
//          
//          You only need to "Look" at a sponsor the get it in the list.  You don't need to activate it.
//          
//          bit00 = Takeoff
//          bit01 = Yours
//          bit02 = Autoleifen
//          bit03 = Full-Auto
//          bit04 = Yellow Magic
//          bit05 = Grafitti Art
//          bit06 = R Concept
//          bit07 = Sprint Racing
//          bit08 = Prestige
//          bit09 = Athlete
//          bit10 = Shiga Speed
//          bit11 = Autobahn
//          bit12 = Frame Master
//          bit13 = Yamamoto Engineering
//          bit14 = Kakinoki Racing
//          bit15 = OMR
//          bit16 = Brighton
//          bit17 = Strada
//          bit18 = Hi-Fi
//          bit19 = ARTT
//          bit20 = Akiba Precision
//          bit21 = Targa Top
//          bit22 = Speed License
//          bit23 = Pro Sport
//          bit24 = GT Youth
//          bit25 = Watanabe Automobiles
//          bit26 = Velvaina
//          bit27 = High Performance
//          bit28 = Independent
//          bit29 = Speed Gear
//          bit30 = Terror Tune
//          bit31 = One Off
//          bit32 = S-Style
//          bit33 = Magnesio Zero
//          bit34 = Gambino Racing
//          bit35 = Omega Line
//          bit36 = Technospeed
//          bit37 = Silver Creek
//          bit38 = Evergreen
//          bit39 = Steiner
function availableSponsors() => byte(0x768C0C)

// $768C14: (40-bit Bitfield) Tied-up Sponsor
//          
//          The bits used are the current sponsors for the player.  There's a limit of 16
//          
//          
//          
//          bit00 = Takeoff
//          bit01 = Yours
//          bit02 = Autoleifen
//          bit03 = Full-Auto
//          bit04 = Yellow Magic
//          bit05 = Grafitti Art
//          bit06 = R Concept
//          bit07 = Sprint Racing
//          bit08 = Prestige
//          bit09 = Athlete
//          bit10 = Shiga Speed
//          bit11 = Autobahn
//          bit12 = Frame Master
//          bit13 = Yamamoto Engineering
//          bit14 = Kakinoki Racing
//          bit15 = OMR
//          bit16 = Brighton
//          bit17 = Strada
//          bit18 = Hi-Fi
//          bit19 = ARTT
//          bit20 = Akiba Precision
//          bit21 = Targa Top
//          bit22 = Speed License
//          bit23 = Pro Sport
//          bit24 = GT Youth
//          bit25 = Watanabe Automobiles
//          bit26 = Velvaina
//          bit27 = High Performance
//          bit28 = Independent
//          bit29 = Speed Gear
//          bit30 = Terror Tune
//          bit31 = One Off
//          bit32 = S-Style
//          bit33 = Magnesio Zero
//          bit34 = Gambino Racing
//          bit35 = Omega Line
//          bit36 = Technospeed
//          bit37 = Silver Creek
//          bit38 = Evergreen
//          bit39 = Steiner
TIED_UP_SPONSORS_MEMORY_LOCATION = 0x768C14
TIED_UP_SPONSORS_FOUR_OFFSET_MEMORY_LOCATION = 0x768C18
function tiedUpSponsors() => byte(TIED_UP_SPONSORS_MEMORY_LOCATION)

TAKEOFF_BIT = 0
YOURS_BIT = 1
AUTOLEIFEN_BIT = 2
FULL_AUTO_BIT = 3
YELLOW_MAGIC_BIT = 4
GRAFITTI_ART_BIT = 5
R_CONCEPT_BIT = 6
SPRINT_RACING_BIT = 7
PRESTIGE_BIT = 8
ATHLETE_BIT = 9
SHIGA_SPEED_BIT = 10
AUTOBAHN_BIT = 11
FRAME_MASTER_BIT = 12
YAMAMOTO_ENGINEERING_BIT = 13
KAKINOKI_RACING_BIT = 14
OMR_BIT = 15
BRIGHTON_BIT = 16
STRADA_BIT = 17
HI_FI_BIT = 18
ARTT_BIT = 19
AKIBA_PRECISION_BIT = 20
TARGA_TOP_BIT = 21
SPEED_LICENSE_BIT = 22
PRO_SPORT_BIT = 23
GT_YOUTH_BIT = 24
WATANABE_AUTOMOBILES_BIT = 25
VELVAINA_BIT = 26
HIGH_PERFORMANCE_BIT = 27
INDEPENDENT_BIT = 28
SPEED_GEAR_BIT = 29
TERROR_TUNE_BIT = 30
ONE_OFF_BIT = 31
S_STYLE_BIT = 32
MAGNESIO_ZERO_BIT = 33
GAMBINO_RACING_BIT = 34
OMEGA_LINE_BIT = 35
TECHNOSPEED_BIT = 36
SILVER_CREEK_BIT = 37
EVERGREEN_BIT = 38
STEINER_BIT = 39

function sponsorJustTiedUp(bitIndex)
{
    if(bitIndex < 32)
    {
        return bit(bitIndex, TIED_UP_SPONSORS_MEMORY_LOCATION) == 1 && 
               prev(bit(bitIndex, TIED_UP_SPONSORS_MEMORY_LOCATION)) == 0
    }
    else
    {
        return bit(bitIndex - 32, TIED_UP_SPONSORS_FOUR_OFFSET_MEMORY_LOCATION) == 1 && 
               prev(bit(bitIndex - 32, TIED_UP_SPONSORS_FOUR_OFFSET_MEMORY_LOCATION)) == 0
    }

}


// $768DFC: (40-bit Bit Field) Prizes Earned.
//          
//          bit00 = Rookie Medal
//          bit01 = Balas Medal
//          bit02 = Ambition Medal
//          bit03 = Mystic Medal
//          bit04 = Perilous Medal
//          bit05 = Sidetes Medal
//          bit06 = Boldness Medal
//          bit07 = Courage Medal
//          bit08 = Knight Medal
//          bit09 = Top Ranking Medal
//          bit10 = Rookie Shield
//          bit11 = Hireax Shield
//          bit12 = Votum Shield
//          bit13 = Pertinax Shield
//          bit14 = Divus Shield
//          bit15 = Nobilissimus Shield
//          bit16 = Baronet Trophy
//          bit17 = Duchess Trophy
//          bit18 = Legandary Shield
//          bit19 = Master Shield
//          bit20 = Julius Cup
//          bit21 = Violent Wind Cup
//          bit22 = Didius Julianus Cup
//          bit23 = Pope Cup
//          bit24 = Sublimity Cup
//          bit25 = Consul Trophy
//          bit26 = Caesar Trophy
//          bit27 = Grypos Trophy
//          bit28 = Asiatikos Trophy
//          bit29 = Prince Elector Trophy
//          bit30 = Keraunos Trophy
//          bit31 = Pater Patriae Trophy
//          bit32 = Earl Trophy
//          bit33 = Bishop Trophy
//          bit34 = Archduke Trophy
//          bit35 = Adept Trophy
//          bit36 = Prominence Trophy
//          bit37 = Notable Trophy
//          bit38 = Imperial Trophy
//          bit39 = Conqueror Trophy
//          
//          Data on each trophy is in the array before it. 24 bit By 40 array before this.
PRIZES_EARNED_MEMORY_LOCATION = 0x768DFC
PRIZES_EARNED_FOUR_OFFSET_MEMORY_LOCATION = 0x768E00
function prizesEarned() => tbyte(PRIZES_EARNED_MEMORY_LOCATION)
ROOKIE_MEDAL_BIT = 0
BALAS_MEDAL_BIT = 1
AMBITION_MEDAL_BIT = 2
MYSTIC_MEDAL_BIT = 3
PERILOUS_MEDAL_BIT = 4
SIDETES_MEDAL_BIT = 5
BOLDNESS_MEDAL_BIT = 6
COURAGE_MEDAL_BIT = 7
KNIGHT_MEDAL_BIT = 8
TOP_RANKING_MEDAL_BIT = 9
ROOKIE_SHIELD_BIT = 10
HIREAX_SHIELD_BIT = 11
VOTUM_SHIELD_BIT = 12
PERTINAX_SHIELD_BIT = 13
DIVUS_SHIELD_BIT = 14
NOBILISSIMUS_SHIELD_BIT = 15
BARONET_TROPHY_BIT = 16
DUCHESS_TROPHY_BIT = 17
LEGENDARY_SHIELD_BIT = 18
MASTER_SHIELD_BIT = 19
JULIUS_CUP_BIT = 20
VIOLENT_WIND_CUP_BIT = 21
DIDIUS_JULIANUS_CUP_BIT = 22
POPE_CUP_BIT = 23
SUBLIMITY_CUP_BIT = 24
CONSUL_TROPHY_BIT = 25
CAESAR_TROPHY_BIT = 26
GRYPOS_TROPHY_BIT = 27
ASIATIKOS_TROPHY_BIT = 28
PRINCE_ELECTOR_TROPHY_BIT = 29
KERAUNOS_TROPHY_BIT = 30
PATER_PATRIAE_TROPHY_BIT = 31
EARL_TROPHY_BIT = 32
BISHOP_TROPHY_BIT = 33
ARCHDUKE_TROPHY_BIT = 34
ADEPT_TROPHY_BIT = 35
PROMINENCE_TROPHY_BIT = 36
NOTABLE_TROPHY_BIT = 37
IMPERIAL_TROPHY_BIT = 38
CONQUEROR_TROPHY_BIT = 39

medalRivalList =
{
    ROOKIE_MEDAL_BIT: NIGHT_FLIGHT,
    BALAS_MEDAL_BIT: BIG_BLUE,
    AMBITION_MEDAL_BIT: GLITTERING_GAZE,
    MYSTIC_MEDAL_BIT: PT_SPRINT,
    ROOKIE_SHIELD_BIT: ENCHANTRESS,
    HIREAX_SHIELD_BIT: TINY_KIM,
    VOTUM_SHIELD_BIT: F2_8,
    JULIUS_CUP_BIT: DIRTY_VERSION,
    VIOLENT_WIND_CUP_BIT: TOCHIGI_SLICER,
    CONSUL_TROPHY_BIT: LIVE_COUNTER
}

medalLookup =
{
    ROOKIE_MEDAL_BIT: "Rookie Medal",
    BALAS_MEDAL_BIT: "Balas Medal",
    AMBITION_MEDAL_BIT: "Ambition Medal",
    MYSTIC_MEDAL_BIT: "Mystic Medal",
    PERILOUS_MEDAL_BIT: "Perilous Medal",
    SIDETES_MEDAL_BIT: "Sidetes Medal",
    BOLDNESS_MEDAL_BIT: "Boldness Medal",
    COURAGE_MEDAL_BIT: "Courage Medal",
    KNIGHT_MEDAL_BIT: "Knight Medal",
    TOP_RANKING_MEDAL_BIT: "Top Ranking Medal",
    ROOKIE_SHIELD_BIT: "Rookie Shield",
    HIREAX_SHIELD_BIT: "Hireax Shield",
    VOTUM_SHIELD_BIT: "Votum Shield",
    PERTINAX_SHIELD_BIT: "Pertinax Shield",
    DIVUS_SHIELD_BIT: "Divus Shield",
    NOBILISSIMUS_SHIELD_BIT: "Nobilissimus Shield",
    BARONET_TROPHY_BIT: "Baronet Trophy",
    DUCHESS_TROPHY_BIT: "Duchess Trophy",
    LEGENDARY_SHIELD_BIT: "Legendary Shield",
    MASTER_SHIELD_BIT: "Master Shield",
    JULIUS_CUP_BIT: "Julius Cup",
    VIOLENT_WIND_CUP_BIT: "Violent Wind Cup",
    DIDIUS_JULIANUS_CUP_BIT: "Didius Julianus Cup",
    POPE_CUP_BIT: "Pope Cup",
    SUBLIMITY_CUP_BIT: "Sublimity Cup",
    CONSUL_TROPHY_BIT: "Consul Trophy",
    CAESAR_TROPHY_BIT: "Caesar Trophy",
    GRYPOS_TROPHY_BIT: "Grypos Trophy",
    ASIATIKOS_TROPHY_BIT: "Asiatikos Trophy",
    PRINCE_ELECTOR_TROPHY_BIT: "Prince Elector Trophy",
    KERAUNOS_TROPHY_BIT: "Keraunos Trophy",
    PATER_PATRIAE_TROPHY_BIT: "Pater Patriae Trophy",
    EARL_TROPHY_BIT: "Earl Trophy",
    BISHOP_TROPHY_BIT: "Bishop Trophy",
    ARCHDUKE_TROPHY_BIT: "Archduke Trophy",
    ADEPT_TROPHY_BIT: "Adept Trophy",
    PROMINENCE_TROPHY_BIT: "Prominence Trophy",
    NOTABLE_TROPHY_BIT: "Notable Trophy",
    IMPERIAL_TROPHY_BIT: "Imperial Trophy",
    CONQUEROR_TROPHY_BIT: "Conqueror Trophy"
}


function prizeJustEarned(bitIndex)
{
    if(bitIndex < 32)
    {
        return bit(bitIndex, PRIZES_EARNED_MEMORY_LOCATION) == 1 && 
               prev(bit(bitIndex, PRIZES_EARNED_MEMORY_LOCATION)) == 0
    }
    else
    {
        return bit(bitIndex - 32, PRIZES_EARNED_FOUR_OFFSET_MEMORY_LOCATION) == 1 && 
               prev(bit(bitIndex - 32, PRIZES_EARNED_FOUR_OFFSET_MEMORY_LOCATION)) == 0
    }

}

// $768E04: (bitfield) Advance Races Unlocked
//          
//          See 0x00768e14 for values.
function advanceRacesUnlocked() => byte(0x768E04)

// $768E08: (bitfield) Master Race Unlocked
//          
//          Note: It's still time based. If you're not on the right day, it won't appear.
//          
//          See 0x00768e18 for values.
function masterRaceUnlocked() => byte(0x768E08)

// $768E0C: (33-bit bitfield) Normal Race Cleared  Stats
//          
//          bit 0 = Hakone CA Cup
//          bit 1 = Hakone TA Cup
//          bit 2 = Hakone TAC Cup
//          
//          This is followed by Hiroshima, Haruna, Akagi, Ura Rokko, Omote Rokko, Shiga Kusatsu, Nikko, Zao, Aso, Hokkaido.
NORMAL_RACE_CLEARED_MEMORY_LOCATION = 0x768E0C
NORMAL_RACE_CLEARED_FOUR_BYTE_OFFSET = 0x768E10
function normalRaceCleared() => byte(NORMAL_RACE_CLEARED_MEMORY_LOCATION)

function bitForNormalRace(bitIndex)
{
    if(bitIndex < 32)
    {
        return bit(bitIndex, NORMAL_RACE_CLEARED_MEMORY_LOCATION)
    }
    else
    {
        return bit(bitIndex - 32, NORMAL_RACE_CLEARED_FOUR_BYTE_OFFSET) 
    }

}


function clearedRace(bitIndex) => bitForNormalRace(bitIndex) == 1 

function wasLockedRace(bitIndex) => prev(bitForNormalRace(bitIndex)) == 0

// Use the Unlock bit or Index, not Course Index
function wonNormalRace(courseIndex) => clearedRace((courseIndex* 3) + 0) &&
                                     clearedRace((courseIndex* 3) + 1) &&
                                     clearedRace((courseIndex* 3) + 2)

function justWonNormalRace(courseIndex) => wonNormalRace(courseIndex) &&
                                         any_of(range(0,2), index => wasLockedRace((courseIndex* 3) + index))

// $768E14: (bitfield) Advance Races Won
//          
//          bit00 = Hakone NA Fest (Perilous Medal)
//          bit01 = Hakone Turbo Fest (Pertinax Shield)
//          bit02 = Hakone Rival Car Match(Imperial Trophy)
//          bit03 = Hiroshima NA Fest (Sidetes Medal)
//          bit04 = Hiroshima Turbo Fest (Master Shield)
//          bit05 = Haruna FF Attack(Boldness Medal)
//          bit06 = Haruna FR Attack(Didius Julianus Cup)
//          bit07 = Akagi FF Attack (Courage Medal)
//          bit08 = Akagi FR Attack (Pope Cup)
//          bit09 = Ura Rokko FF Attack(Knight Medal)
//          bit10 = Ura Rokko FR Attack(Sublimity Cup)
//          bit11 = Omote Rokko Toyota Cup(Top Ranking Medal)
//          bit12 = Omote Rokko Mazda Cup(Caesar Trophy)
//          bit13 = Omote Rokko Small Car Cup(Keraunos Trophy)
//          bit14 = Shiga Kusatsu Nissan Cup(Divus Shield)
//          bit15 = Shiga Kusatsu Mitsubishi Cup(Grypos Trophy)
//          bit16 = Shiga Kusatsu Rival Car Match(Pater Patriae Trophy)
//          bit17 = Nikko Honda Cup(Nobilissimus Shield)
//          bit18 = Nikko Subaru Cup(Asiatikos Trophy)
//          bit19 = Nikko European Cup(Earl Trophy)
//          bit20 = Zao Heavy Engine Cup(Bishop Trophy)
//          bit21 = Zao Middle Engine Cup(Prince Elector Trophy)
//          bit22 = Zao Under Litter Cup(Baronet Shield)
//          bit23 = Aso Lightweight Cup(Duchess Shield)
//          bit24 = Aso Middleweight Cup(Archduke Trophy)
//          bit25 = Aso Heavyweight Cup(Notable Trophy)
//          bit26 = Hokkaido 4wd Attacker(Legendary Shield)
//          bit27 = Hokkaido Heavyweight Cup(Adept Trophy)
//          bit28 = Hokkaido Monster Cup(Prominence Trophy)
//          bit29 = Hokkaido Giant Cup(Conquieror Trophy)
// All of these are Badges.
function advanceRacesWon() => byte(0x768E14)


// $768E18: (bitfield) Master Race  Won
//          
//          bit00 = Hiroshima Straight Match (Rom Level 3)
//          bit01 = Haruna Levin/Trueno Cup(Transmission Level 3)
//          bit02 = Akagi Rotary Match(V-Muffler L Level 3)
//          bit03 = Ura Rokko V-Line Match(Inter Cooler Trm Level 3)
//          bit04 = Omote Rokko Boxer Match (Genki S2000)
//          bit05 = Shiga Kusatsu Special Car Round (mines Skyline)
//          bit06 = Nikko Rival Car Match(HKS Altezza)
//          bit07 = Zao Skyline & Z Stage (HKS Silvia)
//          bit08 = Aso 50/500 Kingdom (MCR GT-R)
//          bit09 = Hokkaido Kaido Championship (FIAT Punto Rally)
MASTER_RACE_WON_MEMORY_LOCATION = 0x768E18 
function masterRaceWon() => byte(MASTER_RACE_WON_MEMORY_LOCATION)

HIROSHIMA_STRAIGHT_MATCH_WON_BIT = 0
HARUNA_LEVIN_TRUENO_CUP_WON_BIT = 1
AKAGI_ROTARY_MATCH_WON_BIT = 2
URA_ROKKA_VLINE_WON_BIT = 3
OMOTE_ROKKO_BOXER_MATCH_WON_BIT = 4
SHIGA_KUSATSU_SPECIAL_CAR_ROUND_WON_BIT = 5
NIKKO_RIVAL_CAR_MATCH_WON_BIT = 6
ZAO_SKYLINE_AND_Z_STAGE_WON_BIT = 7
ASO_50_500_KINGDOM_WON_BIT = 8
HOKKAIDO_KAIDO_CHAMPIONSHIP = 9

function justWonMasterRace(wonBit) => bit(wonBit, MASTER_RACE_WON_MEMORY_LOCATION) == 1 && 
                                      prev(bit(wonBit, MASTER_RACE_WON_MEMORY_LOCATION)) == 0

// $768E1C: (10-bit bitfield) Hakone Gymkhana CA Cleared
//          
//          bit0 = Gymkhana Level 1
//          bit8 (next byte) =  Gymkhana Level 9
//          
//          This is followed by 32-bit Hiroshima, Haruna, Akagi, Ura Rokko, Omote Rokko, Shiga Kusatsu, Nikko, Zao, Aso, Hokkaido.  Then TAs.
HAKONE_GYMKHANA_CA_CLEARED_MEMORY_LOCATION = 0x768E1C
HIROSHIMA_GYMKHANA_CA_CLEARED_MEMORY_LOCATION = 0x768E20
CA_CLEARED_MEMORY_SIZE =  HIROSHIMA_GYMKHANA_CA_CLEARED_MEMORY_LOCATION - HAKONE_GYMKHANA_CA_CLEARED_MEMORY_LOCATION
function hakoneGymkhanaCACleared() => dword(0x768E1C)

function caClearedJustFinished(course_index) => all_of(range(0,9), bit_index => bit(bit_index, HAKONE_GYMKHANA_CA_CLEARED_MEMORY_LOCATION + course_index * CA_CLEARED_MEMORY_SIZE) == 1) &&
                                                any_of(range(0,9), bit_index => prev(bit(bit_index, HAKONE_GYMKHANA_CA_CLEARED_MEMORY_LOCATION + course_index * CA_CLEARED_MEMORY_SIZE)) == 0)

// $768E20: (10-bit bitfield) Hiroshima Gymkhana CA Cleared
//          
//          bit0 = Gymkhana Level 1
//          bit8 (next byte) =  Gymkhana Level 9
function hiroshimaGymkhanaCACleared() => byte(0x768E20)

// $768E48: (10-bit bitfield) Hakone Gymkhana TA Cleared
//          
//          bit0 = Gymkhana Level 1
//          bit8 (next byte) =  Gymkhana Level 9
HAKONE_TA_CLEARED_MEMORY_LOCATION = 0x768E48
HIROSHIMA_TA_ClEARED_MEMORY_LOCATION = 0x768E4C
TA_CLEARED_MEMORY_SIZE = HIROSHIMA_TA_ClEARED_MEMORY_LOCATION - HAKONE_TA_CLEARED_MEMORY_LOCATION
function hakoneGymkhanaTACleared() => byte(HAKONE_TA_CLEARED_MEMORY_LOCATION)

// $768E4C: (10-bit bitfield) Hiroshima Gymkhana TA Cleared
//          
//          bit0 = Gymkhana Level 1
//          bit8 (next byte) =  Gymkhana Level 9
function hiroshimaGymkhanaTACleared() => byte(HIROSHIMA_TA_ClEARED_MEMORY_LOCATION)

function taClearedJustFinished(course_index) => all_of(range(0,9), bit_index => bit(bit_index, HAKONE_TA_CLEARED_MEMORY_LOCATION + course_index * TA_CLEARED_MEMORY_SIZE) == 1) &&
                                                any_of(range(0,9), bit_index => prev(bit(bit_index, HAKONE_TA_CLEARED_MEMORY_LOCATION + course_index * TA_CLEARED_MEMORY_SIZE)) == 0)

// $768E74: (32-bit) C-Level Experience.
//          
//          Note: Level is based on how much experience, so 4 points here = C-Lvl 2)
//          
//          
//          C-Lv1 = 0
//          C-Lv2 = 4
//          C-Lv3 = 16
//          C-Lv4 = 40
//          C-Lv5 = 70
//          C-Lv6 = 100
//          C-Lv7 = 150
//          C-Lv8 = 210
//          C-Lv9 = 290
//          C-Lv10 = 390
//          C-Lv11 = 510
//          C-Lv12 = 640
//          C-Lv13 = 790
//          C-Lv14 = 970
//          C-Lv15 = 1170
//          C-Lv16 = 1390
//          C-Lv17 = 1640
//          C-Lv18 = 1930
//          C-Lv19 = 2280
//          C-Lv20 = 2680
LEVEL_TWO_CLEVEL_EXP = 4
LEVEL_FIVE_CLEVEL_EXP = 70
LEVEL_TEN_CLEVEL_EXP = 390
LEVEL_FIFTEEN_CLEVEL_EXP = 1170
LEVEL_TWENTY_CLEVEL_EXP = 2680
function cLevelExp() => dword(0x768E74)

function justPassedCExperience(targetExperience) => cLevelExp() >= targetExperience && 
                                                    prev(cLevelExp()) < targetExperience

// $77CEB2: (8-bit) Record Tour Stage
//          
//          0x00 = Stage 1
function recordTourStage() => byte(0x77CEB2)

// $77CEB4: (8-bit) Record Tour Group
//          
//          0x00 = Group R
//          0x01 = Group J
//          0x02 = Group A
//          0x03 = Group B
GROUP_R_VALUE = 0
GROUP_J_VALUE = 1
GROUP_A_VALUE = 2
GROUP_B_VALUE = 3

groupLookup = {
    GROUP_R_VALUE: "Group R",
    GROUP_J_VALUE: "Group J",
    GROUP_A_VALUE: "Group A",
    GROUP_B_VALUE: "Group B"
}

function recordTourGroup() => byte(0x77CEB4)

// $77DBE4: (32-bit) Play time
// this is in frames.
function playTime() => dword(0x77DBE4)

// $77DC34: (8-bit) Map Location
//          
//          0x00 = Haruna
//          0x01 = Hakone
//          0x02 = Nikko
//          0x03 = Omote Rokko
//          0x04 = Akagi
//          0x05 = Aso
//          0x06 = Zao
//          0x07 = Oval Course
//          0x08 = Gymkhana
//          0x09 = Hiroshima
//          0x0a = Ura Rokka
//          0x0b = Hokkaido
//          0x0c = Shiga Kusatsu
//          0x0d = Usuitrouge
//          0x0e = Myougisan
//          0x0f = Happogahara
//          0x10 = Yokohama
//          0x11 = Ohtarumi
//          0x12 = Yukinoohtani
//          0x13 = Kirigamine
//          0x14 = Hakone Nanamagari
//          
//          This is not the normal order of the levels.
// Use Course Index
function inGameMapLocation() => byte(0x77DC34)

// $77DC35: (8-bit) Climb/Downhill
//          
//          0x00 = Downhill
//          0x01 = Climb
function inGameClimbDownhill() => byte(0x77DC35)
// DOWNHILL_VALUE =0
// CLIMB_VALUE = 1

// $77DC36: (8-bit) Weather
//          
//          0x00 = Sunny
//          0x01 = Rain
//          0x02 = Snow
//          0x03 = Cloudy
//          0x04 = Storm
//          0x05 = Snowstorm
function inGameWeather() => byte(0x77DC36)

// $77DC37: (8-bit) Time of Day in Game
//          
//          0x00 = Day Time
//          0x01 = Night Time
function inGameTimeOfDay() => byte(0x77DC37)

// $77DC38: (16-bit) Race Starting Location
//          
//          0x00 - 0x09 based on location
function inGameStartingLocation() => word(0x77DC38)

// $77DC3A: (8-bit) End location of Race
//          
//          0x00-0x09
//          
//          Control Value (for Pratice)
function inGameEndLocation() => byte(0x77DC3A)

// $77DC58: (16-bit) Car being driven
//          
//          Controls what car is loaded in.
//          
//          0x00 = ASL Garaiya(Garaiya)
//          0x01 = Daihatsu Midget II R type(K100P)
//          0x02 = Daihatsu Mira TR-XX(L502S)
//          0x03 = Daihatsu Mira AVY RS(L260S)
//          0x04 = Daihatsu Copen(L880K)
//          0x05 = Daihatsu Storia X-4(M112S)
//          0x06 = Honda Beat(PP1)
//          0x07 = Honda City Turbo II
//          0x08 = Honda Fit(GD1)
//          0x09 = Honda Civic SiR II(EG6)
//          0x0a = Honda Civic Type R(EK9)
//          0x0b = Honda Civic Type R(EP3)
//          0x0c = Honda CR-X SiR(EF8)
//          0x0d = Honda Prelude Si VTEC(BB4)
//          0x0e = Honda Prelude Type S(BB6)
//          0x0f = Honda Integra Si VTEC(DB8)
//          0x10 = Honda Integra Type R(DC2)
//          0x11 = Honda Integra Type R(DC5)
//          0x12 = Honda Accord Euro R(CL1)
//          0x13 = Honda Accord Euro R(CL7)
//          0x14 = Honda S2000 2.0 Type V(AP1)
//          0x15 = Honda NSX Type R(NA1)
//          0x16 = Honda NSX Type S(NA2)
//          0x17 = Mazda AZ-1(PG6SA)
//          0x18 = Mazda Mazda2 (DY5W)
//          0x19 = Mazda Mazda3 (BK3P)
//          0x1a = Mazda Mazda323(BG8Z)
//          0x1b = Mazda MX-5 Miata (NA8C)
//          0x1c = Mazda MX-5 Miata (NB8C)
//          0x1d = Mazda MX-5 Miata (NB8C)
//          0x1e = Mazda Mazda6 (GG3S)
//          0x1f = Mazda RX-7 (SA22)
//          0x20 = Mazda RX-7 (FC3S)
//          0x21 = Mazda RX-7 (FC3S)
//          0x22 = Mazda RX-7 (FD3S)
//          0x23 = Mazda RX-7 (FD3S)
//          0x24 = Mazda RX-8 (SE3P)
//          0x25 = Mitsubishi Colt Sport X Version (Z28A)
//          0x26 = Mitsubishi Mirage Cyborg R (CA4A)
//          0x27 = Mitsubishi Mirage Cyborg ZR (CJ4A)
//          0x28 = Mitsubishi Mirage Asti RX (CJ4A)
//          0x29 = Mitsubishi FTO GP Ver.R (DE3A)
//          0x2a = Mitsubishi Galant VR-4 (EC5A)
//          0x2b = Mitsubishi Galant VR-4 (E39A)
//          0x2c = Mitsubishi Lancer Evolution (CD9A)
//          0x2d = Mitsubishi Lancer Evolution 2 (CE9A)
//          0x2e = Mitsubishi Lancer Evolution 3 (CE9A)
//          0x2f = Mitsubishi Lancer Evolution 4 (CN9A)
//          0x30 = Mitsubishi Lancer Evolution 5 (CP9A)
//          0x31 = Mitsubishi Lancer Evolution 6 (CP9A)
//          0x32 = Mitsubishi Lancer Evolution 7 (CT9A)
//          0x33 = Mitsubishi Lancer Evolution 8 (CT9A)
//          0x34 = Mitsubishi Lancer Evolution 8 MR (CT9A)
//          0x35 = Mitsubishi Eclipse GSR-4 (D32A)
//          0x36 = Mitsubishi Starion GSR-VR (A187A)
//          0x37 = Mitsubishi GTO Twin Turbo MR (Z15A)
//          0x38 = Nissan March R (EK10)
//          0x39 = Nissan March G# (HK11)
//          0x3a = Nissan March 12SR (AK12)
//          0x3b = Nissan Bluebird SSS-R (RNU12)
//          0x3c = Nissan Pulsar GTI-R (RNN14)
//          0x3d = Nissan Pulsar VZ-R N1 (JN15)
//          0x3e = Nissan Sunny Truck (B122)
//          0x3f = Nissan RZ-1 Twincam Type-B (EB12)
//          0x40 = Nissan Gazelle Turbo RS-X (S12)
//          0x41 = Nissan 180SX Type II (RS13)
//          0x42 = Nissan 180SX Type X (RPS13)
//          0x43 = Nissan 180SX Type X (RPS13)
//          0x44 = Nissan Silvia Turbo R-X.G (S12)
//          0x45 = Nissan Silvia K's (S13)
//          0x46 = Nissan Silvia Club K's (PS13)
//          0x47 = Nissan Silvia K's (S14)
//          0x48 = Nissan Silvia K's (CS14)
//          0x49 = Nissan Silvia Spec-R (S15)
//          0x4a = Nissan Sileighty
//          0x4b = Nissan Onevia
//          0x4c = Nissan Primera 2.0Te (HP10)
//          0x4d = Nissan Primera 20V (HP12)
//          0x4e = Nissan Laurel Club S (EC33)
//          0x4f = Nissan Laurel 25 Club S (GC34)
//          0x50 = Nissan Laurel 25 Club S (GC35)
//          0x51 = Nissan Cefiro Cruising (A31)
//          0x52 = Nissan Skyline Turbo RS-X (R30)
//          0x53 = Nissan Skyline GTS Turbo (R31)
//          0x54 = Nissan Skyline GTS-R (R31)
//          0x55 = Nissan Skyline GTS-t (HCR32)
//          0x56 = Nissan Skyline GT-R VspecII (BNR32)
//          0x57 = Nissan Skyline GTS25t (ECR33)
//          0x58 = Nissan Skyline GTS25t (ECR33)
//          0x59 = Nissan Skyline GT-R Vspec (BCNR33)
//          0x5a = Nissan Skyline 25GT Turbo (ER34)
//          0x5b = Nissan Skyline GT-R VspecII (BNR34)
//          0x5c = Nissan Skyline 350GT (PV35)
//          0x5d = Nissan Skyline Coupe 350GT (CPV35)
//          0x5e = Nissan Stagea 260RS (WGNC34)
//          0x5f = Nissan Stagea 350RX Four (NM35)
//          0x60 = Nissan Fairlady Z 240Z (HS30S)
//          0x61 = Nissan Fairlady Z 280Z-T (S130)
//          0x62 = Nissan Fairlady Z 300ZX (HZ31)
//          0x63 = Nissan Fairlady Z Version S (CZ32)
//          0x64 = Nissan Fairlady Z Version ST (Z33)
//          0x65 = Subaru Vivio RX-R (KK4)
//          0x66 = Subaru R2 S (RC2)
//          0x67 = Subaru Impreza WRX STi (GC8)
//          0x68 = Subaru Impreza WRX STi Ver2 (GC8)
//          0x69 = Subaru Impreza WRX STi Ver3 (GC8)
//          0x6a = Subaru Impreza WRX STi Ver4 (GC8)
//          0x6b = Subaru Impreza WRX STi Ver5 (GF-GC8)
//          0x6c = Subaru Impreza WRX STi Ver6 (GF-GC8)
//          0x6d = Subaru Impreza 22B STi (GF-GC8)
//          0x6e = Subaru Impreza WRX STi (GDB)
//          0x6f = Subaru Impreza STi (GDB)
//          0x70 = Subaru Impreza Wagon (GF8)
//          0x71 = Subaru Impreza Wagon (GH-GGB)
//          0x72 = Subaru Impreza Wagon (TA-GGA)
//          0x73 = Subaru Forester S/ tb STi2 (SF5)
//          0x74 = Subaru Forester STi (SG9)
//          0x75 = Subaru Legacy Touring Wagon (BF5)
//          0x76 = Subaru Legacy RS (BC5)
//          0x77 = Subaru Legacy Touring Wagon (BG5)
//          0x78 = Subaru Legacy RS (BD5)
//          0x79 = Subaru Legacy Touring Wagon (BH5)
//          0x7a = Subaru Legacy B4 RSK (BE5)
//          0x7b = Subaru Legacy Blitzen (BE5)
//          0x7c = Subaru Legacy S401 (BE5)
//          0x7d = Subaru Legacy B4 2.0GT specB (BL5)
//          0x7e = Subaru Legacy Wagon (BP5)
//          0x7f = Subaru Alcyone (AX9)
//          0x80 = Subaru Alcyone SVX (CXD)
//          0x81 = Suzuki Carry 660 Turbo (DA52T)
//          0x82 = Suzuki Alto Works RS/R (CP21S)
//          0x83 = Suzuki Alto Works RS-Z VVT (HA22S)
//          0x84 = Suzuki Kei Sport R (HN22S)
//          0x85 = Suzuki Swift Sport (HT51S)
//          0x86 = Suzuki Cappuccino (EA21R)
//          0x87 = Toyota Ist 1.5S (NCP61)
//          0x88 = Toyota Starlet Turbo S (EP71)
//          0x89 = Toyota Starlet GT (EP82)
//          0x8a = Toyota Starlet GT (EP82)
//          0x8b = Toyota Starlet Glanza V (EP91)
//          0x8c = Toyota Vitz RS (NCP13)
//          0x8d = Toyota Levin 1500SR (AE85)
//          0x8e = Toyota Trueno 1500SR (AE85)
//          0x8f = Toyota Levin GT-Apex (AE86)
//          0x90 = Toyota Levin GT-Apex (AE86)
//          0x91 = Toyota Levin GT-Apex (AE86)
//          0x92 = Toyota Levin GT-Apex (AE86)
//          0x93 = Toyota Trueno GT-Apex (AE86)
//          0x94 = Toyota Trueno GT-Apex (AE86)
//          0x95 = Toyota Trueno GT-Apex (AE86)
//          0x96 = Toyota Trueno GT-Apex (AE86)
//          0x97 = Toyota Levin 1.6 GT-Z (AE92)
//          0x98 = Toyota Trueno 1.6 GT-Z (AE92)
//          0x99 = Toyota Levin BZ-R (AE111)
//          0x9a = Toyota Trueno BZ-R (AE111)
//          0x9b = Toyota Celica GT-Four (ST165)
//          0x9c = Toyota Celica GT-Four (ST185)
//          0x9d = Toyota Celica GT-Four (ST205)
//          0x9e = Toyota Celica SS-II (ZZT231)
//          0x9f = Toyota Celica XX 2800GT (MA61)
//          0xa0 = Toyota Caldina GT-Four (ST246W)
//          0xa1 = Toyota MR2 G-Super Charger (AW11)
//          0xa2 = Toyota MR2 GT (SW20)
//          0xa3 = Toyota MR-S 1.8 V Edition (ZZW30)
//          0xa4 = Toyota MR-S VM180 Zagato (ZZW30)
//          0xa5 = Toyota Altezza RS200 (SXE10)
//          0xa6 = Toyota Mark II Tourer V (JZX90)
//          0xa7 = Toyota Mark II Tourer V (JZX100)
//          0xa8 = Toyota Mark II IR-V (JZX110)
//          0xa9 = Toyota Chaser Tourer V (JZX100)
//          0xaa = Toyota Verossa 2.5 VR25 (JZX110)
//          0xab = Toyota Soarer 3.0GT Limited (MZ20)
//          0xac = Toyota Supra 2.5GT (JZA70)
//          0xad = Toyota Supra RZ (JZA80)
//          0xae = Volkswagen Golf R32 (1JBFHF)
//          0xaf = Volkswagen New Beetle RSi (9CAXJ)
//          0xb0 = Audi S3 (8LBAMF)
//          0xb1 = Audi RS4 (8DAZBRF)
//          0xb2 = Audi RS6 (4BBCYF)
//          0xb3 = Audi TT Coupe 3.2 Quattro (8NBHEF)
//          0xb4 = Renault 5 Turbo II
//          0xb5 = Renault Clio V6 24V
//          0xb6 = Peugeot 205 Turbo 16
//          0xb7 = Fiat Coupe Turbo Plus (175A3)
//          0xb8 = Fiat Fiat Abarth 1000 TCR
//          0xb9 = Gemballa Turbo R-GT 320
//          0xba = Opel Speedster (E00Z22)
//          0xbb = Alfa Romeo 155 Q4 (167A2E)
//          0xbc = Alfa Romeo 156 GTA (932AXB)
//          0xbd = Alfa Romeo Crosswagon
//          0xbe = Special Ridox Supra (JZA80)
//          0xbf = Special Nob Silvia (S15)
//          0xc0 = Special Amemiya RX-7 (FD3S)
//          0xc1 = Special MCR GT-R (BNR34)
//          0xc2 = Special Fujitsubo Lancer (CT9A)
//          0xc3 = Special Fujitsubo Impreza (GDB)
//          0xc4 = Special Mines Skyline (BNR34)
//          0xc5 = Special 5Zigen Integra (DC5)
//          0xc6 = Special Genki S2000 (AP1)
//          0xc7 = Special HKS Silvia (S15)
//          0xc8 = Special HKS Altezza (SXE10)
//          0xc9 = Special Nomura Skyline (ER34)
//          0xca = Special Yoshioka Levin (AE86)
//          0xcb = Special Utsumi RX-7 (FD3S)
//          0xcc = Special Hayashida Silvia (S15)
//          0xcd = Special Izumida Fairlady Z (Z33)
//          0xce = Special Lancer TGM (CT9A)
//          0xcf = Special Lancer Evolution 9 SP (CT9A)
//          0xd0 = Special Citroen Xsara
//          0xd1 = Special Peugeot 206
//          0xd2 = Special Lancer Evo 8 SP (CT9A)
//          0xd3 = Special Starion 4WD
//          0xd4 = Special Impreza SP Version
//          0xd5 = Special Punto Rally
//          0xd6 = Special Opel Corsa Super 1600
//          0xd7 = Special Clio 1600
//          0xd8 = Special Ignis 1600
//          0xd9 = Special 190E Evolution II
//          0xda = Special 190E Evolution I
//          0xdb = Special RIV000
//          0xdc = Special RIV014
//          0xdd = Special RIV049
//          0xde = Special RIV239
//          0xdf = Special RIV320
//          0xe0 = Special RIV321
//          0xe1 = Special RIV012
//          0xe2 = Special RIV031
//          0xe3 = Special RIV066
//          0xe4 = Special RIV090
//          0xe5 = Special RIV115
//          0xe6 = Special RIV163
//          0xe7 = Special RIV193
//          0xe8 = Special RIV223
//          0xe9 = Special RIV265
//          0xea = Special RIV290
//          0xeb = Special RIV324
//          0xec = Special RIV070
//          0xed = Special RIV098
//          0xee = Special RIV123
//          0xef = Special RIV134
//          0xf0 = Special RIV173
//          0xf1 = Special RIV203
//          0xf2 = Special RIV230
//          0xf3 = Special RIV248
//          0xf4 = Special RIV273
//          0xf5 = Special RIV298
//          0xf6 = Special RIV340
//          0xf7 = Special RIV322
//          0xf8 = Special RIV071
//          0xf9 = Special RIV099
//          0xfa = Special RIV124
//          0xfb = Special RIV144
//          0xfc = Special RIV174
//          0xfd = Special RIV204
//          0xfe = Special RIV231
//          0xff = Special RIV249
//          0x100 = Special RIV274
//          0x101 = Special RIV299
//          0x102 = Special RIV323
//          0x103 = Special RIV332
//          0x104 = Special RIV349
//          0x105 = Special RIV350
//          0x106 = Special RIV351
//          0x107 = Special RIV352
function inGameCarDriven() => word(0x77DC58)

// $77EAF9: (8-bit) Win Status
//          
//          0x00 = In Race
//          0x01 = Won Race
//          0x02 = Lost Race
RACE_IN_PROGRESS_VALUE = 0
WON_RACE_VALUE = 1
LOST_RACE_VALUE = 2
function winStatus() => byte(0x77EAF9)

function justWonRace() => winStatus() == WON_RACE_VALUE &&
                          prev(winStatus()) == RACE_IN_PROGRESS_VALUE

// $77EB20: (8-bit) Display name of Opponent
//          
//          Control.  Also Who gets recorded as a win.
//          
//          Note: Also who gets removed from the parking lot as a racer after the battle.
//          
//          0x0 = Ground Zero (Ground Zero)
//          0x1 = Lil Giant
//          0x2 = Disciple 86
//          0x3 = Hi-Rev
//          0x4 = Drifty
//          0x5 = Melon Gripper (Team Leader: Hakone Stalkers)
//          0x6 = Hi-Fi
//          0x7 = Tofu Maniac
//          0x8 = Eternal Splash (Hi-Gambler)
//          0x9 = Special Scent (Supporter)
//          0xa = Mr. Switchback (Supporter)
//          0xb = Kaniyana Blockbuster (Supporter)
//          0xc = Mr. Mitsu (Slasher, Stage 1)
//          0xd = Night Flight (Medalist)
//          0xe = FR Benchmark (Hi Gambler)
//          0xf = Primal Hill (Trickster)
//          0x10 = Lightning Shift (Trickster)
//          0x11 = Keihin Shadow
//          0x12 = Miracle Runner
//          0x13 = Hakone King (Team Leader: h-dd)
//          0x14 = Terror Sign
//          0x15 = Kojiro Itsukujina
//          0x16 = River Ruler
//          0x17 = Gold Press
//          0x18 = Spring Storm
//          0x19 = Maple Red
//          0x1a = Vorpal Weapon (Team Leader: Street Snap)
//          0x1b = Battleship Kure (Supporter)
//          0x1c = Gogo Noroyana
//          0x1d = Setouchi Queens (Team Leader: Wiz Raspberry)
//          0x1e = Whirlpool (Supporter)
//          0x1f = Dominator (Slasher)
//          0x20 = Spring Wind (Supporter)
//          0x21 = Big Blue (Medalist)
//          0x22 = Hyper Crank (Hi Gambler)
//          0x23 = Black Onyx (Trickster)
//          0x24 = Lash Messiah (Hi Gambler)
//          0x25 = Mist Shower (Trickster)
//          0x26 = Sakura Sprinter (Trickster)
//          0x27 = Mt. Noro Emperess (Trickster)
//          0x28 = Yuushu Flirt
//          0x29 = Climb Hunter (Hi Gambler)
//          0x2a = Jet Set
//          0x2b = Rocket Dash (Team Leader: Skyliner R)
//          0x2c = Street Honage (Hi Gambler)
//          0x2d = Under the Stars (Supporter)
//          0x2e = Ridge Pirate (Supporter)
//          0x2f = Glittering Gaze (Medalist)
//          0x30 = Street Tester (Trickster)
//          0x31 = Metro Roller (Trickster)
//          0x32 = Valiant Inokuchi
//          0x33 = Autumn Lord
//          0x34 = Tail Cracker
//          0x35 = Ikaho Gatekeeper
//          0x36 = Death Sentence
//          0x37 = Groove 9
//          0x38 = Turbolicious (Team Leader: Spiral Sliders)
//          0x39 = Rage
//          0x3a = Death
//          0x3b = Destruction (Team Leader: Haruna Hillclimb Club)
//          0x3c = Aerial R
//          0x3d = Mad Dog
//          0x3e = Local Hero
//          0x3f = Haruna Moon (Supporter)
//          0x40 = Saudade (Supporter)
//          0x41 = Last Supper (Supporter)
//          0x42 = Guardian (Slasher)
//          0x43 = PT Sprint (Medalist)
//          0x44 = Natural Corner (Hi Gambler)
//          0x45 = Drift Wood (Trickster)
//          0x46 = *1st Kingdom (Kingdom Twelve)
//          0x47 = Backstab (Thirteen Devils)
//          0x48 = Fake
//          0x49 = Rev SR
//          0x4a = Total FR (Team Leader: Haruna Starlights)
//          0x4b = Counter-rev
//          0x4c = Highway Lyrics
//          0x4d = Night Groove
//          0x4e = Night Pressure
//          0x4f = Night Rise (Team Leader: Ashanti Rise)
//          0x50 = Drift Source
//          0x51 = Lil Meteor
//          0x52 = Norma FR Style
//          0x53 = Konica FR Style
//          0x54 = Osaka FR Style (Team Leader: Nissan FR Style)
//          0x55 = Minor Hatch
//          0x56 = German Trend
//          0x57 = Pretty Boy (Supporter)
//          0x58 = Hog Muffler (Supporter)
//          0x59 = Silver Rose (Supporter)
//          0x5a = Eternal Wanderer (Slasher)
//          0x5b = Speed Raid (Trickster)
//          0x5c = HC Top
//          0x5d = D. Slick (Team Leader: Akagi Big Blue)
//          0x5e = Cyclone (Trickster)
//          0x5f = Redeye (Trickster)
//          0x60 = Northern Lights (Trickster)
//          0x61 = Passing Night (Trickster)
//          0x62 = Heaven's Sword (Kingdom Twelve)
//          0x63 = Bloodhound (Thirteen Devils)
//          0x64 = True Pleiades
//          0x65 = Hikam Strawberry
//          0x66 = Sugar wind
//          0x67 = Blue Revolution
//          0x68 = Hake Creek
//          0x69 = Shifty One
//          0x6a = Hillclimb Guy #2
//          0x6b = Hillclimb Guy #3
//          0x6c = Hillclimb Guy #4
//          0x6d = Hillclimb Guy #1 (Team Leader: Hillclimb Guys)
//          0x6e = Wild Range
//          0x6f = Hell's Fury (Hi Gambler)
//          0x70 = Master Pete (Supporter)
//          0x71 = Ever Clip (Supporter)
//          0x72 = Lyrical Style (Supporter)
//          0x73 = Alchemist (Slasher)
//          0x74 = Enchantress (Medalist)
//          0x75 = Wandering Destiny (Hi Gambler)
//          0x76 = Dark Fear (Trickster)
//          0x77 = Rose Rain (Trickster)
//          0x78 = Brave Silence (Trickster)
//          0x79 = Hyper Beat (Trickster)
//          0x7a = Nuts & Bolts (Trickster)
//          0x7b = Gladiator (Kingdom Twelve)
//          0x7c = Gloomy Angel (Thirteen Devils)
//          0x7d = Immortal Reaper
//          0x7e = R Pride
//          0x7f = Brake Fest (Hi Gambler)
//          0x80 = Night Striker (Hi Gambler)
//          0x81 = Tiny Kim (Medalist)
//          0x82 = FR Search
//          0x83 = Mohair Legend R (Team Leader: Adult Night)
//          0x84 = Dynamite Fang (Supporter)
//          0x85 = Midnight Prowler (Supporter)
//          0x86 = Street Fossil (Kingdom Twelve)
//          0x87 = Sign Love
//          0x88 = Gumma Giant
//          0x89 = Performance Shifter (Hi Gambler)
//          0x8a = Skill Factory (Hi Gambler)
//          0x8b = F2.8 (Medalist)
//          0x8c = Kayo Spark (Trickster)
//          0x8d = Skirt Checker
//          0x8e = Full-on C121 (Team Leader: Love Boat)
//          0x8f = Bottom Feeder (Supporter)
//          0x90 = Heartbreaker (Thirteen Devils)
//          0x91 = Performance Drifter
//          0x92 = Indy A
//          0x93 = Night Requiem
//          0x94 = Bee Line
//          0x95 = Love Match
//          0x96 = Bloody Saturn
//          0x97 = MY
//          0x98 = Gulf Omen (Team Leader: 60 Seconds)
//          0x99 = Customer Satisfaction
//          0x9a = Insurgency
//          0x9b = Downhill Guy #2
//          0x9c = Downhill Guy #3
//          0x9d = Downhill Guy #4
//          0x9e = Downhill Guy #1 (Team Leader: Downhill Guys)
//          0x9f = Winding Core (Hi Gambler)
//          0xa0 = Impart (Supporter)
//          0xa1 = Racer's Sonata (Supporter)
//          0xa2 = Plasma Baby (Supporter)
//          0xa3 = Last Leg (Slasher)
//          0xa4 = Alter (Trickster)
//          0xa5 = X-Line (Trickster)
//          0xa6 = SS Middle Aged (Hi Gambler)
//          0xa7 = Light Schneider (Trickster)
//          0xa8 = Book of Rhymes (Trickster)
//          0xa9 = Mortal Drift (Trickster)
//          0xaa = Drift Core (Trickster)
//          0xab = Flowerbed
//          0xac = Spit Shine (Team Leader: Westside)
//          0xad = Act of War (Kingdom Twelve)
//          0xae = Dying Star (Thirteen Devils)
//          0xaf = Gearhead
//          0xb0 = 200-Miles
//          0xb1 = Shrine Dynamo
//          0xb2 = Deputy Shiga (Team Leader: LaVern)
//          0xb3 = Drift Survival
//          0xb4 = Ceasefire
//          0xb5 = Ca Rush (Hi Gambler)
//          0xb6 = Street Review
//          0xb7 = Shining Tours
//          0xb8 = Love Christina
//          0xb9 = Street Rise
//          0xba = Zenith Kukupa
//          0xbb = Solar Barrage
//          0xbc = Future Shock (Team Leader: Extra Large)
//          0xbd = Drift Rail
//          0xbe = Keats Love (Supporter)
//          0xbf = Drift Spot (Supporter)
//          0xc0 = Skywalker (Supporter)
//          0xc1 = New Moon (Slasher)
//          0xc2 = Dirty Version (Medalist)
//          0xc3 = Spooks (Trickster)
//          0xc4 = Razor Edge (Hi Gambler)
//          0xc5 = Son of Pain (Hi Gambler)
//          0xc6 = Holy Skills (Trickster)
//          0xc7 = Pure Power (Trickster)
//          0xc8 = Bloodshot
//          0xc9 = Sane Asylum
//          0xca = Dope Color (Team Leader: Street Dreams)
//          0xcb = King's Chariot (Kingdom Twelve)
//          0xcc = Midnight Rose (Thirteen Devils)
//          0xcd = Chiba Hawaiian
//          0xce = Meiji Force SR
//          0xcf = Vintage Style
//          0xd0 = Bosworth Master (Team Leader: God's Favorite)
//          0xd1 = Nikon Premium
//          0xd2 = Workout
//          0xd3 = Napoleon Miyazawa
//          0xd4 = Club Koishikawa
//          0xd5 = Akira Nise (Team Leader: True Shutoko Unit 1)
//          0xd6 = Early India
//          0xd7 = Quick Mouse (Hi Gambler)
//          0xd8 = Wagon Counter
//          0xd9 = YM Spy R
//          0xda = Sakurai Champ
//          0xdb = Death Metal Greed (Team Leader: True Shutoko Unit 2)
//          0xdc = Magnitude 7 (Supporter)
//          0xdd = Stormy Boyz (Supporter)
//          0xde = Pistol Rhyme (Supporter)
//          0xdf = True Champion (Slasher)
//          0xe0 = Tribal (Trickster)
//          0xe1 = Lady Elliot (Trickster)
//          0xe2 = Death Ruse (Hi Gambler)
//          0xe3 = Sacred Flurry (Hi Gambler)
//          0xe4 = Benzo (Trickster)
//          0xe5 = Drop Knowledge (Trickster)
//          0xe6 = Executioner on Wheels (Kingdom Twelve)
//          0xe7 = Tailgunner (Thirteen Devils)
//          0xe8 = Inline Fever (Trickster)
//          0xe9 = King Works
//          0xea = 4WD Chief (Team Leader: The Presidents)
//          0xeb = MR (Trickster)
//          0xec = Mystery Princess
//          0xed = True Warrior
//          0xee = Gale Moment (Team Leader: Bay Racing)
//          0xef = Legendary Schneider (Trickster)
//          0xf0 = Chougamori Breeze
//          0xf1 = Magical Karma
//          0xf2 = Yaita Slicer (Hi Gambler)
//          0xf3 = King Steer
//          0xf4 = King Shift
//          0xf5 = King Foot (Team Leader: Extreme Seminar)
//          0xf6 = Tochigi Slicer (Medalist)
//          0xf7 = Animal Scent (Supporter)
//          0xf8 = Muhai Emblem (Kingdom Twelve)
//          0xf9 = Shadow Eyes (Thirteen Devils)
//          0xfa = Nana Beans
//          0xfb = Tendo Storm
//          0xfc = Everdrift
//          0xfd = Storm Surge
//          0xfe = Double AI (Team Leader: Black Eyed Beans)
//          0xff = Zoom Zoom Zoom
//          0x100 = Platinum Split
//          0x101 = Katta D1
//          0x102 = Whiteout
//          0x103 = Rusty Forest
//          0x104 = Zao Tempest (Team Leader: Blue Avalanche)
//          0x105 = King Kajou (Hi Gambler)
//          0x106 = Frost Wave (Supporter)
//          0x107 = Snowman (Supporter)
//          0x108 = Divine Gorge (Supporter)
//          0x109 = Yeti Fang (Absolute Emperor)
//          0x10a = Downhill Dinosaur (Trickster)
//          0x10b = Wailing Pheonix (Trickster)
//          0x10c = Solemn Tidings (Hi Gambler)
//          0x10d = Snowflake Road (Trickster)
//          0x10e = Blue 'n Yellow 1
//          0x10f = Blue 'n Yellow 2
//          0x110 = Blue 'n Yellow 3 (Team Leader: Snow Inspectors)
//          0x111 = Lionel (Kingdom Twelve)
//          0x112 = Grief Plate (Thirteen Devils)
//          0x113 = 99VA
//          0x114 = Drift Slayer
//          0x115 = Moon Splash
//          0x116 = Foot Beat (Team Leader: Breakform)
//          0x117 = Scared Tree
//          0x118 = Distortion (Hi Gambler)
//          0x119 = Ragga China
//          0x11a = Lanevoism
//          0x11b = Jizo's Fury (Team Leader: Wicked Skillz)
//          0x11c = Right-Brained
//          0x11d = Mighty Crown (Supporter)
//          0x11e = Camellia (Supporter)
//          0x11f = Taylor Ito
//          0x120 = Dabada Kafuri
//          0x121 = Club Bastard (Team Leader: Speed Usher)
//          0x122 = Reign Supreme (Miracles Summit)
//          0x123 = Alt Bayern (Trickster)
//          0x124 = Live Counter (Medalist)
//          0x125 = Light Banshee (Hi Gambler)
//          0x126 = Devil's Advocate (Trickster)
//          0x127 = Limp Grip (Trickster)
//          0x128 = Rotary Commander (Trickster)
//          0x129 = Dark Paladin (Trickster)
//          0x12a = Timber Slash (Kingdom Twelve)
//          0x12b = Dream Fiend (Thirteen Devils)
//          0x12c = Taushubetsu Star
//          0x12d = Line Hysterics
//          0x12e = Limestone Drip
//          0x12f = Plasma Ratio
//          0x130 = Onnetou Glare
//          0x131 = El Matador
//          0x132 = Scuderia Spectre
//          0x133 = McCrash (Team Leader: Team WR)
//          0x134 = Rage of Nauman (Hi Gambler)
//          0x135 = Tailslide Dash
//          0x136 = Cutoff Demon
//          0x137 = Team Steward (Team Leader: Pleiades Spirits)
//          0x138 = Greatest Line (Hi Gambler)
//          0x139 = Snowlight
//          0x13a = Pride of Nupuka
//          0x13b = Killer Kickback (Supporter)
//          0x13c = Mountain Pride (Supporter)
//          0x13d = Aurora Stream (Supporter)
//          0x13e = LAT43N
//          0x13f = Roy's Lover
//          0x140 = God Shift Bunta (Trickster)
//          0x141 = High Empress (Trickster)
//          0x142 = Kaido President (Kingdom Twelve)
//          0x143 = Emperor Speed (Thirteen Devils)
//          0x144 = Blackout (Emotional King)
//          0x145 = Shirakaba White
//          0x146 = Shall We Drift
//          0x147 = Crystal Wonder
//          0x148 = Venus Kirigamine (Team Leader: Heavy Nation)
//          0x149 = Sawa Ghost (Hi Gambler)
//          0x14a = Peacful Marsh (Trickster)
//          0x14b = Iceman (Trickster)
//          0x14c = Ootsuka Demon (Thirteen Devils)
//          0x14d = Alpen Hill
//          0x14e = Killer Bee (Supporter)
//          0x14f = I Scream Truck (Supporter)
//          0x150 = Wall of Murodou
//          0x151 = Tateyama DH1
//          0x152 = Kurobe Think Tank (Team Leader: Quarterbank)
//          0x153 = Big Catch (Hi Gambler)
//          0x154 = Forbidden Spear (Kingdom Twelve)
//          0x155 = Sagami Express
//          0x156 = Takosan Tengu
//          0x157 = Hammer of the Saint
//          0x158 = Yokuouin Keyman (Team Leader: Fresh Air)
//          0x159 = Gang S (Hi Gambler)
//          0x15a = Street Carriage (Trickster)
//          0x15b = Tamba Track Line
//          0x15c = GT (Trickster)
//          0x15d = Sitar Kaneyama (Thirteen Devils)
//          0x15e = Nightmare
//          0x15f = Winter Tornado
//          0x160 = Haunted Shore (Team Leader: Sodom's Revival)
//          0x161 = Blacky
//          0x162 = Dream
//          0x163 = Funin
//          0x164 = Chief Musclehead
//          
//          0x020f Twenty Master
function displayNameOfOpponent() => byte(0x77EB20)

// $77EB70: (8-bit) Gymkhana level in Game
//          
//          0x00 = Level 1
//          0x09 = Level 10
function gymkhanaLevelInGame() => byte(0x77EB70)

FIRST_GYMKHANA_COURSE = 0
LAST_GYMKHANA_COURSE = 9

// $77EBBC: (8-bit) Car Type being Driven
//          
//          0x00 = Normal
//          0x01 = Player owned car
//          0x02 = Custom Car (Record
NORMAL_CAR_VALUE = 0
function carTypeBeingDriven() => byte(0x77EBBC)
function isNormalCar() => carTypeBeingDriven() == NORMAL_CAR_VALUE

// $7C22F4: (8-bit) Alternate Driving Indicator
//          
//          0x00 = Currently on Front End
//          0x01 = Currently Dirving
function altDrivingIndicator() => byte(0x7C22F4)

// $7C26E1: (8-bit) Driving Detection Control.
//          
//          If this is not 0x00 Driving has issues.
//          
//          0x00 = Driving
//          0x02 = Front End (not necessarily Reliable
function altSecondDrivingIndicator() => byte(0x7C26E1)

// $AE3033: (8-bit) Time Trial Result for courses.
//          
//          0x00 = Racing
//          0x01 = Finished
//          0x02 = Retired
function timeTrialResultForCourses() => byte(0xAE3033)

// $B32EA1: (8-bit) Time Trial Alt Result for courses.
//          
//          0x00 = Racing
//          0x02 = Finished
//          0x0c = Retired
function timeTrialResultForCourses2() => byte(0xB32EA1)

// $B35FF4: (8-bit) Time Trial Alt Result for courses.
//          
//          0x00 = Finished
//          0x01 = Racing
//          0x06 = Retired
function timeTrialResultforCourse3() => byte(0xB35FF4)

// $B85DE0: (Float) Representations of Speed in KPH
//          
//          Appears to be a representation of the Speed in KPH (the next Float is around the same).
//          
//          Correct MPH appears to be at 0x00b927a8
function speedRepresentationInGameKPH() => float(0xB85DE0)

// $B8879C: (32-bit) Time in Frames for TA race
//          
//          Control Value.
//          
//          In time attack it's the Base time (Penalty must be added)
function timeInFramesTARace() => dword(0xB8879C)


// $B887CC: (32-bit) Lost Time in Time Attack.
//          
//          This is a bit strange, this is the Minutes, but it's done in multiples of 2 (0x1 = +1 minute 0x02 = loss of 1 minute)
//          
//          Honestly it's just strange, but if you want to wipe it out, just zero this value.
//          
//          (it seems the 4th byte is 4 miliseconds.  The third byte is seconds, with the carry over carried to the miliseconds value, up to 3 miliseconds, the second bit is unusable (in that format,  anything there is > 10 minutes) and the first byte is minutes, but also *2 (because 1 = +1 and 2 = 1)
function lostTimeInTimeAttack() => dword(0xB887CC)

// this is in centiseconds.
function calculateTotalTimeInTimeAttack() {
    minutesLost = (word(0xB887CC)) * 3000 // x/2*60*100
    secondsLost = sum_of(range(0,99), i => (byte(0xB887CE) & 0x3f))
    additionalMillisecondsLost = (byte(0xB887CF)) * 0.4
    totalTimeLost = (minutesLost) + (secondsLost) + additionalMillisecondsLost
    return timeInFramesTARace() * 1.66666 + totalTimeLost
}

// $B887D0: (32-bit) Number of "Hits" in Time attack mode.
//          
//          Attributes to Penalty time, but is not directly penalty time.
function hitsInTimeAttack() => dword(0xB887D0)

// $B887D8: (16-bit) Player's SP during TAC  And head to head
//          
//          Starts at 2ee0
function playerSP() => word(0xB887D8)
FULL_SP = 0x2EE0
function playerSPFull() => playerSP() == FULL_SP

// $B887DC: (32-bit) Total score of CA mode
function totalScoreCAMode() => dword(0xB887DC)

// $B887E0: (32-bit) Current Section Score
//          
//          Unbanked Score for the Current CA section.
function currentSectionScore() => dword(0xB887E0)

// $B88878: (16-bit) Opponent's SP During head to head.
//          
//          Starts at 2ee0
function opponentSP() => word(0xB88878)

// $B888DC: (Float) Distance From Opponent.
//          
//          Recorded in Meters, Displays in Yards (converted in Code I'm sure)
function distanceFromOpponent() => float(0xB888DC)

// $B88E16: (8-bit) Gymkhana Time Records result
//          
//          0x00 = Racing
//          0xa3 = Win
//          0xa4 = Retire
//          
//          Might work for Time records too.
function gymkhanaResults() => byte(0xB88E16)

// $B92789: (8-bit) UI set for Race
//          
//          0x00 = TA Attack
//          0x01 = SP Head to Head
//          0x02 = CA Attack
//          0x03 = FL battle
//          0x05 = TAC Attack
//          0x07 = Gymkhana TA (Likely different for the grid on the left)
//          0x08 = Gymkhana CA
//          0x09 = Practice (TA)
//          0x0a = Practice (CA)
//          0x0b = Record ChallengeTime Attack
//          0x0c = Record Challenge Course Attack
//          0x0d = Record Tour
function uiForRace() => byte(0xB92789)
UI_TA_ATTACK = 0
UI_SP_HEAD_TO_HEAD = 1
UI_CA_ATTACK = 2
UI_FL_BATTLE = 3
UI_TAC_ATTACK = 5
UI_GYM_TA = 7
UI_GYM_CA = 8
UI_PRACTICE_TA = 9
UI_PRACTICE_CA = 0xa
UI_RECORD_CHALLENGE_TA = 0xb
UI_RECORD_CHALLENGE_CA = 0xc
UI_RECORD_TOUR = 0xd

function spHeadToHeadMode() => uiForRace() == UI_SP_HEAD_TO_HEAD
function recordChallengeTAMode() => uiForRace() == UI_RECORD_CHALLENGE_TA
function recordChallengeCAMode() => uiForRace() == UI_RECORD_CHALLENGE_CA
function recordChallengeGymkhanaTAMode() => uiForRace() == UI_GYM_TA
function recordChallengeGymkhanaCAMode() => uiForRace() == UI_GYM_CA

// $B927A8: (Float) Current Speed of Player's Car
//          
//          Representation, Not actual.  Likely this is just the MPH version, the real is in KPH maybe.
function currentSpeedPlayersCarMPH() => float(0xB927A8)

function playerPastSpeedMPH(targetSpeed) => currentSpeedPlayersCarMPH() >= targetSpeed && prev(currentSpeedPlayersCarMPH()) < targetSpeed

// $DE4239: (8-bit) Mode Select in Record Challenge
//          
//          0x00 = Time Attack
//          0x01 = CA Attack
//          0x02 = Gymkhana
TIME_ATTACK_MODE_VALUE = 0
CA_ATTACK_MODE_VALUE = 1
function modeSelectRecordChallengeFrontEnd() => byte(0xDE4239)


recordChallengeModeLookup = 
{
    TIME_ATTACK_MODE_VALUE: "Time Attack",
    CA_ATTACK_MODE_VALUE: "CA Attack"
}

// $DE423C: (8-bit) Course Selected for Record Challenge
//          
//          0x0 = Hakone
//          0x1 = Hiroshima
//          0x2 = Haruna
//          0x3 = Akagi
//          0x4 = Ura Rokko
//          0x5 = Omote Rokko
//          0x6 = Shiga Kusatsu
//          0x7 = Nikko
//          0x8 = Zao
//          0x9 = Aso
//          0xa = Hokkaido
//          0xb= Hakone Nanamagari
//          0xc = Usuitouge
//          0xd = Myougisan
//          0xe = Happogahara
//          0xf = Yokohama
//          0x10 = Yukinoohtani
//          0x11 = Kirigamine
//          0x12 = Ohtarumi
//          0x13 = Oval Course
//          0x14 = Gymkhana Course
//          
//          Not all courses might be selectable
function courseSelectedForRecordChallengeFrontEnd() => byte(0xDE423C)

// $DE423D: (8-bit) Car Type for Record Challenge
//          
//          0x00 = Normal Car
//          0x01 = Player's Car
//          0x02 = Custom Car
//          
//          Only appears outside the race
function carTypeForRecordChallengeFrontEnd() => byte(0xDE423D)

// $DE423E: (8-bit) Course Options
//          
//          0x00 = Downhill
//          0x01 = Uphill
function courseOptionRecordChallengeFrontEnd() => byte(0xDE423E)

// $DE4240: (8-bit) Record Challenge Course Weather Condition
//          
//          Note: Not for Gymkhana
//          
//          0x00 = Fine
//          0x01 = Cloudy
//          0x02 = Rain
//          0x03 = Storm
function WeatherOptionRecordChallengeFrontEnd() => byte(0xDE4240)

// $DE4241: (8-bit) Record Challenge Course Time of Day Choice
//          
//          0x00 = Daytime
//          0x01 = Nighttime
function timeOfDayRecordChallengeFrontEnd() => byte(0xDE4241)

// $DE4244: (8-bit) Record Challenge Gymkhana Course Weather Condition
//          
//          Only for Gymkhana
//          
//          0x00 = Fine
//          0x01 = Cloudy
//          0x02 = Rain
//          0x03 = Snow
//          0x04 = Storm
//          0x05 = SnowStorm
function weatherGymkhanaRecordChallengeFrontEnd() => byte(0xDE4244)

// $DE4254: (16-bit) Record Challenge Car Choice
//          
//          Only appears outside the race, see 0x0077dc58 for what's used in the race.
//          
//          0x00 = ASL Garaiya(Garaiya)
//          0x01 = Daihatsu Midget II R type(K100P)
//          0x02 = Daihatsu Mira TR-XX(L502S)
//          0x03 = Daihatsu Mira AVY RS(L260S)
//          0x04 = Daihatsu Copen(L880K)
//          0x05 = Daihatsu Storia X-4(M112S)
//          0x06 = Honda Beat(PP1)
//          0x07 = Honda City Turbo II
//          0x08 = Honda Fit(GD1)
//          0x09 = Honda Civic SiR II(EG6)
//          0x0a = Honda Civic Type R(EK9)
//          0x0b = Honda Civic Type R(EP3)
//          0x0c = Honda CR-X SiR(EF8)
//          0x0d = Honda Prelude Si VTEC(BB4)
//          0x0e = Honda Prelude Type S(BB6)
//          0x0f = Honda Integra Si VTEC(DB8)
//          0x10 = Honda Integra Type R(DC2)
//          0x11 = Honda Integra Type R(DC5)
//          0x12 = Honda Accord Euro R(CL1)
//          0x13 = Honda Accord Euro R(CL7)
//          0x14 = Honda S2000 2.0 Type V(AP1)
//          0x15 = Honda NSX Type R(NA1)
//          0x16 = Honda NSX Type S(NA2)
//          0x17 = Mazda AZ-1(PG6SA)
//          0x18 = Mazda Mazda2 (DY5W)
//          0x19 = Mazda Mazda3 (BK3P)
//          0x1a = Mazda Mazda323(BG8Z)
//          0x1b = Mazda MX-5 Miata (NA8C)
//          0x1c = Mazda MX-5 Miata (NB8C)
//          0x1d = Mazda MX-5 Miata (NB8C)
//          0x1e = Mazda Mazda6 (GG3S)
//          0x1f = Mazda RX-7 (SA22)
//          0x20 = Mazda RX-7 (FC3S)
//          0x21 = Mazda RX-7 (FC3S)
//          0x22 = Mazda RX-7 (FD3S)
//          0x23 = Mazda RX-7 (FD3S)
//          0x24 = Mazda RX-8 (SE3P)
//          0x25 = Mitsubishi Colt Sport X Version (Z28A)
//          0x26 = Mitsubishi Mirage Cyborg R (CA4A)
//          0x27 = Mitsubishi Mirage Cyborg ZR (CJ4A)
//          0x28 = Mitsubishi Mirage Asti RX (CJ4A)
//          0x29 = Mitsubishi FTO GP Ver.R (DE3A)
//          0x2a = Mitsubishi Galant VR-4 (EC5A)
//          0x2b = Mitsubishi Galant VR-4 (E39A)
//          0x2c = Mitsubishi Lancer Evolution (CD9A)
//          0x2d = Mitsubishi Lancer Evolution 2 (CE9A)
//          0x2e = Mitsubishi Lancer Evolution 3 (CE9A)
//          0x2f = Mitsubishi Lancer Evolution 4 (CN9A)
//          0x30 = Mitsubishi Lancer Evolution 5 (CP9A)
//          0x31 = Mitsubishi Lancer Evolution 6 (CP9A)
//          0x32 = Mitsubishi Lancer Evolution 7 (CT9A)
//          0x33 = Mitsubishi Lancer Evolution 8 (CT9A)
//          0x34 = Mitsubishi Lancer Evolution 8 MR (CT9A)
//          0x35 = Mitsubishi Eclipse GSR-4 (D32A)
//          0x36 = Mitsubishi Starion GSR-VR (A187A)
//          0x37 = Mitsubishi GTO Twin Turbo MR (Z15A)
//          0x38 = Nissan March R (EK10)
//          0x39 = Nissan March G# (HK11)
//          0x3a = Nissan March 12SR (AK12)
//          0x3b = Nissan Bluebird SSS-R (RNU12)
//          0x3c = Nissan Pulsar GTI-R (RNN14)
//          0x3d = Nissan Pulsar VZ-R N1 (JN15)
//          0x3e = Nissan Sunny Truck (B122)
//          0x3f = Nissan RZ-1 Twincam Type-B (EB12)
//          0x40 = Nissan Gazelle Turbo RS-X (S12)
//          0x41 = Nissan 180SX Type II (RS13)
//          0x42 = Nissan 180SX Type X (RPS13)
//          0x43 = Nissan 180SX Type X (RPS13)
//          0x44 = Nissan Silvia Turbo R-X.G (S12)
//          0x45 = Nissan Silvia K's (S13)
//          0x46 = Nissan Silvia Club K's (PS13)
//          0x47 = Nissan Silvia K's (S14)
//          0x48 = Nissan Silvia K's (CS14)
//          0x49 = Nissan Silvia Spec-R (S15)
//          0x4a = Nissan Sileighty
//          0x4b = Nissan Onevia
//          0x4c = Nissan Primera 2.0Te (HP10)
//          0x4d = Nissan Primera 20V (HP12)
//          0x4e = Nissan Laurel Club S (EC33)
//          0x4f = Nissan Laurel 25 Club S (GC34)
//          0x50 = Nissan Laurel 25 Club S (GC35)
//          0x51 = Nissan Cefiro Cruising (A31)
//          0x52 = Nissan Skyline Turbo RS-X (R30)
//          0x53 = Nissan Skyline GTS Turbo (R31)
//          0x54 = Nissan Skyline GTS-R (R31)
//          0x55 = Nissan Skyline GTS-t (HCR32)
//          0x56 = Nissan Skyline GT-R VspecII (BNR32)
//          0x57 = Nissan Skyline GTS25t (ECR33)
//          0x58 = Nissan Skyline GTS25t (ECR33)
//          0x59 = Nissan Skyline GT-R Vspec (BCNR33)
//          0x5a = Nissan Skyline 25GT Turbo (ER34)
//          0x5b = Nissan Skyline GT-R VspecII (BNR34)
//          0x5c = Nissan Skyline 350GT (PV35)
//          0x5d = Nissan Skyline Coupe 350GT (CPV35)
//          0x5e = Nissan Stagea 260RS (WGNC34)
//          0x5f = Nissan Stagea 350RX Four (NM35)
//          0x60 = Nissan Fairlady Z 240Z (HS30S)
//          0x61 = Nissan Fairlady Z 280Z-T (S130)
//          0x62 = Nissan Fairlady Z 300ZX (HZ31)
//          0x63 = Nissan Fairlady Z Version S (CZ32)
//          0x64 = Nissan Fairlady Z Version ST (Z33)
//          0x65 = Subaru Vivio RX-R (KK4)
//          0x66 = Subaru R2 S (RC2)
//          0x67 = Subaru Impreza WRX STi (GC8)
//          0x68 = Subaru Impreza WRX STi Ver2 (GC8)
//          0x69 = Subaru Impreza WRX STi Ver3 (GC8)
//          0x6a = Subaru Impreza WRX STi Ver4 (GC8)
//          0x6b = Subaru Impreza WRX STi Ver5 (GF-GC8)
//          0x6c = Subaru Impreza WRX STi Ver6 (GF-GC8)
//          0x6d = Subaru Impreza 22B STi (GF-GC8)
//          0x6e = Subaru Impreza WRX STi (GDB)
//          0x6f = Subaru Impreza STi (GDB)
//          0x70 = Subaru Impreza Wagon (GF8)
//          0x71 = Subaru Impreza Wagon (GH-GGB)
//          0x72 = Subaru Impreza Wagon (TA-GGA)
//          0x73 = Subaru Forester S/ tb STi2 (SF5)
//          0x74 = Subaru Forester STi (SG9)
//          0x75 = Subaru Legacy Touring Wagon (BF5)
//          0x76 = Subaru Legacy RS (BC5)
//          0x77 = Subaru Legacy Touring Wagon (BG5)
//          0x78 = Subaru Legacy RS (BD5)
//          0x79 = Subaru Legacy Touring Wagon (BH5)
//          0x7a = Subaru Legacy B4 RSK (BE5)
//          0x7b = Subaru Legacy Blitzen (BE5)
//          0x7c = Subaru Legacy S401 (BE5)
//          0x7d = Subaru Legacy B4 2.0GT specB (BL5)
//          0x7e = Subaru Legacy Wagon (BP5)
//          0x7f = Subaru Alcyone (AX9)
//          0x80 = Subaru Alcyone SVX (CXD)
//          0x81 = Suzuki Carry 660 Turbo (DA52T)
//          0x82 = Suzuki Alto Works RS/R (CP21S)
//          0x83 = Suzuki Alto Works RS-Z VVT (HA22S)
//          0x84 = Suzuki Kei Sport R (HN22S)
//          0x85 = Suzuki Swift Sport (HT51S)
//          0x86 = Suzuki Cappuccino (EA21R)
//          0x87 = Toyota Ist 1.5S (NCP61)
//          0x88 = Toyota Starlet Turbo S (EP71)
//          0x89 = Toyota Starlet GT (EP82)
//          0x8a = Toyota Starlet GT (EP82)
//          0x8b = Toyota Starlet Glanza V (EP91)
//          0x8c = Toyota Vitz RS (NCP13)
//          0x8d = Toyota Levin 1500SR (AE85)
//          0x8e = Toyota Trueno 1500SR (AE85)
//          0x8f = Toyota Levin GT-Apex (AE86)
//          0x90 = Toyota Levin GT-Apex (AE86)
//          0x91 = Toyota Levin GT-Apex (AE86)
//          0x92 = Toyota Levin GT-Apex (AE86)
//          0x93 = Toyota Trueno GT-Apex (AE86)
//          0x94 = Toyota Trueno GT-Apex (AE86)
//          0x95 = Toyota Trueno GT-Apex (AE86)
//          0x96 = Toyota Trueno GT-Apex (AE86)
//          0x97 = Toyota Levin 1.6 GT-Z (AE92)
//          0x98 = Toyota Trueno 1.6 GT-Z (AE92)
//          0x99 = Toyota Levin BZ-R (AE111)
//          0x9a = Toyota Trueno BZ-R (AE111)
//          0x9b = Toyota Celica GT-Four (ST165)
//          0x9c = Toyota Celica GT-Four (ST185)
//          0x9d = Toyota Celica GT-Four (ST205)
//          0x9e = Toyota Celica SS-II (ZZT231)
//          0x9f = Toyota Celica XX 2800GT (MA61)
//          0xa0 = Toyota Caldina GT-Four (ST246W)
//          0xa1 = Toyota MR2 G-Super Charger (AW11)
//          0xa2 = Toyota MR2 GT (SW20)
//          0xa3 = Toyota MR-S 1.8 V Edition (ZZW30)
//          0xa4 = Toyota MR-S VM180 Zagato (ZZW30)
//          0xa5 = Toyota Altezza RS200 (SXE10)
//          0xa6 = Toyota Mark II Tourer V (JZX90)
//          0xa7 = Toyota Mark II Tourer V (JZX100)
//          0xa8 = Toyota Mark II IR-V (JZX110)
//          0xa9 = Toyota Chaser Tourer V (JZX100)
//          0xaa = Toyota Verossa 2.5 VR25 (JZX110)
//          0xab = Toyota Soarer 3.0GT Limited (MZ20)
//          0xac = Toyota Supra 2.5GT (JZA70)
//          0xad = Toyota Supra RZ (JZA80)
//          0xae = Volkswagen Golf R32 (1JBFHF)
//          0xaf = Volkswagen New Beetle RSi (9CAXJ)
//          0xb0 = Audi S3 (8LBAMF)
//          0xb1 = Audi RS4 (8DAZBRF)
//          0xb2 = Audi RS6 (4BBCYF)
//          0xb3 = Audi TT Coupe 3.2 Quattro (8NBHEF)
//          0xb4 = Renault 5 Turbo II
//          0xb5 = Renault Clio V6 24V
//          0xb6 = Peugeot 205 Turbo 16
//          0xb7 = Fiat Coupe Turbo Plus (175A3)
//          0xb8 = Fiat Fiat Abarth 1000 TCR
//          0xb9 = Gemballa Turbo R-GT 320
//          0xba = Opel Speedster (E00Z22)
//          0xbb = Alfa Romeo 155 Q4 (167A2E)
//          0xbc = Alfa Romeo 156 GTA (932AXB)
//          0xbd = Alfa Romeo Crosswagon
//          0xbe = Special Ridox Supra (JZA80)
//          0xbf = Special Nob Silvia (S15)
//          0xc0 = Special Amemiya RX-7 (FD3S)
//          0xc1 = Special MCR GT-R (BNR34)
//          0xc2 = Special Fujitsubo Lancer (CT9A)
//          0xc3 = Special Fujitsubo Impreza (GDB)
//          0xc4 = Special Mines Skyline (BNR34)
//          0xc5 = Special 5Zigen Integra (DC5)
//          0xc6 = Special Genki S2000 (AP1)
//          0xc7 = Special HKS Silvia (S15)
//          0xc8 = Special HKS Altezza (SXE10)
//          0xc9 = Special Nomura Skyline (ER34)
//          0xca = Special Yoshioka Levin (AE86)
//          0xcb = Special Utsumi RX-7 (FD3S)
//          0xcc = Special Hayashida Silvia (S15)
//          0xcd = Special Izumida Fairlady Z (Z33)
//          0xce = Special Lancer TGM (CT9A)
//          0xcf = Special Lancer Evolution 9 SP (CT9A)
//          0xd0 = Special Citroen Xsara
//          0xd1 = Special Peugeot 206
//          0xd2 = Special Lancer Evo 8 SP (CT9A)
//          0xd3 = Special Starion 4WD
//          0xd4 = Special Impreza SP Version
//          0xd5 = Special Punto Rally
//          0xd6 = Special Opel Corsa Super 1600
//          0xd7 = Special Clio 1600
//          0xd8 = Special Ignis 1600
//          0xd9 = Special 190E Evolution II
//          0xda = Special 190E Evolution I
//          0xdb = Special RIV000
//          0xdc = Special RIV014
//          0xdd = Special RIV049
//          0xde = Special RIV239
//          0xdf = Special RIV320
//          0xe0 = Special RIV321
//          0xe1 = Special RIV012
//          0xe2 = Special RIV031
//          0xe3 = Special RIV066
//          0xe4 = Special RIV090
//          0xe5 = Special RIV115
//          0xe6 = Special RIV163
//          0xe7 = Special RIV193
//          0xe8 = Special RIV223
//          0xe9 = Special RIV265
//          0xea = Special RIV290
//          0xeb = Special RIV324
//          0xec = Special RIV070
//          0xed = Special RIV098
//          0xee = Special RIV123
//          0xef = Special RIV134
//          0xf0 = Special RIV173
//          0xf1 = Special RIV203
//          0xf2 = Special RIV230
//          0xf3 = Special RIV248
//          0xf4 = Special RIV273
//          0xf5 = Special RIV298
//          0xf6 = Special RIV340
//          0xf7 = Special RIV322
//          0xf8 = Special RIV071
//          0xf9 = Special RIV099
//          0xfa = Special RIV124
//          0xfb = Special RIV144
//          0xfc = Special RIV174
//          0xfd = Special RIV204
//          0xfe = Special RIV231
//          0xff = Special RIV249
//          0x100 = Special RIV274
//          0x101 = Special RIV299
//          0x102 = Special RIV323
//          0x103 = Special RIV332
//          0x104 = Special RIV349
//          0x105 = Special RIV350
//          0x106 = Special RIV351
//          0x107 = Special RIV352
function carChoiceGymkhanaRecordChallengeFrontEnd() => word(0xDE4254)

// $1781BDC: (8-bit) Display value for CA Section Notification
//           
//           0x02 = Expert
//           0x03 = Average
//           0x04 = Novice Fighter
//           0x05 = Amazing
//           0x06 = Uncrowned Monarch
function displayValueForCASection() => byte(0x1781BDC)

UNCROWNED_MONARCH = 0x06
function uncrownedMonarch() => displayValueForCASection() == UNCROWNED_MONARCH && prev(displayValueForCASection()) != UNCROWNED_MONARCH

function achievementActive()
{
    return !replayActive() &&
           notSaving()
}

function calculateMemoryLocation(startingMemory, index, size) => startingMemory + (index * size)


function winAchievement(title, description, points, index )
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = rivalWinData(index) == 1 &&
                          prev(rivalWinData(index)) == 0 &&
                          conquestMode() &&
                          achievementActive()
    )
}

function teamAchievements(data)
{
    id = data[ID]
    winAchievement(title = opponentLookup[id],
                   description = format("Beat {0} from {1} in Conquest Mode", opponentLookup[id], data[TEAM_NAME]),
                   points = data[POINTS],
                   index = id
                  )
}



for teamMember in teamLeaderInfos
{
    teamAchievements(teamMember)
}

for slasher in slasherList
{
    winAchievement(title = opponentLookup[slasher[ID]],
                   description = format("Defeat Slasher {0} in Conquest Mode", opponentLookup[slasher[ID]]),
                   points = slasher[POINTS],
                   index = slasher[ID]
                  )
}

for opponent in kingdomTwelveList
{
    winAchievement(title = opponentLookup[opponent[ID]],
                   description = format("Defeat {0} from Kingdom Twelve in Conquest Mode", opponentLookup[opponent[ID]]),
                   points = opponent[POINTS],
                   index = opponent[ID]
                  )

}

for devil in thirteenDevilsList
{
    winAchievement(title = opponentLookup[devil[ID]],
                   description = format("Defeat {0} from Thirteen Devils in Conquest Mode", opponentLookup[devil[ID]]),
                   points = devil[POINTS],
                   index = devil[ID]
                  )
}

for boss in eliteList
{
    winAchievement(title = opponentLookup[boss[ID]],
                   description = format("Defeat {0} in Conquest Mode", opponentLookup[boss[ID]]),
                   points = boss[POINTS],
                   index = boss[ID]
                  )
}

for trickster in tricksterList
{
    winAchievement(title = opponentLookup[trickster[ID]],
                   description = format("Defeat Trickster {0} from in Conquest Mode", opponentLookup[trickster[ID]]),
                   points = trickster[POINTS],
                   index = trickster[ID]
                  )
}


function twentyMasterAchievement(title, description, points, total)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = twentyMastersLevel() == total &&
                          prev(twentyMastersLevel()) == total - 1 &&
                          conquestMode() &&
                          achievementActive()
    )

}

twentyMasterAchievement(title = "Who are these guys?",
                        description = "Defeat Twenty Masters for the first time in Conquest Mode",
                        points = 10,
                        total = 1
                       )

twentyMasterAchievement(title = "Wait How many of these guys are there?",
                        description = "Defeat Twenty Masters for the first time in Conquest Mode",
                        points = 10,
                        total = 21
                       )

function medalachievement(title, description, points, medal)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = prizeJustEarned(medal)&&
                          conquestMode() &&
                          achievementActive()
    )
}



medalData =
[
    { 
        ID: ROOKIE_MEDAL_BIT,
        FROM: "Rival Night Flight",
        POINTS: 5
    },
    { 
        ID: BALAS_MEDAL_BIT,
        FROM: "Rival Big Blue",
        POINTS: 5
    },
    { 
        ID: AMBITION_MEDAL_BIT,
        FROM: "Rival Glittering Gaze",
        POINTS: 5
    },
    { 
        ID: MYSTIC_MEDAL_BIT,
        FROM: "Rival PT Sprint",
        POINTS: 5
    },
    { 
        ID: PERILOUS_MEDAL_BIT,
        FROM: "Hakone NA Fest",
        POINTS: 5
    },
    { 
        ID: SIDETES_MEDAL_BIT,
        FROM: "Hiroshima NA Fest",
        POINTS: 5
    },
    { 
        ID: BOLDNESS_MEDAL_BIT,
        FROM: "Haruna FF Attack",
        POINTS: 5
    },
    { 
        ID: COURAGE_MEDAL_BIT,
        FROM: "Akagi FF Attack",
        POINTS: 5
    },
    { 
        ID: KNIGHT_MEDAL_BIT,
        FROM: "Ura Rokko FF Attack",
        POINTS: 5
    },
    { 
        ID: TOP_RANKING_MEDAL_BIT,
        FROM: "Omote Rokko Toyota Cup",
        POINTS: 5
    },
    { 
        ID: ROOKIE_SHIELD_BIT,
        FROM: "Rival Enchantress",
        POINTS: 5
    },
    { 
        ID: HIREAX_SHIELD_BIT,
        FROM: "Rival Tiny Kim",
        POINTS: 5
    },
    { 
        ID: VOTUM_SHIELD_BIT,
        FROM: "Rival F2.8",
        POINTS: 5
    },
    { 
        ID: PERTINAX_SHIELD_BIT,
        FROM: "Hakone Turbo Fest",
        POINTS: 5
    },
    { 
        ID: DIVUS_SHIELD_BIT,
        FROM: "Shiga Kusatsu Nissan Cup",
        POINTS: 5
    },
    { 
        ID: NOBILISSIMUS_SHIELD_BIT,
        FROM: "Nikko Honda Cup",
        POINTS: 5
    },
    { 
        ID: BARONET_TROPHY_BIT,
        FROM: "Zao Under Litter Cup",
        POINTS: 5
    },
    { 
        ID: DUCHESS_TROPHY_BIT,
        FROM: "Aso Lightweight Cup",
        POINTS: 5
    },
    { 
        ID: LEGENDARY_SHIELD_BIT,
        FROM: "Hokkaido 4wd Attacker",
        POINTS: 5
    },
    { 
        ID: MASTER_SHIELD_BIT,
        FROM: "Hiroshima Turbo Fest",
        POINTS: 5
    },
    { 
        ID: JULIUS_CUP_BIT,
        FROM: "Rival Dirty Version",
        POINTS: 5
    },
    { 
        ID: VIOLENT_WIND_CUP_BIT,
        FROM: "Rival Tochigi Slicer",
        POINTS: 5
    },
    { 
        ID: DIDIUS_JULIANUS_CUP_BIT,
        FROM: "Haruna FR Attack",
        POINTS: 5
    },
    { 
        ID: POPE_CUP_BIT,
        FROM: "Akagi FR Attack",
        POINTS: 5
    },
    { 
        ID: SUBLIMITY_CUP_BIT,
        FROM: "Ura Rokko FR Attack",
        POINTS: 5
    },
    { 
        ID: CONSUL_TROPHY_BIT,
        FROM: "Rival Live Counter",
        POINTS: 5
    },
    { 
        ID: CAESAR_TROPHY_BIT,
        FROM: "Omote Rokko Mazda Cup",
        POINTS: 5
    },
    { 
        ID: GRYPOS_TROPHY_BIT,
        FROM: "Shiga Kusatsu Mitsubishi Cup",
        POINTS: 5
    },
    { 
        ID: ASIATIKOS_TROPHY_BIT,
        FROM: "Nikko Subaru Cup",
        POINTS: 5
    },
    { 
        ID: PRINCE_ELECTOR_TROPHY_BIT,
        FROM: "Zao Middle Engine Cup",
        POINTS: 5
    },
    { 
        ID: KERAUNOS_TROPHY_BIT,
        FROM: "Omote Rokko Small Car Cup",
        POINTS: 5
    },
    { 
        ID: PATER_PATRIAE_TROPHY_BIT,
        FROM: "Shiga Kusatsu Rival Car Match",
        POINTS: 5
    },
    { 
        ID: EARL_TROPHY_BIT,
        FROM: "Nikko European Cup",
        POINTS: 5
    },
    { 
        ID: BISHOP_TROPHY_BIT,
        FROM: "Zao Heavy Engine Cup",
        POINTS: 5
    },
    { 
        ID: ARCHDUKE_TROPHY_BIT,
        FROM: "Aso Middleweight Cup",
        POINTS: 5
    },
    { 
        ID: ADEPT_TROPHY_BIT,
        FROM: "Hokkaido Heavyweight Cup",
        POINTS: 5
    },
    { 
        ID: PROMINENCE_TROPHY_BIT,
        FROM: "Hokkaido Monster Cup",
        POINTS: 5
    },
    { 
        ID: NOTABLE_TROPHY_BIT,
        FROM: "Aso Heavyweight Cup",
        POINTS: 5
    },
    { 
        ID: IMPERIAL_TROPHY_BIT,
        FROM: "Hakone Rival Car Match",
        POINTS: 5
    },
    { 
        ID: CONQUEROR_TROPHY_BIT,
        FROM: "Hokkaido Giant Cup",
        POINTS: 5
    },
]

for data in medalData
{
    id = data[ID]
    medalachievement(title = medalLookup[id],
                     description = format("Earn the {0} from {1} in Conquest Mode", medalLookup[id], data[FROM]),
                     points = data[POINTS],
                     medal = data[ID]
    )
}

function cLevelAchievement(title, description, points, targetExp)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = justPassedCExperience(targetExp) &&
                          conquestMode() &&
                          achievementActive()
    )
}

cLevelAchievement(title = "Race Noob",
                  description = "Reach C-Level 5 in Conquest Mode",
                  points = 3,
                  targetExp = LEVEL_TWO_CLEVEL_EXP
                 )

cLevelAchievement(title = "Race Rookie",
                  description = "Reach C-Level 5 in Conquest Mode",
                  points = 4,
                  targetExp = LEVEL_FIVE_CLEVEL_EXP
                 )

cLevelAchievement(title = "Race Pro",
                  description = "Reach C-Level 10 in Conquest Mode",
                  points = 5,
                  targetExp = LEVEL_TEN_CLEVEL_EXP
                 )

cLevelAchievement(title = "Race Master",
                  description = "Reach C-Level 15 in Conquest Mode",
                  points = 10,
                  targetExp = LEVEL_FIFTEEN_CLEVEL_EXP
                 )

cLevelAchievement(title = "Race God",
                  description = "Reach C-Level 20 in Conquest Mode",
                  points = 10,
                  targetExp = LEVEL_TWENTY_CLEVEL_EXP
                 )

normalCourseListName =
[
    {
        ID: HAKONE_INDEX,
        COURSE_NAME: "Hakone",
        POINTS: 5,
    },
    {
        ID: HIROSHIMA_INDEX,
        COURSE_NAME: "Hiroshima",
        POINTS: 5,
    },
    {
        ID: HARUNA_INDEX,
        COURSE_NAME: "Haruna",
        POINTS: 5,
    },
    {
        ID: AKAGI_INDEX,
        COURSE_NAME: "Akagi",
        POINTS: 5,
    },
    {
        ID: URA_ROKKA_INDEX,
        COURSE_NAME: "Ura Rokko",
        POINTS: 5,
    },
    {
        ID: OMOTE_ROKKO_INDEX,
        COURSE_NAME: "Omote Rokko",
        POINTS: 5,
    },
    {
        ID: SHIGA_KUSATSU_INDEX,
        COURSE_NAME: "Shiga Kusatsu",
        POINTS: 5,
    },
    {
        ID: NIKKO_INDEX,
        COURSE_NAME: "Nikko",
        POINTS: 5,
    },
    {
        ID: ZAO_INDEX,
        COURSE_NAME: "Zao",
        POINTS: 5,
    },
    {
        ID: ASO_INDEX,
        COURSE_NAME: "Aso",
        POINTS: 5,
    },
    {
        ID: HOKKAIDO_INDEX,
        COURSE_NAME: "Hokkaido",
        POINTS: 5,
    } 
]

function normalRaceAchievement(title, description, points, course)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = justWonNormalRace(course) &&
                          conquestMode() &&
                          achievementActive()
    )
}

for course in normalCourseListName
{
    normalRaceAchievement(title = format("{0} Master", course[COURSE_NAME]),
                          description = format("Clear all three normal courses for {0} in Conquest Mode", course[COURSE_NAME]),
                          points = course[POINTS],
                          course = course[ID]
    )
}

function gymkhanaTAAchievement(title, description, points, stages)
{
    achievement(title = format(title,"TA"),
                description = format(description, "Time Attack"),
                points = points,
                trigger = any_of(stages, stageIndex => taClearedJustFinished(stageIndex)) &&
                          conquestMode() &&
                          achievementActive()
    )
}

function gymkhanaCAAchievement(title, description, points, stages)
{
    achievement(title = format(title,"CA"),
                description = format(description, "Course Attack"),
                points = points,
                trigger = any_of(stages, stageIndex => caClearedJustFinished(stageIndex)) &&
                          conquestMode() &&
                          achievementActive()
    )
}

// Timings
// Hakone Gymkhana 13'000 
// Hiroshima Gymkhana 13'000
// Haruna 12.5
// Akagi 12.5
// Ura Rokko 12.5
// Omote Rokko 12.0
// shiga Kusatsu 12.0
// Nikko 12.0
// Zao 11.5
// Aso 11.5
// Hokkaido 10.5

gymkhanaStageList =
[
    {
        TITLE: "Stage 1 Gymkhana {0}",
        DESCRIPTION: "Clear all one of Stage 1 Gymkhana {0} (Hakone or  Hiroshima) in Conquest Mode",
        POINTS: 1,
        STAGES: [HAKONE_UNLOCK_BIT, HIROSHIMA_UNLOCK_BIT]
    },
    {
        TITLE: "Stage 2 Gymkhana {0}",
        DESCRIPTION: "Clear all one of Stage 2 Gymkhana {0} (Haruna or Akagi or Ura Rokko) in Conquest Mode",
        POINTS: 2,
        STAGES: [HARUNA_UNLOCK_BIT, AKAGI_UNLOCK_BIT, URA_ROKKA_UNLOCK_BIT]
    },
    {
        TITLE: "Stage 3 Gymkhana {0}",
        DESCRIPTION: "Clear all one of Stage 3 Gymkhana {0} (Omote Rokko or Shiga Kusatsu or Nikko) in Conquest Mode",
        POINTS: 3,
        STAGES: [OMOTE_ROKKO_UNLOCK_BIT, SHIGA_KUSATSU_UNLOCK_BIT, NIKKO_UNLOCK_BIT]
    },
    {
        TITLE: "Stage 4 Gymkhana {0}",
        DESCRIPTION: "Clear all one of Stage 4 Gymkhana {0} (Zao or Aso) in Conquest Mode",
        POINTS: 4,
        STAGES: [ZAO_UNLOCK_BIT, ASO_UNLOCK_BIT]
    },
    {
        TITLE: "Stage 5 Gymkhana {0}",
        DESCRIPTION: "Clear all one of Stage 5 Gymkhana {0} (Hokkaido) in Conquest Mode",
        POINTS: 5,
        STAGES: [HOKKAIDO_UNLOCK_BIT]
    }
]

for data in gymkhanaStageList
{
    gymkhanaCAAchievement(title = data[TITLE],
                          description = data[DESCRIPTION],
                          points = data[POINTS],
                          stages = data[STAGES]
    )
    
    gymkhanaTAAchievement(title = data[TITLE],
                          description = data[DESCRIPTION],
                          points = data[POINTS],
                          stages = data[STAGES]
    )
    
}


masterRaceAchievementList =
[
    {
        ID: HIROSHIMA_STRAIGHT_MATCH_WON_BIT,
        TITLE: "Hiroshima Straight Match",
        DESCRIPTION: "Clear the Hiroshima Straight Match in Conquest Mode and earn Rom Level 3",
        POINTS: 5
    },
    {
        ID: HARUNA_LEVIN_TRUENO_CUP_WON_BIT,
        TITLE: "Haruna Levin/Trueno Cup",
        DESCRIPTION: "Clear the Haruna Levin/Trueno Cup in Conquest Mode and earn Transmission Level 3",
        POINTS: 5
    },
    {
        ID: AKAGI_ROTARY_MATCH_WON_BIT,
        TITLE: "Akagi Rotary Match",
        DESCRIPTION: "Clear the Akagi Rotary Match in Conquest Mode and earn V-Muffler L Level 3",
        POINTS: 5
    },
    {
        ID: URA_ROKKA_VLINE_WON_BIT,
        TITLE: "Ura Rokko V-Line Match",
        DESCRIPTION: "Clear the Ura Rokka V-Line Match in Conquest Mode and earn Inter Cooler Trm Level 3",
        POINTS: 5
    },
    {
        ID: OMOTE_ROKKO_BOXER_MATCH_WON_BIT,
        TITLE: "Omote Rokko Boxer Match",
        DESCRIPTION: "Clear the Omote Rokko Boxer Match in Conquest Mode and unlock the Genki S2000",
        POINTS: 5
    },
    {
        ID: SHIGA_KUSATSU_SPECIAL_CAR_ROUND_WON_BIT,
        TITLE: "Shiga Kusatsu Special Car Round",
        DESCRIPTION: "Clear the Shiga Kusatsu Special Car Round in Conquest Mode and unlock the mine Skyline",
        POINTS: 5
    },
    {
        ID: NIKKO_RIVAL_CAR_MATCH_WON_BIT,
        TITLE: "Nikko Rival Car Match",
        DESCRIPTION: "Clear the Nikko Rival Car Match in Conquest Mode and unlock the HKS Altezza",
        POINTS: 5
    },
    {
        ID: ZAO_SKYLINE_AND_Z_STAGE_WON_BIT,
        TITLE: "Zao Skyline & Z Stage",
        DESCRIPTION: "Clear the Zao Skyline & Z Stage in Conquest Mode and unlock the HKS Silvia",
        POINTS: 5
    },
    {
        ID: ASO_50_500_KINGDOM_WON_BIT,
        TITLE: "Aso 50/500 Kingdom",
        DESCRIPTION: "Clear the Aso 50/500 Kingdom in Conquest Mode and unlock the MCR GT-R",
        POINTS: 5
    },
    {
        ID: HOKKAIDO_KAIDO_CHAMPIONSHIP,
        TITLE: "Hokkaido Kaido Championship",
        DESCRIPTION: "Clear the Hokkaido Kaido Championship in Conquest Mode and unlock the FIAT Punto Rally",
        POINTS: 5
    }
]

for data in masterRaceAchievementList
{
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = justWonMasterRace(data[ID]) &&
                          conquestMode() &&
                          achievementActive()
    )
}


for groupIndex in groupLookup
{
    achievement(title = groupLookup[groupIndex] + " Champion",
                description = format("Win the {0} Tour in Record Tour Mode", groupLookup[groupIndex]),
                points = 5,
                trigger = recordTourStage() == 11 &&
                          didPlayerWinRecordTour() &&
                          justFinishedGameplay() &&
                          // winStatus() == WON_RACE_VALUE && You don't need to win the race, if they retire they still might win the tour. 
                          recordTourMode() &&
                          recordTourStage() == LAST_RECORD_TOUR_COURSE &&
                          recordTourGroup() == groupIndex &&
                          achievementActive()
    )
}

for groupIndex in groupLookup
{
    achievement(title = groupLookup[groupIndex] + " Clean Race",
                description = format("Win any stage in the {0} Tour with out any hits and still reach first place for the stage in Record Tour Mode", groupLookup[groupIndex]),
                points = 5,
                trigger = didPlayerWinRecordTourStage() &&
                          justFinishedGameplay() &&
                          winStatus() == WON_RACE_VALUE && // Note this is not "Won" but finished. 
                          recordTourMode() &&
                          recordTourStage() == LAST_RECORD_TOUR_COURSE &&
                          recordTourGroup() == groupIndex &&
                          maxPlayerScore() &&
                          achievementActive()
    )
}

for groupIndex in groupLookup
{
    achievement(title = groupLookup[groupIndex] + " Perfect Season",
                description = format("Win the {0} Tour with the maximum ({1}) points in Record Tour Mode", groupLookup[groupIndex], MAX_SCORE),
                points = 5,
                trigger = recordTourStage() == 11 &&
                          didPlayerWinRecordTour() &&
                          justFinishedGameplay() &&
                          winStatus() == WON_RACE_VALUE &&
                          recordTourMode() &&
                          recordTourStage() == LAST_RECORD_TOUR_COURSE &&
                          recordTourGroup() == groupIndex &&
                          maxPlayerScore() &&
                          achievementActive()
    )
}

achievement(title = "Not even a scratch",
            description = format("Win a SP Head to Head race in conquest mode with out losing any SP in Conquest Mode"),
            points = 5,
            trigger = trigger_when(justWonRace()) &&
                        isInGame() &&
                        spHeadToHeadMode() &&
                        conquestMode() &&
                        playerSPFull() &&
                        achievementActive()
)

achievement(title = "One-Oh-Oh",
            description = format("Reach 100 MPH in Conquest Mode"),
            points = 5,
            trigger = isInGame() &&
                      conquestMode() &&
                      playerPastSpeedMPH(100) &&
                      achievementActive()
)

sponsorAchievementList =
[
    
    {
        ID: TAKEOFF_BIT,
        TITLE: "Takeoff",
        POINTS: 5,
    },
    {
        ID: YOURS_BIT,
        TITLE: "Yours",
        POINTS: 5,
    },
    {
        ID: AUTOLEIFEN_BIT,
        TITLE: "Autoleifen",
        POINTS: 5,
    },
    {
        ID: FULL_AUTO_BIT,
        TITLE: "Full-auto",
        POINTS: 5,
    },
    {
        ID: YELLOW_MAGIC_BIT,
        TITLE: "Yellow Magic",
        POINTS: 5,
    },
    {
        ID: GRAFITTI_ART_BIT,
        TITLE: "Grafitti Art",
        POINTS: 5,
    },
    {
        ID: R_CONCEPT_BIT,
        TITLE: "R Concept",
        POINTS: 5,
    },
    {
        ID: SPRINT_RACING_BIT,
        TITLE: "Sprint Racing",
        POINTS: 5,
    },
    {
        ID: PRESTIGE_BIT,
        TITLE: "Prestige",
        POINTS: 5,
    },
    {
        ID: ATHLETE_BIT,
        TITLE: "Athlete",
        POINTS: 5,
    },
    {
        ID: SHIGA_SPEED_BIT,
        TITLE: "Shiga Speed",
        POINTS: 5,
    },
    {
        ID: AUTOBAHN_BIT,
        TITLE: "Autobahn",
        POINTS: 5,
    },
    {
        ID: FRAME_MASTER_BIT,
        TITLE: "Frame Master",
        POINTS: 5,
    },
    {
        ID: YAMAMOTO_ENGINEERING_BIT,
        TITLE: "Yamamoto Engineering",
        POINTS: 5,
    },
    {
        ID: KAKINOKI_RACING_BIT,
        TITLE: "Kakinoki Racing",
        POINTS: 5,
    },
    {
        ID: OMR_BIT,
        TITLE: "OMR",
        POINTS: 5,
    },
    {
        ID: BRIGHTON_BIT,
        TITLE: "Brighton",
        POINTS: 5,
    },
    {
        ID: STRADA_BIT,
        TITLE: "Strada",
        POINTS: 5,
    },
    {
        ID: HI_FI_BIT,
        TITLE: "Hi-Fi",
        POINTS: 5,
    },
    {
        ID: ARTT_BIT,
        TITLE: "ARTT",
        POINTS: 5,
    },
    {
        ID: AKIBA_PRECISION_BIT,
        TITLE: "Akiba Precision",
        POINTS: 5,
    },
    {
        ID: TARGA_TOP_BIT,
        TITLE: "Targa Top",
        POINTS: 5,
    },
    {
        ID: SPEED_LICENSE_BIT,
        TITLE: "Speed License",
        POINTS: 5,
    },
    {
        ID: PRO_SPORT_BIT,
        TITLE: "Pro Sport",
        POINTS: 5,
    },
    {
        ID: GT_YOUTH_BIT,
        TITLE: "GT Youth",
        POINTS: 5,
    },
    {
        ID: WATANABE_AUTOMOBILES_BIT,
        TITLE: "Watanabe_automobiles",
        POINTS: 5,
    },
    {
        ID: VELVAINA_BIT,
        TITLE: "Velvaina",
        POINTS: 5,
    },
    {
        ID: HIGH_PERFORMANCE_BIT,
        TITLE: "High Performance",
        POINTS: 5,
    },
    {
        ID: INDEPENDENT_BIT,
        TITLE: "Independent",
        POINTS: 5,
    },
    {
        ID: SPEED_GEAR_BIT,
        TITLE: "Speed Gear",
        POINTS: 5,
    },
    {
        ID: TERROR_TUNE_BIT,
        TITLE: "Terror Tune",
        POINTS: 5,
    },
    {
        ID: ONE_OFF_BIT,
        TITLE: "One Off",
        POINTS: 5,
    },
    {
        ID: S_STYLE_BIT,
        TITLE: "S-Style",
        POINTS: 5,
    },
    {
        ID: MAGNESIO_ZERO_BIT,
        TITLE: "Magnesio Zero",
        POINTS: 5,
    },
    {
        ID: GAMBINO_RACING_BIT,
        TITLE: "Gambino Racing",
        POINTS: 5,
    },
    {
        ID: OMEGA_LINE_BIT,
        TITLE: "Omega Line",
        POINTS: 5,
    },
    {
        ID: TECHNOSPEED_BIT,
        TITLE: "Technospeed",
        POINTS: 5,
    },
    {
        ID: SILVER_CREEK_BIT,
        TITLE: "Silver Creek",
        POINTS: 5,
    },
    {
        ID: EVERGREEN_BIT,
        TITLE: "Evergreen",
        POINTS: 5,
    },
    {
        ID: STEINER_BIT,
        TITLE: "Steiner",
        POINTS: 5,
    }
]

function sponsorAchievement(title, description, points, sponsor)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = sponsorJustTiedUp(sponsor) &&
                          conquestMode() &&
                          achievementActive()
    )                          
}

for sponsor in sponsorAchievementList
{
    sponsorAchievement(title = sponsor[TITLE],
                       description = format("Tie-up {0} as a sponsor for the first time in Conquest Mode", sponsor[TITLE]),
                       points = sponsor[POINTS],
                       sponsor = sponsor[ID]
    )
}

// Friends 1/10/25
function friendAchievement(title, description, points, total)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = measured(countCurrentFriends() >= total) &&
                          countPrevFriends() <= total - 1 &&
                          conquestMode() &&
                          achievementActive()
    )
}

friendAchievement(title = "Best Friend",
                  description = "Make your first friend in Conquest Mode",
                  points = 3,
                  total = 1
                 )

friendAchievement(title = "Friend of Friends",
                  description = "Make your tenth friend in Conquest Mode",
                  points = 10,
                  total = 10
                 )

friendAchievement(title = "Mr. Popular",
                  description = "Make your twenty-fifth friend in Conquest Mode",
                  points = 25,
                  total = 25
                 )

function groundZeroBeaten()
{
    return rivalWinData(GROUND_ZERO) == 1 &&
           prev(rivalWinData(GROUND_ZERO)) == 0
}
                          
function emotionalKingBeaten()
{
    return rivalWinData(BLACKOUT) == 1 &&
           prev(rivalWinData(BLACKOUT)) == 0
}

leaderboardsStageList =
[
    {
        NAME: "Stage 2",
        FASTEST_DESCRIPTION: "Reach Stage 2 in the shortest time.  Time is based on when the courses unlock, and based on the Player Total Time stat",
        SHORTEST_DESCRIPTION: "Reach Stage 2 in the fewest days based on the in-game calendar",
        TRIGGER: stage2JustUnlocked()
    },
    {
        NAME: "Stage 3",
        FASTEST_DESCRIPTION: "Reach Stage 3 in the shortest time.  Time is based on when the courses unlock, and based on the Player Total Time stat",
        SHORTEST_DESCRIPTION: "Reach Stage 3 in the fewest days based on the in-game calendar",
        TRIGGER: stage3JustUnlocked()
    },
    {
        NAME: "Stage 4",
        FASTEST_DESCRIPTION: "Reach Stage 4 in the shortest time.  Time is based on when the courses unlock, and based on the Player Total Time stat",
        SHORTEST_DESCRIPTION: "Reach Stage 4 in the fewest days based on the in-game calendar",
        TRIGGER: stage4JustUnlocked()
    },
    {
        NAME: "Stage 5",
        FASTEST_DESCRIPTION: "Reach Stage 5 in the shortest time.  Time is based on when the courses unlock, and based on the Player Total Time stat",
        SHORTEST_DESCRIPTION: "Reach Stage 5 in the fewest days based on the in-game calendar",
        TRIGGER: finalStageJustUnlocked()
    },
    {
        NAME: "Final Boss Conquered",
        FASTEST_DESCRIPTION: "Beat Emotional King in the shortest time.",
        SHORTEST_DESCRIPTION: "Reach Emotional King in the fewest days based on the in-game calendar",
        TRIGGER: emotionalKingBeaten()
    },
    {
        NAME: "Secret Boss Conquered",
        FASTEST_DESCRIPTION: "Beat Ground Zero in the shortest time.",
        SHORTEST_DESCRIPTION: "Reach Ground Zero in the fewest days based on the in-game calendar",
        TRIGGER: groundZeroBeaten()
    }
    
]

for stage in leaderboardsStageList
{
    leaderboard(
        title = format("Fastest {0}", stage[NAME]),
        description = stage[FASTEST_DESCRIPTION],
        start = 
        (
            stage[TRIGGER] &&
            achievementActive() &&
            conquestMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = playTime(),
        lower_is_better = true,
        format = "FRAMES"
    )
    
    leaderboard(
        title = format("Shortest {0} Calendar", stage[NAME]),
        description = stage[SHORTEST_DESCRIPTION],
        start = 
        (
            stage[TRIGGER] &&
            achievementActive() &&
            conquestMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = daysPlayed(),
        lower_is_better = true,
        format = "VALUE"
    )
}

function leaderboardCourse(courseId, direction)
{
    leaderboard(
        title = format("Record Challenge: Fastest Time on {0} {1}",  ingameCourseLookup[courseId], directionLookup[direction]),
        description = format("Record the fastest time on {0} {1} in Time Attack Mode in Record Challenge Mode", ingameCourseLookup[courseId], directionLookup[direction] ),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            recordChallengeMode() &&
            courseInGame() == courseId &&
            achievementActive() && 
            inGameClimbDownhill() == direction &&
            recordChallengeTAMode()

        ),
        cancel = always_false(),
        submit = always_true(),
        value = calculateTotalTimeInTimeAttack(), // MILLISECONDS is centiseconds. See: https://docs.retroachievements.org/Leaderboards/#value-format
        lower_is_better = true,
        format = "MILLISECS"
    )

    leaderboard(
        title = format("Record Challenge: CA Attack on {0} {1}",  ingameCourseLookup[courseId], directionLookup[direction]),
        description = format("Finish with the best CA score on {0} {1} in Time Attack Mode in Record Challenge Mode", ingameCourseLookup[courseId], directionLookup[direction] ),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            recordChallengeMode() &&
            courseInGame() == courseId &&
            achievementActive() && 
            inGameClimbDownhill() == direction &&
            recordChallengeCAMode()

        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalScoreCAMode(), 
        format = "VALUE"
    )
}
for key in ingameCourseLookup
{
    if (key != GYMKHANA_COURSE_INDEX)
    {
        leaderboardCourse(key, DOWNHILL_VALUE)
        leaderboardCourse(key, CLIMB_VALUE)
    } 
}

for target in range(FIRST_GYMKHANA_COURSE, LAST_GYMKHANA_COURSE)
{
    leaderboard(
        title = format("Fastest Time Gymkhana {0}",  target + 1),
        description = format("Record the fastest time on TA Course {0} for Gymkhana in Conquest Mode or Record Challenge Mode", target + 1 ),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            (conquestMode() || 
             recordChallengeMode()) &&   
            courseInGame() == GYMKHANA_COURSE_INDEX &&
            gymkhanaLevelInGame() ==  target &&
            achievementActive() &&
            recordChallengeGymkhanaTAMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = calculateTotalTimeInTimeAttack(), // MILLISECONDS is centiseconds. 
        lower_is_better = true,
        format = "MILLISECS"
        )
}

for target in range(FIRST_GYMKHANA_COURSE, LAST_GYMKHANA_COURSE)
{
    leaderboard(
        title = format("Highest Score Gymkhana {0}",  target + 1),
        description = format("Finish CA Course {0} with the highest score for Gymkhana in Conquest Mode or Record Challenge Mode", target + 1 ),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            (conquestMode() || 
             recordChallengeMode()) &&   
            courseInGame() == GYMKHANA_COURSE_INDEX &&
            gymkhanaLevelInGame() ==  target &&
            achievementActive() &&
            recordChallengeGymkhanaCAMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalScoreCAMode(), // MILLISECONDS is centiseconds. 
        format = "VALUE"
        )
}



function timeConversion(minutes, seconds, millisecond = 0) => ((minutes * 60) +seconds) * 60 + millisecond

specificLeaderboard =
[
    { 
        TRACK: AKAGI_COURSE_INDEX,
        CAR: MITSUBISHI_MIRAGE_CYBORG_ZR,
        CREATOR: "Borysewicz",
        DIRECTION: DOWNHILL_VALUE,
        WEATHER: CLOUDY_VALUE,
        TIMEOFDAY: NIGHTTIME_VALUE,
        ID: 94793,
        MODE: TIME_ATTACK_MODE_VALUE,
        TIME: timeConversion(5,00),
        ACHIEVEMENT_NAME: "Ghost King of Akagi",
        TIMESTRING: "5:00"
    },
    { 
        TRACK: URA_ROKKA_COURSE_INDEX,
        CAR: DAIHATSU_MIDGET_II_R_TYPE_K100P,
        CREATOR: "Cipher47",
        ID: 94794,
        MODE: TIME_ATTACK_MODE_VALUE,
        DIRECTION: DOWNHILL_VALUE,
        WEATHER: STORM_VALUE,
        TIMEOFDAY: NIGHTTIME_VALUE,
        TIME: timeConversion(6,00),
        ACHIEVEMENT_NAME: "Hauler King of ShinKanjou",
        TIMESTRING: "6:00"
    },
    { 
        TRACK: HARUNA_COURSE_INDEX,
        CAR: TOYOTO_TRUENO_3DOOR_GT_APEX_AE86,
        CREATOR: "PacoAlcantara",
        ID: -1,
        MODE: CA_ATTACK_MODE_VALUE,
        DIRECTION: DOWNHILL_VALUE,
        WEATHER: SUNNY_VALUE,
        TIMEOFDAY: NIGHTTIME_VALUE,
        ACHIEVEMENT_NAME: "Tofu King of Haruna",
        SCORE: 1000000        
    },
    {
        TRACK: SHIGA_KUSATSU_COURSE_INDEX,
        CAR: HONDA_CIVIC_TYPE_R_EK9,
        CREATOR: "nyxxie",
        ID: -1,
        MODE: TIME_ATTACK_MODE_VALUE,
        DIRECTION: DOWNHILL_VALUE,
        WEATHER: SUNNY_VALUE,
        TIMEOFDAY: NIGHTTIME_VALUE,
        ACHIEVEMENT_NAME: "Racer King of Shiga Kusatsu",
        TIME: timeConversion(5,00)
    }
]

function specificLeaderboardTimeAttack(data)
{
    leaderboard(    
        title = format("Record Challenge: Fastest {1} {2} on {0}",  ingameCourseLookup[data[TRACK]],  shortCarNameLookup[data[CAR]], directionLookup[data[DIRECTION]]),
        description = format("Record the fastest time on {0}/{3}/{4}/{5} while driving the Normal Car of {1} in Time Attack in Record Challenge Mode. Thanks to {2} For the suggestion", 
                             ingameCourseLookup[data[TRACK]], 
                             carLookup[data[CAR]], 
                             data[CREATOR], 
                             directionLookup[data[DIRECTION]], 
                             weatherLookup[data[WEATHER]], 
                             timeOfDayLookup[data[TIMEOFDAY]],
                             recordChallengeModeLookup[data[MODE]]),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            recordChallengeMode() &&
            courseInGame() == data[TRACK] &&
            inGameClimbDownhill() == data[DIRECTION] &&
            inGameCarDriven() == data[CAR] &&
            inGameWeather() == data[WEATHER] &&
            inGameTimeOfDay() == data[TIMEOFDAY] &&
            isNormalCar() &&
            achievementActive() && 
            recordChallengeTAMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = calculateTotalTimeInTimeAttack(), // MILLISECONDS is centiseconds. See above
        lower_is_better = true,
        format = "MILLISECS"
    )

}

function specificLeaderboardCAAttack(data)
{
    leaderboard(    
        title = format("Record Challenge: CA Attack {1} {2} on {0}",  ingameCourseLookup[data[TRACK]],  shortCarNameLookup[data[CAR]], directionLookup[data[DIRECTION]]),
        description = format("Finish with the best CA Score on {0}/{3}/{4}/{5} while driving the Normal Car of {1} in CA Attack in Record Challenge Mode. Thanks to {2} For the suggestion", 
                             ingameCourseLookup[data[TRACK]], 
                             carLookup[data[CAR]], 
                             data[CREATOR], 
                             directionLookup[data[DIRECTION]], 
                             weatherLookup[data[WEATHER]], 
                             timeOfDayLookup[data[TIMEOFDAY]],
                             recordChallengeModeLookup[data[MODE]]),
        start = 
        (
            justFinishedGameplay() &&
            winStatus() == WON_RACE_VALUE &&
            recordChallengeMode() &&
            courseInGame() == data[TRACK] &&
            inGameClimbDownhill() == data[DIRECTION] &&
            inGameCarDriven() == data[CAR] &&
            inGameWeather() == data[WEATHER] &&
            inGameTimeOfDay() == data[TIMEOFDAY] &&
            isNormalCar() &&
            achievementActive() && 
            recordChallengeCAMode()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = totalScoreCAMode(), 
        format = "VALUE"
    )

}


for data in specificLeaderboard 
{
    if data[MODE] == TIME_ATTACK_MODE_VALUE
    {
        specificLeaderboardTimeAttack(data)
    }
    else if data[MODE] == CA_ATTACK_MODE_VALUE
    {
        specificLeaderboardCAAttack(data)
    }

    
//    achievement(title = data[ACHIEVEMENT_NAME],
//                description = format("Beat {0} on {1} while driving the Default Car of {2} in Time Trial Mode.  Thanks to {3} for designing this achievement", data[TIMESTRING], TrackLookup[data[TRACK]], CarName[data[CAR]], data[CREATOR]),
//                points = 5,
//                trigger = isDriving() && 
//                          triggerJustFinishedTimeAttack() && 
//                          timeAttackMode() && 
//                          prev(timeTimeAttackMode()) > 0 &&
//                          prev(timeTimeAttackMode()) < data[TIME] &&
//                          timeAttackTrackId() == data[TRACK] &&
//                          carCheck(data[CAR]) &&
//                          isDefaultCar()
//
//    )

}



for groupIndex in groupLookup
{
    for index in range(FIRST_RECORD_TOUR_COURSE, LAST_RECORD_TOUR_COURSE) 
    {
        leaderboard(    
            title = format("Record Tour: Fastest Group {1} Stage {0}", index + 1, groupLookup[groupIndex]),
            description = format("Record the fastest time on {0} in Group{1} in Record Tour mode", recordTourLookup[index], groupLookup[groupIndex] ),
            start = 
            (
                justFinishedGameplay() &&
                winStatus() == WON_RACE_VALUE &&
                recordTourMode() &&
                recordTourStage() == index &&
                recordTourGroup() == groupIndex &&
                achievementActive()
            ),
            cancel = always_false(),
            submit = always_true(),
            value = calculateTotalTimeInTimeAttack(), // MILLISECONDS is centiseconds. See above
            lower_is_better = true,
            format = "MILLISECS"
        )
    }
}


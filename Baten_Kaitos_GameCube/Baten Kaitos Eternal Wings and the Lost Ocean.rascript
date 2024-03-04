// Baten Kaitos: Eternal Wings and the Lost Ocean
// #ID = 8489

function containsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

// Name of each area.  Using a plain text as the identifier. 
CEBALRAI = "Cebalrai"
MOONGUILE_FOREST = "Moonguile Forest"
NUNKI_VALLEY = "Nunki Valley"
PHERKAD = "Pherkad"
LORDS_MANSIONS = "Lord's Mansion"
NASHIRA = "Nashira"
LESSER_CELESTIAL_RIVER = "Lesser Celestial River"
CLOUD_PASSAGE = "Cloud Passage"
SHELIAK = "Sheliak"
CASTLE_ELNATH = "Castle Elnath"
ANUENUE_PORT = "Anuenue Port"
KOMO_MAI = "Komo Mai"
ANCIENT_LIBRARY_OF_MAGIC = "Ancient Library of Magic"
HOLOHOLO_JUNGLE = "Holoholo Jungle"
OPU = "Opu"
CELESTIAL_TREE = "Celestial Tree"
TRAIL_OF_SOULS = "Trail of Souls"
PARNASSE = "Parnasse"
DETOURNE = "Detourne"
REVERENCE = "Reverence"
NEKTON = "Nekton"
BALANCOIRE = "Balancoire"
COCCOLITH = "Coccolith"
MINTAKA = "Mintaka"
BATTLESHIP_GOLDOBA = "Battleship Goldoba"
AZHA_VILLAGE = "Azha Village"
LAVA_CAVES = "Lava Caves"
IMPERIAL_FORTRESS = "Imperial Fortress"
ICE_CLIFFS = "Ice Cliffs of Gomeisa"
KAFFALJIDHMA = "Kaffaljidhma"
CURSA = "Cursa"
LABYRINTH_OF_DUHR = "Labyrinth of Duhr"
GEMMA_VILLAGE = "Gemma Village"
CAPELLA = "Capella"
ALGORAB_VILLAGE = "Algorab Village"
ZOSMA_TOWER = "Zosma Tower"
CELESTIAL_ALPS = "Celestial Alps"
ILLUSORY_FORTRESS = "Illusory Fortress"
GREATER_CELESTIAL_RIVER = "Greater Celestial River"
PHANTOM_GOLDOBA = "Phantom Goldoba"
NIHAL_DESERT = "Nihal Desert"
COR_HYDRAE = "Cor Hydrae"

DescriptionNameLookup =
{
    CEBALRAI: "Cebalrai",
    MOONGUILE_FOREST: "Moonguile Forest",
    NUNKI_VALLEY: "Nunki Valley",
    PHERKAD: "Pherkad",
    LORDS_MANSIONS: "the Lord's Mansion",
    NASHIRA: "Nashira",
    LESSER_CELESTIAL_RIVER: "the Lesser Celestial River",
    CLOUD_PASSAGE: "the Cloud Passage",
    SHELIAK: "Sheliak",
    CASTLE_ELNATH: "Castle Elnath",
    ANUENUE_PORT: "Anuenue Port",
    KOMO_MAI: "Komo Mai",
    ANCIENT_LIBRARY_OF_MAGIC: "the Ancient Library of Magic",
    HOLOHOLO_JUNGLE: "Holoholo Jungle",
    OPU: "Opu",
    CELESTIAL_TREE: "the Celestial Tree",
    TRAIL_OF_SOULS: "Trail of Souls",
    PARNASSE: "Parnasse",
    DETOURNE: "Detourne",
    REVERENCE: "Reverence",
    NEKTON: "Nekton",
    BALANCOIRE: "Balancoire",
    COCCOLITH: "Coccolith",
    MINTAKA: "Mintaka",
    BATTLESHIP_GOLDOBA: "Battleship Goldoba",
    AZHA_VILLAGE: "Azha Village",
    LAVA_CAVES: "the Lava Caves",
    IMPERIAL_FORTRESS: "the Imperial Fortress",
    ICE_CLIFFS: "the Ice Cliffs of Gomeisa",
    KAFFALJIDHMA: "Kaffaljidhma",
    CURSA: "Cursa",
    LABYRINTH_OF_DUHR: "the Labyrinth of Duhr",
    GEMMA_VILLAGE: "Gemma Village",
    CAPELLA: "Capella",
    ALGORAB_VILLAGE: "Algorab Village",
    ZOSMA_TOWER: "Zosma Tower",
    CELESTIAL_ALPS: "the Celestial Alps",
    ILLUSORY_FORTRESS: "the Illusory Fortress",
    GREATER_CELESTIAL_RIVER: "the Greater Celestial River",
    PHANTOM_GOLDOBA: "Phantom Goldoba",
    NIHAL_DESERT: "Nihal Desert",
    COR_HYDRAE: "Cor Hydrae",
}


// $251b78: (8-bit) Load Indicator.
//          
//          0x00 = Not Loading
//          0x01 = Loading a save file.
function loadIndicator() => byte(0x00251b78)

LOADING_FILE_VALUE = 0x01

function saveProtection() => loadIndicator() != LOADING_FILE_VALUE
function resetSaveProtection() => never(loadIndicator() != LOADING_FILE_VALUE)

// $1EDD55: (24-bit BE) Pointer to Mindeer Info
//          
//          +0x700C= (32-bit BE) Number of Magnus found in Mindeer minigame
function pointerToMindeer() => tbyte_be(0x1EDD55)

MINDEER_MINI_GAME_MAGNUS_COUNT_OFFSET = 0x700C

function mindeerMinigameMagnusCount() => dword_be(pointerToMindeer() + MINDEER_MINI_GAME_MAGNUS_COUNT_OFFSET)

function mindeerMinigameCheck(magnusTarget) => mindeerMinigameMagnusCount() == magnusTarget &&
                                               prev(mindeerMinigameMagnusCount()) == magnusTarget - 1

// $2494E4: (32-bit bitfield)  Valuable Items bitfield
//          
//          NOTE not treated as BE.
//          
//          bit0 = Maynee's Pendant
//          bit1 = Rainbow Spider's Web
//          bit2 = Guestroom Key
//          bit3 = Ladekahn's Letter
//          bit4-bit7 = Keys for Ancient Library of Magic
//          bit8-bit11 = Books for Ancient Library of Magic (Note eventually these are used)
//          bit13 = Landmark stone
//          bit14 = Koko Mai Cookies
//          bit15 = End Magnus (Che)
//          bit16 = Mira Cream
//          bit17 = Mira Chocolate
//          bit18 = Shadow Magnus
//          bit19 = Flame Ice
//          bit20 = Twinstone Compass
//          bit21 = Garden of Death Key
//          bit22 = Elevator Key
//          bit23 = Prison Cell Key
//          bit24 = Key
//          bit25 = Jet Boots
//          bit26 = White Sword
//          bit27 = Red Necklace
//          bit28 = Green Ring
//          bit29 = Balance
VALUABLE_ITEM_MEMORY_LOCATION = 0x2494E4
function valuableItems() => dword(VALUABLE_ITEM_MEMORY_LOCATION)

JET_BOOTS_BIT = 25 
WHITE_SWORD_BIT = 26
RED_NECKLACE_BIT = 27
GREEN_RING_BIT = 28
BALANCE_BIT = 29 

function detoroneValuableItemsCheck() => bit(JET_BOOTS_BIT, VALUABLE_ITEM_MEMORY_LOCATION) == 0 &&
                                         bit(WHITE_SWORD_BIT, VALUABLE_ITEM_MEMORY_LOCATION) == 0 &&
                                         bit(RED_NECKLACE_BIT, VALUABLE_ITEM_MEMORY_LOCATION) == 0 &&
                                         bit(GREEN_RING_BIT, VALUABLE_ITEM_MEMORY_LOCATION) == 0 &&
                                         bit(BALANCE_BIT, VALUABLE_ITEM_MEMORY_LOCATION) == 0

// $249500: (24-bit bitfield) 17 Animals collected not delivered
//          
//          17 bits  (bit0 on 3rd byte)
function animalsCollected() => tbyte(0x249500)
// Not actually needed, use 24950F

// $249508: (bitfield) Star Map Fragments.
//          
//          More will Be used, these are just what has been sussed out.
//          More bitfields follow (higher address) this.
//          
//          bit 0 = Initial
//          bit 1 = Draco
//          bit 2 = Vela
function starmapFragments() => byte(0x249508)
// Not actually needed. 

// $24950F: (24-bit bitfield) Quest info
//          
//          bit0 = Start of Animal of Wazn Campaign
//          bit1-18 = Animals Delivered
ANIMALS_DELIVERED_MEMORY_LOCATION = 0x24950F
function animalsDelivered() => tbyte(ANIMALS_DELIVERED_MEMORY_LOCATION)

function animalDeliveredCount() => sum_of(range(0,2), index=> bitcount(ANIMALS_DELIVERED_MEMORY_LOCATION + index))
function prevAnimalDeliveredCount() => sum_of(range(0,2), index=> prev(bitcount(ANIMALS_DELIVERED_MEMORY_LOCATION + index)))
 

// $2495CE: (bitfield) Event Progress
//          
//          bit0 = Cebalrai Maynee quest
function eventProgress() => 0x2495CE
// Shouldn't be needed.  End of the question is at 0x2496A5

// $2495D7: (4-bit low ) Quest progress
//          Azha Kids magnus quest.  Bit 0 is first, bit 1 is first reward, bit 2 is second reward.  See 0x002495e3 instead
function azhaKidsQuest() => byte(0x2495D7)

// $2495DB: (bitfield) Quest Progress
//          
//          bit0 = Pherkad mountain apple for pebble (Why?)
//          bit2 = Anuenue Port Shrine Progression Quest Start
//          bit3 = Cordelia Agrees to Shrine Progression
//          bit4 = Everything set for Shrine Progression
//          bit5 = Shrine Progression 2 finished
//          bit6 = Shrine Progression Dancer
//          bit7 = Shrine Progression Blue guy
function lootProgress() => 0x2495DB

// $2495DC: (bitfield) Quest Progress
//          
//          bit0 = Shrine Progression Bridge guy
//          bit1 = Shrine Progression Teacher
//          bit2 = Shrine Progression Snail Girl School
//          bit3 = Shrine Progression Snail Girl palace
//          bit4 = Shrine Progression Reward Given
function lootProgress2() => 0x2495DC

// $2495E3: (bitfield) Chest Progress
//          
//          bit4= Azha Village Kids 13 magnus card Mephistophales Cloak
//          bit5 =Azha Village Kids 21 magnus card Secret Recipe 7
//          bit6 =Azha Village Left building first floor pots Green tea
//          bit7 =Azha Village Left building second floor shelf Crimson Oak Blossom
function lootProgress3() => 0x2495E3

// $2495E4: (bitfield) Chest Progress
//          
//          bit0 = Azha Village Left Building Second Floor Drill Sculpting Knife
//          bit1 = Azha Third floor Pot Pork Ribs
//          bit2 = Azha Third floor Pot Sunflower Coin
function lootProgress4() => 0x2495E4

// $2495E5: (bitfield) Chest Progress
//          
//          bit5 = Azha Third floor Pot Jumbo Pastry
//          bit6 =Balancore Restaurant Quest Scorpion Barette
//          bit7 =Balancore Restaurant Quest Given to Man (Versus woman)
function lootProgress5() => 0x2495E5

// $2495E6: (bitfield) Chest Progress
//          
//          bit0 =Balancore Restaurant Quest Given to Woman (Versus man)
//          bit1 =Balancore Third house Oven Bacon
//          bit2 =Balancore Third house Barrels Deluxe Red Wine
//          bit3 =Balancore First house Pot Sugar Cane
//          bit4 =Balancore First house Dresser Millinery
//          bit5 =Balancore Second house Dishes Pot of Air
//          bit6 =Balancore Second house Plants Cedar Tree
//          bit7 =Balancoire Duke's Mansion, bottom right Jill's Jewlery Box
function lootProgress6() => 0x2495E6

// $2495E7: (bitfield) Chest Progress
//          
//          bit0 =Balancoire Duke's Mansion, bottom right Drums Piscis Australis
//          bit2 =Balancoire Duke's Mansion, Right Side Secret Recipe 5
//          bit3 =Balancoire Duke's Mansion, Right Side Picture Silent Lady
//          bit4 =Balancoire Duke's Mansion, Left Side Tearless Mermaid
//          bit5 =Balancoire Duke's Mansion, Left Side Sleet Shawl
//          bit6 =Celestial Tree Right Tent Crater
function lootProgress7() => 0x2495E7

// $2495E8: (bitfield) Chest Progress
//          
//          bit0 = Azha Village Right Lab Blueprints Grumble Pen
//          bit1 = Azha Village Right Lab Barrels Sepens
//          bit2 = Anuenue Port Cabinet Auriga
//          bit3 = Komo Mai School of Magic Magical Piggy Bank
//          bit4 = Komo Mai School of Magic West Lockers Chronos Blow 2
//          bit5 = Komo Mai School of Magic Oil Paintings Sweetheart Picture
//          bit6 = Komo Mai School of Magic Bookshelf Secret Recipe 3
//          bit7 = Komo Mai School of Magic Lockers Black Scepter
function lootProgress8() => 0x2495E8

// $2495E9: (bitfield) Chest Progress
//          
//          bit0 = Komo Mai  School of Magic SilkWorm when drinking green liquid
//          bit1 = Komo Mai  Guard given Yogurt Sagitta
//          bit1 = Komo Mai  Guard given Yogurt Return later Fairy Barrette
//          bit3 = Komo Mai Cordelia Palace Right side Pot Flower Bud
//          bit4 = Komo Mai Cordelia Palace Right side Strawberries
//          bit5 = Komo Mai Cordelia Palace Left side Pot Deluxe Bananas
//          bit6 = Komo Mai Cordelia Palace Cordelia Bedroom, Hair Dryer
//          bit7 = Komo Mai Cordelia Palace Cordelia Bedroom Mattress
function lootProgress9() => 0x2495E9

// $2495EA: (bitfield) Chest Progress
//          
//          bit0 = Celestial Alps House Statute Silk Veil
//          bit1 = Celestial Alps House Pot Avacado
//          bit2 = Celestial Alps Left room Pot Milk
//          bit3 = Celestial Alps Left room Ladder Straw
//          bit4 = Nihal Desert Boxes Rooster
//          bit5 = Nihal Desert Barrels Centarus
//          bit6 = Nihal Desert Water Quest Chaos mail
function lootProgress10() => 0x2495EA

// $2495EB: (bitfield) Chest Progress
//          
//          bit0 = Nihal Desert Water Quest Galeos Fangs
//          bit1 = Nihal Desert Water Quest Holy Armor
//          bit2 = Nihal Desert Water Quest Red Impulse
//          bit3 = Pherkad Bookshelf Shish Kebab(M)
//          bit5 = Pherkad Tree - Pine Tree
//          bit6 = Lord's Mansion Stained Glass Frozen Shield
//          bit7 = Lord's Mansion Mini Quest Alejeemo Voice II
function lootProgress11() => 0x2495EB

// $2495EC: (bitfield) Chest Progress
//          
//          bit0 = Lord's Mansion Bedside table Mink Coat
//          bit2 = Lord's Mansion Bedside table Ice dagger
//          bit3 = Lord's Mansion Quest Fire Burst 3
//          bit4 = Komo Mai Bananas
//          bit5 = Pherkad  Talk to girl, Got Pyxxis
//          bit6= Azha Village Post Quest Hot stone Platnium Buckle
//          bit7= Azha Village Quest Hot stone for Cetaka's Sword
function lootProgress12() => 0x2495EC

// $2495ED: (bitfield) chest Progress
//          
//          bit1 = Anuenue Port Shrine Progression Quest Rainbow Ash
//          bit2 = Komo Mai Rock Salt Quest Deluxe Cookies
//          bit3 = Komo Mai Snow Quest Light Flare V
//          bit4 = Komo Mai Hot Rock Quest Erbschaft
//          bit5 = Komo Mai Evergreen quest Pickup line Zeit Robe
//          bit6 = Pherkad  Talk to man, given Dark Flare 2
function lootProgress13() => 0x2495ED

// $2495EE: (bitfield) Chest Progress
//          
//          bit0 = Balancore Sea Bream Filet quest Wizard Robe
//          bit1 = Balancore Cloud quest Arm Bomber
//          bit2 = Balancore Salt quest Pork Ribs
//          bit3 = Balancore Kids quest Firedrake Fist
//          bit4 = Azha Third floor girl Thoughts Red Oak
//          bit5 = Celestial Tree Apple Vinegar Quest Flugel Shield
//          bit7 = Balancore Museum Quest Broken Birdie
function lootProgress14() => 0x2495EE

// $2495EF: (bitfield) Quest Progress
//          
//          bit0 = Cebalrai Larikush Tutorial Ice Dagger given
function lootProgress15() => 0x2495EF

// $24962E: (bitfield) Chest Progress
//          
//          bit4 = Lord's Mansion Chest Chain Mail
//          bit5 = Lord's Mansion Chest Moon Buckle
//          bit6 = Lord's Mansion Chest Wind Blow
//          bit7 = Lord's Mansion Chest Shadow Wings
function lootProgress16() => 0x24962E

// $24962F: (bitfield) Chest Progress
//          
//          bit2 = Lord's Mansion Hidden Intriguing Mystery
//          bit3 = Anuenue Port Chest Snake Tuba
//          bit4 = Anuenue Port Chest Explosive Paddle
//          bit5 = Anuenue Port Chest Bamboo Grass Creel
function lootProgress17() => 0x24962F

// $249631: (bitfield) Chest Progress
//          
//          bit6 =Celestial Tree Left Branch Wild Cherry Bud
//          bit7 =Nerton Chest Corona Borelis
function lootProgress18() => 0x249631

// $249632: (bitfield) Chest Progress
//          
//          bit0 = Nerton Chest Wind God Blade
//          bit1 = Nerton Chest Water Blade
//          bit2 = Azha Village Left building Secret Area Lupus
//          bit3 = Lava Caves Chest Catfish Whiskers
//          bit4 = Lava Caves Chest Gold Earring
//          bit5 = Azha Village Right lab chest Dream Blade
//          bit6 = Celestial Alps First Screen Chest Canis Minor
//          bit7 = Celestial Alps Chest Apocolypse Sword
function lootProgress19() => 0x249632

// $249633: (bitfield) Chest Progress
//          
//          bit0 = Celestial Alps Chest Air Slash
//          bit1 = Celestial Alps Chest Chaos Mail
//          bit2 = Celestial Alps Chest Azure Sand
//          bit3 = Celestial Alps Left room Chest Holy Armor
//          bit4 = Celestial Alps Left room Chest Skull Buckle
//          bit5 = Celestial Alps Right room Chest Void Phantom
//          bit6 = Illusionary Fortress First Hall Chest Aqua Truth
//          bit7 = Illusionary Fortress First Hall Chest Apple Pie (full)
function lootProgress20() => 0x249633

// $249634: (bitfield) Chest Progress
//          
//          bit0 = Illusionary Fortress First Hall Chest Linnet Statue
//          bit1 = Illusionary Fortress First Hall Chest Bloody Vortex
//          bit3 = Illusionary Fortress First Hall Chest Silk Veil
//          bit3 = Illusionary Fortress First Hall Chest Skull Anklet
//          bit4 = Lava Caves Chest Shadow Thruster
//          bit5 = Lava Caves Chest Solar Saber
//          bit6 = Nihal Desert Chest Skull Barrette
//          bit7 = Nihal Desert Chest Dragon Plum Bud
function lootProgress21() => 0x249634

// $249635: (bitfield) Chest Progress
//          
//          bit0 = Celestial Alps House Chest Eferetti Saber
function lootProgress22() => 0x249635

// $24963D: (bitfield) Event Flags
//          
//          bit6 = Zosma Tower Wizard Shadow killed
function eventProgress2() => 0x24963D

// $24965B: (bitfield) Event Flags
//          
//          bit5 = Nunki Valley, Killed Spider
function eventProgress3() => 0x24965B

// $249679: (bitfield) Event Flags
//          
//          bit7 = Cebalrai Milker discussion of Pherkad
function eventProgress4() => 0x249679

// $249692: (bitfield) Chest Progress
//          
//          bit4 = Cebalrai Drawer: Dark Flare 1
//          bit5 = Cebalrai Drawer: Fire Burst 1
//          bit6 = Cebalrai Wood Chest: Shish Kebab (S)
function lootProgress23() => 0x249692

// $2496A5: (bitfield) Chest Progress
//          
//          bit2 = Cebalrai Maynee quest Shampoo
//          bit3 = Cebalrai Old woman: Shish Kebab (M)
//          bit4 = Cebalrai Young chef Puppis
//          bit5 = Cebalrai Milker Anklet of Calm Winds
function lootProgress24() => 0x2496A5

// $2496AB: (bitfield) Chest Progress
//          
//          bit4 = Moonguile Forest First room Chest: Voice 1
//          bit5 = Moonguile Forest second room Chest: Leather Armor
//          bit7 = Moonguile Forest second room Chest behind log: Ice Dagger
function lootProgress25() => 0x2496AB

// $2496AC: (bitfield) Event Flags
//          
//          bit0 = Moonguile Forest Second room chest: Bamboo Shoot
//          bit1 = Moonguile Forest Save room Flame sword
//          bit2 = Moonguile Forest Save room Flame Burst 1
//          bit3 = Moonguile Forest Spring Escape
//          bit4 = Nunki Valley Lower path chest Flame Shield
//          bit5 = Nunki Valley Upper path chest Frozen Shield
//          bit6 = Nunki Valley Behind Waterfall Secret Recipe 1
function lootProgress26() => 0x2496AC

// $2496AE: (bitfield) Chest Progress
//          
//          bit5 =Ice Cliffs of Gomeisa chest Shepard's Purse
//          bit6 =Coccolith Second room Chest Heaven's Pillar
//          bit7 =Coccolith Third Room Chest Corona Australis
function lootProgress27() => 0x2496AE

// $2496AF: (bitfield) Chest Progress
//          
//          bit0 = Zosma Tower Floor 1 Chest Firedrake Barrette
//          bit1 = Zosma Tower  Chest Burning Shield
//          bit2 = Zosma Tower Chest Rhapsody
//          bit3 = Zosma Tower Chest Tradescantia Petals
//          bit4 = Zosma Tower Chest Aquila
//          bit5 = Zosma Tower Chest Skull Birdie
//          bit6 = Ice Cliffs of Gomeisa chest Deluxe Pastry
//          bit7 = Ice Cliffs of Gomeisa chest Tower Shield
function lootProgress28() => 0x2496AF

// $2496B0: (bitfield) Chest Progress
//          
//          bit0 =Ice Cliffs of Gomeisa chest Aqua Burst IV
//          bit1 =Ice Cliffs of Gomeisa chest Forseti Robe
//          bit2 =Ice Cliffs of Gomeisa chest Leo
//          bit5 =Coccolith Chest Robe of Firelight
function lootProgress29() => 0x2496B0

// $2496C9: (bitfield) Museum Quest Progress
//          
//          bit6 = Calbren Museum Quest Start
function museumQuest() => byte(0x2496C9)

// $249728: (36 bits) Quzman Family bits
//          
//          Technically starting high4 here, there's 32 bits from 0x00249728 to 0x0024972c each of which is a member of the family, when 32 is found, the final cutscene plays out.
QUZMAN_FAMILY_MEMORY_LOCATION = 0x249728
function quzmanFamily() => dword(QUZMAN_FAMILY_MEMORY_LOCATION)

// $24972F: (bitfield) Quzman Family status
//          
//          bit3 = Quzman passing
function quzmanEnding() => byte(0x24972F)

// $249748: (bitfield) Chest Progress
//          
//          bit0 = Gemma Village Gift Sun Anklet
//          bit3 = Gemma Village Chest Quest Siegfried
function lootProgress30() => 0x249748

// $24974B: (bitfield) Chest Progress
//          
//          bit4 = Gemma Village Right room Fire conversation Broken Earth Sphere
function lootProgress31() => 0x24974B

// $24974E: (bitfield) Chest Progress
//          
//          bit4 = Imperial Fortress Geldoblame's room Bed Cute Doll
function lootProgress32() => 0x24974E

// $249752: (bitfield) Chest Progress
//          
//          bit3 = Opu Flower girl Perseus
function lootProgress33() => 0x249752

// $249755: (bitfield) QuestProgress
//          
//          bit5 = Kaffaljidhma  Right side, Warriors Memories
//          bit6 = Kaffaljidhma  Right side, Warriors Mementos
//          bit7 = Labyrinth of Duhr Quest Bells of Fate
function lootProgress34() => 0x249755

// $249756: (bitfield) Chest progress
//          
//          bit0 = Labyrinth of Duhr Body Pegasus
//          bit1 = Greater Celestial River Borlokis Boss (Gibari's weapon)
//          bit2 = Nashira Mountain Apple Wine Quest Secret Recipe 9
//          bit3 = Nashira Secret Information Quest Creel of the Whale
//          bit5 = Gemma Village Rubber Mud Quest (just quest)
//          bit7 = Gemma Village Rubber Mud Quest Power Blade
function lootProgress35() => 0x249756

// $249757: (bitfield) Chest progress
//          
//          bit0 = Gemma Village Rubber Mud Quest Sacred Helm
//          bit5 = Opu Quest Secret Information Crimson Oak Blossom
function lootProgress36() => 0x249757

// $249758: (bitfield) Chest Progress
//          
//          bit0 = Opu Mayfee repeatable quest Deluxe Shish Kebab
function lootProgress37() => 0x249758

// $249759: (bitfield) Chest Progress
//          
//          bit1 and bt2 = Nashira Bar Pickup Line Quest Shako
function lootProgress38() => 0x249759

// $24975A: (bitfield) Chest Progress
//          
//          bit 0-bit 2=  Parts of Parnasse quest giving celestial seed.  and mountain apple wine
//          bit3 = Parnasse Quest Celestial Seed Silk Robe
//          bit4 = Parnasse Quest Mountain Apple Wine Second Hand
function lootProgress39() => 0x24975A

// $24975E: (bitfield) Mintaka's Attack
//          
//          bit1 = Up the first alleyway.
function eventProgress5() => 0x24975E

// $24975F: (bitfield) Mintaka's Attack
//          
//          bit0 = First area
//          bit2+3 = Guard room
//          bit5 = Room at the end of the first alley
function eventProgress6() => 0x24975F

// $249767: (bitfield) Chest Progress
//          
//          bit3 = Nashira Boxes Scale Shield
//          bit4 = Nashira Boxes Fire burst 2
//          bit5 = Nashira Warehouse Jars Pine tree
//          bit6 = Nashira Warehouse Pots Fire Yell level 1
//          bit7 = Nashira chest Carina Constellation
function lootProgress40() => 0x249767

// $249768: (bitfield) Chest Progress
//          
//          bit1 = Nashira Bed Feathered Hat
//          bit2 = Nashira Bar Barrels Shortcake
function lootProgress41() => 0x249768

// $24978D: (bitfield) Mintaka's Attack
//          
//          bit1 = Top of the Guards room
//          bit2 = Second area
function eventProgress7() => 0x24978D

// $24979A: (bitfield) Chest Progress
//          
//          bit2 = Imperial Fortress 5th Floor Equipment Room Asura Tuba
//          bit3 = Imperial Fortress 5th Floor Equipment Locker Inferno Fists
//          bit4 = Imperial Fortress 5th Floor Equipment Locker Efretti Suit
//          bit5 = Greater Celestial River Hidden Chest Corvus
//          bit6 = Gemma Village Mitzuki's house Green Drawers Large Team Mug
//          bit7 = Gemma Village Mitzuki's house Fire oakwood
function lootProgress42() => 0x24979A

// $24979B: (bitfield) Chest Progress
//          
//          bit0 = Gemma Village Right Room Blue Drawer Slight Debt
//          bit1 = Gemma Village Right Room Drawer Peanuts
//          bit2 = Kaffaljidhma Statue Room Back Sagittarius
//          bit3 = Kaffaljidhma Queen's Chambers Dresser Light Flare IV
//          bit4 = Kaffaljidhma Queen's Chambers Lamp Young Wasabi Root
//          bit5 = Kaffaljidhma Queen's Chambers Bed Dancing Flames
//          bit6 = Kaffaljidhma Bottom floor Left side Green Tea
function lootProgress43() => 0x24979B

// $24979C: (bitfield) Chest Progress
//          
//          bit1 = Kaffaljidhma Queen's Lamp Shortcake Large
//          bit2 = Kaffaljidhma Right Side Pot Eel
//          bit3 = Ancient Library of Magic Uppstairs area Bookshelf Deluxe Shortcake
//          bit4 = Ancient Library of Magic History Section Bookshelf Deluxe BonBon
//          bit5 = Imperial Fortress Second Floor left Deluxe Cream Puff
//          bit6 = Imperial Fortress Cell Toilet Pot of Air
function lootProgress44() => 0x24979C

// $24979D: (bitfield) Chest Progress
//          
//          bit0 = Imperial Fortress Geldoblame's room Horse Birch
//          bit1 = Imperial Fortress Throne Room Behind Golden Bugle
//          bit2 = Opu Mayfree's room Pot Curry
//          bit3 = Opu Mayfree's bottom room Ice Knuckles
//          bit4 = Opu First Room Flowers Lupus
//          bit5 = Opu First Room Tub Uncooked Rice
//          bit6 = Parnasse Far back room Chocolate Dresser Chronos Armor
//          bit7 = Parnasse Far back room Kitchen Fresh Beef
function lootProgress45() => 0x24979D

// $24979E: (bitfield) Chest Progress
//          
//          bit0 = Parnasse First room on the right Fridge Frozen Tangerine
//          bit1 = Mintaka Spoke Secret Recipe 6
//          bit2 = Mintaka Guard Room Pot Ara
//          bit3 = Mintaka Lyude's House Rice Paper
//          bit4 = Mintaka Lyude's House Pretty flowers
//          bit5 = Mintaka End of Alley Apple Pie
//          bit6 = Mintaka Round Building Pickled Eggplant
//          bit7 = Gemma Village Right room Fire Guy Boots
function lootProgress46() => 0x24979E

// $24979F: (bitfield) Chest Progress
//          
//          bit2 = Capella Chest Full Plate
function lootProgress47() => 0x24979F

// $2497A5: (bitfield) Chest Progress
//          
//          bit4 = HoloHolo Jungle Next to ladder Chest Ice Crystal Buckle
//          bit5 = HoloHolo Jungle 1 Chest Dead end Silver Earring
//          bit6 = HoloHolo Jungle 6 Chest Dead End Chest Fire Burst III
//          bit7 = HoloHolo Jungle 6 Chest Dead End Chest Heat Paddle
function lootProgress48() => 0x2497A5

// $2497A6: (bitfield) Chest Progress
//          
//          bit0 = Ancient Library of Magic Chest Zeit Robe
//          bit1 = Ancient Library of Magic Upstairs landing Chest Wave Blade
//          bit2 = Ancient Library of Magic Uppstairs area Chest Falcon Statue
//          bit3 = Ancient Library of Magic Upstairs Area Chest Kite Shield
//          bit4 = Ancient Library of Magic Geography Section Chest Zeit Robe
//          bit5 = Ancient Library of Magic Geography Section Hidden Chest Will o wisp hat
//          bit6 = Ancient Library of Magic History Section Chest Fruity Gelatin
//          bit7 = Ancient Library of Magic History Section Chest Taurus
function lootProgress49() => 0x2497A6

// $2497A7: (bitfield) Chest Progress
//          
//          bit0 = Ancient Library of Magic Philosophy Section Chest Magnum Cornet
//          bit1 = Ancient Library of Magic Philosophy Section Chest Deluxe Cookies
//          bit2 = Ancient Library of Magic Philosophy Section Chest Scarlett Shell
//          bit3 = Ancient Library of Magic Literarture Section Chest Ruby Earrings
//          bit4 = Ancient Library of Magic Literarture Section Chest Silver Sword
//          bit5 = Ancient Library of Magic Boss Room Water Mirror Anklet
function lootProgress50() => 0x2497A7

// $2497A8: (bitfield) Chest Progress
//          
//          bit1 = Detourne Balance room Whirlwind Hit
//          bit2 = Detourne Balance room Silver Barette
//          bit3 = Opu First room hidden area Flash Explosion
//          bit6= Mintaka Guard Area Scale Mail
//          bit7= Mintaka Guard Area Coffin Shield
function lootProgress51() => 0x2497A8

// $2497A9: (bitfield) Chest Progress
//          
//          bit0 = Mintaka Lyude's House Intermezzo
//          bit1 = Mintaka End of Alley Sleet Shawl
//          bit2 = Mintaka Round Building Viking Helmet
//          bit3 = Imperial Fortress Front Gate Chest Wave Cutter
//          bit4 = Imperial Fortress Front Gate Chest Light Wave IV
//          bit5 = Imperial Fortress Hall Chest Spark Hat
//          bit6 = Imperial Fortress 5th Floor Equipment Chest Blood Sword
//          bit7 = Imperial Fortress 5th Floor Equipment Chest Dragonfly
function lootProgress52() => 0x2497A9

// $2497AA: (bitfield) Chest Progress
//          
//          bit0 = Imperial Fortress Second Floor Left Chest Wolf Fangs
//          bit1 = Imperial Fortress Second Floor Left Chest Aqua Impulse
//          bit2 = Imperial Fortress Cell Chest Fire Burst IV
//          bit3 = Imperial Fortress Cell Chest Whispering Wind
//          bit4 = Imperial Fortress Second Floor Toilets Phoenix Helm
//          bit6 = Imperial Fortress First Floor Left Chest Fire Burst IV
//          bit7 = Imperial Fortress Geldoblame's room Chest Crown of Bubbles
function lootProgress53() => 0x2497AA

// $2497AB: (bitfield) Chest progress
//          
//          bit1 = Imperial Fortress Throne Room Chest Full Helm
//          bit2 = Imperial Fortress Throne Room Chest Aqua Burst IV
//          bit3 = Imperial Fortress Cell floor Dark Flare Iv
//          bit4 = Imperial Fortress Cell floor Port Scorpius
//          bit5 = Capella Chest Flashy Earrings
//          bit7 = Greater Celestial River Chest Buoy of Light
function lootProgress54() => 0x2497AB

// $2497AC: (bitfield) Chest progress
//          
//          bit0 = Greater Celestial River Chest Power Blade
//          bit1 = Labyrinth of Duhr Chest Sunflower Barrette
//          bit2 = Labyrinth of Duhr Chest Air Slash
//          bit3 = Labyrinth of Duhr Chest Platter of Parting
//          bit4 = Labyrinth of Duhr Chest Fangs of Light
//          bit5 = Labyrinth of Duhr Chest Hamelin Cloak
//          bit6 = Labyrinth of Duhr Chest Cinderella Birdie
//          bit7 = Labyrinth of Duhr Chest Sun Coin
function lootProgress55() => 0x2497AC

// $2497AD: (bitfield) Chest Progress
//          
//          bit0 = Labyrinth of Duhr Chest White Ash
//          bit2 = Labyrinth of Duhr Chest Metal Knuckles
//          bit3 = Gemma Village Chest Earth Buckle
//          bit4 = Kaffaljidhma  Right side, Chest Phoenix helm
//          bit5 = Kaffaljidhma  Right side, Chest Birdie Fatale
//          bit6 = Greater Celestial River Chest Skull Creel
//          bit7 = Greater Celestial River Chest Battle Suit
function lootProgress56() => 0x2497AD

// $2497AE: (bitfield) Chest Progress
//          
//          bit0 = Lesser Celestial River Chest Chaos Edge
//          bit1 = Lesser Celestial River Chest Stream blade
//          bit2 = Lesser Celestial River Chest Mana stone
//          bit2 = Lesser Celestial River Chest Century veil
//          bit4 = Lesser Celestial River Chest Camera 1
//          bit5 = Lesser Celestial River Chest Hemp Creel
//          bit6 = Cloud Passage Chest Aqua Burst 2
//          bit7 = HoloHolo Jungle 6 Chest Dead End Chest Smash Tackle
function lootProgress57() => 0x2497AE

// $2497AF: (bitfield) Chest Progress
//          
//          bit0 = HoloHolo Jungle 6 Chest Dead End Chest Equuleus
//          bit1 = HoloHolo Jungle 6 Chest Dead End Chest Wind Yell I
//          bit2 = HoloHolo Jungle 6 Chest Dead End Chest Brave Knight Helm
//          bit3 = Capella Chest Whitecap Shield
//          bit4 = Capella Chest Purple Rose
function lootProgress58() => 0x2497AF

// $2497B2: (bitfield) Chest Progress
//          
//          bit1 = Cor Hydrae Sibling God Unknown
//          bit2 = Cor Hydrae Sibling God Che
//          bit3 = Cor Hydrae Sibling God Body
//          bit4 = Cor Hydrae Sibling God Unknown
//          bit5 = Cor Hydrae Sibling God Unknown
//          bit6 = Sheliak Mayor's Room Saving Book
//          bit7 = Sheliak Obelisk room, Cloud Shield
function lootProgress59() => 0x2497B2

// $2497B3: (bitfield) Chest Progress
//          
//          bit0 = Sheliak Obelisk room, Light Flare II
//          bit1 = Sheliak Middle room, Red And Blue Pencil
//          bit2 = Sheliak Third Room Voice II
//          bit3 = Sheliak Third Room Fading Notebook
//          bit4 = Algorab Village Far Left room Bookshelf Cherries
//          bit5 = Algorab Village Far Left room Pot Aries
//          bit6 = Algorab Village Upper Left room Pot Curry
//          bit7 = Algorab Village Upper Left Room Left book Divorce Papers
function lootProgress60() => 0x2497B3

// $2497B4: (bitfield) Chest Progress
//          
//          bit0 = Algorab Village Right room Bookshelf Cassiopera
function lootProgress61() => 0x2497B4

// $2497BE: (Upper4) I believe this is the values for thirsty soldier.  However you get nothing for it.  Noted just for interesting
function eventProgress8() => 0x2497BE

// $2497C1: (bitfield) Chest Progress
//          
//          bit7 = Sheliak Giving water to Soldier and get Shadow Cornet
function lootProgress62() => 0x2497C1

// $2497C2: (bitfield) Chest Progress
//          
//          bit0 = Sheliak Giving salty water to clean lamp and get Flash Armor
//          bit0 = Also possible to give Apple wine to someone by the bonfire at the end of the game.  Flash Armor
function lootProgress63() => 0x2497C2

// $249822: (bitfield) Chest Progress
//          
//          bit5  = Algorab Village Post Mal Alley Inferno Cannon
//          bit6  = Sheliak Mayor's Room Chest Butterfly
//          bit7 =  Sheliak Hidden Room Calm Helmet
function lootProgress64() => 0x249822

// $249823: (bitfield) Chest Progress
//          
//          bit0 =  Sheliak Hidden Room Ray of Truth
//          bit1 = Cor Hydrae Chest Fire Burst VI
//          bit2 = Cor Hydrae Chest Chronos Blow VI
//          bit3 = Cor Hydrae Chest Venus Garb
//          bit4 = Cor Hydrae Chest Second Chronos Blow VI
//          bit5 = Cor Hydrae Chest Esperanza
//          bit6 = Cor Hydrae Chest Light Flare VI
//          bit7 = Cor Hydrae Chest Dark Flare VI
function lootProgress66() => 0x249823

// $249824: (bitfield) Chest Progress
//          
//          bit0 =  Cor Hydrae Chest Desperda
//          bit1 =  Cor Hydrae Chest Lord of the Winds
//          bit2 =  Cor Hydrae Chest Wind Blow VI
//          bit3 =  Cor Hydrae Chest Brahma Eupho
//          bit4 =  Cor Hydrae Chest Voice 6
//          bit5 =  Cor Hydrae Chest Firefly
//          bit6 =  Cor Hydrae Chest Wind Blow VI
//          bit7 =  Cor Hydrae Chest Golden Helm
function lootProgress67() => 0x249824

// $249825: (bitfield) Chest Progress
//          
//          bit0 =  Cor Hydrae Chest Aqua Burst VI
//          bit1 =  Cor Hydrae Chest Shield of Hope
//          bit2 =  Cor Hydrae Chest Mermaid's Nail
//          bit3 =  Cor Hydrae Chest Sybil's Crown
function lootProgress68() => 0x249825

// $249832: (8-bit) Quest Progress
//          
//          bit2 = Kaffaljidhma  Right side, Warriors Mementos OR memories, for more specific check 0x00249755
function lootProgress69() => 0x249832

// $24985D: (bitfield) Chest Progress
//          
//          bit3 = Goldoba Code Viking Hat
//          bit4 = Goldoba Code Assasin Robe
//          bit7 = Goldoba Code Open bridge (not an item)
function lootProgress70() => 0x24985D

// $24985F: (bitfield) Quest Process
//          
//          bit4 = Illusionary Fortress Kulcabaran Boss Killed
function lootProgress71() => 0x24985F

// $24986E: (bitfield) Chest Progress
//          
//          bit7 = Castle Elnath Clean up West Side
function lootProgress72() => 0x24986E

// $24986F: (bitfield) Chest Progress
//          
//          bit0 = Castle Elnath Clean up East Side
//          bit1 = Castle Elnath Cleaned up both West and East Side
function lootProgress73() => 0x24986F

// $249874: (bitfield) Quest Progress
//          
//          bit0 = Cursa Skating Girl Rubber Mud Quest Light Flare IV
//          bit3 = Castle ElnathRoyal Crest Quest Rainbow Ash
function lootProgress74() => 0x249874

// $249887: (bitfield) Chest Progress
//          
//          bit0 = Goldoba Right Cabin Robe of Firelight
//          bit1 = Goldoba Left Cabin Mattress Sleet Shawl
//          bit2 = Castle Elnath Top Landing Statue Light Flare II
//          bit3 = Castle Elnath Top Landing Statue Dark Flare II
//          bit4 = Castle Elnath Middle Left Arrogance Dark Yellow I
//          bit5 = Castle Elnath Middle Right Metropolis Light Yell 1
//          bit6 = Castle Elnath Upper Left room Desk Fading Notebook
function lootProgress75() => 0x249887

// $249888: (bitfield) Chest Progress
//          
//          bit0 = Reverence Left Chest Monolith Pen
//          bit1 = Reverence right Chest Tri Crescendo Pen
//          bit2 = Cursa Left side Snowman Cloudy Emblem
//          bit3 = Cursa Left house left bin Dark Flare IV
//          bit4 = Cursa Left house right bin Soybeans
//          bit5 = Cursa 2nd Left House Fish Ursa Minor
function lootProgress76() => 0x249888

// $249899: (bitfield) Chest Progress
//          
//          bit7 = Phantom Goldoba Boss Rampulus
function lootProgress77() => 0x249899

// $2498A0: (bitfield) Chest Progress
//          
//          bit7 = Lesser Celestial River Chest Heron Statue
function lootProgress78() => 0x2498A0

// $2498A1: (bitfield) Chest Progress
//          
//          bit0 = Lesser Celestial River Chest Cloak of Dark Night 2
//          bit1 = Lesser Celestial River hidden chest past boss Chest Stream Blade
//          bit2 = Castle Elnath Upper Left room Chest Magical AmuletI
//          bit3 = Goldoba Chest Right Cabin Grace shield
//          bit4 = Goldoba Left Cabin Chest Rainbow Straw hat
//          bit5 = Goldoba Garage Chest Crystal Nails
//          bit6 = Goldoba Bottom right room Rice Paper
//          bit6 = Goldoba Bottom right room Cetaka's Sword
function lootProgress79() => 0x2498A1

// $2498A2: (bitfield) Chest Progress
//          
//          bit0 = Phantom Goldoba Cherst Jasper Gem
//          bit1 = Phantom Goldoba Cherst Skull Earring
//          bit2 = Phantom Goldoba Cherst Agni Tuba
//          bit3 = Phantom Goldoba Cherst Mithril Helm
//          bit4 = Phantom Goldoba Cherst Hades Horn
function lootProgress80() => 0x2498A2

// $2498A4: (bitfield) Chest Progress
//          
//          bit3 = Cloud Passage Chest Cygnus
//          bit4 = Lesser Celestial River Chest Fire Burst 2
//          bit5 = Castle Elnath Dock Infinity Mask
//          bit6 = Castle Elnath Top floor Dark Sword
//          bit7 = Castle Elnath Bottom Floor Chest Flame Armor
function lootProgress81() => 0x2498A4

// $2498A5: (bitfield) Chest Progress
//          
//          bit0 = Castle Elnath Bottom Floor Chest Shadow Suit
function lootProgress82() => 0x2498A5

// $249CC4: (32-bit BE) This is the major script ID.
//          
//          This controls the state of numerous parts of the game, the game advances the script when the story advances.
//          
//          NOTE: Multiple parts of the game require 2 or more actions to occur.  For instance you MUST talk to the girl in the first village, AND talk to the chief.  Those are NOT registered here.
//          
//          However if both events are in the event field (above) there is a cutscene when you exit the village and then this event system will advance.  It appears to always increase.
//          
//          If you set this to 0 the castle battle in the second area restarts.  If you set this to 0x1000000  A lot of the game disappears.
//          
//          0x00000000 =-Start of the game
//          0x00000064 = In the village
//          0x000000c8 = Picked up Winglet, game starts.
//          
//          0x0000012c = Memai Meeting
//          0x00000190 =Post Memai Meeting, Need to exit village with girl discussion and elder discussion
//          0x000001f4 =  Exited the village, Moonguile Forest Log is removed (Before Sabre dragon)
//          0x000002bc = After Sabre Dragon
//          0x00000320 = Post Sabre Dragon cutscene (Pre Lord of the Spring)
//          0x0000044c = After Lord of the Spring fight
//          0x000004b0 = Post Lord of the Spring Cutscene
//          
//          0x000005a0 = Nunka Valley Boss timeline (no change)
//          
//          0x00000708 = Before Giacomo in Lord's Mansion
//          0x00000834 = After Giacomo's battle in Lord's Mansion (technically on battleship)
//          
//          0x00000bb8 = Before Thunderfish in Lesser Celestial River
//          0x00000c1c = Beaten Thunderfish in Lesser Celestial River
//          0x00000c80 = After Thunderfish cutscene in Lesser Celestial River
//          
//          0x00000e10 = Before Iron Beetle (1)  battle On Cloud Passage
//          0x00000e74 = After Iron Beetle Battle On Cloud Passage
//          0x00000ed8 = After Iron Beetle Cutscene
//          
//          0x00001068 = Before Iron Beetle V Cutscene
//          0x00001194 = Beat Iron Beetle V
//          0x000011f8 = Post Iron Beetle V battle
//          0x0000125c = Post Iron Beetle V cutscenes
//          
//          0x00001324 = Before Lord of The Winds
//          0x00001388 = Beat Lord of The Winds
//          0x000013ec = Post Lord of the Winds ?
//          
//          0x000015ae = Pre Entering school of magic
//          0x00001640?= Entered School of Magic
//          0x0000164e = Entered Corelia Castle
//          0x00001658 = Post Initial meeting with Queen Corellia
//          0x000016a8 = Queen Corellia name checks Kalas
//          0x000016b2 = Deciding where to go after Corellia Castle
//          0x0000170c = Queen Corellia reminiscing as you leave Komo Mai
//          
//          0x00001770 = Before Boss of Ancient Library (Folon)
//          0x000017d4 = After Boss of Ancient Library
//          0x00001838 = Post Ancient Library Scene
//          
//          0x000019c8 = Before Tree Guardian/ Entering Core of The Celestial Tree
//          0x00001a2c = Just beaten Guardian of the Celestial Tree (Tree Guardian)
//          0x00001a36 = Before Savyna/Leading up to Savyna in the Celestial Tree
//          0x00001a90 = Leaving Celestial Tree after Savyna fight.
//          0x00001af4 = After giving End Magnus to Queen Cordellia
//          0x00001b58 = After talking to Queen Cordellia and deciding to go to Mira
//          0x00001bbc = On the ship on the way to Trail of Souls
//          0x00001c20 = Being Attacked on the Way to Trail of Souls
//          
//          0x00001d4c = Happens during Mindeer Flying
//          0x00001d4c = Also pre Gnosis Fight
//          0x00001db0 = Done with Gnosis Fight
//          0x00001e14 = Leaving Outer Dimension
//          0x00001e78 = Done talking to Great Mizuki.  Now in Trail of Souls.
//          0x00001edc = First entering into Parnasse The Confectionary Village
//          
//          0x00002008 = Pre Magnus Giganticus
//          0x0000206c = Beat Magnus Giganticus
//          0x000020d0 = Post Magnus Giganticus Cutscene
//          
//          0x000022C4 = Pre Sikmi
//          0x00002328 = Beat Sikni
//          
//          0x00002648 = Before Phantasm
//          0x000026ac = Beat Phantasm
//          
//          0x000029cc = Pre Trio Fight on Goldoba
//          0x00002a94 = Post Trio Fight on Goldoba
//          0x00002af8 = Post Trio Fight on Goldoba
//          
//          0x00002e18 = Prior Geldoblame
//          0x00002e22 = Post Geldoblame
//          
//          0x00002f4e = Post Spoiler, ready to regroup.
//          0x00002fa8? = Post Spoiler REgroup team.
//          
//          0x0000319c = Pre Goddess Of Ice
//          0x00003200 = Post Goddess Of Ice
//          
//          0x000034bc = Pre Fadroh
//          0x00003520 = Post Fadroh Battle
//          
//          0x00003584 = Pre Angel of Darkness
//          
//          
//          0x00003a34 = Pre Zosma Boss battle
//          0x0003a98 = Post Zosma Boss Battle
//          
//          0x0003afc = Pre Malpercio
//          0x0003b60 = Post Malpercio
//          
//          0x00003ee4 = Pre Celestial Alps Trio Second fight
//          0x00003f48 = Post Celestial Alpsa Trio Second figfht
//          
//          0x00413c = Before Malpercio Cor Battle. 1
//          0x0041a0 = After Malpercio Cor Battle 1
//          
//          0x04204 = Before Mapercio Final Battle
//          0x04268 = Post Malpercio Final Battle
//          
//          0x004394 = In battle with True Final Boss
//          (unknown if there's anything between)
//          0x0043f8 = Ending and credits.
//          Ends here.
//          
//          Not all state will be detailed here. But please detail the Previous and next state for any achievement triggers.
//          
//          If it's not here, check 0x002494c8- 0x00249cc7
function majorScriptId() => dword_be(0x249CC4)

// $249CCC: (48-bit) Character order and size.
//          
//          Actually 6 8-bit values followed by array size.
//          
//          0x00 = None
//          0x01 = Kalas
//          0x02 = Xelha
//          0x03 = Gibari
//          0x04 = Lyude
//          0x05 = Sayvna
//          0x06 = Mitzuki
CHARACTER_ORDER_LOCATION = 0x249CCC
function characterOrder() => byte(CHARACTER_ORDER_LOCATION)

// $249CE3: (8-bit) Kalas - Class
//          
//          0x01-0x06
//          
//          This is the controls the Combo Max, and Deck Size.
KALAS_CLASS_LOCATION = 0x249CE3
function kalasClass() => byte(KALAS_CLASS_LOCATION)

// $249D27: (8-bit) Xelha - Class
//          
//          0x01-0x06
//          
//          This is the controls the Combo Max, and Deck Size.
XELHA_CLASS_LOCATION = 0x249D27
function xelhaClass() => byte(XELHA_CLASS_LOCATION)

// This could grab all the locations manually but let's just math them. 
CLASS_OFFSET = XELHA_CLASS_LOCATION - KALAS_CLASS_LOCATION

// Values from 0x01-0x06 so let's start 1 more value back. 
CLASS_STARTING_VALUE = KALAS_CLASS_LOCATION - CLASS_OFFSET

function classValue(characterId) => byte(CLASS_STARTING_VALUE + (CLASS_OFFSET * characterId))

// $251B7C: (32-bit BE) Money
//          
//          Cash, Dough, Gold, Loot, Lucre!
function moneyTotal() => dword_be(0x251B7C)

// $251b80: (1216-bit BE bitflag ) Magnus Display Bitflag
//
//          This is an array of the Magnus Gathering Display bitfields. There's 1022 cards, each has a bit. 
//          
//          This should be easy, but of course nothing is easy with this game.  There are gaps in the bit (maybe cut cards, maybe the game just being annoying as !@#$ but yeah.   The span of 1022 is spread over 1212  From 0x251b80-0x251c17.    
//          
//          You have to remove some of the values :(
function magnusDisplayStart() => 0x251b80

// $251B83: (bitfield)  First bits of Magnus Display
//          
//          bit0  = NOT USED
function magnusDisplayIssue40() => 0x251B83

// $251B9D: (bitfield) Magnus Display Field Issue
//          
//          bit7 = Camera 1
//          NOTE: All other bits NOT USED
function magnusDisplayIssue1() => 0x251B9D

// $251B9E: (bitfield) Magnus Display Field Issue
//          
//          bit0 = Escape
//          NOTE: All other bits NOT USED
function magnusDisplayIssue2() => 0x251B9E

// $251B9F: (bitfield) Magnus Display Field Issue
//          
//          bit0-bit5= Used
//          NOTE: All other bits NOT USED
//          
//          bit0 = Broken Earth Sphereb
//          bit1 =-Ocean Mirror
//          bit2 = Sword of the Heavens
//          bit3 = Broken Heaven Sword
//          bit4 = Broken Ocean Mirror
function magnusDisplayIssue3() => 0x251B9F

// $251BAC: (bitfield) Magnus Display Field Issue
//          
//          bit4 = NOT USED
function magnusDisplayIssue4() => 0x251BAC

// $251BAD: (bitfield) Magnus Display Field Issue
//          
//          bit5 = NOT USED
function magnusDisplayIssue5() => 0x251BAD

// $251BAE: (bitfield) Magnus Display Field Issue
//          
//          bit6 = NOT USED
function magnusDisplayIssue6() => 0x251BAE

// $251BAF: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit7 = NOT USED
function magnusDisplayIssue7() => 0x251BAF

// $251BB3: (bitfield) Magnus Display Field Issue
//          
//          bit3= NOT USED
function magnusDisplayIssue8() => 0x251BB3

// $251BB4: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue9() => 0x251BB4

// $251BB5: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue10() => 0x251BB5

// $251BB6: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue11() => 0x251BB6

// $251BB7: (bitfield) Magnus Display Field Issue
//          
//          bit0 = Tradescantia Petals
//          NO OTHER BITS USED
function magnusDisplayIssue12() => 0x251BB7

// $251BBA: (bitfield) Magnus Display Field Issue
//          
//          bit6 = Draco
//          bit7 = Vela
//          NO OTHER BITS USED
function magnusDisplayIssue13() => 0x251BBA

// $251BBB: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue14() => 0x251BBB

// $251BC8: (bitfield) Magnus Display Field Issue
//          
//          bit0-bit3 used
//          NO OTHER BITS USED
function magnusDisplayIssue15() => 0x251BC8

// $251BC9: (bitfield) Magnus Display Field Issue
//          
//          bit1 = NOT USED
//          bit7 = NOT USED
//          ALL OTHER BITS USED
function magnusDisplayIssue16() => 0x251BC9

// $251BCE: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
//          bit2 = NOT USED
//          ALL OTHER BITS USED
function magnusDisplayIssue17() => 0x251BCE

// $251BCF: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue18() => 0x251BCF

// $251bd4: (bitfield) Magnus Display Special Cards
// 
//          bit0 = Frozen Tangerine
//          bit1 = Melon
//          bit2 = Pac-Man
//          bit3 = Pac-Land
//          bit4 = Pac-Mania
//          bit5 = Peach
//          bit6 = The Peach Boy
//          bit7 = Wonder MOMO
function specialCards() => 0x251bd4

// $251be1: (bitfield) Magnus Display Special Cards
//
//          bit0 = Conditioner
//          bit1 = Hair Aftercare
//          bit2 = Hair Dryer
//          bit3 = Rare Action Figure (Kosmos) 
//          bit4 = Sweetheart Picture
//          bit5 = Broken Heart Picture 
//          bit6 = Nostalgic Picture
//          bit7 = Cursed Picture
function specialCards2() => 0x251be1

// $251BF4: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit2 = NOT USED
//          bit7 = NOT USED
function magnusDisplayIssue19() => 0x251BF4

// $251BF5: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
function magnusDisplayIssue20() => 0x251BF5

// $251BF6: (bitfield) Magnus Display Field Issue
//          
//          bit7 = NOT USED
function magnusDisplayIssue21() => 0x251BF6

// $251BFA: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
function magnusDisplayIssue22() => 0x251BFA

// $251BFB: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
//          bit2 = NOT USED
function magnusDisplayIssue23() => 0x251BFB

// $251C00: (bitfield) Magnus Display Field Issue
//          
//          bit3-bit7 = NOT USED
function magnusDisplayIssue24() => 0x251C00

// $251C01: (bitfield) Magnus Display Field Issue
//          
//          bit2 = NOT USED
//          bit3 = NOT USED
function magnusDisplayIssue25() => 0x251C01

// $251C03: (bitfield) Magnus Display Field Issue
//          
//          bit2 = NOT USED
//          bit3 = NOT USED
function magnusDisplayIssue26() => 0x251C03

// $251C04: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue27() => 0x251C04

// $251C05: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue28() => 0x251C05

// $251C07: (bitfield) Magnus Display Field Issue
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
function magnusDisplayIssue29() => 0x251C07

// $251C08: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue30() => 0x251C08

// $251C09: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue31() => 0x251C09

// $251C0A: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue32() => 0x251C0A

// $251C0B: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue33() => 0x251C0B

// $251C0C: (bitfield) Magnus Display Field Issue
//          
//          bit2 = NOT USED
//          bit3 = NOT USED
function magnusDisplayIssue34() => 0x251C0C

// $251C0D: (bitfield) Magnus Display Field Issue
//          
//          bit0-5 = NOT USED
function magnusDisplayIssue35() => 0x251C0D

// $251C0E: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue36() => 0x251C0E

// $251C0F: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue37() => 0x251C0F

// $251C14: (bitfield) Magnus Display Field Issue
//          
//          NO BITS USED
function magnusDisplayIssue38() => 0x251C14

// $251C15: (bitfield) Magnus Display Field Issue
//          
//          bit0 = Treasured Painting
//          Other Values not recorded at this time
function magnusDisplayIssue39() => 0x251C15


// NOTE: The following are repeats of the above values, but 
// $251BF4: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = NOT USED
//          bit1 = Folon
//          bit2 = NOT USED
//          bit3 = Kalas -- Angel of Darkness
//          bit4 = Agyo
//          bit5 = Malpercio
//          bit6 = Wizard Shadow
//          bit7 = NOT USED
function bossCards1() => 0x251BF4

// $251BF5: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = NOT USED
//          bit1 = Ayme
//          bit2 = Geldoblame
//          bit3 = Naiad
//          bit4 = Thalassa
//          bit5 = Despina
//          bit6 = Galatea
//          bit7 = Goddess of Ice
function bossCards2() => 0x251BF5

// $251BF6: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = Iron Beetle I
//          bit1 = Iron Beetle II
//          bit2 = Tree Guardian
//          bit3 = Magnus Giganticus
//          bit4 =Sikri
//          bit5 =Phantasm
//          bit6 =Giacomo
//          bit7 = NOT USED
function bossCards3() => 0x251BF6

// $251BF7: (bitfield) Magnus Display Boss Cards
//          
//          bit2 = Sabre Dragon
//          bit3 = Lord of the Spring
//          bit4 = Thunderfish
//          bit5 = Iron Beetle V
//          bit6 = Lord of The Winds
//          bit7 = Gnosis
function bossCards4() => 0x251BF7

// $251BFA: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
//          bit2 = Ungyo
//          bit3 = Imperial Soldier
//          bit4 = Imperial Elite
//          bit5 = Imperial Blackhelm
function bossCards5() => 0x251BFA

// $251BFB: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = NOT USED
//          bit1 = NOT USED
//          bit2 = NOT USED
//          bit3 = Sibling God: He
//          bit4 = Sibling God: Che
//          bit5 = Sibling God: Bo
//          bit6 = Sibling God: Ar
//          bit7 = Sibling God: Le
function bossCards6() => 0x251BFB

// $251c00: (bitfield) Magnus Display Field Issue and Boss Cards
//
//          bit1 = Nunkirantula
//          bit2 = Tentacle
//          bit3-bit7 = NOT USED
function bossCards7() => 0x251c00

// $251c01: (bitfield) Magnus Display Field Issue and Boss cards
//          
//          bit0 = Brolokis
//          bit1 = Rampulus
//          bit2 = NOT USED
//          bit3 = NOT USED
//          bit4 = Fadroh
//          bit5 = Sowzana
function bossCards8() => 0x251c01

// $251c02 (bitfield) Magnus Display Boss Cards
// 
//          bit7 = Kulcabaran
function bossCards9() => 0x251c02

// $251C18: (1216-bit  bitflag) Magnus Seen Bitflag
function magnusSeenStart() => 0x251C18

// $251c27: (bitfield) Magnus seen 
//
//          bit3 = Phoneix Crest Sowzana card
function phoenixCrestSeenLocation() => 0x251c27

// $251c7c :bitfield) Magnus Seen Value
// 
//          bit4 Splendid hair.  (Time delayed) 
//          Other Values not recorded at this time
function splendidHairSeenLocation() => 0x251c7c

// $251cad: (bitfield) Magnus Seen Value
//
//          bit0 = Treasured Painting  (Time delayed) 
function treasuredPaintingSeenLocation() => 0x251cad

// $251E35: (8-bit) Star Map Fragments collected
//          
//          How many of the 50 Star Map Fragments are collected.
//          
//          Does not necessarily change the items recieved.
function starFragmentsCollected() => byte(0x251E35)

// $251EE8: (32-BE) Timer for Goldoba Escape.  Appears to remain for the rest of the game.
function timerForGoldobaEscape() => byte(0x251EE8)

// $25EC98: (16-bit) First card of the SP Combo 1, Sun-Dried Wine Set
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
//          
//          Note: many of the SP Combos are 4 bytes apart, however that is NOT guarenteed, as 4 bytes is 2 cards, and some combo are 3,4,5 cards long, and one (Secret recipe) is 9! so ...
function spCombo1() => word(0x25EC98)

// $25EC9C: (16-bit) First card of the SP Combo 2, Lukewarm Rice Wine
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo2() => word(0x25EC9C)

// $25ECA0: (16-bit) First card of the SP Combo 3, Hot Rice Wine
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo3() => word(0x25ECA0)

// $25ECA4: (16-bit) First card of the SP Combo 4, Sacred Wine
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo4() => word(0x25ECA4)

// $25ECA8: (16-bit) First card of the SP Combo 5, Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo5() => word(0x25ECA8)

// $25ECB0: (16-bit) First card of the SP Combo 6, Extra Flluffy Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo6() => word(0x25ECB0)

// $25ECBA: (16-bit) First card of the SP Combo 7, Deluxe Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo7() => word(0x25ECBA)

// $25ECC4: (16-bit) First card of the SP Combo 8, Sushi Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo8() => word(0x25ECC4)

// $25ECCA: (16-bit) First card of the SP Combo 9, Roasted Squid
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo9() => word(0x25ECCA)

// $25ECD0: (16-bit) First card of the SP Combo 10, Model Boat
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo10() => word(0x25ECD0)

// $25ECD8: (16-bit) First card of the SP Combo 11, Deluxe Green Tea
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo11() => word(0x25ECD8)

// $25ECDC: (16-bit) First card of the SP Combo 12, Wasabi Root
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo12() => word(0x25ECDC)

// $25ECE0: (16-bit) First card of the SP Combo 13, Deluxe Wasabi Root
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo13() => word(0x25ECE0)

// $25ECE4: (16-bit) First card of the SP Combo 14, Deluxe Sushi
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo14() => word(0x25ECE4)

// $25ECEA: (16-bit) First card of the SP Combo 15, Sweatband
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo15() => word(0x25ECEA)

// $25ECF2: (16-bit) First card of the SP Combo 16, Poisonous Sushi
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo16() => word(0x25ECF2)

// $25ECF8: (16-bit) First card of the SP Combo 17, Karate Headband
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo17() => word(0x25ECF8)

// $25ED00: (16-bit) First card of the SP Combo 18, Freshly Baked Bread
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo18() => word(0x25ED00)

// $25ED06: (16-bit) First card of the SP Combo 19, Beef Jerky
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo19() => word(0x25ED06)

// $25ED0A: (16-bit) First card of the SP Combo 20, Grilled Hamburger
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo20() => word(0x25ED0A)

// $25ED10: (16-bit) First card of the SP Combo 21, Melted Ice Cream
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo21() => word(0x25ED10)

// $25ED16: (16-bit) First card of the SP Combo 22, Beef Stew
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo22() => word(0x25ED16)

// $25ED1E: (16-bit) First card of the SP Combo 23, Cheese Fondue
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo23() => word(0x25ED1E)

// $25ED22: (16-bit) First card of the SP Combo 24, Cheese Fondue
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo24() => word(0x25ED22)

// $25ED28: (16-bit) First card of the SP Combo 25, Green Mold
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo25() => word(0x25ED28)

// $25ED2C: (16-bit) First card of the SP Combo 26, Coat of Gallantry
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo26() => word(0x25ED2C)

// $25ED32: (16-bit) First card of the SP Combo 27, Deluxe Fireworks Set
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo27() => word(0x25ED32)

// $25ED38: (16-bit) First card of the SP Combo 28, Strange Brew
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo28() => word(0x25ED38)

// $25ED3E: (16-bit) First card of the SP Combo 29, Strawberry Milk
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo29() => word(0x25ED3E)

// $25ED44: (16-bit) First card of the SP Combo 30, Pretty Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo30() => word(0x25ED44)

// $25ED48: (16-bit) First card of the SP Combo 31, Pretty Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo31() => word(0x25ED48)

// $25ED4C: (16-bit) First card of the SP Combo 32, Root-Rotten Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo32() => word(0x25ED4C)

// $25ED50: (16-bit) First card of the SP Combo 33, Dead Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo33() => word(0x25ED50)

// $25ED54: (16-bit) First card of the SP Combo 34, Dead Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo34() => word(0x25ED54)

// $25ED58: (16-bit) First card of the SP Combo 35, Pretty Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo35() => word(0x25ED58)

// $25ED60: (16-bit) First card of the SP Combo 36, Pretty Flower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo36() => word(0x25ED60)

// $25ED66: (16-bit) First card of the SP Combo 37, DeadFlower
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo37() => word(0x25ED66)

// $25ED6E: (16-bit) First card of the SP Combo 38, Cute Doll
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo38() => word(0x25ED6E)

// $25ED72: (16-bit) First card of the SP Combo 39, Doll
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo39() => word(0x25ED72)

// $25ED76: (16-bit) First card of the SP Combo 40, Crying Doll
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo40() => word(0x25ED76)

// $25ED7A: (16-bit) First card of the SP Combo 41, Soft- Boiled Egg
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo41() => word(0x25ED7A)

// $25ED7E: (16-bit) First card of the SP Combo 42, Fried Egg
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo42() => word(0x25ED7E)

// $25ED82: (16-bit) First card of the SP Combo 43, Tonguetwister Rogue
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo43() => word(0x25ED82)

// $25ED88: (16-bit) First card of the SP Combo 44, Frozen Tangerine
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo44() => word(0x25ED88)

// $25ED8C: (16-bit) First card of the SP Combo 45, Pac-man
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo45() => word(0x25ED8C)

// $25ED96: (16-bit) First card of the SP Combo 46, Fruit Sorbet
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo46() => word(0x25ED96)

// $25ED9A: (16-bit) First card of the SP Combo 47, Fruit Tart
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo47() => word(0x25ED9A)

// $25ED9E: (16-bit) First card of the SP Combo 48, Fruit Cornucopia
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo48() => word(0x25ED9E)

// $25EDA6: (16-bit) First card of the SP Combo 49, Rotten Cornucopia
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo49() => word(0x25EDA6)

// $25EDAE: (16-bit) First card of the SP Combo 50, Seed of Headaches
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo50() => word(0x25EDAE)

// $25EDB6: (16-bit) First card of the SP Combo 51, Dog Carving
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo51() => word(0x25EDB6)

// $25EDBA: (16-bit) First card of the SP Combo 52, Monkey Carving
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo52() => word(0x25EDBA)

// $25EDBE: (16-bit) First card of the SP Combo 53, Pheasant Carving
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo53() => word(0x25EDBE)

// $25EDC2: (16-bit) First card of the SP Combo 54, Branches
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo54() => word(0x25EDC2)

// $25EDC6: (16-bit) First card of the SP Combo 55, Rotten Wood
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo55() => word(0x25EDC6)

// $25EDCA: (16-bit) First card of the SP Combo 56, Treasure
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo56() => word(0x25EDCA)

// $25EDD2: (16-bit) First card of the SP Combo 57, Strawberry Shaved Ice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo57() => word(0x25EDD2)

// $25EDD8: (16-bit) First card of the SP Combo 58, Melon Shaved Ice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo58() => word(0x25EDD8)

// $25EDDE: (16-bit) First card of the SP Combo 59, Sea Bream
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo59() => word(0x25EDDE)

// $25EDE2: (16-bit) First card of the SP Combo 60, Fresh Sashimi Set
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo60() => word(0x25EDE2)

// $25EDEA: (16-bit) First card of the SP Combo 61, Old Sashimi Set
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo61() => word(0x25EDEA)

// $25EDF2: (16-bit) First card of the SP Combo 62, Deluxe Sashimi Boat
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo62() => word(0x25EDF2)

// $25EDFC: (16-bit) First card of the SP Combo 63, RottenSashimi Boat
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo63() => word(0x25EDFC)

// $25EE06: (16-bit) First card of the SP Combo 64, Minced Skipjack
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo64() => word(0x25EE06)

// $25EE0C: (16-bit) First card of the SP Combo 65, Plum & Eel Surprise
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo65() => word(0x25EE0C)

// $25EE10: (16-bit) First card of the SP Combo 66, Rice Ball
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo66() => word(0x25EE10)

// $25EE14: (16-bit) First card of the SP Combo 67, Toasted Rice Ball
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo67() => word(0x25EE14)

// $25EE1A: (16-bit) First card of the SP Combo 68, Charcoal Broiled Eel
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo68() => word(0x25EE1A)

// $25EE20: (16-bit) First card of the SP Combo 69, Mermaid's Tear
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo69() => word(0x25EE20)

// $25EE24: (16-bit) First card of the SP Combo 70, Fire Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo70() => word(0x25EE24)

// $25EE2A: (16-bit) First card of the SP Combo 71, Aqua Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo71() => word(0x25EE2A)

// $25EE30: (16-bit) First card of the SP Combo 72, Light Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo72() => word(0x25EE30)

// $25EE36: (16-bit) First card of the SP Combo 73, Dark Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo73() => word(0x25EE36)

// $25EE3C: (16-bit) First card of the SP Combo 74, Chronos Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo74() => word(0x25EE3C)

// $25EE42: (16-bit) First card of the SP Combo 75, Wind Yell Lv 2
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo75() => word(0x25EE42)

// $25EE48: (16-bit) First card of the SP Combo 76, Fire Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo76() => word(0x25EE48)

// $25EE50: (16-bit) First card of the SP Combo 77, Aqua Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo77() => word(0x25EE50)

// $25EE58: (16-bit) First card of the SP Combo 78, Light Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo78() => word(0x25EE58)

// $25EE60: (16-bit) First card of the SP Combo 79, Dark Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo79() => word(0x25EE60)

// $25EE68: (16-bit) First card of the SP Combo 80, Chronos Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo80() => word(0x25EE68)

// $25EE70: (16-bit) First card of the SP Combo 81, Wind Yell Lv 3
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo81() => word(0x25EE70)

// $25EE78: (16-bit) First card of the SP Combo 82, Fire Yell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo82() => word(0x25EE78)

// $25EE82: (16-bit) First card of the SP Combo 83, AquaYell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo83() => word(0x25EE82)

// $25EE8C: (16-bit) First card of the SP Combo 84, Light Yell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo84() => word(0x25EE8C)

// $25EE96: (16-bit) First card of the SP Combo 85, Dark Yell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo85() => word(0x25EE96)

// $25EEA0: (16-bit) First card of the SP Combo 86, Chronos Yell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo86() => word(0x25EEA0)

// $25EEAA: (16-bit) First card of the SP Combo 87, Wind Yell Lv 4
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo87() => word(0x25EEAA)

// $25EEB4: (16-bit) First card of the SP Combo 88, Loveletter (Part 1)
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo88() => word(0x25EEB4)

// $25EEBA: (16-bit) First card of the SP Combo 89, Loveletter (Part 2)
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo89() => word(0x25EEBA)

// $25EEC0: (16-bit) First card of the SP Combo 90, Loveletter (Part 3)
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo90() => word(0x25EEC0)

// $25EEC6: (16-bit) First card of the SP Combo 91, Hate Filled Diary 1
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo91() => word(0x25EEC6)

// $25EECC: (16-bit) First card of the SP Combo 92, Lovey Dovey Diary 1
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo92() => word(0x25EECC)

// $25EED2: (16-bit) First card of the SP Combo 93, Voodoo Doll
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo93() => word(0x25EED2)

// $25EED8: (16-bit) First card of the SP Combo 94, Voodoo Doll
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo94() => word(0x25EED8)

// $25EEDC: (16-bit) First card of the SP Combo 95, Evil Ashes
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo95() => word(0x25EEDC)

// $25EEE0: (16-bit) First card of the SP Combo 96 Evil Ashes
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo96() => word(0x25EEE0)

// $25EEE4: (16-bit) First card of the SP Combo 97 Dried Persimmons
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo97() => word(0x25EEE4)

// $25EEE8: (16-bit) First card of the SP Combo 98, Firefighting Medal
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo98() => word(0x25EEE8)

// $25EEEC: (16-bit) First card of the SP Combo 99, Goddess of Victory
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo99() => word(0x25EEEC)

// $25EEF0: (16-bit) First card of the SP Combo 100, Secret Recipe 10
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo100() => word(0x25EEF0)

// $25EF02: (16-bit) First card of the SP Combo 101, Angelic Hair
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo101() => word(0x25EF02)

// $25EF0C: (16-bit) First card of the SP Combo 102, Cursed Picture
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo102() => word(0x25EF0C)

// $25EF10: (16-bit) First card of the SP Combo 103, Prophet's Notebook
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo103() => word(0x25EF10)

// $25EF14: (16-bit) First card of the SP Combo 104, Director's Notebook
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo104() => word(0x25EF14)

// $25EF18: (16-bit) First card of the SP Combo 105, Unicorn Blow Horn
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo105() => word(0x25EF18)

// $25EF1C: (16-bit) First card of the SP Combo 106, Rainbow Emblem
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo106() => word(0x25EF1C)

// $25EF20: (16-bit) First card of the SP Combo 107, John Hancock's Pen
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo107() => word(0x25EF20)

// $25EF24: (16-bit) First card of the SP Combo 108, Consolidation Pay
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo108() => word(0x25EF24)

// $25EF28: (16-bit) First card of the SP Combo 109, Beetle
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo109() => word(0x25EF28)

// $25EF2C: (16-bit) First card of the SP Combo 110, Grilled Fish
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo110() => word(0x25EF2C)

// $25EF30: (16-bit) First card of the SP Combo 111, CharredFish
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo111() => word(0x25EF30)

// $25EF34: (16-bit) First card of the SP Combo 112, Baked Potato
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo112() => word(0x25EF34)

// $25EF38: (16-bit) First card of the SP Combo 113, Monolith Brochure
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo113() => word(0x25EF38)

// $25EF3C: (16-bit) First card of the SP Combo 114, Tri-Cres Job Offer
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo114() => word(0x25EF3C)

// $25EF40: (16-bit) First card of the SP Combo 115, Stinky Beans
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo115() => word(0x25EF40)

// $25EF44: (16-bit) First card of the SP Combo 116, Fatty Tuna
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo116() => word(0x25EF44)

// $25EF48: (16-bit) First card of the SP Combo 117, Sea Urchin
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo117() => word(0x25EF48)

// $25EF4C: (16-bit) First card of the SP Combo 118, Chestnuts
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo118() => word(0x25EF4C)

// $25EF50: (16-bit) First card of the SP Combo 119, Melon
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo119() => word(0x25EF50)

// $25EF54: (16-bit) First card of the SP Combo 120, Deluxe Curry
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo120() => word(0x25EF54)

// $25EF5A: (16-bit) First card of the SP Combo 120, Curry with Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo121() => word(0x25EF5A)

// $25EF60: (16-bit) First card of the SP Combo 122, Deluxe Curry with Rice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo122() => word(0x25EF60)

// $25EF66: (16-bit) First card of the SP Combo 123, Japanese Breakfast
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo123() => word(0x25EF66)

// $25EF6C: (16-bit) First card of the SP Combo 124, Stalker LetterRice
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo124() => word(0x25EF6C)

// $25EF72: (16-bit) First card of the SP Combo 125, Doodle Book
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo125() => word(0x25EF72)

// $25EF76: (16-bit) First card of the SP Combo 126, Ice Sculpture
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo126() => word(0x25EF76)

// $25EF7A: (16-bit) First card of the SP Combo 127, Chicken Kebab
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo127() => word(0x25EF7A)

// $25EF80: (16-bit) First card of the SP Combo 128, Paper Fan
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo128() => word(0x25EF80)

// $25EF86: (16-bit) First card of the SP Combo 129, Strawberry Jam
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo129() => word(0x25EF86)

// $25EF8C: (16-bit) First card of the SP Combo 130, Western Breakfast
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo130() => word(0x25EF8C)

// $25EF92: (16-bit) First card of the SP Combo 131, Sea Urchin Surprise
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo131() => word(0x25EF92)

// $25EF96: (16-bit) First card of the SP Combo 132, Mark of Death
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo132() => word(0x25EF96)

// $25EF9A: (16-bit) First card of the SP Combo 133, Sea Bream Lunch
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo133() => word(0x25EF9A)

// $25EF9E: (16-bit) First card of the SP Combo 131, Beautiful Hair
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo134() => word(0x25EF9E)

// $25EFA6: (16-bit) First card of the SP Combo 135, Vanilla Ice Cream
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo135() => word(0x25EFA6)

// $25EFAE: (16-bit) First card of the SP Combo 136, Pet Food
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo136() => word(0x25EFAE)

// $25EFB6: (16-bit) First card of the SP Combo 137, Charred Meat
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo137() => word(0x25EFB6)

// $25EFBE: (16-bit) First card of the SP Combo 138, Ashes
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo138() => word(0x25EFBE)

// $25EFC4: (16-bit) First card of the SP Combo 139, Deluxe Charcoal
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo139() => word(0x25EFC4)

// $25EFC8: (16-bit) First card of the SP Combo 140, Charcoal
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo140() => word(0x25EFC8)

// $25EFCC: (16-bit) First card of the SP Combo 141, Holy Grail
//          
//          If set to 0x0000 then SP Combo has not been found, otherwise it's been discovered
function spCombo141() => word(0x25EFCC)

// $261838: (8-bit) Music Gathering Part 1
//          
//          bit0 = No. 1
//          bit1 = No. 2
//          bit2 = No. 3
//          bit3 = No..4
//          bit4 = No. 5
//          bit5 = No. 6
//          bit6 = No. 7
//          bit7 = No. 8
function musicGathering1() => byte(0x261838)

// $261839: (8-bit) Music Gathering Part 2
//          
//          bit0 = No. 9
//          bit1 = No. 10
//          bit2 = No. 11
//          bit3 = UNUSED
//          bit4 = UNUSED
//          bit5 = No. 12
//          bit6 = UNUSED
//          bit7 = UNUSED
function musicGathering2() => byte(0x261839)

// $26183A: (8-bit) Music Gathering Part 3
//          
//          bit0  !! Unused!!
//          bit1 = No 13 (Lull In The WInd)
//          bit2 = No. 14 Gentle Breeze
//          bit3 = No. 15
//          bit4 = No  16
//          bit5 = No. 17
//          bit6 = No. 18
//          bit7 = No. 19
function musicGathering3() => byte(0x26183A)

// $26183B: (8-bit) Music Gathering Part 4
//          
//          bit0 = No. 20
//          bit1 = No  21
//          bit2 = UNUSED
//          bit3 = No. 22
//          bit4 = No  23
//          bit5 = No. 24
//          bit6 = No. 25
//          bit7 = No. 26
function musicGathering4() => byte(0x26183B)

// $26183C: (8-bit) Music Gathering Part 5
//          
//          bit0 = No. 27
//          bit1 = No  28
//          bit2 = No. 29
//          bit3 = No. 30
//          bit4 = No  31
//          bit5 = No. 32
//          bit6 = No. 33
//          bit7 = No. 34
function musicGathering5() => byte(0x26183C)

// $26183D: (8-bit) Music Gathering Part 6
//          
//          bit0 = No. 35
//          bit1 = No  36
//          bit2 = No. 37
//          bit3 = No. 38
//          bit4 = UNUSED
//          bit5 = No. 39
//          bit6 = No. 40
//          bit7 = No. 41
function musicGathering6() => byte(0x26183D)

// $26183E: (8-bit) Music Gathering Part 7
//          
//          bit0 = No. 42
//          bit1 = UNUSED
//          bit2 = No. 43
//          bit3 = No. 44
//          bit4 = No. 45
//          bit5 = No. 46
//          bit6 = No. 47
//          bit7 = No. 48
function musicGathering7() => byte(0x26183E)

// $26183F: (8-bit) Music Gathering Part 8
//          
//          bit0 = UNUSED
//          bit1 = UNUSED
//          bit2 = No. 49
//          bit3 = No. 50
//          bit4 = No. 51
//          bit5 = UNUSED
//          bit6 = No. 52
//          bit7 = No. 53
function musicGathering8() => byte(0x26183F)

// $261840: (8-bit) Music Gathering Part 9
//          
//          bit0 = No. 54
//          bit1 = No. 55
//          bit2 = No. 56
//          bit3 = No. 57
//          bit4 = No. 58
//          bit5 = UNUSED
//          bit6 = UNUSED
//          bit7 = UNUSED
function musicGathering9() => byte(0x261840)

// $3efccd: (24-bit BE)  Pointer to Hand Information
//
//          +0x1309= (8-bit) Hand Value 1
//          Note: this will cause memory issues if it's not a valid target.
//
//          If this is 0x0000 ALL hands are not shown.
//
//          0x0000 = No Display.
//          0x0001 = No Display but don't block other rows.
//          0x0002-f = Straights  Evens straight X/2+1   Odds Straight with 9s
//          0x0002 = 2 Straights
//          0x0003 = 2 Straights with 9
//          0x0010 = Final Straight Sunset
//          0x0011 = Final Straight Sunrise
//          0x0012 = 2 cards
//          0x0013 = 2 card with 9
//          0x0014 = 2 cards 2 pair
//          0x0015 = 2 cards 3 pair
//          0x0016 = 2 cards 4 pair
//          0x0017 = 3 cards
//          0x0018 = 3 cards with 9
//          0x0019 = 3 cards 2 pair
//          0x001a = 3 cards 3 pairs
//          0x001b = 4 cards
//          0x001c = 4 cards with 9
//          0x001d = 4 cards 2 pair
//          0x001e = 5 cards
//          0x001f = 5 cards with 9
//          0x0020 = 6 cards
//          0x0021 = 6 cards with 9
//          0x0022 = 7 cards
//          0x0023 = 7 cards with 9
//          0x0024 = 8 cards
//          0x0025 = 8 cards with 9
//          0x0026 = 9 cards
//          0x0027 = 9 cards with 9
//          0x0028 = Voice
//          +0x130b= (8-bit) Hand Power 1
//          +0x1311= (8-bit) Hand Value 2
//          +0x1313= (8-bit) Hand Power 2
//          +0x1319= (8-bit) Hand Value 3
//          +0x131b= (8-bit) Hand Power 3
function pointerToHandinfo () => tbyte_be(0x3efccd)

HAND_VALUE_1_OFFSET = 0x1309
HAND_VALUE_2_OFFSET = 0x1311
HAND_VALUE_3_OFFSET = 0x1319

function handValue1() => byte(pointerToHandinfo() + HAND_VALUE_1_OFFSET)
function handValue2() => byte(pointerToHandinfo() + HAND_VALUE_2_OFFSET)
function handValue3() => byte(pointerToHandinfo() + HAND_VALUE_3_OFFSET)



BIT0 = 0
BIT1 = 1
BIT2 = 2
BIT3 = 3
BIT4 = 4
BIT5 = 5
BIT6 = 6
BIT7 = 7
LOCATION = "Location"
BIT = "Bit"
BITS = "Bits"
TITLE = "Title"
DESCRIPTION = "Description"
POINTS = "Points"
TRIGGER = "Trigger"
NAME = "Name"
PRIOR = "Prior"
POST = "Post"
WHO = "Who"
CARDS = "Cards"
COUNT = "Count"
TYPE = "Type"
PROGRESSION = "Progression"
WIN_CONDITION = "Win_Condition"
MISSABLE = "Missable"
STANDARD = ""
NO_CHARACTER = 0x00
KALAS = 0x01
XELHA = 0x02
GIBARI = 0x03
LYUDE = 0x04
SAYVNA = 0x05
MIZUTI = 0x06

bossScriptIdList = 
[
    {
        TITLE:"Saving the Lady",
        NAME: "the Sabre Dragon", 
        POINTS: 3,
        PRIOR: 0x000001f4,
        POST: 0x000002bc
    },
    {
        TITLE:"Opening the First Gate",
        NAME: "the Lord of the Spring", 
        POINTS: 5,
        PRIOR: 0x00000320,
        POST: 0x000044c
    },
    {
        TITLE:"This One Time in the Prequel",
        NAME: "Giacomo", 
        POINTS: 5,
        PRIOR: 0x708,
        POST: 0x0000834
    },
    {
        TITLE:"Bringing the Thunder",
        NAME: "the Thunderfish", 
        POINTS: 5,
        PRIOR: 0x00000bb8,
        POST: 0x0000c1c
    },
    {
        TITLE:"Fighting Among the Clouds",
        NAME: "the Iron Beetle I", 
        POINTS: 5,
        PRIOR: 0x00000e10,
        POST: 0x0000e74
    },
    {
        TITLE:"Drill, Baby, Drill",
        NAME: "the Iron Beetle V", 
        POINTS: 5,
        PRIOR: 0x00001068,
        POST: 0x0001194
    },
    {
        TITLE:"Opening the Second Gate",
        NAME: "the Lord of the Winds", 
        POINTS: 5,
        PRIOR: 0x00001324,
        POST: 0x0001388
    },
    {
        TITLE:"Taking out the Librarian",
        NAME: "Folon", 
        POINTS: 5,
        PRIOR: 0x00001770,
        POST: 0x000017d4
    },
    {
        TITLE:"Opening the Third Gate",
        NAME: "the Tree Guardian", 
        POINTS: 5,
        PRIOR: 0x000019c8,
        POST: 0x00001a2c
    },
    {
        TITLE:"Was It Something I Said?",
        NAME: "Savyna", 
        POINTS: 5,
        PRIOR: 0x00001a36,
        POST: 0x00001a90
    },
    {
        TITLE:"Xeno-What?",
        NAME: "Gnosis", 
        POINTS: 5,
        PRIOR: 0x00001d4c,
        POST: 0x00001db0
    },
    {
        TITLE:"Massive Shuffle",
        NAME: "the Magnus Giganticus", 
        POINTS: 5,
        PRIOR: 0x00002008,
        POST: 0x0000206c
    },
    {
        TITLE:"You Again?",
        NAME: "Sikri", 
        POINTS: 5,
        PRIOR: 0x000022c4,
        POST: 0x00002328
    },
    {
        TITLE:"Opening the Fourth Gate",
        NAME: "Phantasm", 
        POINTS: 5,
        PRIOR: 0x00002648,
        POST: 0x000026ac
    },
    {
        TITLE:"Time to Run",
        NAME: "the Chaotic Trio On The Goldoba", 
        POINTS: 10,
        PRIOR: 0x000029cc,
        POST: 0x00002a94
    },
    {
        TITLE:"What the Heck Was That?",
        NAME: "Geldoblame", 
        POINTS: 10,
        PRIOR: 0x00002e18,
        POST: 0x00002e22
    },
    {
        TITLE:"Passing The Test",
        NAME: "the Goddess of Ice", 
        POINTS: 3,
        PRIOR: 0x0000319c,
        POST: 0x00003200
    },
    {
        TITLE:"Eye See You",
        NAME: "Fadroh", 
        POINTS: 5,
        PRIOR: 0x000034bc,
        POST: 0x00003520
    },
    {
        TITLE:"Angel of Darkness",
        NAME: "the Angel of Darkness", 
        POINTS: 10,
        PRIOR: 0x00003584,
        POST: 0x000035e8
    },
    {
        TITLE:"Twin Doggos",
        NAME: "Agyo and Ungyo", 
        POINTS: 5,
        PRIOR: 0x00003a34,
        POST: 0x0003a98
    },
    {
        TITLE:"Is That All You Got?",
        NAME: "the Ancient God", 
        POINTS: 10,
        PRIOR: 0x0003afc,
        POST: 0x0003b60
    },
    {
        TITLE:"Our Final Meeting",
        NAME: "the CHaotic Trio at the Celestial Alps", 
        POINTS: 10,
        PRIOR: 0x00003ee4,
        POST: 0x00003f48
    },
    {
        TITLE:"The Evil God",
        NAME: "Malpercio", 
        POINTS: 25,
        PRIOR: 0x00413c,
        POST: 0x0041a0
    },
    {
        TITLE:"Wake Up!",
        NAME: "the Final Boss", 
        POINTS: 25,
        PRIOR: 0x04204,
        POST: 0x04268
    },
    {
        TITLE: "The End", 
        NAME: "True Final Boss",
        DESCRIPTION: "Reach the end of the game",
        POINTS: 50,
        PRIOR: 0x004394,
        POST: 0x0043f8,
        TYPE: WIN_CONDITION
    },
    
]

function bossScriptIdAchievement(data) 
{
    if (containsKey(data,TITLE))
    {
        title = data[TITLE]
    }
    else
    {
        title = data[NAME]
    }

    if (containsKey(data,DESCRIPTION))
    {
        description = data[DESCRIPTION]
    }
    else
    {
        description = format("Defeat {0}",data[NAME])
    }
    if (containsKey(data,TYPE))
    {
        type = data[TYPE]
    }
    else
    {
        type = PROGRESSION
    }

    achievement(title = title,
                description = description,
                type = type,
                points = data[POINTS],
                trigger = saveProtection() &&
                          prev(majorScriptId()) == data[PRIOR] &&
                          majorScriptId() == data[POST]
    )
}


for data in bossScriptIdList
{
    bossScriptIdAchievement(data)
}

// Need to identify this by boolean. 
bossBooleanList = 
[
    {
        TITLE:"Required Spider Boss",
        NAME: "the Nunkirantula", 
        POINTS: 3,
        LOCATION: eventProgress3(),
        BIT: BIT5,
        TYPE: PROGRESSION
    },
    {
        TITLE:"Putting the Ghosts to Rest",
        NAME: "Rampulus", 
        POINTS: 10,
        LOCATION: lootProgress77(),
        BIT: BIT7,
        TYPE:STANDARD
    },
    {
        TITLE:"Sand in Your Eyes",
        NAME: "Sowzana", 
        POINTS: 10,
        LOCATION: phoenixCrestSeenLocation(),
        BIT: BIT3,
        TYPE: STANDARD
    },
    {
        TITLE:"Returning to the First Boss",
        NAME: "Kulcabaran", 
        POINTS: 10,
        LOCATION: lootProgress71(),
        BIT: BIT4,
        TYPE: STANDARD
    },
    {
        TITLE:"The Shadow of the Wizard",
        NAME: "Wizard Shadow", 
        POINTS: 5,
        LOCATION: eventProgress2(),
        BIT: BIT6,
        TYPE: STANDARD
    },
    {
        TITLE:"Quite a Catch",
        NAME: "Brokolis", 
        POINTS: 10,
        LOCATION: lootProgress35(),
        BIT: BIT1,
        TYPE: STANDARD
    },
    {
        TITLE:"Beheading",
        NAME: "Sibling God: He", 
        POINTS: 5,
        LOCATION: lootProgress59(),
        BIT: BIT1,
        TYPE: PROGRESSION
    },
    {
        TITLE:"Chest Shot",
        NAME: "Sibling God: Che", 
        POINTS: 5,
        LOCATION: lootProgress59(),
        BIT: BIT2,
        TYPE: PROGRESSION
    },
    {
        TITLE:"Body Blow",
        NAME: "Sibling God: Bo", 
        POINTS: 5,
        LOCATION: lootProgress59(),
        BIT: BIT3,
        TYPE: PROGRESSION
    },
    {
        TITLE:"Disarming",
        NAME: "Sibling God: Ar", 
        POINTS: 5,
        LOCATION: lootProgress59(),
        BIT: BIT4,
        TYPE: PROGRESSION
    },
    {
        TITLE:"Grounded",
        NAME: "Sibling God: Le", 
        POINTS: 5,
        LOCATION: lootProgress59(),
        BIT: BIT5,
        TYPE: PROGRESSION
    }
]

function booleanBossAchievement(data) 
{
    if (containsKey(data,TITLE))
    {
        title = data[TITLE]
    }
    else
    {
        title = data[NAME]
    }

    if (containsKey(data,DESCRIPTION))
    {
        description = data[DESCRIPTION]
    }
    else
    {
        description = format("Defeat {0}",data[NAME])
    }

    target = bit(data[BIT], data[LOCATION])

    achievement(title = title,
                description = description,
                type = data[TYPE],
                points = data[POINTS],
                trigger = saveProtection() &&
                          prev(target) == 0 &&
                          target == 1
    )
}

for data in bossBooleanList
{
    booleanBossAchievement(data)
}

lootList = 
{
    CEBALRAI:
        [
            { LOCATION: lootProgress23(), BITS: range(BIT4,BIT6) },
            { LOCATION: lootProgress24(), BITS: [BIT4] },  // The Shish Kebab is not an evergreen item, let's not require it. 
        ],
    MOONGUILE_FOREST: 
        [
            { LOCATION: lootProgress25(), BITS: [BIT4,BIT5,BIT7] },
            { LOCATION: lootProgress26(), BITS: range(BIT0,BIT3) },
        ],
    NUNKI_VALLEY: 
        [
            { LOCATION: lootProgress26(), BITS: range(BIT4,BIT6) },
        ],
    PHERKAD: 
        [
            { LOCATION: lootProgress(), BITS: [BIT0] },
            { LOCATION: lootProgress11(), BITS: [BIT3, BIT4] },
            { LOCATION: lootProgress12(), BITS: [BIT5] },
            { LOCATION: lootProgress13(), BITS: [BIT6] },
        ],
    LORDS_MANSIONS:
        [
            { LOCATION: lootProgress11(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress12(), BITS: [BIT0, BIT2, BIT3] },
            { LOCATION: lootProgress16(), BITS: range(BIT4, BIT7) },
            { LOCATION: lootProgress17(), BITS: [BIT2] },
        ],
    NASHIRA: 
        [
            { LOCATION: lootProgress35(), BITS: [BIT2, BIT3] },
            { LOCATION: lootProgress38(), BITS: [BIT2] },
            { LOCATION: lootProgress40(), BITS: range(BIT3, BIT7) },
            { LOCATION: lootProgress41(), BITS: [BIT1, BIT2] },
        ],
    LESSER_CELESTIAL_RIVER: 
        [
            { LOCATION: lootProgress57(), BITS: range(BIT0, BIT5) },
            { LOCATION: lootProgress78(), BITS: [BIT7] },
            { LOCATION: lootProgress78(), BITS: [BIT0, BIT1] },
            { LOCATION: lootProgress81(), BITS: [BIT4] },
        ],
    CLOUD_PASSAGE: 
        [
            { LOCATION: lootProgress57(), BITS: [BIT6] },
            { LOCATION: lootProgress81(), BITS: [BIT0] },
        ],
    SHELIAK: 
        [
            { LOCATION: lootProgress59(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress60(), BITS: range(BIT0, BIT3) },
            { LOCATION: lootProgress63(), BITS: [BIT0] },
            { LOCATION: lootProgress64(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress66(), BITS: [BIT0] },
        ],
    CASTLE_ELNATH: 
        [
            { LOCATION: lootProgress74(), BITS: [BIT3] },
            { LOCATION: lootProgress75(), BITS: range(BIT2,BIT6) },
            { LOCATION: lootProgress79(), BITS: [BIT2] },
            { LOCATION: lootProgress81(), BITS: range(BIT5,BIT7) },
            { LOCATION: lootProgress82(), BITS: [BIT0] },
        ],
    ANUENUE_PORT: 
        [
            { LOCATION: lootProgress8(), BITS: [BIT2] },
            { LOCATION: lootProgress17(), BITS: range(BIT3, BIT5) },
        ],
    KOMO_MAI: 
        [
            { LOCATION: lootProgress8(), BITS: range(BIT3, BIT7) },
            { LOCATION: lootProgress9(), BITS: range(BIT0, BIT7) },
            { LOCATION: lootProgress12(), BITS: [BIT4] },
            { LOCATION: lootProgress13(), BITS: range(BIT2,BIT5) },
        ],
    ANCIENT_LIBRARY_OF_MAGIC: 
        [
            { LOCATION: lootProgress44(), BITS: [BIT3, BIT4] },
            { LOCATION: lootProgress49(), BITS: range(BIT0, BIT7) },
            { LOCATION: lootProgress50(), BITS: range(BIT0, BIT5) },
        ],
    HOLOHOLO_JUNGLE: 
        [
            { LOCATION: lootProgress48(), BITS: range(BIT4, BIT7) },
            { LOCATION: lootProgress57(), BITS: [BIT7] },
            { LOCATION: lootProgress58(), BITS: range(BIT0,BIT2) },
        ],
    OPU: 
        [
            { LOCATION: lootProgress33(), BITS: [BIT3] },
            { LOCATION: lootProgress36(), BITS: [BIT5] },
            { LOCATION: lootProgress37(), BITS: [BIT0] },
            { LOCATION: lootProgress45(), BITS: range(BIT2, BIT5) },
            { LOCATION: lootProgress51(), BITS: [BIT3] },
        ],
    CELESTIAL_TREE: 
        [
            { LOCATION: lootProgress7(), BITS: [BIT6] },
            { LOCATION: lootProgress14(), BITS: [BIT5] },
            { LOCATION: lootProgress18(), BITS: [BIT6] },
        ],
    // TRAIL_OF_SOULS:  // NOne available. 
    PARNASSE: 
        [
            { LOCATION: lootProgress39(), BITS: [BIT3, BIT4] },
            { LOCATION: lootProgress45(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress46(), BITS: [BIT0] },
        ],
    DETOURNE: 
        [
            { LOCATION: lootProgress51(), BITS: [BIT1, BIT2] },
        ],
    REVERENCE: 
        [
            { LOCATION: lootProgress75(), BITS: [BIT0, BIT1] },
        ],
    NEKTON: 
        [
            { LOCATION: lootProgress18(), BITS: [BIT7] },
            { LOCATION: lootProgress19(), BITS: [BIT0,BIT1] },
        ],
    BALANCOIRE: 
        [
            { LOCATION: lootProgress5(), BITS: [BIT6] },
            { LOCATION: lootProgress6(), BITS: range(BIT1, BIT7) },
            { LOCATION: lootProgress7(), BITS: range(BIT0, BIT5) },
            { LOCATION: lootProgress14(), BITS: range(BIT0,BIT2) },
        ],
    COCCOLITH: 
        [
            { LOCATION: lootProgress27(), BITS: [BIT6,BIT7] },
            { LOCATION: lootProgress29(), BITS: [BIT5] },
        ],
    MINTAKA: 
        [
            { LOCATION: lootProgress46(), BITS: range(BIT1, BIT6) },
            { LOCATION: lootProgress51(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress52(), BITS: range(BIT0, BIT2) },
        ],
    BATTLESHIP_GOLDOBA: 
        [
            { LOCATION: lootProgress70(), BITS: [BIT3, BIT4] },
            { LOCATION: lootProgress75(), BITS: [BIT0, BIT1] },
            { LOCATION: lootProgress79(), BITS: range(BIT3,BIT7) },
        ],
    AZHA_VILLAGE: 
        [
            { LOCATION: lootProgress3(), BITS: range(BIT6, BIT7) },
            { LOCATION: lootProgress4(), BITS: range(BIT0, BIT2) },
            { LOCATION: lootProgress5(), BITS: [BIT5] },
            { LOCATION: lootProgress8(), BITS: [BIT0, BIT1] },
            { LOCATION: lootProgress19(), BITS: [BIT2,BIT5] },
        ],
    LAVA_CAVES: 
        [
            { LOCATION: lootProgress19(), BITS: [BIT3,BIT4] },
            { LOCATION: lootProgress21(), BITS: [BIT4, BIT5] },
        ],
    IMPERIAL_FORTRESS: 
        [
            { LOCATION: lootProgress32(), BITS: [BIT4] },
            { LOCATION: lootProgress42(), BITS: range(BIT2, BIT4) },
            { LOCATION: lootProgress44(), BITS: [BIT5, BIT6] },
            { LOCATION: lootProgress45(), BITS: [BIT0, BIT1] },
            { LOCATION: lootProgress52(), BITS: range(BIT3, BIT7) },
            { LOCATION: lootProgress53(), BITS: range(BIT0, BIT7) },
            { LOCATION: lootProgress54(), BITS: range(BIT1, BIT4) },
        ],
    ICE_CLIFFS: 
        [
            { LOCATION: lootProgress27(), BITS: [BIT5] },
            { LOCATION: lootProgress28(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress43(), BITS: range(BIT0, BIT2) },
            { LOCATION: lootProgress44(), BITS: [BIT1, BIT2] },
        ],
    KAFFALJIDHMA: 
        [
            { LOCATION: lootProgress43(), BITS: range(BIT2, BIT6) },
            { LOCATION: lootProgress56(), BITS: [BIT4, BIT5] },
        ],
    CURSA: 
        [
            { LOCATION: lootProgress71(), BITS: [BIT0] },
            { LOCATION: lootProgress76(), BITS: range(BIT2, BIT5) },
        ],
    LABYRINTH_OF_DUHR: 
        [
            { LOCATION: lootProgress34(), BITS: [BIT7] },
            { LOCATION: lootProgress35(), BITS: [BIT0] },
            { LOCATION: lootProgress55(), BITS: range(BIT1,BIT7) },
            { LOCATION: lootProgress56(), BITS: [BIT0,BIT2] },
        ],
    GEMMA_VILLAGE: 
        [
            { LOCATION: lootProgress30(), BITS: [BIT0, BIT3] },
            { LOCATION: lootProgress31(), BITS: [BIT4] },
            { LOCATION: lootProgress35(), BITS: [BIT7] },
            { LOCATION: lootProgress36(), BITS: [BIT0] },
            { LOCATION: lootProgress42(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress43(), BITS: [BIT0, BIT1] },
            { LOCATION: lootProgress46(), BITS: [BIT7] },
            { LOCATION: lootProgress56(), BITS: [BIT3] },
        ],
    CAPELLA: 
        [
            { LOCATION: lootProgress47(), BITS: [BIT2] },
            { LOCATION: lootProgress54(), BITS: [BIT5] },
            { LOCATION: lootProgress58(), BITS: [BIT3, BIT4] },
        ],
    ALGORAB_VILLAGE: 
        [
            { LOCATION: lootProgress60(), BITS: range(BIT4, BIT7) },
            { LOCATION: lootProgress61(), BITS: [BIT0] },
            { LOCATION: lootProgress64(), BITS: [BIT5] },
        ],
    ZOSMA_TOWER: 
        [
            { LOCATION: lootProgress28(), BITS: range(BIT0, BIT5) },
        ],
    CELESTIAL_ALPS: 
        [
            { LOCATION: lootProgress10(), BITS: range(BIT0, BIT3) },
            { LOCATION: lootProgress19(), BITS: [BIT6,BIT7] },
            { LOCATION: lootProgress20(), BITS: range(BIT0,BIT5) },
            { LOCATION: lootProgress22(), BITS: [BIT0] },
        ],
    ILLUSORY_FORTRESS: 
        [
            { LOCATION: lootProgress20(), BITS: [BIT6, BIT7] },
            { LOCATION: lootProgress21(), BITS: range(BIT0, BIT4) },
        ],
    GREATER_CELESTIAL_RIVER: 
        [
            { LOCATION: lootProgress35(), BITS: [BIT1] },
            { LOCATION: lootProgress42(), BITS: [BIT5] },
            { LOCATION: lootProgress54(), BITS: [BIT7] },
            { LOCATION: lootProgress55(), BITS: [BIT0] },
            { LOCATION: lootProgress56(), BITS: [BIT6, BIT7] },
        ],
    PHANTOM_GOLDOBA: 
        [
            { LOCATION: lootProgress80(), BITS: range(BIT0, BIT4) },
        ],
    NIHAL_DESERT: 
        [
            { LOCATION: lootProgress10(), BITS: range(BIT4, BIT6) },
            { LOCATION: lootProgress11(), BITS: range(BIT0, BIT2) },
            { LOCATION: lootProgress21(), BITS: [BIT6, BIT7] },
        ],
    COR_HYDRAE: 
        [
            { LOCATION: lootProgress66(), BITS: range(BIT1, BIT7) },
            { LOCATION: lootProgress67(), BITS: range(BIT0, BIT7) },
            { LOCATION: lootProgress68(), BITS: range(BIT0, BIT3) },
        ],
}

// Doing it this way because I accidentally wrote the Locations before I thought about this. 
lootPointsList ={
    CEBALRAI: 2,
    MOONGUILE_FOREST: 3,
    NUNKI_VALLEY: 2,
    PHERKAD: 3,
    LORDS_MANSIONS: 5,
    NASHIRA: 3,
    LESSER_CELESTIAL_RIVER: 4,
    CLOUD_PASSAGE: 1,
    SHELIAK: 4,
    CASTLE_ELNATH: 4,
    ANUENUE_PORT: 2,
    KOMO_MAI: 5,
    ANCIENT_LIBRARY_OF_MAGIC: 5,
    HOLOHOLO_JUNGLE: 5,
    OPU: 3,
    CELESTIAL_TREE: 3,
    // TRAIL_OF_SOULS:  // NOne available. 
    PARNASSE: 3,
    DETOURNE: 2,
    REVERENCE: 1,
    NEKTON: 3,
    BALANCOIRE: 3,
    COCCOLITH: 3,
    MINTAKA: 3,
    BATTLESHIP_GOLDOBA: 5,
    AZHA_VILLAGE: 4,
    LAVA_CAVES: 4,
    IMPERIAL_FORTRESS: 10,
    ICE_CLIFFS: 5,
    KAFFALJIDHMA: 3,
    CURSA: 3,
    LABYRINTH_OF_DUHR: 5,
    GEMMA_VILLAGE: 5,
    CAPELLA: 3,
    ALGORAB_VILLAGE: 3,
    ZOSMA_TOWER: 5,
    CELESTIAL_ALPS: 5,
    ILLUSORY_FORTRESS: 3,
    GREATER_CELESTIAL_RIVER: 4,
    PHANTOM_GOLDOBA: 4,
    NIHAL_DESERT: 5,
    COR_HYDRAE: 10
}

function collectionAchievement(key) 
{
    locations = []
    for element in lootList[key]
    {
        for bitValue in element[BITS]
        {
            target = bit(bitValue, element[LOCATION])
            array_push(locations, target)
        }
    }

    type = STANDARD
    if (key == PHANTOM_GOLDOBA || key == BATTLESHIP_GOLDOBA)
    {
        type = MISSABLE
    }

    achievement(title = format("{0} Collector",key),
                description = format("Loot and earn everything from {0}.  Some missable items are not counted",DescriptionNameLookup[key]),
                type = type,
                points = lootPointsList[key],
                trigger = saveProtection() &&
                          any_of(locations, value => prev(value) == 0) &&
                          measured(sum_of(locations, value => value) == length(locations))
    )
}



for key in lootList
{
    collectionAchievement(key)
}

questList = 
[
    {
        TITLE: "Learning How to Use Quest Magnus",
        DESCRIPTION: "Earn an Ice Dagger by giving an apple to Larikush", 
        POINTS: 1,
        TRIGGER: [
            { LOCATION: lootProgress15(), BITS: [BIT0] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "And Now the Real Speedrun Begins...",
        DESCRIPTION: "Earn the fabled Shampoo by helping Maynee find her husband", 
        POINTS: 2,
        TRIGGER: [
            { LOCATION: lootProgress24(), BITS: [BIT2] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Tripadvisor: Sheliak",
        DESCRIPTION: "Earn the Anklet of Calm Winds by visiting Sheliak", 
        POINTS: 2,
        TRIGGER: [
            { LOCATION: lootProgress24(), BITS: [BIT5] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Cleaning Up" ,
        DESCRIPTION: "Help three soldiers and get rewarded after the Battle of Castle Elnath", 
        POINTS: 3,
        TRIGGER: [
            { LOCATION: lootProgress62(), BITS: [BIT7] },
            { LOCATION: lootProgress73(), BITS: [BIT1] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Here You Go Kid, Now Get Away From Me" ,
        DESCRIPTION: "Earn the Secret Recipe 7 by giving a lot of items to those annoying kids", 
        POINTS: 3,
        TRIGGER: [
            { LOCATION: lootProgress3(), BITS: [BIT5] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Quite a Trade" ,
        DESCRIPTION: "Earn a Platinum Buckle and a Cetaka's Sword for helping an old woman's backache", 
        POINTS: 2,
        TRIGGER: [
            { LOCATION: lootProgress12(), BITS: [BIT6, BIT7] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Let Me Through" ,
        DESCRIPTION: "Earn a Red Oak for sharing a Girl's Thoughts", 
        POINTS: 3,
        TRIGGER: [
            { LOCATION: lootProgress14(), BITS: [BIT4] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Hero of Mintaka",
        DESCRIPTION: "Save everyone possible during Mintaka's attack", 
        POINTS: 5,
        TRIGGER: [
            { LOCATION: eventProgress5(), BITS: [BIT1] },
            { LOCATION: eventProgress6(), BITS: [BIT0, BIT2, BIT3, BIT5] },
            { LOCATION: eventProgress7(), BITS: [BIT1, BIT2] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "It Belongs in a Museum!",
        DESCRIPTION: "Earn a Broken Birdie by completing the Balancoire Museum Collection", 
        POINTS: 5,
        TRIGGER: [
            { LOCATION: lootProgress14(), BITS: [BIT7] }
        ],
        TYPE: MISSABLE
    },
    {
        TITLE: "Glad I'm Not Cleaning That Up",
        DESCRIPTION: "Earn a Firedrake Fist by complete the Balancoire Kids quest", 
        POINTS: 5,
        TRIGGER: [
            { LOCATION: lootProgress14(), BITS: [BIT3] }
        ],
        TYPE: STANDARD
    },
    {
        TITLE: "Could You Repeat That?" ,
        DESCRIPTION: "Earn a Rainbow Ash by putting on a second Shrine Progression", 
        POINTS: 5,
        TRIGGER: [
            { LOCATION: lootProgress13(), BITS: [BIT1] }
        ],
        TYPE: STANDARD
    },
    {
        TITLE: "Very Sorry For Your Loss" ,
        DESCRIPTION: "Earn a Golden Bugle by giving two widows in Kaffaljidhma something to remember their husbands with", 
        POINTS: 3,
        TRIGGER: [
            { LOCATION: lootProgress34(), BITS: [BIT6] }
        ],
        TYPE: MISSABLE
    }
]

function questAchievement(data) 
{
    locations = []
    for element in data[TRIGGER]
    {
        for bitValue in element[BITS]
        {
            target = bit(bitValue, element[LOCATION])
            array_push(locations, target)
        }
    }

    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                type = data[TYPE],
                points = data[POINTS],
                trigger = saveProtection() &&
                          any_of(locations, value => prev(value) == 0) &&
                          measured(sum_of(locations, value => value) == length(locations))
    )
}

for data in questList
{
    questAchievement(data)
}

optionalQuestsList =
[
    {
        TITLE: "An Expensive Dessert",
        DESCRIPTION: "Earn a dessert for a gold nugget in Balancoire", 
        POINTS: 2,
        TRIGGER: [
            { LOCATION: lootProgress5(), BITS: [BIT7] },
            { LOCATION: lootProgress6(), BITS: [BIT0] }
        ]
    }
]

function optionalQuestAchievement(data) 
{
    locations = []
    for element in data[TRIGGER]
    {
        for bitValue in element[BITS]
        {
            target = bit(bitValue, element[LOCATION])
            array_push(locations, target)
        }
    }

    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                type = STANDARD,
                points = data[POINTS],
                trigger = saveProtection() &&
                          any_of(locations, value => prev(value) == 0 && value == 1) 
    )
}

for data in optionalQuestsList
{
    optionalQuestAchievement(data)
}

spCombos = 
[
    spCombo1(),
    spCombo2(),
    spCombo3(),
    spCombo4(),
    spCombo5(),
    spCombo6(),
    spCombo7(),
    spCombo8(),
    spCombo9(),
    spCombo10(),
    spCombo11(),
    spCombo12(),
    spCombo13(),
    spCombo14(),
    spCombo15(),
    spCombo16(),
    spCombo17(),
    spCombo18(),
    spCombo19(),
    spCombo20(),
    spCombo21(),
    spCombo22(),
    spCombo23(),
    spCombo24(),
    spCombo25(),
    spCombo26(),
    spCombo27(),
    spCombo28(),
    spCombo29(),
    spCombo30(),
    spCombo31(),
    spCombo32(),
    spCombo33(),
    spCombo34(),
    spCombo35(),
    spCombo36(),
    spCombo37(),
    spCombo38(),
    spCombo39(),
    spCombo40(),
    spCombo41(),
    spCombo42(),
    spCombo43(),
    spCombo44(),
    spCombo45(),
    spCombo46(),
    spCombo47(),
    spCombo48(),
    spCombo49(),
    spCombo50(),
    spCombo51(),
    spCombo52(),
    spCombo53(),
    spCombo54(),
    spCombo55(),
    spCombo56(),
    spCombo57(),
    spCombo58(),
    spCombo59(),
    spCombo60(),
    spCombo61(),
    spCombo62(),
    spCombo63(),
    spCombo64(),
    spCombo65(),
    spCombo66(),
    spCombo67(),
    spCombo68(),
    spCombo69(),
    spCombo70(),
    spCombo71(),
    spCombo72(),
    spCombo73(),
    spCombo74(),
    spCombo75(),
    spCombo76(),
    spCombo77(),
    spCombo78(),
    spCombo79(),
    spCombo80(),
    spCombo81(),
    spCombo82(),
    spCombo83(),
    spCombo84(),
    spCombo85(),
    spCombo86(),
    spCombo87(),
    spCombo88(),
    spCombo89(),
    spCombo90(),
    spCombo91(),
    spCombo92(),
    spCombo93(),
    spCombo94(),
    spCombo95(),
    spCombo96(),
    spCombo97(),
    spCombo98(),
    spCombo99(),
    spCombo100(),
    spCombo101(),
    spCombo102(),
    spCombo103(),
    spCombo104(),
    spCombo105(),
    spCombo106(),
    spCombo107(),
    spCombo108(),
    spCombo109(),
    spCombo110(),
    spCombo111(),
    spCombo112(),
    spCombo113(),
    spCombo114(),
    spCombo115(),
    spCombo116(),
    spCombo117(),
    spCombo118(),
    spCombo119(),
    spCombo120(),
    spCombo121(),
    spCombo122(),
    spCombo123(),
    spCombo124(),
    spCombo125(),
    spCombo126(),
    spCombo127(),
    spCombo128(),
    spCombo129(),
    spCombo130(),
    spCombo131(),
    spCombo132(),
    spCombo133(),
    spCombo134(),
    spCombo135(),
    spCombo136(),
    spCombo137(),
    spCombo138(),
    spCombo139(),
    spCombo140(),
    spCombo141()
]

function spComboAchievements(title, targetValue)
{
    points = 5
    if (targetValue == 141)
    {
        points = 25
    }
    achievement(title = title,
                description = format("Discover {0} SP combos",targetValue),
                points = points,
                trigger = saveProtection() && 
                          sum_of(spCombos, value => prev(value)/ prev(value)) < targetValue &&
                          measured(sum_of(spCombos, value => value/value) == targetValue) 
    )
}

TOTAL_SP_COMBOS = 141
TENTH_SP_TOTAL_COMBOS = TOTAL_SP_COMBOS / 10

spComboAchievements("SP Combos Discovery I", 1 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery II", 2 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery III", 3 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery IV", 4 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery V", 5 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery VI", 6 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery VII", 7 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery VIII", 8 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery IX", 9 * TENTH_SP_TOTAL_COMBOS)
spComboAchievements("SP Combos Discovery X", TOTAL_SP_COMBOS)

displayIssues = 
[    
    { LOCATION: magnusDisplayIssue40(), BITS: [BIT0] },
    { LOCATION: magnusDisplayIssue1(), BITS: range(BIT0, BIT6) },
    { LOCATION: magnusDisplayIssue2(), BITS: range(BIT1, BIT7) },
    { LOCATION: magnusDisplayIssue3(), BITS: range(BIT5, BIT7) },
    { LOCATION: magnusDisplayIssue4(), BITS: [BIT4] },
    { LOCATION: magnusDisplayIssue5(), BITS: [BIT5] },
    { LOCATION: magnusDisplayIssue6(), BITS: [BIT6] },
    { LOCATION: magnusDisplayIssue7(), BITS: [BIT0,BIT7] },
    { LOCATION: magnusDisplayIssue8(), BITS: [BIT3] },
    { LOCATION: magnusDisplayIssue9(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue10(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue11(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue12(), BITS: range(BIT1, BIT7) },
    { LOCATION: magnusDisplayIssue13(), BITS: range(BIT0, BIT5) },
    { LOCATION: magnusDisplayIssue14(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue15(), BITS: range(BIT4, BIT7) },
    { LOCATION: magnusDisplayIssue16(), BITS: [BIT1, BIT7] },
    { LOCATION: magnusDisplayIssue17(), BITS: range(BIT0, BIT2) },
    { LOCATION: magnusDisplayIssue18(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue19(), BITS: [BIT0, BIT2, BIT7] },
    { LOCATION: magnusDisplayIssue20(), BITS: [BIT0] },
    { LOCATION: magnusDisplayIssue21(), BITS: [BIT7] },
    { LOCATION: magnusDisplayIssue22(), BITS: [BIT0, BIT1] },
    { LOCATION: magnusDisplayIssue23(), BITS: range(BIT0, BIT2) },
    { LOCATION: magnusDisplayIssue24(), BITS: range(BIT3, BIT7) },
    { LOCATION: magnusDisplayIssue25(), BITS: [BIT2, BIT3] },
    { LOCATION: magnusDisplayIssue26(), BITS: [BIT2, BIT3] },
    { LOCATION: magnusDisplayIssue27(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue28(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue29(), BITS: [BIT0, BIT1] },
    { LOCATION: magnusDisplayIssue30(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue31(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue32(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue33(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue34(), BITS: [BIT2, BIT3] },
    { LOCATION: magnusDisplayIssue35(), BITS: range(BIT0, BIT5) },
    { LOCATION: magnusDisplayIssue36(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue37(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue38(), BITS: range(BIT0, BIT7) },
    { LOCATION: magnusDisplayIssue39(), BITS: range(BIT1, BIT7) },
]


MAGNUS_TOTAL_BITS = 1216
MAGNUS_ACHIEVEMENT_CARDS = 1020
MAGNUS_TOTAL_CARDS = 1022
// This is the bit locations of every value 
fullMagnusLocations = range(0, MAGNUS_TOTAL_BITS - 1)

// Achievement counts will not include Splendid hair or Treasured Painting
correctAchievementCombinationLocations = []
correctAchievementReduceCombinationLocations = []
correctAchievementPrevCombinationLocations = []
correctAchievementPrevReduceCombinationLocations = []
// Count all the cards including the Splendid Hair and Treasured Painting
correctRPCombinationLocations = []
correctRPReduceCombinationLocations = []
// No prev needed on RP

TRUE = 1
FALSE = 0
// This is kind of a crazy idea, but we're going to take every error location, calculate the offset and delete it from 
function calculateCorrectMagnusLocations()
{
    // Cycle through all index.
    for bitOffset in fullMagnusLocations
    {
        // Calculate the offset and bit.
        offset = bitOffset / 8
        targetBit = bitOffset % 8

        // Set data to good. 
        data = TRUE

        // Cycle through all Bad datas. 
        for badData in displayIssues
        {
            // If bad data Location is the same as the offset.  Mark data as bad.
            if(badData[LOCATION] == magnusDisplayStart() + offset)
            {
                for bitValue in badData[BITS]
                {
                    if(bitValue == targetBit)
                    {
                        data = FALSE
                    }
                }
            }
        }  
        
        achievementValid = TRUE
        // Hardcoded.
        if ((targetBit == BIT4 && magnusSeenStart() + offset == splendidHairSeenLocation()) &&
            (targetBit == BIT0 && magnusSeenStart() + offset == treasuredPaintingSeenLocation()))
        {
            achievementValid = FALSE
        }
        
        // If data is still good, mark data as good for SEEN field, not Display field. 
        if (data == TRUE)
        {
            array_push(correctRPCombinationLocations, bit(targetBit, magnusSeenStart() + offset) + bit(targetBit, magnusDisplayStart() + offset) )
            array_push(correctRPReduceCombinationLocations, bit(targetBit, magnusSeenStart() + offset) / bit(targetBit, magnusDisplayStart() + offset) )
            
            if (achievementValid == TRUE)
            {
                array_push(correctAchievementCombinationLocations, bit(targetBit, magnusSeenStart() + offset) + bit(targetBit, magnusDisplayStart() + offset) )
                array_push(correctAchievementReduceCombinationLocations, bit(targetBit, magnusSeenStart() + offset) / bit(targetBit, magnusDisplayStart() + offset) )
                array_push(correctAchievementPrevCombinationLocations, prev(bit(targetBit, magnusSeenStart() + offset)) + prev(bit(targetBit, magnusDisplayStart() + offset)) )
                array_push(correctAchievementPrevReduceCombinationLocations, prev(bit(targetBit, magnusSeenStart() + offset)) / prev(bit(targetBit, magnusDisplayStart() + offset)) )
            }   
        }
    }
}

calculateCorrectMagnusLocations()


function magnusCollectionAchievement(id, title, targetValue, type)
{
    points = 10
    if (targetValue == MAGNUS_ACHIEVEMENT_CARDS)
    {
        points = 50
    }
    achievement(id = id,
                title = title,
                description = format("Discover {0} Magnus Cards. Splendid Hair and Treasured Painting are not counted",targetValue),
                type = type,
                points = points,
                trigger = saveProtection() && 
                          sum_of(correctAchievementPrevCombinationLocations, value => value) - sum_of(correctAchievementPrevReduceCombinationLocations, value => value) < targetValue &&
                          sum_of(correctAchievementCombinationLocations, value => value) - sum_of(correctAchievementReduceCombinationLocations, value => value) >= targetValue
                          // NOTE: This intentionally does not have measured because everything adds cards.
    )
}

MAGNUS_ACHIEVEMENT_CARDS_TENTH = MAGNUS_ACHIEVEMENT_CARDS/10

magnusCollectionAchievement(403458, "Magnus Collector I", 1 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403459, "Magnus Collector II", 2 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403460, "Magnus Collector III", 3 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403461, "Magnus Collector IV", 4 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403462, "Magnus Collector V", 5 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403463, "Magnus Collector VI", 6 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403464, "Magnus Collector VII", 7 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403465, "Magnus Collector VIII", 8 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403466, "Magnus Collector IX", 9 * MAGNUS_ACHIEVEMENT_CARDS_TENTH, STANDARD)
magnusCollectionAchievement(403467, "Waiting for 100%", MAGNUS_ACHIEVEMENT_CARDS, MISSABLE)

cameraAchievementList = 
[
    {
        TITLE: "Portfolio: Sadal Suud" ,
        DESCRIPTION: " Register a picture in the Magnus Gathering of the Sabre Dragon, the Lord of the Spring, and the Nunkirantula from the Sadal Suud nation", 
        POINTS: 5,
        CARDS: [
            { LOCATION: bossCards4(), BITS: [BIT2, BIT3] },
            { LOCATION: bossCards7(), BITS: [BIT1] }
        ],
        TYPE: MISSABLE,
        ID: 403468
    },
    {
        TITLE: "Portfolio: Diadem" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of the Thunderfish, the Iron Beetle I, the Iron Beetle V, and the Lord of the Winds from the Diadem nation", 
        POINTS: 5,
        CARDS: [
            { LOCATION: bossCards4(), BITS: [BIT4, BIT5, BIT6] },
            { LOCATION: bossCards3(), BITS: [BIT0] }
        ],
        TYPE: MISSABLE,
        ID: 403469
    },
    {
        TITLE: "Portfolio: Anuenue" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of the Tree Guardian and the Tentacle from the Anuenue nation", 
        POINTS: 2,
        CARDS: [
            { LOCATION: bossCards3(), BITS: [BIT2] },
            { LOCATION: bossCards7(), BITS: [BIT2] }
        ],
        TYPE: MISSABLE,
        ID: 403470
    },
    {
        TITLE: "Portfolio: Mira" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of Gnosis, Magnus Giganticus, Sikri, and Phantasm from the Mira nation", 
        POINTS: 5,
        CARDS: [
            { LOCATION: bossCards4(), BITS: [BIT7] },
            { LOCATION: bossCards3(), BITS: [BIT3, BIT4, BIT5] }
        ],
        TYPE: MISSABLE,
        ID: 403471
    },
    {
        TITLE: "Portfolio: Alfard" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of Geldoblame, Fadroh, and the Angel of Darkness from  the Alfard nation", 
        POINTS: 5,
        CARDS: [
            { LOCATION: bossCards2(), BITS: [BIT2] },
            { LOCATION: bossCards8(), BITS: [BIT4] },
            { LOCATION: bossCards1(), BITS: [BIT3] }
        ],
        TYPE: MISSABLE,
        ID: 403472
    },
    {
        TITLE: "Portfolio: Reforming Party" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of Naiad, Thalassa, Despina, and Galatea", 
        POINTS: 5,
        CARDS: [
            { LOCATION: bossCards2(), BITS: range(BIT3, BIT6) }
        ],
        TYPE: MISSABLE,
        ID: 403473
    },
    {
        TITLE: "Portfolio: Wazn" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of the Goddess of Ice from the Wazn nation", 
        POINTS: 1,
        CARDS: [
            { LOCATION: bossCards2(), BITS: [BIT7] }
        ],
        TYPE: MISSABLE,
        ID: 403474
    },
    {
        TITLE: "Portfolio: Duhr" ,
        DESCRIPTION: "Register a picture in the Magnus Gathering of Agyo and Ugyo from the Duhr nation",
        POINTS: 2,
        CARDS:[
            { LOCATION: bossCards1(), BITS: [BIT4] },
            { LOCATION: bossCards5(), BITS: [BIT2] }
        ],
        TYPE: MISSABLE,
        ID: 403475
    },
    {
        TITLE: "Portfolio: The World",
        DESCRIPTION: "Register a picture in the Magnus Gathering of Rampulus, Sowzana, Kulcabaran, Wizard Shadow, Brokolis, and the Chaotic Trio from the bonus dungeons",
        POINTS: 5,
        CARDS:[
            { LOCATION: bossCards8(), BITS: [BIT0, BIT1, BIT5] },
            { LOCATION: bossCards9(), BITS: [BIT7] },
            { LOCATION: bossCards1(), BITS: [BIT1, BIT6] },
            { LOCATION: bossCards3(), BITS: [BIT6] },
            { LOCATION: bossCards2(), BITS: [BIT1] }
        ],
        TYPE: MISSABLE,
        ID: 403476
    },
    {
        TITLE: "Portfolio: Finale",
        DESCRIPTION: "Register a picture in the Magnus Gathering of the five Sibling Gods and the Final Boss from the finale of the story",
        POINTS: 10,
        CARDS:[
            { LOCATION: bossCards6(), BITS: range(BIT3, BIT7) },
            { LOCATION: bossCards1(), BITS: [BIT0] }
        ],
        TYPE: MISSABLE,
        ID: 403477
    }
]

function cardAchievement(data) 
{
    additionValues = []
    reduceValues =[]
    prevNotOwned = []
    prevReduceValues = []
    for element in data[CARDS]
    {
        for bitValue in element[BITS]
        {
            offset = element[LOCATION] - magnusDisplayStart()
            array_push(additionValues, bit(bitValue, magnusSeenStart() + offset) + bit(bitValue, magnusDisplayStart() + offset) )
            array_push(reduceValues, bit(bitValue, magnusSeenStart() + offset) / bit(bitValue, magnusDisplayStart() + offset) )
            array_push(prevNotOwned, prev(bit(bitValue, magnusSeenStart() + offset)) == 0 && prev(bit(bitValue, magnusDisplayStart() + offset)) == 0 )
        }
    }

    achievement(id = data[ID],
                title = data[TITLE],
                description = data[DESCRIPTION],
                type = data[TYPE],
                points = data[POINTS],
                trigger = saveProtection() &&
                          any_of(prevNotOwned, value => value) &&
                          measured(sum_of(additionValues, value => value) - sum_of(reduceValues, value => value) == length(additionValues))
    )
}

for data in cameraAchievementList
{
    cardAchievement(data)
}

specialCardList =
[
  {
        TITLE: "He's Now a 3-D Pizza",
        DESCRIPTION: "Find the Pac-Mania card",
        POINTS: 2,
        CARDS:[
            { LOCATION: specialCards(), BITS: [BIT4] }
        ],
        TYPE: STANDARD
    },
    {
        TITLE: "Is There a Set For That?",
        DESCRIPTION: "Find the Wonder MOMO card",
        POINTS: 2,
        CARDS:[
            { LOCATION: specialCards(), BITS: [BIT7] }
        ],
        TYPE: STANDARD
    },
    {
        TITLE: "Cosmic Guardian",
        DESCRIPTION: "Find the Rare Action Figure card",
        POINTS: 1,
        CARDS:[
            { LOCATION: specialCards2(), BITS: [BIT3] }
        ],
        TYPE: STANDARD
    }
]

for data in specialCardList
{
    cardAchievement(data)
}

STAR_FRAGMENTS = 50

function starFragmentAchievement(title, targetValue)
{
    points = 4
    if (targetValue >= 40)
    {
        points = 5
    }
    if (targetValue == STAR_FRAGMENTS)
    {
        points = 25
    }
    achievement(title = title,
                description = format("Deliver {0} Constellations",targetValue),
                points = points,
                trigger = saveProtection() && 
                          prev(starFragmentsCollected()) < targetValue &&
                          measured(starFragmentsCollected() == targetValue) 
    )
}
starFragmentAchievement("Skywatcher", 5)
starFragmentAchievement("Celestial Observer", 10)
starFragmentAchievement("Star Gazer", 15)
starFragmentAchievement("Amateur Astronomer", 20)
starFragmentAchievement("Astronomer", 25)
starFragmentAchievement("Astrobiologist", 30)
starFragmentAchievement("Space Scientist", 35)
starFragmentAchievement("Planetary Scientist", 40) 
starFragmentAchievement("Cosmologist", 45)
starFragmentAchievement("Astrophysicist", 50) 

rich_presence_display("Magnus collection: {0}/1022 SP Combo: {1}/141",
    rich_presence_value("VALUE", sum_of(correctRPCombinationLocations, value => value) - sum_of(correctRPReduceCombinationLocations, value => value)),
    rich_presence_value("VALUE", sum_of(spCombos, value => value/value))
)

familyLocations = 
[
    { LOCATION: (QUZMAN_FAMILY_MEMORY_LOCATION + 0), BITS: range(BIT4, BIT7) },
    { LOCATION: (QUZMAN_FAMILY_MEMORY_LOCATION + 1), BITS: range(BIT0, BIT7) },
    { LOCATION: (QUZMAN_FAMILY_MEMORY_LOCATION + 2), BITS: range(BIT0, BIT7) },
    { LOCATION: (QUZMAN_FAMILY_MEMORY_LOCATION + 3), BITS: range(BIT0, BIT7) },
    { LOCATION: (QUZMAN_FAMILY_MEMORY_LOCATION + 4), BITS: range(BIT0, BIT3) },
    { LOCATION: quzmanEnding(), BITS: [BIT3] }
]

familyAchievements  =
[
  {
        TITLE: "Gathering Threads",
        DESCRIPTION: "Find 5 members of the Quzman family",
        POINTS: 3,
        COUNT:5
    },
    {
        TITLE: "Rekindling Bonds",
        DESCRIPTION: "Find 10 members of the Quzman family",
        POINTS: 4,
        COUNT:10
    },
    {
        TITLE: "Uniting Roots",
        DESCRIPTION: "Find 15 members of the Quzman family",
        POINTS: 5,
        COUNT:15
    },
    {
        TITLE: "Harmony Restored",
        DESCRIPTION: "Find 20 members of the Quzman family",
        POINTS: 5,
        COUNT:20
    },
    {
        TITLE: "Hearts Entwined",
        DESCRIPTION: "Find 25 members of the Quzman family",
        POINTS: 5,
        COUNT:25
    },
    {
        TITLE: "Legacy Embraced",
        DESCRIPTION: "Find 30 members of the Quzman family",
        POINTS: 10,
        COUNT:30
    },
    {
        TITLE: "A Full Circle",
        DESCRIPTION: "See the ending of the Quzman's questline",
        POINTS: 25,
        COUNT:33
    }

]


function bitfieldCountAchievement(data, values)
{
    targetBits = []
    for element in values
    {
        for bitValue in element[BITS]
        {
            array_push(targetBits, bit(bitValue, element[LOCATION]))
            
        }
    }

    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = saveProtection() && 
                          sum_of(targetBits, value => prev(value)) < data[COUNT] &&
                          measured(sum_of(targetBits, value => value) == data[COUNT]) 
    )
}


for data in familyAchievements
{
    bitfieldCountAchievement(data, familyLocations)
}


animalLocations = 
[
    { LOCATION: (ANIMALS_DELIVERED_MEMORY_LOCATION + 0), BITS: range(BIT1, BIT7) },
    { LOCATION: (ANIMALS_DELIVERED_MEMORY_LOCATION + 1), BITS: range(BIT0, BIT7) },
    { LOCATION: (ANIMALS_DELIVERED_MEMORY_LOCATION + 2), BITS: range(BIT0, BIT4) }
]

animalAchievements  =
[
  {
        TITLE: "Zoo Enthusiast",
        DESCRIPTION: "Deliver 8 animals to Wazn",
        POINTS: 5,
        COUNT:8
    },
    {
        TITLE: "Zoo Master",
        DESCRIPTION: "Deliver all 17 animals to Wazn",
        POINTS: 10,
        COUNT:17
    }
]
for data in animalAchievements
{
    bitfieldCountAchievement(data, animalLocations)
}

joiningAchievementsList  =
[
  {
        TITLE: "Mysterious Woman",
        DESCRIPTION: "Have Xelha join the party",
        POINTS: 1,
        WHO: XELHA
    },
    {
        TITLE: "Mysterious Fisherman",
        DESCRIPTION: "Have Gibari join the party",
        POINTS: 1,
        WHO: GIBARI
    },
    {
        TITLE: "Mysterious Former Soldier",
        DESCRIPTION: "Have Lyude join the party",
        POINTS: 1,
        WHO: LYUDE
    },
    {
        TITLE: "Mysterious Hunter",
        DESCRIPTION: "Have Savyna join the party",
        POINTS: 2,
        WHO: SAYVNA
    },
    {
        TITLE: "Mysterious Mystery",
        DESCRIPTION: "Have Mizuti join the party",
        POINTS: 3,
        WHO: MIZUTI
    }
]

rejoiningAchievementsList  =
[
    {
        TITLE: "Cloud Rider",
        DESCRIPTION: "Defeat Naiad and find what they were guarding",
        POINTS: 3,
        WHO: GIBARI
    },
    {
        TITLE: "Burning Love",
        DESCRIPTION: "Defeat Galatea and find what they were guarding",
        POINTS: 3,
        WHO: LYUDE
    },
    {
        TITLE: "Whacky Weed",
        DESCRIPTION: "Defeat Thalassa and find what they were guarding",
        POINTS: 3,
        WHO: SAYVNA
    },
    {
        TITLE: "Planting a Seed",
        DESCRIPTION: "Defeat Despina and find what they were guarding",
        POINTS: 4,
        WHO: MIZUTI
    }
]

function joiningAchievements(data)
{

    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                type = PROGRESSION,
                points = data[POINTS],
                trigger = saveProtection() && 
                          any_of( range(1,6), index => byte(CHARACTER_ORDER_LOCATION + index - 1) == data[WHO] &&
                                                       prev(byte(CHARACTER_ORDER_LOCATION + index - 1)) == NO_CHARACTER &&
                                                       (CHARACTER_ORDER_LOCATION + 6) >= index  // probably could be == but that's it. 
                                ) &&
                          any_of( range(1,6), index => byte(CHARACTER_ORDER_LOCATION + index - 1) == KALAS &&
                                                       (CHARACTER_ORDER_LOCATION + 6) >= index  
                                )
                        
    )
}


function rejoiningAchievements(data)
{

    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                type = PROGRESSION,
                points = data[POINTS],
                trigger = saveProtection() && 
                          any_of( range(1,6), index => byte(CHARACTER_ORDER_LOCATION + index - 1) == data[WHO] &&
                                                       prev(byte(CHARACTER_ORDER_LOCATION + index - 1)) == NO_CHARACTER &&
                                                       (CHARACTER_ORDER_LOCATION + 6) >= index  // probably could be == but that's it. 
                                )  &&
                          none_of( range(1,6), index => byte(CHARACTER_ORDER_LOCATION + index - 1) == KALAS &&
                                                       (CHARACTER_ORDER_LOCATION + 6) >= index  
                                 ) &&
                          majorScriptId() == 0x00002f4e
    )
}



for data in joiningAchievementsList
{
    joiningAchievements(data)
}

for data in rejoiningAchievementsList
{
    rejoiningAchievements(data)
}

maxClassLevelList  =
[
    {
        TITLE: "Amazing Angel",
        DESCRIPTION: "Reach max class level with Kalas",
        POINTS: 5,
        WHO: KALAS
    },
    {
        TITLE: "Master Magician",
        DESCRIPTION: "Reach max class level with Xelha",
        POINTS: 5,
        WHO: XELHA
    },
    {
        TITLE: "Fantastic Fisherman",
        DESCRIPTION: "Reach max class level with Gibari",
        POINTS: 5,
        WHO: GIBARI
    },
    {
        TITLE: "Solid Soldier",
        DESCRIPTION: "Reach max class level with Lyude",
        POINTS: 5,
        WHO: LYUDE
    },
    {
        TITLE: "Honorable Hunter",
        DESCRIPTION: "Reach max class level with Sayvna",
        POINTS: 5,
        WHO: SAYVNA
    },
    {
        TITLE: "The Great Mizuti",
        DESCRIPTION: "Reach max class level with Mizuti",
        POINTS: 5,
        WHO: MIZUTI
    }
]


PREV_CLASS_VALUE = 0x05
TARGET_CLASS_VALUE = 0x06
function classLevelAchievement(data)
{
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = saveProtection() && 
                          prev(classValue( data[WHO] )) == PREV_CLASS_VALUE &&
                          classValue(data[WHO]) == TARGET_CLASS_VALUE
    )
}

for data in maxClassLevelList
{
    classLevelAchievement(data)
}

TOTAL_MAGNUS_IN_MINDEER_MINIGAME = 12
achievement(title = "Trail of Souls Collector",
            description = "Earn all 12 cards from the Mindeer minigame",
            type = MISSABLE,
            points = 5,
            trigger = saveProtection() &&
                      mindeerMinigameCheck(TOTAL_MAGNUS_IN_MINDEER_MINIGAME) &&
                      majorScriptId() == 0x00001d4c
)

achievement(title = "Naked Detourne",
            description = "Beat the Detourne Boss without getting any special items from the Golden Hero",
            type = MISSABLE,
            points = 5,
            trigger = saveProtection() &&
                      detoroneValuableItemsCheck() &&
                      prev(majorScriptId()) == 0x00002008 &&
                      majorScriptId() == 0x0000206c
)

NO_CARD_HAND = 0x000
VOICE =0x0028
PAIR = 0x0012
PAIR_NINE = 0x0013
TRIPLE = 0x0017
TRIPLE_NINE = 0x0018
TRIPLE_TRIPLE = 0x001a
FOUR_OF_A_KIND = 0x001b
FOUR_NINES = 0x001c
FIVE_OF_A_KIND = 0x001e
FIVE_NINES = 0x001f
NINE_OF_A_KIND = 0x0026
NINE_NINES = 0x0027
SUNRISE = 0x0011
SUNSET = 0x0010
FOUR_STRAIGHT = 0x0006
FOUR_STRAIGHT_NINE = 0x0007
FIVE_STRAIGHT = 0x0008
FIVE_STRAIGHT_NINE = 0x0009
SIX_STRAIGHT = 0x000a
SIX_STRAIGHT_NINE = 0x00b

function finalValue(targetValue) => (targetValue == NO_CARD_HAND || 
                                   targetValue == VOICE)

function matchHand(targetValue, targetHand) => targetValue == targetHand &&
                                               prev(targetValue) != targetHand
function matchOnlyHand(targetValue, targetHand) => targetValue == targetHand

cardHandList  =
[
    {
        TITLE: "Quatro Magio",
        DESCRIPTION: "Make a 'four of a kind' hand combo in a single turn. (No other pairs)",
        POINTS: 3,
        TRIGGER: (( matchOnlyHand(handValue1(), FOUR_OF_A_KIND) ||
                   matchOnlyHand(handValue1(), FOUR_NINES)) &&
                  ((prev(handValue1()) != FOUR_OF_A_KIND &&
                    prev(handValue1()) != FOUR_NINES ) ||
                   (prev(handValue2()) != VOICE &&
                    prev(handValue2()) != NO_CARD_HAND)) &&
                  finalValue(handValue2()) )
    },
    {
        TITLE: "Quintuples",
        DESCRIPTION: "Make a 'five of a kind' hand combo in a single turn. (No other pairs)",
        POINTS: 4,
        TRIGGER: (( matchOnlyHand(handValue1(), FIVE_OF_A_KIND) ||
                   matchOnlyHand(handValue1(), FIVE_NINES)) &&
                  ((prev(handValue1()) != FIVE_OF_A_KIND &&
                   prev(handValue1()) != FIVE_NINES ) ||
                  (prev(handValue2()) != VOICE &&
                   prev(handValue2()) != NO_CARD_HAND)) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Only Need One Number",
        DESCRIPTION: "Make a 'nine of a kind' hand combo",
        POINTS: 10,
        TRIGGER: (matchHand(handValue1(), NINE_OF_A_KIND) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Eighty One",
        DESCRIPTION: "Make a 'nine 9s' hand combo",
        POINTS: 10,
        TRIGGER: (matchHand(handValue1(), NINE_NINES) && 
                 finalValue(handValue2()))
    },
    {
        TITLE: "Good Morning",
        DESCRIPTION: "Make a 'sunrise' hand combo",
        POINTS: 5,
        TRIGGER: (matchHand(handValue1(), SUNRISE) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Good Night",
        DESCRIPTION: "Make a 'sunset' hand combo",
        POINTS: 5,
        TRIGGER: (matchHand(handValue1(), SUNSET) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Small Straight",
        DESCRIPTION: "Make a 'four card straight' hand combo",
        POINTS: 3,
        TRIGGER: (matchHand(handValue1(), FOUR_STRAIGHT) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Large Straight",
        DESCRIPTION: "Make a 'six card straight' hand combo",
        POINTS: 4,
        TRIGGER: (matchHand(handValue1(), SIX_STRAIGHT) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Full House",
        DESCRIPTION: "Make a 'three of a kind' and a 'two of a kind' hand combo in a single turn",
        POINTS: 4,
        TRIGGER: (( matchOnlyHand(handValue1(), TRIPLE ) ||
                    matchOnlyHand(handValue1(), TRIPLE_NINE )) &&
                  ( matchOnlyHand(handValue2(), PAIR) ||
                    matchOnlyHand(handValue2(), PAIR_NINE)) &&
                  ((prev(handValue1()) != TRIPLE &&
                    prev(handValue1()) != TRIPLE_NINE ) ||
                   (prev(handValue2()) != PAIR &&
                    prev(handValue3()) != PAIR_NINE ) ||
                   (prev(handValue3()) != VOICE &&
                    prev(handValue3()) != NO_CARD_HAND)) &&
                  finalValue(handValue2()))                  
    },
    {
        TITLE: "Fuller House",
        DESCRIPTION: "Make a 'four of a kind' and a 'three of a kind' hand combo in a single turn",
        POINTS: 5,
        TRIGGER:(( matchOnlyHand(handValue1(), FOUR_OF_A_KIND) ||
                   matchOnlyHand(handValue1(), FOUR_NINES)) &&
                 ( matchOnlyHand(handValue2(), TRIPLE) ||
                   matchOnlyHand(handValue2(), TRIPLE_NINE)) &&
                 ((prev(handValue1()) != FOUR_OF_A_KIND &&
                   prev(handValue1()) != FOUR_NINES ) ||
                  (prev(handValue2()) != TRIPLE &&
                   prev(handValue3()) != TRIPLE_NINE ) ||
                  (prev(handValue3()) != VOICE &&
                   prev(handValue3()) != NO_CARD_HAND)) &&
                 finalValue(handValue2()))
    },
    {
        TITLE: "Fullest House",
        DESCRIPTION: "Make a 'five of a kind' and a 'four of a kind' hand combo in a single turn",
        POINTS: 5,
        TRIGGER:(( matchOnlyHand(handValue1(), FIVE_OF_A_KIND) ||
                   matchOnlyHand(handValue1(), FIVE_NINES)) &&
                 ( matchOnlyHand(handValue2(), FOUR_OF_A_KIND) ||
                   matchOnlyHand(handValue2(), FOUR_NINES)) &&
                 ((prev(handValue1()) != FIVE_OF_A_KIND &&
                   prev(handValue1()) != FIVE_NINES ) ||
                  (prev(handValue2()) != FOUR_OF_A_KIND &&
                   prev(handValue3()) != FOUR_NINES ) ||
                  (prev(handValue3()) != VOICE &&
                   prev(handValue3()) != NO_CARD_HAND)) &&
                 
                 finalValue(handValue3()))
    },
    {
        TITLE: "Triple Triple",
        DESCRIPTION: "Make a 'three card three pairs' hand combo in a single turn",
        POINTS: 5,
        TRIGGER:(matchHand(handValue1(), TRIPLE_TRIPLE) &&
                 finalValue(handValue2()))
    }
    

]

function cardHandAchievement(data)
{
    achievement(title = data[TITLE],
                description = data[DESCRIPTION],
                points = data[POINTS],
                trigger = saveProtection() && 
                          data[TRIGGER] 
    )
}

for data in cardHandList
{
    cardHandAchievement(data)
}
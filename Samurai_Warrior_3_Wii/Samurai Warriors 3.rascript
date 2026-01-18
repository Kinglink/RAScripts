// Samurai Warriors 3
// #ID = 34694

TITLE = "Title"
DESCRIPTION = "Description"


function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

function bitOffset(InitialLocation, BitValue)
{
    offset = BitValue / 8
    
    targetBit = BitValue % 8
    targetLocation = InitialLocation+offset
    return bit(targetBit, targetLocation)
}

function bit32BEOffset(InitialLocation, BitValue)
{
    offset = BitValue / 32
    
    targetBit = BitValue % 32

    targetLocation = InitialLocation + offset
    return bit(32 - targetBit, targetLocation)
}

// bitcount Helper functions. 
function bitcount_5bit_char(base_addr, char_index) {
    // A character's 5 bits are at total bit positions:
    // start, start+1, start+2, start+3, start+4
    start = char_index * 5
    
    // We create an array of the 5 specific bit values (1 or 0)
    bits = []
    for i in range(0, 4) {
        current_bit = start + i
        byte_off = current_bit / 8
        bit_idx = current_bit % 8
        
        // bit() returns the value of the bit at that position
        array_push(bits, bit(bit_idx, base_addr + byte_off))
    }
    
    // Summing them gives the total count of 'on' bits
    return sum_of(bits, i => i)
}

function bitcount_variable_bits(base_addr, char_index, bit_length) {
    // Calculate the global starting bit position
    start = char_index * bit_length
    
    bits = []
    // Loop for the specific number of bits requested
    for i in range(0, bit_length - 1) {
        current_bit = start + i
        byte_off = current_bit / 8
        bit_idx = current_bit % 8
        
        // Push each individual bit check into the array
        array_push(bits, bit(bit_idx, base_addr + byte_off))
    }
    
    // Sum the bits (each bit() call is 1 or 0)
    return sum_of(bits, i => i)
}

function bit_val(index) {
    // This is a lookup for 2^index
    // It maps bit 0 to 1, bit 8 to 256, bit 16 to 65536, etc.
    weights = {
        0:0x1, 1:0x2, 2:0x4, 3:0x8, 4:0x10, 5:0x20, 6:0x40, 7:0x80,
        8:0x100, 9:0x200, 10:0x400, 11:0x800, 12:0x1000, 13:0x2000, 14:0x4000, 15:0x8000,
        16:0x10000, 17:0x20000, 18:0x40000, 19:0x80000, 20:0x100000, 21:0x200000, 22:0x400000, 23:0x800000,
        24:0x1000000, 25:0x2000000, 26:0x4000000, 27:0x8000000, 28:0x10000000, 29:0x20000000, 30:0x40000000, 31:0x80000000
    }
    return weights[index]
}

function bitcount_masked(address, byte_count, mask) {
    bits = []
    
    // Total bits to check is byte_count * 8
    total_bits = (byte_count * 8) - 1
    
    for i in range(0, total_bits) {
        // Check if the current bit (0-31) is set in the constant mask
        if ((mask & bit_val(i)) != 0) {
            
            // Calculate which byte this bit belongs to (0, 1, 2, or 3)
            byte_off = i / 8
            
            // Calculate which bit it is within that byte (0-7)
            bit_in_byte = i % 8
            
            // Push the memory accessor to the array
            array_push(bits, bit(bit_in_byte, address + byte_off))
        }
    }
    
    return sum_of(bits, i => i)
}

function manual_bitcount(value) {
    count = 0
    for i in range(0, 31) {
        // Compare the value against the specific power of 2
        if ((value & bit_val(i)) != 0) {
            count = count + 1
        }
    }
    return count
}

// Character List 
YUKIMURA_SANADA_PLAYER_ID = 0x00
KEIJI_MAEDA_PLAYER_ID = 0x01
NOBUNAGA_ODA_PLAYER_ID = 0x02
MITSUHIDE_AKECHI_PLAYER_ID = 0x03
KENSHIN_UESUGI_PLAYER_ID = 0x04
OICHI_PLAYER_ID = 0x05
OKUNI_PLAYER_ID = 0x06
KUNOICHI_PLAYER_ID = 0x07
MAGOICHI_SAIKA_PLAYER_ID = 0x08
SHINGEN_TAKEDA_PLAYER_ID = 0x09
MASAMUNE_DATE_PLAYER_ID = 0x0A
NO_PLAYER_ID = 0x0B
HANZO_HATTORI_PLAYER_ID = 0x0C
RANMARU_MORI_PLAYER_ID = 0x0D
HIDEYOSHI_TOYOTOMI_PLAYER_ID = 0x0E
YOSHIMOTO_IMAGAWA_PLAYER_ID = 0x0F
TADAKATSU_HONDA_PLAYER_ID = 0x10
INA_PLAYER_ID = 0x11
IEYASU_TOKUGAWA_PLAYER_ID = 0x12
MITSUNARI_ISHIDA_PLAYER_ID = 0x13
NAGAMASA_AZAI_PLAYER_ID = 0x14
SAKON_SHIMA_PLAYER_ID = 0x15
YOSHIHIRO_SHIMAZU_PLAYER_ID = 0x16
GINCHIYO_TACHIBANA_PLAYER_ID = 0x17
KANETSGU_NAOE_PLAYER_ID = 0x18
NENE_PLAYER_ID = 0x19
KOTARO_FUMA_PLAYER_ID = 0x1A
TOSHIE_MAEDA_PLAYER_ID = 0x1B
MOTOCHIKA_CHOSOKABE_PLAYER_ID = 0x1C
KATSUITE_SHIBATA_PLAYER_ID = 0x1D
KIYOMASA_KATO_PLAYER_ID = 0x1E
KANBEI_KURODA_PLAYER_ID = 0x1F
MUNESHIGE_TACHIBANA_PLAYER_ID = 0x20
KAI_PLAYER_ID = 0x21
UJIYASU_HOJO_PLAYER_ID = 0x22
HANBEI_TAKENAKA_PLAYER_ID = 0x23
MOTONARI_MORI_PLAYER_ID = 0x24
MASANORI_FUKUSHIMA_PLAYER_ID = 0x25
AYA_PLAYER_ID = 0x26
TAKAMARU_PLAYER_ID = 0x27
FIRST_CUSTOM_CHARACTER_PLAYER_ID = 0x28
SECOND_CUSTOM_CHARACTER_PLAYER_ID = 0x29
THIRD_CUSTOM_CHARACTER_PLAYER_ID = 0x2A
FOURTH_CUSTOM_CHARACTER_PLAYER_ID = 0x2B
FIFTH_CUSTOM_CHARACTER_PLAYER_ID = 0x2C
SIXTH_CUSTOM_CHARACTER_PLAYER_ID = 0x2D
SEVENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x2E
EIGHTH_CUSTOM_CHARACTER_PLAYER_ID = 0x2F
NINETH_CUSTOM_CHARACTER_PLAYER_ID = 0x30
TENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x31
ELEVENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x32
TWELFTH_CUSTOM_CHARACTER_PLAYER_ID = 0x33
THIRTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x34
FOURTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x35
FIFTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x36
SIXTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x37
SEVENTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x38
EIGHTEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x39
NINETEENTH_CUSTOM_CHARACTER_PLAYER_ID = 0x3A
TWENTIETH_CUSTOM_CHARACTER_PLAYER_ID = 0x3B
LAST_CUSTOM_CHARACTER_PLAYER_ID = TWENTIETH_CUSTOM_CHARACTER_PLAYER_ID

SWORD_WEAPON_ID = 0x28
SPEAR_WEAPON_ID = 0x29
NAGINATA_WEAPON_ID = 0x2A

CHARACTER_NAME_LOOKUP =
{
    YUKIMURA_SANADA_PLAYER_ID: "Yukimura Sanada",
    KEIJI_MAEDA_PLAYER_ID: "Keiji Maeda",
    NOBUNAGA_ODA_PLAYER_ID: "Nobunaga Oda",
    MITSUHIDE_AKECHI_PLAYER_ID: "Mitsuhide Akechi",
    KENSHIN_UESUGI_PLAYER_ID: "Kenshin Uesugi",
    OICHI_PLAYER_ID: "Oichi",
    OKUNI_PLAYER_ID: "Okuni",
    KUNOICHI_PLAYER_ID: "Kunoichi",
    MAGOICHI_SAIKA_PLAYER_ID: "Magoichi Saika",
    SHINGEN_TAKEDA_PLAYER_ID: "Shingen Takeda",
    MASAMUNE_DATE_PLAYER_ID: "Masamune Date",
    NO_PLAYER_ID: "Nohime",
    HANZO_HATTORI_PLAYER_ID: "Hanzo Hattori",
    RANMARU_MORI_PLAYER_ID: "Ranmaru Mori",
    HIDEYOSHI_TOYOTOMI_PLAYER_ID: "Hideyoshi Toyotomi",
    YOSHIMOTO_IMAGAWA_PLAYER_ID: "Yoshimoto Imagawa",
    TADAKATSU_HONDA_PLAYER_ID: "Tadakatsu Honda",
    INA_PLAYER_ID: "Ina",
    IEYASU_TOKUGAWA_PLAYER_ID: "Ieyasu Tokugawa",
    MITSUNARI_ISHIDA_PLAYER_ID: "Mitsunari Ishida",
    NAGAMASA_AZAI_PLAYER_ID: "Nagamasa Azai",
    SAKON_SHIMA_PLAYER_ID: "Sakon Shima",
    YOSHIHIRO_SHIMAZU_PLAYER_ID: "Yoshihiro Shimazu",
    GINCHIYO_TACHIBANA_PLAYER_ID: "Ginchiyo Tachibana",
    KANETSGU_NAOE_PLAYER_ID: "Kanetsugu Naoe",
    NENE_PLAYER_ID: "Nene",
    KOTARO_FUMA_PLAYER_ID: "Kotaro Fuma",
    TOSHIE_MAEDA_PLAYER_ID: "Toshiie Maeda",
    MOTOCHIKA_CHOSOKABE_PLAYER_ID: "Motochika Chosokabe",
    KATSUITE_SHIBATA_PLAYER_ID: "Katsuie Shibata",
    KIYOMASA_KATO_PLAYER_ID: "Kiyomasa Kato",
    KANBEI_KURODA_PLAYER_ID: "Kanbei Kuroda",
    MUNESHIGE_TACHIBANA_PLAYER_ID: "Muneshige Tachibana",
    KAI_PLAYER_ID: "Kai",
    UJIYASU_HOJO_PLAYER_ID: "Ujiyasu Hojo",
    HANBEI_TAKENAKA_PLAYER_ID: "Hanbei Takenaka",
    MOTONARI_MORI_PLAYER_ID: "Motonari Mori",
    MASANORI_FUKUSHIMA_PLAYER_ID: "Masanori Fukushima",
    AYA_PLAYER_ID: "Aya",
    TAKAMARU_PLAYER_ID: "Takamaru",
    FIRST_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    SECOND_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    THIRD_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    FOURTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    FIFTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    SIXTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    SEVENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    EIGHTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    NINETH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    TENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    ELEVENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    TWELFTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    THIRTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    FOURTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    FIFTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    SIXTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    SEVENTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    EIGHTEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    NINETEENTH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
    TWENTIETH_CUSTOM_CHARACTER_PLAYER_ID: "Custom Character",
}

PURCHASABLE_CHARACTER_UNLOCKS = 
[
    KEIJI_MAEDA_PLAYER_ID,
    MITSUHIDE_AKECHI_PLAYER_ID,
    OKUNI_PLAYER_ID,
    KUNOICHI_PLAYER_ID,
    MAGOICHI_SAIKA_PLAYER_ID,
    SHINGEN_TAKEDA_PLAYER_ID,
    MASAMUNE_DATE_PLAYER_ID,
    NO_PLAYER_ID,
    RANMARU_MORI_PLAYER_ID,
    HIDEYOSHI_TOYOTOMI_PLAYER_ID,
    YOSHIMOTO_IMAGAWA_PLAYER_ID,
    TADAKATSU_HONDA_PLAYER_ID,
    INA_PLAYER_ID,
    IEYASU_TOKUGAWA_PLAYER_ID,
    MITSUNARI_ISHIDA_PLAYER_ID,
    NAGAMASA_AZAI_PLAYER_ID,
    SAKON_SHIMA_PLAYER_ID,
    YOSHIHIRO_SHIMAZU_PLAYER_ID,
    NENE_PLAYER_ID,
    KOTARO_FUMA_PLAYER_ID,
    TOSHIE_MAEDA_PLAYER_ID,
    MOTOCHIKA_CHOSOKABE_PLAYER_ID,
    KATSUITE_SHIBATA_PLAYER_ID,
    KANBEI_KURODA_PLAYER_ID,
    MUNESHIGE_TACHIBANA_PLAYER_ID,
    UJIYASU_HOJO_PLAYER_ID,
    MOTONARI_MORI_PLAYER_ID,
]

PURCHASABLE_CUSTOMIZE_APPEARANCE_UNLOCKS =  range(YUKIMURA_SANADA_PLAYER_ID, MOTONARI_MORI_PLAYER_ID)
function MaxStatUnlockBuilder() 
{
    retValue = range(YUKIMURA_SANADA_PLAYER_ID, MOTONARI_MORI_PLAYER_ID)  
    array_push(retValue, TAKAMARU_PLAYER_ID)
    return retValue
}  
PURCHASABLE_UNLOCK_MAX_STATS_UNLOCKS = MaxStatUnlockBuilder()
function UnlockableWeaponBuilder() 
{
    // For some reason FUMA is not unlockable 
    // (Probably because his weapon might have animation issues? 
    //  They're gloves)
    retValue = range(YUKIMURA_SANADA_PLAYER_ID, MOTONARI_MORI_PLAYER_ID)  
    return array_filter(retValue, id => id != KOTARO_FUMA_PLAYER_ID)
}  

PURCHASABLE_UNLOCKABLE_WEAPONS =   UnlockableWeaponBuilder()


// $6521B8: (32-bit BE) Demo Indicator 
//
//          When in Demo mode, this is set to 5a, when it main game this is set to 0x00.  Don't assume 0x00 but 5a is definitely demo (Changing it in demo corrupts the Press Any Key 
function DemoIndicator() => dword_be(0x6521B8)

DEMO_MODE_VALUE = 0x5A
function IsInDemoMode() => DemoIndicator() == DEMO_MODE_VALUE


// $653420: (32-bit BE) Yukimura Complete Stages
//          
//          0x01 = Beat First stage.
//          0x05 = Complete Musou Mode (mark Cleared
function YukimuraCompleteStages() => dword_be(0x653420)

YukimuraCompleteStagsLocation = 0x653420
KeijiMaedaCompleteStagesLocation = 0x653428
NobunagaOdaCompleteStagesLocation = 0x653430

CompleteStagesLocationOffset = KeijiMaedaCompleteStagesLocation - YukimuraCompleteStagsLocation

function CharacterClearedMusouModeValue(characterId) 
{
    return dword_be(YukimuraCompleteStagsLocation + (CompleteStagesLocationOffset * characterId))
}

function CharacterJustClearedMusouMode(characterId) => CharacterClearedMusouModeValue(characterId) == 0x05 && prev(CharacterClearedMusouModeValue(characterId)) == 0x04

// $653428: (32-bit BE) Keiji Maeda Complete Stages
//          
//          0x01 = Beat First stage.
//          0x05 = Complete Musou Mode (mark Cleared
function KeijiMaedaCompleteStages() => dword_be(0x653428)

// $653430: (32-bit BE) Nobunaga Oda Complete Stages
//          
//          0x01 = Beat First stage.
//          0x05 = Complete Musou Mode
function NobunagaOdaCompleteStages() => dword_be(0x653430)


// $65450F: (8-bit) Difficulty Selected
//          
//          Might be 32-bit BE
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Chaos
//          
//          Check 0x00787d6f if this is proven false.
//          
//          This appears to affect the home screen when you return as well (Which one was last selected)
function DifficultySelected() => byte(0x65450F)

EASY_DIFFICULTY_VALUE = 0x00
NORMAL_DIFFICULTY_VALUE = 0x01
HARD_DIFFICULTY_VALUE = 0x02
CHAOS_DIFFICULTY_VALUE = 0x03
function IsChaosDifficultySelected() => DifficultySelected() == CHAOS_DIFFICULTY_VALUE


DifficultyNameLookup =
{
    EASY_DIFFICULTY_VALUE: "Easy",
    NORMAL_DIFFICULTY_VALUE: "Normal",
    HARD_DIFFICULTY_VALUE: "Hard",
    CHAOS_DIFFICULTY_VALUE: "Chaos"
}

// This is for tactical Complete tracking 
// $654630: (bitfield) Completed Stages
//          
//          bit0 = Yukimura's First stage
//          bit4 = Yukimura's Fifth Stage
//          bit5 = Second character (Keiji?) first stage
function TacticallyCompleteStages() => byte(0x654630)

TACTICALLY_COMPLETE_STAGE_START = 0x654630

function HasCharacterJustCompletedTactical(characterId)
{
    return bitcount_5bit_char(TACTICALLY_COMPLETE_STAGE_START, characterId) == 5 && 
      prev(bitcount_5bit_char(TACTICALLY_COMPLETE_STAGE_START, characterId)) == 4
}

// $654631: (bitfield) Completed Stages Part 2
//          
//          bit2 = Nobunaga's first stage
//          bit6 = Nobunaga's fifth stage
function TacticallyCompleteStagesPart2() => byte(0x654631)

// $65464E: (bitfield) Completed stages for normal Murasame Castle
//          
//          bit 2 = A Strange Rumor
//          bit 3 = The Mysterious Samurai
//          bit 4 = Follow Takamaru
//          bit 5 = Aosame Castle (Fourth Stage) worthy of an achievement?
//          bit 6 = The Plot Thickens
//          bit 7 = An Unexpected Encounter
function MurasameCastleCompleteStages() => byte(0x65464E)

    
// $65464F: (bitfield) Completed stages for normal Murasame Castle  Part 2
//          
//          bit 0 = Akasame Castle
//          bit 1 = The Mystery Of The Jewels
//          bit 2 = The Legend of Murasame
//          bit 3 = Ryokusame Castle
//          bit 4 = Eye of the Storm
//          bit 5 = Momosame Castle
//          bit 6  = The Truth Revealed
//          bit 7 = The Petrified Village
function MurasameCastleCompleteStagesPart2() => byte(0x65464F)

// $654650: (bitfield) Complete Stagesfor Murasame Castle Part 3
//          
//          bit 0 = Murasame Castle
//          bit 1 = Down the Rabbit Hole (Bonus 1)
//          bit 2 = Through the Looking Glass (Bonus 2)
//          bit 3 = Curiouser and Curiouser (Bonus 3)
//          bit 4 = A Strange Rumor (Nightmare)
function MurasameCastleCompleteStagesPart3() => byte(0x654650)

A_STRANGE_RUMOR = 2
THE_MYSTERIOUS_SAMURAI = 3
FOLLOW_TAKAMARU = 4
AOSAME_CASTLE = 5
THE_PLOT_THICKENS = 6
AN_UNEXPECTED_ENCOUNTER = 7
AKASAME_CASTLE = 8
THE_MYSTERY_OF_THE_JEWELS = 9
THE_LEGEND_OF_MURASAME = 10
RYOKUSAME_CASTLE = 11
EYE_OF_THE_STORM = 12
MOMOSAME_CASTLE = 13
THE_TRUTH_REVEALED = 14
THE_PETRIFIED_VILLAGE = 15
MURASAME_CASTLE = 16
DOWN_THE_RABBIT_HOLE = 17
THROUGH_THE_LOOKING_GLASS = 18
CURIOUSER_AND_CURIOUSER = 19
A_STRANGE_RUMOR_NIGHTMARE = 20

NIGHTMARE_MODE_BIT_VALUE_OFFSET = A_STRANGE_RUMOR_NIGHTMARE - A_STRANGE_RUMOR

function JustCompleteCastleStage(CastleStageIndex)
{
    normalBitValue = CastleStageIndex + 2
    return bitOffset(0x65464E, normalBitValue) == 1 && 
      prev(bitOffset(0x65464E, normalBitValue)) == 0
}

function JustCompleteNightmareCastleStage(CastleStageIndex)
{
    nightmareBitValue = CastleStageIndex + NIGHTMARE_MODE_BIT_VALUE_OFFSET + 2
    return bitOffset(0x65464E, nightmareBitValue) ==  1 && 
      prev(bitOffset(0x65464E, nightmareBitValue)) == 0
}


// $654651: (bitfield) Complete Stagesfor Murasame Castle Part 4
//          
//          Same as the original but offset.
//          
//          bit 7 = Momosame Castle (Nightmare)
function MurasameCastleCompleteStagesPart4() => byte(0x654651)

// $654652: (bitfield) Complete Stagesfor Murasame Castle Part 5
//          
//          Same as the original but offset.
//          
//          bit 0 - 5 is the final levels of Nightmare Murasame castle (offset from the original list)
//          Not sure what bit 6 and bit 7 are Likely messages,  6 was set when I was mucking,  7 gets set eventually, might be tutorial messages?
function MurasameCastleCompleteStagesPart5() => byte(0x654652)

// $654654: (54bit bitfield)   Tanuki Unlocks
//          
//          bit 0  and bit 1  Unknown but not tanukis.
//          
//          bit 2: A Strange Rumor Tanuki 1
//          bit 3: A Strange Rumor Tanuki 2
//          bit 4: A Strange Rumor Tanuki 3 and so on.
//          bit 5->56  The remaining 54 tanukis.
//          
//          This is NOT BE bits.
function TanukiUnlocks() => byte(0x654654)

// $65465B: (54bit Bitfield) Nightmare Tanuki's
//          
//          bit 0-2:  A Strange rumor on Nightmare Tanukis
//          bit 3-54, remaining tanukis.
function NightmareTanukis() => byte(0x65465B)

MAX_TANUKI_COUNT = 54

function CountofTanukisCollected()
{
    return bitcount_variable_bits(0x654654, 0, 54) 
}

function JustReachedTanukiCount(targetCount)
{
    return measured(CountofTanukisCollected() == targetCount) && 
      prev(CountofTanukisCollected()) <= targetCount - 1 &&
      prev(CountofTanukisCollected()) >= targetCount - 3
}

function CountofNightmareTanukisCollected()
{
    return bitcount_variable_bits(0x65465B, 0, 54) 
}

function JustReachedNightmareTanukiCount(targetCount)
{
    return measured(CountofNightmareTanukisCollected() == targetCount) && 
      prev(CountofNightmareTanukisCollected()) <= targetCount - 1 &&
      prev(CountofNightmareTanukisCollected()) >= targetCount - 3
      
}

// $654677: (Bitfield) Weapon Unlock purchases
//          
//          Bit 2 = Yukimura
//          Bit 3 = Keiji Maeda
//          
//          
//          Rather than list the rest, here's the final value.
//          32-bit BE 0x fcffffef   Followed by 8-bit is 7f
function WeaponUnlockPurchases() => dword_be(0x654677)

WEAPON_UNLOCK_PURCHASE_LOCATION = 0x654677
WEAPON_UNLOCK_MASK = 0xeffffffc
WEAPON_UNLOCK_MASK_PART2 = 0x7f

function WeaponUnlockPurchasePart2() => byte(0x65467B)

function CountWeaponUnlockPurchases()
{
    // 0x654677 is the start of the BE Dword
    return bitcount_masked(WEAPON_UNLOCK_PURCHASE_LOCATION, 4, WEAPON_UNLOCK_MASK) + 
           bitcount_masked(WEAPON_UNLOCK_PURCHASE_LOCATION + 4, 1, WEAPON_UNLOCK_MASK_PART2)
}

function TotalWeaponUnlockPurchasesAvailable()
{
    return manual_bitcount(WEAPON_UNLOCK_MASK) + manual_bitcount(WEAPON_UNLOCK_MASK_PART2)
}

function JustPurchasedAllWeaponsUnlocks()
{
    return measured(CountWeaponUnlockPurchases() == TotalWeaponUnlockPurchasesAvailable()) &&
           prev(CountWeaponUnlockPurchases()) == TotalWeaponUnlockPurchasesAvailable() - 1
}

// $6546A8: (32-bit BE) Yukimura Sanada Level
//          
//          Note when you load a save, it loads to this location
function YukimuraSanadaLevel() => dword_be(0x6546A8)

// $6546BA: (bitfield) Yukimura unlock status.
//          
//          bit 4 = New marker
//          bit 5 = Customize appearance
//          bit 6 = Unlock Max Stats
//          bit 7 = Selectable (Not set it will not display.  needs to be unlocked elsewhere too)
//          
//          Note this also controls if the character can be purchased.
function YukimuraUnlockStatus() => byte(0x6546BA)

// $6546BC: (32-bit BE) Yukimura's First Weapon Type
//          
//          
//          Appears to be mostly based on bit 0 and bit 1, however higher values than 255  will make this blank.
//          
//          0x00 = Aeon Spear
//          0x01 = Crimson Spear
//          0x02 = Mythril Spear
//          0x03 = Dragon Tail
//          
//          0xc3 = Not Owned (not shown)
//          
//          This changes the power of the weapon, as well as type  (first is normal, second is Power, third is Speed, Fourth is special)
//          
//          The first 0xc3 stops the list of weapons, numbers (*including the next weapon) beyond that is ignored.
function YukimurasFirstWeaponType() => dword_be(0x6546BC)

// $6546E8: (32-bit BE) Yukimura's Second Weapon Type
function YukimurasSecondWeaponType() => dword_be(0x6546E8)

// $654714: (32-bit BE) Yukimura's Third Weapon Type
function YukimurasThirdWeaponType() => dword_be(0x654714)

// $654860: (32-bit BE) Keiji Maeda Level
function KeijiMaedaLevel() => dword_be(0x654860)

// $654872: (8-bit) Keiji Maeda Unlocked Part 2
//          
//          This is set to 90 when he's unlocked.  If this is NOT set to 0x90 it appears he's not selectable.  You also must set 0x6535a0 to 0x01
function KeijiMaedaUnlockedPart2() => byte(0x654872)

YUKIMURA_LEVEL_MEMORY_LOCATION = 0x6546A8
YUKIMURA_UNLOCK_MEMORY_LOCATION = 0x6546BA
YUKIMURA_FIRST_WEAPON_TYPE_MEMORY_LOCATION = 0x6546BC
YUKIMURA_SECOND_WEAPON_TYPE_MEMORY_LOCATION = 0x6546E8
KEIJI_MAEDA_LEVEL_MEMORY_LOCATION = 0x654860
CHARACTER_DATA_OFFSET = KEIJI_MAEDA_LEVEL_MEMORY_LOCATION - YUKIMURA_LEVEL_MEMORY_LOCATION
UNLOCK_MEMORY_OFFSET = YUKIMURA_UNLOCK_MEMORY_LOCATION - YUKIMURA_LEVEL_MEMORY_LOCATION
FIRST_WEAPON_MEMORY_OFFSET = YUKIMURA_FIRST_WEAPON_TYPE_MEMORY_LOCATION - YUKIMURA_LEVEL_MEMORY_LOCATION
WEAPON_MEMORY_OFFSET = YUKIMURA_SECOND_WEAPON_TYPE_MEMORY_LOCATION - YUKIMURA_FIRST_WEAPON_TYPE_MEMORY_LOCATION

function WeaponType(characterId, weaponIndex)
{
    memoryLocation = YUKIMURA_LEVEL_MEMORY_LOCATION + 
                     (CHARACTER_DATA_OFFSET * characterId) + 
                     FIRST_WEAPON_MEMORY_OFFSET + 
                     (WEAPON_MEMORY_OFFSET * weaponIndex)
    return dword_be(memoryLocation)
}

// General weapon index is usually just the character ID, but customs are more complicated. 
function CharacterWeaponJustChanged(characterID, GeneralWeaponIndex)
{
    targetWeaponIndex = GeneralWeaponIndex * 4 + 3
    return any_of( range(0,7), 
        weaponIndex => 
            WeaponType(characterID, weaponIndex) == targetWeaponIndex && 
            prev(WeaponType(characterID, weaponIndex)) != targetWeaponIndex
    )
}

function CheckPurchasedCharacter(characterId) 
{
    memoryLocation = YUKIMURA_LEVEL_MEMORY_LOCATION + 
                     (CHARACTER_DATA_OFFSET * characterId) + 
                     UNLOCK_MEMORY_OFFSET
    return bit(7, memoryLocation)
}

function CheckPurchasedCustomizedCharacter(characterId) 
{
    memoryLocation = YUKIMURA_LEVEL_MEMORY_LOCATION + 
                     (CHARACTER_DATA_OFFSET * characterId) + 
                     UNLOCK_MEMORY_OFFSET
    return bit(5, memoryLocation)
}

function CheckPurchasedCharacterMaxStats(characterId) 
{
    memoryLocation = YUKIMURA_LEVEL_MEMORY_LOCATION + 
                     (CHARACTER_DATA_OFFSET * characterId) + 
                     UNLOCK_MEMORY_OFFSET
    return bit(6, memoryLocation)
}

function JustPurchasedAllCharacters() 
{
    return measured(sum_of(PURCHASABLE_CHARACTER_UNLOCKS, 
                            i=> CheckPurchasedCharacter(i)) == 
                        length(PURCHASABLE_CHARACTER_UNLOCKS))&&
           sum_of(PURCHASABLE_CHARACTER_UNLOCKS, 
                    i=> prev(CheckPurchasedCharacter(i))) ==
                length(PURCHASABLE_CHARACTER_UNLOCKS) - 1
                    
}

function JustPurchasedAllCustomizedCharacters() 
{
    return measured(sum_of(PURCHASABLE_CUSTOMIZE_APPEARANCE_UNLOCKS, 
                            i=> CheckPurchasedCustomizedCharacter(i)) ==
                        length(PURCHASABLE_CUSTOMIZE_APPEARANCE_UNLOCKS)) &&
           sum_of(PURCHASABLE_CUSTOMIZE_APPEARANCE_UNLOCKS, 
                    i=> prev(CheckPurchasedCustomizedCharacter(i))) ==
                    length(PURCHASABLE_CUSTOMIZE_APPEARANCE_UNLOCKS) - 1    
}

function JustPurchasedAllMaxStatUnlocks() 
{
    return measured(sum_of(PURCHASABLE_UNLOCK_MAX_STATS_UNLOCKS, 
                            i=> CheckPurchasedCharacterMaxStats(i)) ==
                        length(PURCHASABLE_UNLOCK_MAX_STATS_UNLOCKS)) &&
           sum_of(PURCHASABLE_UNLOCK_MAX_STATS_UNLOCKS, 
                    i=> prev(CheckPurchasedCharacterMaxStats(i))) == 
                length(PURCHASABLE_UNLOCK_MAX_STATS_UNLOCKS) - 1
}

FOURTH_WEAPON_NAME =
{
    YUKIMURA_SANADA_PLAYER_ID: "Dragon Tail",
    KEIJI_MAEDA_PLAYER_ID: "Divinity Blade",
    NOBUNAGA_ODA_PLAYER_ID: "Demon Slayer",
    MITSUHIDE_AKECHI_PLAYER_ID:"Gilded Talon",
    KENSHIN_UESUGI_PLAYER_ID:"Frozen Flame",
    OICHI_PLAYER_ID:"Rising Sun",
    OKUNI_PLAYER_ID:"Heaven's Glory",
    KUNOICHI_PLAYER_ID:"Shiranui",
    MAGOICHI_SAIKA_PLAYER_ID:"Marksman's Pride",
    SHINGEN_TAKEDA_PLAYER_ID:"Divine Inspiration",
    MASAMUNE_DATE_PLAYER_ID:"Dragonhunters",
    NO_PLAYER_ID:"Black Widow",
    HANZO_HATTORI_PLAYER_ID:"Chained Dragon",
    RANMARU_MORI_PLAYER_ID:"Steel Vengeance",
    HIDEYOSHI_TOYOTOMI_PLAYER_ID:"Serpent Trinity",
    YOSHIMOTO_IMAGAWA_PLAYER_ID:"Meteor",
    TADAKATSU_HONDA_PLAYER_ID:"Tonbo-giri",
    INA_PLAYER_ID:"Enigma",
    IEYASU_TOKUGAWA_PLAYER_ID:"Earthshaker",
    MITSUNARI_ISHIDA_PLAYER_ID:"Golden Splendor",
    NAGAMASA_AZAI_PLAYER_ID:"Impaler",
    SAKON_SHIMA_PLAYER_ID:"Armageddon Blade",
    YOSHIHIRO_SHIMAZU_PLAYER_ID:"Earthsplitter",
    GINCHIYO_TACHIBANA_PLAYER_ID:"Raging Tempest",
    KANETSGU_NAOE_PLAYER_ID:"Evil's Bane",
    NENE_PLAYER_ID:"Soaring Dragons",
    KOTARO_FUMA_PLAYER_ID:"Soulstealer",
    TOSHIE_MAEDA_PLAYER_ID:"Dragon's Bite",
    MOTOCHIKA_CHOSOKABE_PLAYER_ID:"Golden Melody",
    KATSUITE_SHIBATA_PLAYER_ID:"Iron Supremacy",
    KIYOMASA_KATO_PLAYER_ID:"Demon's Maw",
    KANBEI_KURODA_PLAYER_ID:"Demonstone",
    MUNESHIGE_TACHIBANA_PLAYER_ID:"Roaring Lion",
    KAI_PLAYER_ID:"Orochi",
    UJIYASU_HOJO_PLAYER_ID:"Punisher",
    HANBEI_TAKENAKA_PLAYER_ID:"Astral Conqueror",
    MOTONARI_MORI_PLAYER_ID:"Blackhawk",
    //MASANORI_FUKUSHIMA_PLAYER_ID:
    //AYA_PLAYER_ID:
    TAKAMARU_PLAYER_ID:"Murasame Blade"
}

// This will require searching all custom players. 
FOURTH_CUSTOM_WEAPON_TYPES = 
{
    SWORD_WEAPON_ID:"Wazamono",
    SPEAR_WEAPON_ID:"Destiny",
    NAGINATA_WEAPON_ID:"Enlightenment"
}

// Additional information for custom characters. 
// $64ADD5: (8-bit) First Custom Character General Weapon Type
//          
//          0x00 = Yukimura Sanada (Rest of the values are the  
//          characters names.
//          0x28 = Sword
//          0x29 = Spear
//          0x2a Naginata
FIRST_CUSTOM_CHARACTER_GENERAL_WEAPON_TYPE_LOCATION = 0x65ADD5

// $65AE3B: (8-bit) Second Custom Character General Weapon Type
SECOND_CUSTOM_CHARACTER_GENERAL_WEAPON_TYPE_LOCATION = 0x65AE3B
CUSTOM_CHARACTER_WEAPON_TYPE_OFFSET = SECOND_CUSTOM_CHARACTER_GENERAL_WEAPON_TYPE_LOCATION - FIRST_CUSTOM_CHARACTER_GENERAL_WEAPON_TYPE_LOCATION
function CustomCharacterGeneralWeaponType(characterIndex) 
{
    index = characterIndex - FIRST_CUSTOM_CHARACTER_PLAYER_ID
    memoryLocation = FIRST_CUSTOM_CHARACTER_GENERAL_WEAPON_TYPE_LOCATION + 
                     (CUSTOM_CHARACTER_WEAPON_TYPE_OFFSET * (index))
    return byte(memoryLocation)
}


// $65B5B0: (32-bit BE) Amount of rice
//          
//          Currency for the Dojo
function AmountOfRice() => dword_be(0x65B5B0)

// $65BC6A: (8-bit) Historical Mode Siege of Kawagoe Castle(1-1) completed status.
//          
//          The higher this is the more information is filled out on the timeline.
//          
//          0x01 = Low beaten
//          0x02 = Mid Beaten
//          0x03 = High Beaten (Not sure what value you need for these)
//          
//          0x00= Next Level Locked,
//          0x01-0x03 = Next Level Unlocked
function HistoricalStage1_1CompleteStatus() => byte(0x65BC6A)

// $65BC92: (8-bit) Historical Mode Battle of Okehazama(1-2) completed status.
//          
//          The higher this is the more information is filled out on the timeline.
//          
//          0x01 = Low beaten
//          0x02 = Mid Beaten
//          0x03 = High Beaten (Not sure what value you need for these)
//          
//          0x00= Next Level Locked,
//          0x01-0x03 = Next Level Unlocked
function HistoricalModeStage1_2CompleteStatus() => byte(0x65BC92)

// $65BCBA: (8-bit) Historical Mode Battle of Kawanakajima(1-3) completed status.
//          
//          The higher this is the more information is filled out on the timeline.
//          
//          0x01 = Low beaten
//          0x02 = Mid Beaten
//          0x03 = High Beaten (Not sure what value you need for these)
//          
//          0x00= Next Level Locked,
//          0x01-0x03 = Next Level Unlocked
function HistoricalModeStage1_3CompleteStatus() => byte(0x65BCBA)

// $65BD2E: (16-bit BE) Historical Mode Battle of Nagashino (2-1) Number of Experience earned
function HistoricalModeStage2_1ExperienceEarned() => word_be(0x65BD2E)

// $65BD30: (16-bit BE) Historical Mode Battle of Nagashino (2-1) Number of Enemies killed
function HistoricalModeStage2_1EnemiesKilled() => word_be(0x65BD30)

// $65BD32: (8-bit) Historical Mode Battle of Nagashino(2-1) completed status.
//          
//          The higher this is the more information is filled out on the timeline.
//          
//          0x01 = Low beaten
//          0x02 = Mid Beaten
//          0x03 = High Beaten (Not sure what value you need for these)
//          
//          0x00= Next Level Locked,
//          0x01-0x03 = Next Level Unlocked
function HistoricalModeStage2_1CompleteStatus() => byte(0x65BD32)

HISTORICAL_STAGE_1_1_COMPLETE_STATUS_LOCATION = 0x65BC6A
HISTORICAL_STAGE_1_2_COMPLETE_STATUS_LOCATION = 0x65BC92
HISTORICAL_STAGE_OFFSET = HISTORICAL_STAGE_1_2_COMPLETE_STATUS_LOCATION - HISTORICAL_STAGE_1_1_COMPLETE_STATUS_LOCATION

MAX_HISTORICAL_STAGE_COMPLETED_VALUE = 0x03

function convertHistoricalStageToIndex(Stage, subStage) => ((Stage-1) * 5) + subStage - 1

function HistoricalModeStageCompleteStatus(Stage, subStage) 
{
    memoryLocation = HISTORICAL_STAGE_1_1_COMPLETE_STATUS_LOCATION + 
                     (HISTORICAL_STAGE_OFFSET * (convertHistoricalStageToIndex(Stage, subStage)))
    return byte(memoryLocation)
}

// $6A08C8: (Array of 6 32-bit BE) Objective index... Not important should always be 00 -05 unless mission is not tracked then, 0xffffffff Might be useful to check.
function ObjectiveInfoForCurrentMission() => dword_be(0x6A08C8)

// $6A08E0: (32-bit BE Array of 4 ) Current Mission Objective Statuses
//          
//          0x00 = In Progress (uncomplete)
//          0x01 = Successful
//          0x02 = Failed
function ObjectiveStatusForCurrentMission() => dword_be(0x6A08E0)

ObjectiveInfoForCurrentMissionLocation = 0x6A08C8
ObjectiveStatusForCurrentMissionLocation = 0x6A08E0


function AllObjectivesCompletedForCurrentMission()
{
    return all_of(range(0, 5), 
                    index => once(dword_be(ObjectiveInfoForCurrentMissionLocation + (index * 4)) == 0xffffffff || 
                         dword_be(ObjectiveStatusForCurrentMissionLocation + (index * 4)) == 1))
}

// $6A14F8: (Array of 4 32-bit )  Tactical Bonuses Index
//          
//          This is how the game marks a Tactical Bonus Complete, I believe it will always be 0x00, 0x01, 0x02, 0x03.  Maybe 0xffffffff If not active.
function TacticalBonusIndexForCurrentMission() => dword(0x6A14F8)

// $6A1508: (Array of 4 32-bit )  Tactical Bonuse Success Status
//          
//          0x00 = Incomplete
//          0x03 = Cleared (marker shown)
//          0x04 = Failure (no marker shown)
function TacticalBonusStatusForCurrentMission() => dword(0x6A1508)

TacticalBonusIndexForCurrentMissionLocation = 0x6A14F8
TacticalBonusStatusForCurrentMissionLocation = 0x6A1508
TACTICAL_BONUS_CLEARED_VALUE = 0x03

function AllTacticalBonusesCompletedForCurrentMission()
{
    return all_of(range(0, 3), 
                    index => (dword_be(TacticalBonusStatusForCurrentMissionLocation + (index * 4)) == TACTICAL_BONUS_CLEARED_VALUE))

}

// $787D68: (32-bit BE) Mission results
//          
//          0x00 = Mission won
//          0x01 = Time over.
//          0x03 = Killed
//          0x04 = Quit
//          0x05 = Normal Gameplay.
//          
//          if this is not set to 0x5, you get result screens when you quit
function MissionResults() => dword_be(0x787D68)

MISSION_WON_VALUE = 0x00
MISSION_NORMAL_GAMEPLAY_VALUE = 0x05

function JustWonMission() => MissionResults() == MISSION_WON_VALUE && 
                        prev(MissionResults()) == MISSION_NORMAL_GAMEPLAY_VALUE

function TriggerJustWonMission() => trigger_when( MissionResults() == MISSION_WON_VALUE) && 
                                                prev(MissionResults()) == MISSION_NORMAL_GAMEPLAY_VALUE


function WonMission() => MissionResults() == MISSION_WON_VALUE

// $787D6F: (8-bit) Difficulty Selected
//          
//          Might be 32-bit BE
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Chaos
//          
//          Check 0x00787d6f if this is proven false.
function AlternateDifficultySelected() => byte(0x787D6F)

// $787D78: (32-bit be) Mode Select
//          
//          Changes The values in the upper right.
//          
//          0x00 =- Story Mode
//          0x01 = Free Mode
//          0x02 = Murasame Castle
//          0x03 = Historical Mode
//          0x04 = Dojo
//          
//          This is NOT a firm control, but does control the title and can be used.
//          
//          Bonus point..  THis is set to 04 when loading at the beginning of the game.  This can be a pretty solid save check
function ModeSelect() => dword_be(0x787D78)

STORY_MODE_VALUE = 0x00
FREE_MODE_VALUE = 0x01
MURASAME_CASTLE_VALUE = 0x02
HISTORICAL_MODE_VALUE = 0x03
DOJO_MODE_VALUE = 0x04
function IsInStoryMode() => ModeSelect() == STORY_MODE_VALUE
function IsInFreeMode() => ModeSelect() == FREE_MODE_VALUE
function IsInMurasameCastleMode() => ModeSelect() == MURASAME_CASTLE_VALUE
function IsInHistoricalMode() => ModeSelect() == HISTORICAL_MODE_VALUE
function IsInDojoMode() => ModeSelect() == DOJO_MODE_VALUE

function IsInStoryorFreeMode() => IsInStoryMode() || IsInFreeMode()
function IsInGameplayMode() => IsInHistoricalMode() || IsInFreeMode() || IsInStoryMode() || IsInMurasameCastleMode() 

// $787D7C: (32-bit BE) Two Player indicator.
//          
//          0x00 = 1 Player.
//          0x01 = 2 Player.
//          0x03 = Main Menu potentially
function TwoPlayerIndicator() => dword_be(0x787D7C)

SINGLE_PLAYER_VALUE = 0x00

function IsInSinglePlayerMode() => TwoPlayerIndicator() == SINGLE_PLAYER_VALUE

// $787D94: (32-bit BE)  Stage/Force
//          
//          This controls the script used.  so 0x03 will pull up The Suruga-Sagami Conflict (Hojo Army).  HOWEVER it won't affect the title, nor the stage load.  Likely to save space at least two variants are on all stages.  So load one map and one "layout"
//          
//          Safe to use this to figure out which stage you're in.   But this won't tell you if you're in a stage.
//          
//          
//          Note: This is only for the script (and maybe characters).  The level loaded is elsewhere.  The Map index is 0x00787da0
//          
//          This also has values for maps that are only in Historical mode (The first one for instance)
//          
//          
//          0x00 = Siege of Kawagoe Castle(Hojo Army)   (Historical Mode)
//          0x01 = Motonari's Return (Uesugi Army)
//          0x02 = The Suruga-Sagami Conflict (Hojo Army)
//          0x03 = The Suruga-Sagami Conflict (Takeda Army)
//          0x04 = The Kanto Campaign (Hojo Army)
//          0x05 = The Kanto Campaign (Uesugi Army)
//          0x06 = Battle of Okehazama (Oda Army)   
//          0x07 = Battle of Kawanakajima(Uesugi Army)
//          0x08 = Battle of Kawanakajima(Takeda Army)
//          0x09 = Battle of Mt. Inaba Castle (Oda)
//          0x0a = Battle of Mt. Inaba Castle (Saito)
//          0x0b = Invasion of Suruga (Uesugi Army)
//          0x0c = Battle of Mimase Pass (Takeda Army)
//          0x0d = Battle of Mimase Pass (Hojo Army)
//          0x0e = Retreat from Kanegasaki (Oda-Tokugawa Army)
//          0x0f = Retreat from Kanegasaki  (Azai-Asakura Army)
//          0x10 = Battle of Anegawa (Oda-Tokugawa Army)
//          0x11 = Battle of Anegawa (Azai-Asakura Army)
//          0x12 = Battle of Odani Castle (Oda Army)
//          0x13 = Battle of Odani Castle (Azai Army)
//          0x14 = Confrontation at Lake Yogo (Azai Army)
//          0x15 = Battle of Tonegawa (Hojo-Takeda Army)
//          0x16 = Battle of Mikatagahara (Takeda Army)
//          0x17 = Battle of Mikatagahara (Tokugawar Army)
//          0x18 = The Great Kanto Defense (Hojo Army)  (Hojo story)
//          0x19 = Confrontation at Nagashino (Takeda Army)
//          0x1a = Battle of Nagashino(Oda-Tokugawa Army)
//          0x1b = Battle of Kizugawa (Mori Army)
//          0x1c = Battle of Kizugawa (Oda Army)
//          0x1d = Invasion of Chugoku (Oda Army)
//          0x1e = Battle of Kozuki Castle (Mori Army) 
//          0x1f = The Tachibana Crisis (Mori Army)
//          0x20 = Confrontation at Yamazuki (Mori Army)
//          0x21 = Battle of Tetorigawa (Oda Army)
//          0x22 = Battle of Tetorigawa (Uesugi Army)
//          0x23 = Confrontation at Shizugatake (Uesugi Army)
//          0x24 = Struggle for Kai Province (Hojo Army)
//          0x25 = Incident at Honnoji (Oda Army)
//          0x26 = Incident at Honnoji (Akechi Army)
//          0x27 = Escape through Iga (Tokugawa Army)
//          0x28 = Battle of Yamazaki (Hashiba Army)
//          0x29 = Battle of Yamazaki (Akechi Army)
//          0x2a = Confrontation at Anegawa (Akechi Army)
//          0x2b = Battle of Shizugatake (Hashiba Army)
//          0x2c = Battle of Shizugatake (Shibata Army)
//          0x2d = Battle of Komaki-Nagakute (Hashiba Army)
//          0x2e = Battle of Komaki-Nagakute (Tokugawa Army)
//          0x2f = Conquest of Kyushu (Tachibana Army)
//          0x30 = Conquest of Kyushu (Shimazu Army)
//          0x31 = Battle of Ueda Castle (Tokugawa Army)
//          0x32 = Battle of Ueda Castle (Sanada Army)
//          0x33 = Conquest of Odawara (Toyotomi Army)
//          0x34 = Assault on Oshi Castle (Toyotomi Army)
//          0x35 = Assault on Oshi Castle (Hojo Army)
//          0x36 = The Kasai Osaki Uprising (Peasant Army)
//          0x37 = The Kasai Osaki Uprising (Toyotomi Army)
//          0x38 = The Rescue of Mitsunari (Ishida Army)
//          0x39 = Battle of Fushimi Castle (Western Army)
//          0x3a = Battle of Otsu Castle (Western Army)
//          0x3b = Battle of Kuzegawa (Western Army)
//          0x3c = Battle of Sekigahara (Eastern Army)
//          0x3d = Battle of Sekigahara (Western Army)
//          0x3e = Flight From Sekigahara (Western Army)
//          0x3f = Battle of Hasedo (Uesugi Army)
//          0x40 = Battle of Hasedo (Date Army)
//          0x41 = Battle of Numata Castle (Tokugawa Army)
//          0x42 = Battle of Numata Castle (Sanada Army)
//          0x43 = Conflict at the Ishigaki Plains (Eastern Army)
//          0x44 = Retreat from the Ishigaki Plains (Western Army)
//          0x45 = The Osaka Campaign (Tokugawa Army) (historical mission 3-5)
//          0x46 = The Osaka Campaign (Toyotomi Army)
//          0x47 = Confrontationat at Mikatagahara(Toyotomi Army)
//          0x48 = Siege of Kawagoe Castle (Sanada Army) (Though this is set for Murasame castle as well)
//          0x49= Siege of Kawagoe Castle
//          0x04a = Osaka Campaign(Hojo Army)
//          0x04b = Main Menu (Freezing this starts crashing the game.)  (Shows Siege of Kawagoe Castle)
function StageForceIndex() => dword_be(0x787D94)


HISTORICAL_SIEGE_OF_KAWAGOE_CASTLE = 0x00
HISTORICAL_BATTLE_OF_OKEHAZAMA = 0x06
HISTORICAL_BATTLE_OF_KAWANAKAJIMA = 0x07
HISTORICAL_BATLE_OF_ANGEGAWA = 0x10
HISTORICAL_BATTLE_OF_MIKATAGAHARA = 0x16
HISTORICAL_BATTLE_OF_NAGASHINO = 0x1A
HISTORICAL_BATTLE_OF_TETORIGAWA = 0x22
HISTORICAL_INCIDENT_AT_HONNOJI = 0x25
HISTORICAL_BATTLE_OF_YAMAZAKI = 0x28
HISTORICAL_BATTLE_OF_SHIGUZGATAKE = 0x2B
HISTORICAL_BATTLE_OF_KOMAKI_NAGAKUTE = 0x2E
HISTORICAL_CONQUEST_OF_KYUSHU = 0x2F
HISTORICAL_CONQUEST_OF_ODAWARA = 0x33
HISTORICAL_BATTLE_OF_SEGAKIHARA = 0x3C
HISTORICAL_THE_OSAKA_CAMPAIGN = 0x45

HISTORICAL_MODE_FIRST_CHAPTER_STAGES = 
[
    HISTORICAL_SIEGE_OF_KAWAGOE_CASTLE,
    HISTORICAL_BATTLE_OF_OKEHAZAMA,
    HISTORICAL_BATTLE_OF_KAWANAKAJIMA,
    HISTORICAL_BATLE_OF_ANGEGAWA,
    HISTORICAL_BATTLE_OF_MIKATAGAHARA
]

HISTORICAL_MODE_SECOND_CHAPTER_STAGES =
[
    HISTORICAL_BATTLE_OF_NAGASHINO,
    HISTORICAL_BATTLE_OF_TETORIGAWA,
    HISTORICAL_INCIDENT_AT_HONNOJI,
    HISTORICAL_BATTLE_OF_YAMAZAKI,
    HISTORICAL_BATTLE_OF_SHIGUZGATAKE
]

HISTORICAL_MODE_THIRD_CHAPTER_STAGES =
[
    HISTORICAL_BATTLE_OF_KOMAKI_NAGAKUTE,
    HISTORICAL_CONQUEST_OF_KYUSHU,
    HISTORICAL_CONQUEST_OF_ODAWARA,
    HISTORICAL_BATTLE_OF_SEGAKIHARA,
    HISTORICAL_THE_OSAKA_CAMPAIGN
]

SIEGE_OF_KAWAGOE_CASTLE_HOJO_FORCE_INDEX = 0x00
MOTONARIS_RETURN_UESUGI_FORCE_INDEX = 0x01
SURUGA_SAGAMI_CONFLICT_HOJO_FORCE_INDEX = 0x02
SURUGA_SAGAMI_CONFLICT_TAKEDA_FORCE_INDEX = 0x03
KANTO_CAMPAIGN_HOJO_FORCE_INDEX = 0x04
KANTO_CAMPAIGN_UESUGI_FORCE_INDEX = 0x05
BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX = 0x06
BATTLE_OF_KAWANAKAJIMA_UESUGI_FORCE_INDEX = 0x07
BATTLE_OF_KAWANAKAJIMA_TAKEDA_FORCE_INDEX = 0x08
BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX = 0x09
BATTLE_OF_MT_INABA_CASTLE_SAITO_FORCE_INDEX = 0x0A
INVASION_OF_SURUGA_UESUGI_FORCE_INDEX = 0x0B
BATTLE_OF_MIMASE_PASS_TAKEDA_FORCE_INDEX = 0x0C
BATTLE_OF_MIMASE_PASS_HOJO_FORCE_INDEX = 0x0D
RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX = 0x0E
RETREAT_FROM_KANEGASAKI_AZAI_ASAKURA_FORCE_INDEX = 0x0F
BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX = 0x10
BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX = 0x11
BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX = 0x12
BATTLE_OF_ODANI_CASTLE_ODA_FORCE_INDEX = 0x13
CONFRONTATION_AT_LAKE_YOGO_AZAI_FORCE_INDEX = 0x14
BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX = 0x15
BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX = 0x16
BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX = 0x17
GREAT_KANTO_DEFENSE_HOJO_FORCE_INDEX = 0x18
CONFRONTATION_AT_NAGASHINO_TAKEDA_FORCE_INDEX = 0x19
BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX = 0x1A
BATTLE_OF_KIZUGAWA_MORI_FORCE_INDEX = 0x1B
BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX = 0x1C
INVASION_OF_CHUGOKU_ODA_FORCE_INDEX = 0x1D
BATTLE_OF_KOZUKI_CASTLE_MORI_FORCE_INDEX = 0x1E
THE_TACHIBANA_CRISIS_MORI_FORCE_INDEX = 0x1F
CONFRONTATION_AT_YAMAZUKI_MORI_FORCE_INDEX = 0x20
BATTLE_OF_TETORIGAWA_ODA_FORCE_INDEX = 0x21
BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX = 0x22
CONFRONTATION_AT_SHIZUGATAKE_UESUGI_FORCE_INDEX = 0x23
STRUGGLE_FOR_KAI_PROVINCE_HOJO_FORCE_INDEX = 0x24
INCIDENT_AT_HONNOJI_ODA_FORCE_INDEX = 0x25
INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX = 0x26
ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX = 0x27
BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX = 0x28
BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX = 0x29
CONFRONTATION_AT_ANEGAWA_AKECHI_FORCE_INDEX = 0x2A
BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX = 0x2B
BATTLE_OF_SHIZUGATAKE_SHIBATA_FORCE_INDEX = 0x2C
BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX = 0x2D
BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX = 0x2E
CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX = 0x2F
CONQUEST_OF_KYUSHU_SHIMAZU_FORCE_INDEX = 0x30
BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX = 0x31
BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX = 0x32
CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX = 0x33
ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX = 0x34
ASSAULT_ON_OSHI_CASTLE_HOJO_FORCE_INDEX = 0x35
THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX = 0x36
THE_KASAI_OSAKI_UPRISING_TOYOTOMI_FORCE_INDEX = 0x37
THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX = 0x38
BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX = 0x39
BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX = 0x3A
BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX = 0x3B
BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX = 0x3C
BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX = 0x3D
FLIGHT_FROM_SEKIGAHARA_WESTERN_FORCE_INDEX = 0x3E
BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX = 0x3F
BATTLE_OF_HASEDO_DATE_FORCE_INDEX = 0x40
BATTLE_OF_NUMATA_CASTLE_TOKUGAWA_FORCE_INDEX = 0x41
BATTLE_OF_NUMATA_CASTLE_SANADA_FORCE_INDEX = 0x42
CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX = 0x43
RETREAT_FROM_ISHIGAKI_PLAINS_WESTERN_FORCE_INDEX = 0x44
THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX = 0x45
THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX = 0x46
CONFRONTATION_AT_MIKATAGAHARA_TOYOTOMI_FORCE_INDEX = 0x47

MAIN_MENU_INDEX = 0x4B

function IsInMainMenu() => StageForceIndex() == MAIN_MENU_INDEX

StageNameLookup =
{
    SIEGE_OF_KAWAGOE_CASTLE_HOJO_FORCE_INDEX: "Siege of Kawagoe Castle (Hojo Army)",
    MOTONARIS_RETURN_UESUGI_FORCE_INDEX: "Motonari's Return (Uesugi Army)",
    SURUGA_SAGAMI_CONFLICT_HOJO_FORCE_INDEX: "The Suruga-Sagami Conflict (Hojo Army)",
    SURUGA_SAGAMI_CONFLICT_TAKEDA_FORCE_INDEX: "The Suruga-Sagami Conflict (Takeda Army)",
    KANTO_CAMPAIGN_HOJO_FORCE_INDEX: "The Kanto Campaign (Hojo Army)",
    KANTO_CAMPAIGN_UESUGI_FORCE_INDEX: "The Kanto Campaign (Uesugi Army)",
    BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX: "Battle of Okehazama (Oda Army)",
    BATTLE_OF_KAWANAKAJIMA_UESUGI_FORCE_INDEX: "Battle of Kawanakajima (Uesugi Army)",
    BATTLE_OF_KAWANAKAJIMA_TAKEDA_FORCE_INDEX: "Battle of Kawanakajima (Takeda Army)",
    BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX: "Battle of Mt. Inaba Castle (Oda)",
    BATTLE_OF_MT_INABA_CASTLE_SAITO_FORCE_INDEX: "Battle of Mt. Inaba Castle (Saito)",
    INVASION_OF_SURUGA_UESUGI_FORCE_INDEX: "Invasion of Suruga (Uesugi Army)",
    BATTLE_OF_MIMASE_PASS_TAKEDA_FORCE_INDEX: "Battle of Mimase Pass (Takeda Army)",
    BATTLE_OF_MIMASE_PASS_HOJO_FORCE_INDEX: "Battle of Mimase Pass (Hojo Army)",
    RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX: "Retreat from Kanegasaki (Oda-Tokugawa Army)",
    RETREAT_FROM_KANEGASAKI_AZAI_ASAKURA_FORCE_INDEX: "Retreat from Kanegasaki  (Azai-Asakura Army)",
    BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX: "Battle of Anegawa (Oda-Tokugawa Army)",
    BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX: "Battle of Anegawa (Azai-Asakura Army)",
    BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX: "Battle of Odani Castle (Azai-Asakura Army)",
    BATTLE_OF_ODANI_CASTLE_ODA_FORCE_INDEX: "Battle of Odani Castle (Oda-Tokugawa Army)",
    CONFRONTATION_AT_LAKE_YOGO_AZAI_FORCE_INDEX: "Confrontation at Lake Yogo (Azai Army)",
    BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX: "Battle of Tonegawa (Hojo-Takeda Army)",
    BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX: "Battle of Mikatagahara (Takeda Army)",
    BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX: "Battle of Mikatagahara (Tokugawar Army)",
    GREAT_KANTO_DEFENSE_HOJO_FORCE_INDEX: "The Great Kanto Defense (Hojo Army)  (Hojo story)",
    CONFRONTATION_AT_NAGASHINO_TAKEDA_FORCE_INDEX: "Confrontation at Nagashino (Takeda Army)",
    BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX: "Battle of Nagashino(Oda-Tokugawa Army)",
    BATTLE_OF_KIZUGAWA_MORI_FORCE_INDEX: "Battle of Kizugawa (Mori Army)",
    BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX: "Battle of Kizugawa (Oda Army)",
    INVASION_OF_CHUGOKU_ODA_FORCE_INDEX: "Invasion of Chugoku (Oda Army)",
    BATTLE_OF_KOZUKI_CASTLE_MORI_FORCE_INDEX: "Battle of Kozuki Castle (Mori Army)",
    THE_TACHIBANA_CRISIS_MORI_FORCE_INDEX: "The Tachibana Crisis (Mori Army)",
    CONFRONTATION_AT_YAMAZUKI_MORI_FORCE_INDEX: "Confrontation at Yamazuki (Mori Army)",
    BATTLE_OF_TETORIGAWA_ODA_FORCE_INDEX: "Battle of Tetorigawa (Oda Army)",
    BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX: "Battle of Tetorigawa (Uesugi Army)",
    CONFRONTATION_AT_SHIZUGATAKE_UESUGI_FORCE_INDEX: "Confrontation at Shizugatake (Uesugi Army)",
    STRUGGLE_FOR_KAI_PROVINCE_HOJO_FORCE_INDEX: "Struggle for Kai Province (Hojo Army)",
    INCIDENT_AT_HONNOJI_ODA_FORCE_INDEX: "Incident at Honnoji (Oda Army)",
    INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX: "Incident at Honnoji (Akechi Army)",
    ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX: "Escape through Iga (Tokugawa Army)",
    BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX: "Battle of Yamazaki (Hashiba Army)",
    BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX: "Battle of Yamazaki (Akechi Army)",
    CONFRONTATION_AT_ANEGAWA_AKECHI_FORCE_INDEX: "Confrontation at Anegawa (Akechi Army)",
    BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX: "Battle of Shizugatake (Hashiba Army)",
    BATTLE_OF_SHIZUGATAKE_SHIBATA_FORCE_INDEX: "Battle of Shizugatake (Shibata Army)",
    BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX: "Battle of Komaki-Nagakute (Hashiba Army)",
    BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX: "Battle of Komaki-Nagakute (Tokugawa Army)",
    CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX: "Conquest of Kyushu (Tachibana Army)",
    CONQUEST_OF_KYUSHU_SHIMAZU_FORCE_INDEX: "Conquest of Kyushu (Shimazu Army)",
    BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX: "Battle of Ueda Castle (Tokugawa Army)",
    BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX: "Battle of Ueda Castle (Sanada Army)",
    CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX: "Conquest of Odawara (Toyotomi Army)",
    ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX: "Assault on Oshi Castle (Toyotomi Army)",
    ASSAULT_ON_OSHI_CASTLE_HOJO_FORCE_INDEX: "Assault on Oshi Castle (Hojo Army)",
    THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX: "The Kasai Osaki Uprising (Peasant Army)",
    THE_KASAI_OSAKI_UPRISING_TOYOTOMI_FORCE_INDEX: "The Kasai Osaki Uprising (Toyotomi Army)",
    THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX: "The Rescue of Mitsunari (Ishida Army)",
    BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX: "Battle of Fushimi Castle (Western Army)",
    BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX: "Battle of Otsu Castle (Western Army)",
    BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX: "Battle of Kuzegawa (Western Army)",
    BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX: "Battle of Sekigahara (Eastern Army)",
    BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX: "Battle of Sekigahara (Western Army)",
    FLIGHT_FROM_SEKIGAHARA_WESTERN_FORCE_INDEX: "Flight From Sekigahara (Western Army)",
    BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX: "Battle of Hasedo (Uesugi Army)",
    BATTLE_OF_HASEDO_DATE_FORCE_INDEX: "Battle of Hasedo (Date Army)",
    BATTLE_OF_NUMATA_CASTLE_TOKUGAWA_FORCE_INDEX: "Battle of Numata Castle (Tokugawa Army)",
    BATTLE_OF_NUMATA_CASTLE_SANADA_FORCE_INDEX: "Battle of Numata Castle (Sanada Army)",
    CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX: "Conflict at the Ishigaki Plains (Eastern Army)",
    RETREAT_FROM_ISHIGAKI_PLAINS_WESTERN_FORCE_INDEX: "Retreat from the Ishigaki Plains (Western Army)",
    THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX: "The Osaka Campaign (Tokugawa Army)",
    THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX: "The Osaka Campaign (Toyotomi Army)",
    CONFRONTATION_AT_MIKATAGAHARA_TOYOTOMI_FORCE_INDEX: "Confrontation at Mikatagahara (Toyotomi Army)"
    
}

FIRST_LEVEL = "FIRSTLEVEL"
SECOND_LEVEL = "SECONDLEVEL"
THIRD_LEVEL = "THIRDLEVEL"
FOURTH_LEVEL = "FOURTHLEVEL"
FIFTH_LEVEL = "FIFTHLEVEL"
MAIN_MUSOU_ID = "MAINMUSOUID"
MAIN_MUSOU_TITLE = "MAINMUSOUTITLE"
TACTICAL_MUSOU_TITLE = "TACTICALMUSOUTITLE"
CHAOS_TACTICAL_TITLE = "CHAOSTACTICALTITLE"

LEVEL_IDENTIFIERS =
{
    FIRST_LEVEL: "I",
    SECOND_LEVEL: "II",
    THIRD_LEVEL: "III",
    FOURTH_LEVEL: "IV",
    FIFTH_LEVEL: "V"
}


CHARACTER_MUSOU_MODE_LIST =
{
    YUKIMURA_SANADA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549290,
        MAIN_MUSOU_TITLE: "Crimson Hero of Sanada",
        TACTICAL_MUSOU_TITLE: "Last Strategist of Osaka",
        CHAOS_TACTICAL_TITLE: "Red Demon of the Battlefield",
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_NUMATA_CASTLE_SANADA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    KEIJI_MAEDA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549291,
        MAIN_MUSOU_TITLE: "Peerless Kabukimono",
        TACTICAL_MUSOU_TITLE: "Unpredictable Wild Card",
        CHAOS_TACTICAL_TITLE: "Fearless Vanguard",
        FIRST_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_SHIZUGATAKE_SHIBATA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX
    },
    NOBUNAGA_ODA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549292,
        MAIN_MUSOU_TITLE: "The Demon King of Owari",
        TACTICAL_MUSOU_TITLE: "Architect of Unification",
        CHAOS_TACTICAL_TITLE: "Ruthless Conquerer",
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        FIFTH_LEVEL: INCIDENT_AT_HONNOJI_ODA_FORCE_INDEX
    },
    MITSUHIDE_AKECHI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549293,
        MAIN_MUSOU_TITLE: "The Traitor of Honno-ji",
        TACTICAL_MUSOU_TITLE: "Calculating Usurper",
        CHAOS_TACTICAL_TITLE: "Blade of Betrayal",
        FIRST_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX
    },
    KENSHIN_UESUGI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549294,
        MAIN_MUSOU_TITLE: "Dragon of Echigo",
        TACTICAL_MUSOU_TITLE: "God of War's Mind",
        CHAOS_TACTICAL_TITLE: "Righteous Storm",
        FIRST_LEVEL: KANTO_CAMPAIGN_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KAWANAKAJIMA_UESUGI_FORCE_INDEX,
        THIRD_LEVEL: INVASION_OF_SURUGA_UESUGI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_SHIZUGATAKE_UESUGI_FORCE_INDEX
    },
    OICHI_PLAYER_ID : { 
        MAIN_MUSOU_ID: 549295,
        MAIN_MUSOU_TITLE: "Tragic Blossom of Oda",
        TACTICAL_MUSOU_TITLE: "Noble Heart Amid Chaos",
        CHAOS_TACTICAL_TITLE: "Unyielding Resolve",
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_LAKE_YOGO_AZAI_FORCE_INDEX
    },
    KUNOICHI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549296,
        MAIN_MUSOU_TITLE: "Shadow Operative",
        TACTICAL_MUSOU_TITLE: "Master of Espionage",
        CHAOS_TACTICAL_TITLE: "Silent Assassin",
        FIRST_LEVEL: BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    MAGOICHI_SAIKA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549297,
        MAIN_MUSOU_TITLE: "Leader of the Gun Monks",
        TACTICAL_MUSOU_TITLE: "Firearms Innovator",
        CHAOS_TACTICAL_TITLE: "Thunder of Lead",
        FIRST_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        SECOND_LEVEL: THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX,
        THIRD_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_HASEDO_DATE_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    SHINGEN_TAKEDA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549298,
        MAIN_MUSOU_TITLE: "Tiger of Kai",
        TACTICAL_MUSOU_TITLE: "Supreme Battlefield Commander",
        CHAOS_TACTICAL_TITLE: "Crushing Avalanche",
        FIRST_LEVEL: SURUGA_SAGAMI_CONFLICT_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KAWANAKAJIMA_TAKEDA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_MIMASE_PASS_TAKEDA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_NAGASHINO_TAKEDA_FORCE_INDEX
    },
    MASAMUNE_DATE_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549299,
        MAIN_MUSOU_TITLE: "One-Eyed Dragon of Oshu",
        TACTICAL_MUSOU_TITLE: "Ambitious Visionary",
        CHAOS_TACTICAL_TITLE: "Blazing Ambition",
        FIRST_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_DATE_FORCE_INDEX
    },
    HANZO_HATTORI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549300,
        MAIN_MUSOU_TITLE: "Devil Ninja of Iga",
        TACTICAL_MUSOU_TITLE: "Shadow Tactician",
        CHAOS_TACTICAL_TITLE: "Phantom Blade",
        FIRST_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    HIDEYOSHI_TOYOTOMI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549301,
        MAIN_MUSOU_TITLE: "The Peasant Who Rose",
        TACTICAL_MUSOU_TITLE: "Master of Adaption",
        CHAOS_TACTICAL_TITLE: "Relentless Climber",
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX
    },
    TADAKATSU_HONDA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549302,
        MAIN_MUSOU_TITLE: "The Unwounded Warrior",
        TACTICAL_MUSOU_TITLE: "Living Shield of Tokugawa",
        CHAOS_TACTICAL_TITLE: "Indestructible Spear",
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX
    },
    INA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549303,
        MAIN_MUSOU_TITLE: "Shinobi Princess",
        TACTICAL_MUSOU_TITLE: "Hidden Protector",
        CHAOS_TACTICAL_TITLE: "Swift Fang",
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_NUMATA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    IEYASU_TOKUGAWA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549304,
        MAIN_MUSOU_TITLE: "Founder of the Shogunate",
        TACTICAL_MUSOU_TITLE: "Ultimate Survivor",
        CHAOS_TACTICAL_TITLE: "Patient Iron Fist",
        FIRST_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    MITSUNARI_ISHIDA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549305,
        MAIN_MUSOU_TITLE: "Loyalist of the West",
        TACTICAL_MUSOU_TITLE: "Idealistic Strategist",
        CHAOS_TACTICAL_TITLE: "Burning Conviction",
        FIRST_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    NAGAMASA_AZAI_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549306,
        MAIN_MUSOU_TITLE: "Torn Between Loyalties",
        TACTICAL_MUSOU_TITLE: "Honorable Commander",
        CHAOS_TACTICAL_TITLE: "Doomed Resolve",
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: RETREAT_FROM_KANEGASAKI_AZAI_ASAKURA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX
    },
    SAKON_SHIMA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549307,
        MAIN_MUSOU_TITLE: "Devoted Retainer",
        TACTICAL_MUSOU_TITLE: "Strategist of Sacrifice",
        CHAOS_TACTICAL_TITLE: "Fierce Loyalty",
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    YOSHIHIRO_SHIMAZU_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549308,
        MAIN_MUSOU_TITLE: "Ogre of Satsuma",
        TACTICAL_MUSOU_TITLE: "Master of Retreat",
        CHAOS_TACTICAL_TITLE: "Battlefield Ogre",
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_SHIMAZU_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: FLIGHT_FROM_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    GINCHIYO_TACHIBANA_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549309,
        MAIN_MUSOU_TITLE: "Warrior Matriarch",
        TACTICAL_MUSOU_TITLE: "Defend of the Clan",
        CHAOS_TACTICAL_TITLE: "Iron Will",
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: RETREAT_FROM_ISHIGAKI_PLAINS_WESTERN_FORCE_INDEX
    },
    KANETSGU_NAOE_PLAYER_ID: { 
        MAIN_MUSOU_ID: 549310,
        MAIN_MUSOU_TITLE: "Righteous General",
        TACTICAL_MUSOU_TITLE: "Strategist of Justice",
        CHAOS_TACTICAL_TITLE: "Banner of Honor",
        FIRST_LEVEL: BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX
    },
    NENE_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "First Lady of the Toyotomi",
        TACTICAL_MUSOU_TITLE: "Stabilizing Presence",
        CHAOS_TACTICAL_TITLE: "Quiet Strength",
        FIRST_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        FIFTH_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX
    },
    MOTOCHIKA_CHOSOKABE_PLAYER_ID: {
        MAIN_MUSOU_TITLE: "Unifier of Shikoku", 
        TACTICAL_MUSOU_TITLE: "Regional Conqueror",
        CHAOS_TACTICAL_TITLE: "Tidal Force",
        FIRST_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_TETORIGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_ANEGAWA_AKECHI_FORCE_INDEX
    },
    KIYOMASA_KATO_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Tiger of Higo",
        TACTICAL_MUSOU_TITLE: "Aggressive Commander",
        CHAOS_TACTICAL_TITLE: "Demon Spearman",
        FIRST_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        FOURTH_LEVEL: CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    KANBEI_KURODA_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Master Strategist",
        TACTICAL_MUSOU_TITLE: "Mind Behind Victories",
        CHAOS_TACTICAL_TITLE: "Cold Precision",
        FIRST_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        FOURTH_LEVEL: CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    MUNESHIGE_TACHIBANA_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Paragon of the West",
        TACTICAL_MUSOU_TITLE: "Peerless Commander",
        CHAOS_TACTICAL_TITLE: "Unbreakable Blade",
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_MIKATAGAHARA_TOYOTOMI_FORCE_INDEX
    },
    KAI_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Fierce Retainer",
        TACTICAL_MUSOU_TITLE: "Shield of the Takeda",
        CHAOS_TACTICAL_TITLE: "Wild Fang",
        FIRST_LEVEL: BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: STRUGGLE_FOR_KAI_PROVINCE_HOJO_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_HOJO_FORCE_INDEX,
        FOURTH_LEVEL: THE_KASAI_OSAKI_UPRISING_TOYOTOMI_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    UJIYASU_HOJO_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Lion of Sagami",
        TACTICAL_MUSOU_TITLE: "Defensive Genius",
        CHAOS_TACTICAL_TITLE: "Unmovable Wall",
        FIRST_LEVEL: SIEGE_OF_KAWAGOE_CASTLE_HOJO_FORCE_INDEX,
        SECOND_LEVEL: SURUGA_SAGAMI_CONFLICT_HOJO_FORCE_INDEX,
        THIRD_LEVEL: KANTO_CAMPAIGN_HOJO_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_MIMASE_PASS_HOJO_FORCE_INDEX,
        FIFTH_LEVEL: GREAT_KANTO_DEFENSE_HOJO_FORCE_INDEX
    },
    HANBEI_TAKENAKA_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Genius in the Shadows",
        TACTICAL_MUSOU_TITLE: "Brilliant Schemer",
        CHAOS_TACTICAL_TITLE: "Mind over Might",
        FIRST_LEVEL: BATTLE_OF_MT_INABA_CASTLE_SAITO_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        FIFTH_LEVEL: INVASION_OF_CHUGOKU_ODA_FORCE_INDEX
    },
    MOTONARI_MORI_PLAYER_ID: { 
        MAIN_MUSOU_TITLE: "Elder of Three Arrows",
        TACTICAL_MUSOU_TITLE: "Master of the Long Strategy",
        CHAOS_TACTICAL_TITLE: "Patient Predator",
        FIRST_LEVEL: MOTONARIS_RETURN_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_MORI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOZUKI_CASTLE_MORI_FORCE_INDEX,
        FOURTH_LEVEL: THE_TACHIBANA_CRISIS_MORI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_YAMAZUKI_MORI_FORCE_INDEX
    }
}


LEVEL = "LEVEL"
ID = "ID"
NO_MUSOU_CHARACTERS =
{
    OKUNI_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Dancer who Defied Tradition",
        LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX,
        ID: 573436
    },
    NO_PLAYER_ID: {  // (NOHIME)
        CHAOS_TACTICAL_TITLE: "Poisoned Smile",
        LEVEL: INCIDENT_AT_HONNOJI_ODA_FORCE_INDEX,
        ID: 573563
    },
    RANMARU_MORI_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Last Stand of Loyalty",
        LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        ID: 573564
    },
    YOSHIMOTO_IMAGAWA_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Fallen Lord of Suruga",
        LEVEL: CONFRONTATION_AT_YAMAZUKI_MORI_FORCE_INDEX,
        ID: 573565
    },
    KOTARO_FUMA_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Chaos Incarnate",
        LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX
    },
    TOSHIE_MAEDA_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Crimson Vanguard",
        LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX
    },
    KATSUITE_SHIBATA_PLAYER_ID: { 
        CHAOS_TACTICAL_TITLE: "Final Blaze",
        LEVEL: BATTLE_OF_SHIZUGATAKE_SHIBATA_FORCE_INDEX
    }
}


// $787D98: (32-bit BE) Murasame Castle Difficulty Index
//          
//          In Murasame Castle, this controls which difficulty you are playing
//          
//          Interesting Note, changing this changes the map while in the mode.
//          
//          0x00 = Normal
//          0x01 = Nightmare
//          
//          Likely has other uses in other modes.
//          
//          Higher numbers pull data.  Likely bad data.  But interesting point.
function MurasameCastleDifficultyIndex() => dword_be(0x787D98)

MURASAME_CASTLE_DIFFICULTY_NORMAL = 0x00
MURASAME_CASTLE_DIFFICULTY_NIGHTMARE = 0x01
MurasameCastleDifficultyNameLookup =
{
    MURASAME_CASTLE_DIFFICULTY_NORMAL: "Normal",
    MURASAME_CASTLE_DIFFICULTY_NIGHTMARE: "Nightmare",
}


function IsMurasameCastleNormalMode() => 
            MurasameCastleDifficultyIndex() == MURASAME_CASTLE_DIFFICULTY_NORMAL

function IsMurasameCastleNightmareMode() => 
            MurasameCastleDifficultyIndex() == MURASAME_CASTLE_DIFFICULTY_NIGHTMARE

// $787D9C: (32-bit BE) Murasame Castle Stage Index
//          
//          In Murasame Castle, this controls which level you will play
//          
//          0x00 = A Strange Rumor
//          0x01 = The Mysterious Samurai
//          0x02 = Follow Takamaru
//          0x03 = Aosame Castle
function MurasameCastleStageIndex() => dword_be(0x787D9C)


A_STRANGE_RUMOR = 0x00
THE_MYSTERIOUS_SAMURAI = 0x01
FOLLOW_TAKAMARU = 0x02
AOSAME_CASTLE = 0x03
THE_PLOT_THICKENS = 0x04
AN_UNEXPECTED_ENCOUNTER = 0x05
AKASAME_CASTLE = 0x06
THE_MYSTERY_OF_THE_JEWELS = 0x07
THE_LEGEND_OF_MURASAME = 0x08
RYOKUSAME_CASTLE = 0x09
EYE_OF_THE_STORM = 0x0A
MOMOSAME_CASTLE = 0x0B
THE_TRUTH_REVEALED = 0x0C
THE_PETRIFIED_VILLAGE = 0x0D
MURASAME_CASTLE = 0x0E
DOWN_THE_RABBIT_HOLE = 0x0F
THROUGH_THE_LOOKING_GLASS = 0x10
CURIOUSER_AND_CURIOUSER = 0x11

MurasameCastleStageNameLookup =
{
    A_STRANGE_RUMOR: "A Strange Rumor",
    THE_MYSTERIOUS_SAMURAI: "The Mysterious Samurai",
    FOLLOW_TAKAMARU: "Follow Takamaru",
    AOSAME_CASTLE: "Aosame Castle",
    THE_PLOT_THICKENS: "The Plot Thickens",
    AN_UNEXPECTED_ENCOUNTER: "An Unexpected Encounter",
    AKASAME_CASTLE: "Akasame Castle",
    THE_MYSTERY_OF_THE_JEWELS: "The Mystery Of The Jewels",
    THE_LEGEND_OF_MURASAME: "The Legend of Murasame",
    RYOKUSAME_CASTLE: "Ryokusame Castle",
    EYE_OF_THE_STORM: "Eye of the Storm",
    MOMOSAME_CASTLE: "Momosame Castle",
    THE_TRUTH_REVEALED: "The Truth Revealed",
    THE_PETRIFIED_VILLAGE: "The Petrified Village",
    MURASAME_CASTLE: "Murasame Castle",
    DOWN_THE_RABBIT_HOLE: "Down the Rabbit Hole",
    THROUGH_THE_LOOKING_GLASS: "Through the Looking Glass",
    CURIOUSER_AND_CURIOUSER: "Curiouser and Curiouser"
}
// $787DA8: (32-bit BE) Current Player
//          
//          This controls a few things like which weapons you're selecting from, and which player is actually loading in (If you change this on preparation... The game will freeze
//          
//          Also selected character on the background screen
//          
//          0x00 = Yukimura Sanada
//          0x01 = Keiji Maeda
//          0x02 = Nobunaga Oda
//          0x03 = Mitsuhide Akechi
//          0x04 = Kenshin Uesugi
//          0x05 = Oichi
//          0x06 = Okuni
//          0x07 = Kunoichi
//          0x08 = Magoichi Saika
//          0x09 = Shingen Takeda
//          0x0a = Masamune Date
//          0x0b = No
//          0x0c = Hanzo Hattori
//          0x0d = Ranmaru Mori
//          0x0e = Hideyoshi Toyotomi
//          0x0f = Yoshimoto Imagawa
//          0x10 =Tadakatsu Honda
//          0x11 = Ina
//          0x12 = Ieyasu Tokugawa
//          0x13 = Mitsunari Ishida
//          0x14 = Nagamasa Azai
//          0x15 = Sakon Shima
//          0x16 = Yoshihiro Shimazu
//          0x17 = Ginchiyo Tachibana
//          0x18 = Kanetsugu Naoe
//          0x19 = Nene
//          0x1a = Kotaro Fuma
//          0x1b = Toshiie Maeda
//          0x1c = Motochika Chosokabe
//          0x1d = Katsuie Shibata
//          0x1e = Kiyomasa Kato
//          0x1f =  Kanbei Kuroda
//          0x20 = Muneshige Tachibana
//          0x21 = Kai
//          0x22 = Ujiyasu Hojo
//          0x23 = Hanbei Takenaka
//          0x24 = Motonari Mori
//          0x25 = Masanori Fukushima (probably not selectable
//          0x26 = Aya (probably not selectable)
//          0x27 = Takamaru
//          
//          
//          <I assume the other characters exist, but I don't have values for them>
//          0x28 = First Character
//          0x3b = Last Custom Character
function CurrentPlayerID() => dword_be(0x787DA8)

// $78B0CC: (Float BE) Actual Time control. This is Seconds (Floating point value)
//          
//          Setting this to 3600 (on a 3600 second mission) Fails the mission immediately.
function CurrentTimeSeconds() => float_be(0x78B0CC)

function CurrentTimeFrames() => CurrentTimeSeconds() * 60

// $78B0FC: (32-bit BE) Character Mission/Level Index
//          
//          0x00 = First level of the current player character in Story
//          0x01 = Second Level of the Current Player Characters in story mode.
//          
//          Not sure what it means for Free mode.
//          
//          Looks like it works for historical mode, but there's three stories there.
function CharacterMissionLevelIndex() => dword_be(0x78B0FC)

// $107D6F4: (32-bit BE) KO pointer
//           
//           +0x8000004c: KO counter   Control, changing this changes the KO count. (If this is ever bellow the current count, it'll count forever, just a comment.)
function KoPointer() => dword_be(0x107D6F4)

function CurrentKOCounter() => dword_be((KoPointer() & 0x7fffffff)+ 0x0000004c)

// $107D950: (32-bit BE) Number of Items Player 1 currently has
function NumberOfItemsPlayer1CurrentlyHas() => dword_be(0x107D950)

HARD_CODED_NUMBER_OF_ITEMS_PLAYER_1_STARTS_WITH = 6

function PlayerHasNotUsedAnyItems() => 
    NumberOfItemsPlayer1CurrentlyHas() == HARD_CODED_NUMBER_OF_ITEMS_PLAYER_1_STARTS_WITH

function GeneralProtection() => !IsInMainMenu() && IsInSinglePlayerMode() && !IsInDemoMode() && YukimuraSanadaLevel() != 0x00

achievement(
    title = "Your First Battle", points = 1,
    description = "Win Any Stage",
    id = 549285,
    trigger = JustWonMission() && GeneralProtection()
)

achievement(
    title = "Assembled Your Forces", points = 5,
    description = "Unlock Every Character from the Dojo",
    id = 549286,
    trigger = IsInDojoMode() && JustPurchasedAllCharacters()
)

achievement(
    title = "Dress up Your Forces", points = 5,
    description = "Purchase every Customize Appearance from The Dojo",
    id = 549287,
    trigger = IsInDojoMode() && JustPurchasedAllCustomizedCharacters()
)

achievement(
    title = "Unleash Your Forces", points = 5,
    description = "Purchase every Unlock Max Stats from the Dojo",
    id = 549288,
    trigger = IsInDojoMode() && JustPurchasedAllMaxStatUnlocks()
)

achievement(
    title = "Equip Your Forces", points = 3,
    description = "Purchase every Unlock Weapon from the Dojo",
    id = 549289,
    trigger = IsInDojoMode() && JustPurchasedAllWeaponsUnlocks()
)


function CreateMusouModeAchievement(characterId) {
    if (ContainsKey(CHARACTER_MUSOU_MODE_LIST[characterId], MAIN_MUSOU_ID))
    {
        achievement( title = CHARACTER_MUSOU_MODE_LIST[characterId][MAIN_MUSOU_TITLE],
            description = "Clear all five of " + CHARACTER_NAME_LOOKUP[characterId] + "'s stages in Story Mode for the first time",
            id = CHARACTER_MUSOU_MODE_LIST[characterId][MAIN_MUSOU_ID],
            points = 5,
            type = "progression",
            trigger = GeneralProtection() &&
                  IsInStoryMode() &&
                  CurrentPlayerID() == characterId &&
                  WonMission() &&
                  CharacterJustClearedMusouMode(characterId)
        )
    }
    else
    {
        achievement( title = CHARACTER_MUSOU_MODE_LIST[characterId][MAIN_MUSOU_TITLE],
            description = "Clear all five of " + CHARACTER_NAME_LOOKUP[characterId] + "'s stages in Story Mode for the first time",
            points = 5,
            trigger = GeneralProtection() &&
                  IsInStoryMode() &&
                  CurrentPlayerID() == characterId &&
                  WonMission() &&
                  CharacterJustClearedMusouMode(characterId)
        )
    }

}

for characterId in CHARACTER_MUSOU_MODE_LIST
{
    CreateMusouModeAchievement(characterId)
}


function CreateTacticalMusouModeAchievement(characterId) {
    
    achievement( title = CHARACTER_MUSOU_MODE_LIST[characterId][TACTICAL_MUSOU_TITLE],
        description = "Complete all five of " + CHARACTER_NAME_LOOKUP[characterId] + "'s stages in Story Mode with all Tactical Bonuses",
        points = 5,
        trigger = GeneralProtection() &&
                IsInStoryMode() &&
                CurrentPlayerID() == characterId &&
                WonMission() &&
                HasCharacterJustCompletedTactical(characterId)
    )
}

for characterId in CHARACTER_MUSOU_MODE_LIST
{
    CreateTacticalMusouModeAchievement(characterId)
}

CHAPTER_NAMING = 
{
    1: "first",
    2: "second",
    3: "third"
}

HISTORICAL_ACHIEVEMENT_NAMES =
{
    1: { MAIN_MUSOU_TITLE: "Age of Warring Lords",
            TACTICAL_MUSOU_TITLE: "Learning Through Defense and Alliance",
            CHAOS_TACTICAL_TITLE: "Steel Tested in Chaos"},
    2: { MAIN_MUSOU_TITLE: "The Fall of the Demon",
            TACTICAL_MUSOU_TITLE: "Endurance Amid Upheaval",
            CHAOS_TACTICAL_TITLE: "Marching Through the Firestorm"},
    3: { MAIN_MUSOU_TITLE: "Unification and It's Cost",
            TACTICAL_MUSOU_TITLE: "Patience Rewarded by Dominion",
            CHAOS_TACTICAL_TITLE: "Victory that Outlived its Master"}
}

function HistoricalProgressionAchievement(stageNumber)
{
    achievement( title = HISTORICAL_ACHIEVEMENT_NAMES[stageNumber][MAIN_MUSOU_TITLE],
                description = format("Complete the five stages of the {0} Chapter of Historical Mode", CHAPTER_NAMING[stageNumber]) ,
                points = 3,
                type = "progression",
                trigger = GeneralProtection() &&
                        IsInHistoricalMode() &&
                        WonMission() &&
                        measured(sum_of(range(1,5), 
                                    index => HistoricalModeStageCompleteStatus (stageNumber, index) / 
                                            HistoricalModeStageCompleteStatus (stageNumber, index) ) == 5) &&
                        any_of( range(1,5), 
                                    index => HistoricalModeStageCompleteStatus (stageNumber, index)  == 1 && 
                                            prev(HistoricalModeStageCompleteStatus (stageNumber, index) ) == 0)
    )
}

for index in range(1,3)
{
    HistoricalProgressionAchievement(index)
}

function HistoricalStoryProgressionAchievement(stageNumber)
{
    achievement( title = HISTORICAL_ACHIEVEMENT_NAMES[stageNumber][TACTICAL_MUSOU_TITLE],
                description = format("Fully fill out the {0} chapter of the Historical Mode book", CHAPTER_NAMING[stageNumber]) ,
                points = 4,
                trigger = GeneralProtection() &&
                        IsInHistoricalMode() &&
                        WonMission() &&
                        measured(sum_of(range(1,5), 
                                    index => HistoricalModeStageCompleteStatus (stageNumber, index) / 
                                            MAX_HISTORICAL_STAGE_COMPLETED_VALUE) == 5) &&
                        any_of( range(1,5), 
                                    index => HistoricalModeStageCompleteStatus (stageNumber, index)  == MAX_HISTORICAL_STAGE_COMPLETED_VALUE && 
                                            prev(HistoricalModeStageCompleteStatus (stageNumber, index) ) < MAX_HISTORICAL_STAGE_COMPLETED_VALUE )
    )
}

for index in range(1,3)
{
    HistoricalStoryProgressionAchievement(index)
}


NORMAL_MURASAME_TITLE = "Normal_Murasame_Title"
NIGHTMARE_MURASAME_TITLE = "Nightmare_Murasame_Title"
NIGHTMARE_MURASAME_POINTS = "Nightmare_Murasame_Points"
NIGHTMARE_MURASAME_ID = "NIGHTMARE_MURASAME_ID"

MurasameLevelData = 
{
    AOSAME_CASTLE: { NORMAL_MURASAME_TITLE: "The Legend of the Five Jewels", 
                     NIGHTMARE_MURASAME_TITLE: "Night Is Always Darkest Before the Dawn", 
                     NIGHTMARE_MURASAME_POINTS: 10,
                     NIGHTMARE_MURASAME_ID: 573583
                    },
    AKASAME_CASTLE: { NORMAL_MURASAME_TITLE: "The Stolen Jewel", 
                      NIGHTMARE_MURASAME_TITLE: "A Thief in the Night", 
                      NIGHTMARE_MURASAME_POINTS: 10,
                      NIGHTMARE_MURASAME_ID: 573584
                      },
    RYOKUSAME_CASTLE: { NORMAL_MURASAME_TITLE: "Recovered Jewels", 
                      NIGHTMARE_MURASAME_TITLE: "Danger in the Night", 
                      NIGHTMARE_MURASAME_POINTS: 10,
                      NIGHTMARE_MURASAME_ID: 573585 },
    MOMOSAME_CASTLE: { NORMAL_MURASAME_TITLE: "Possessed Jewels", 
                      NIGHTMARE_MURASAME_TITLE: "The Dark Night", 
                      NIGHTMARE_MURASAME_POINTS: 10,
                      NIGHTMARE_MURASAME_ID: 573586
                     },
    MURASAME_CASTLE: { NORMAL_MURASAME_TITLE: "Defeated Jewels", 
                      NIGHTMARE_MURASAME_TITLE: "Day", 
                      NIGHTMARE_MURASAME_POINTS: 10,
                      NIGHTMARE_MURASAME_ID: 573587
                     },
    CURIOUSER_AND_CURIOUSER: { NORMAL_MURASAME_TITLE: "Takamaru in Wonderland", 
                      NIGHTMARE_MURASAME_TITLE: "The Nightmare Is Finally Over", 
                      NIGHTMARE_MURASAME_POINTS: 25,
                      NIGHTMARE_MURASAME_ID: 573588
                      }
}

for stageId in MurasameLevelData
{
    achievement( title = MurasameLevelData[stageId][NORMAL_MURASAME_TITLE],
                description = format("Complete the stage {0} in Murasame Castle on Normal Difficulty", MurasameCastleStageNameLookup[stageId]),
                type = "progression",
                points = 5, 
                trigger = GeneralProtection() &&
                        IsInMurasameCastleMode() &&
                        IsMurasameCastleNormalMode() &&
                        MurasameCastleStageIndex() == stageId &&
                        JustCompleteCastleStage(stageId)
    )
}

achievement(
    title = "Tanuki Suit Not Included", points = 5,
    description = "Collect all Tanuki in Murasame Castle on Normal Difficulty",
    trigger = GeneralProtection() &&
              IsInMurasameCastleMode() &&
              IsMurasameCastleNormalMode() &&
              JustReachedTanukiCount(MAX_TANUKI_COUNT)
)   


for characterId in CHARACTER_MUSOU_MODE_LIST
{
    achievement(title = format( "{0}", 
                                CHARACTER_MUSOU_MODE_LIST[characterId][CHAOS_TACTICAL_TITLE]),
                description = format("Complete all fives of {0}'s stages in Story Mode on Chaos Difficulty with all Tactical Bonuses",
                                        CHARACTER_NAME_LOOKUP[characterId]),
                points = 25,
                trigger = measured(tally_of(LEVEL_IDENTIFIERS, 5, tag=> 
                                            once(GeneralProtection() && 
                                            IsInStoryMode() &&
                                            IsChaosDifficultySelected() &&
                                            CurrentPlayerID() == characterId &&
                                            StageForceIndex() == CHARACTER_MUSOU_MODE_LIST[characterId][tag] &&
                                            JustWonMission() &&
                                            AllTacticalBonusesCompletedForCurrentMission())
                        )
                )
    )
}

LIST = "LIST"

HistoricalModeChaosList = 
{
    1: {
            TITLE: "Steel Tested in Chaos", 
            DESCRIPTION:"Complete all fives of the first chapter in Historical Mode on Chaos Difficulty with all Tactical Bonuses",
            LIST: HISTORICAL_MODE_FIRST_CHAPTER_STAGES
    },
    2: {
            TITLE: "Marching Through the Firestorm", 
            DESCRIPTION:"Complete all fives of the second chapter in Historical Mode on Chaos Difficulty with all Tactical Bonuses",
            LIST: HISTORICAL_MODE_SECOND_CHAPTER_STAGES
    },
    3: {
            TITLE: "Victory That Outlived its Master", 
            DESCRIPTION:"Complete all fives of the third chapter in Historical Mode on Chaos Difficulty with all Tactical Bonuses",
            LIST: HISTORICAL_MODE_THIRD_CHAPTER_STAGES
    }

}

function HistoricalModeChaosAchievements(ListIndex)
{
    achievement( title = HistoricalModeChaosList[ListIndex][TITLE],
                description = HistoricalModeChaosList[ListIndex][DESCRIPTION],
                points = 5,
                trigger = measured(tally_of(HistoricalModeChaosList[ListIndex][LIST], 5, stageId=> 
                                    once(GeneralProtection() &&
                                    IsInHistoricalMode() &&
                                    IsChaosDifficultySelected() &&
                                    StageForceIndex() == stageId &&
                                    JustWonMission() &&
                                    AllTacticalBonusesCompletedForCurrentMission())
            )
        )
    )
}

for index in HistoricalModeChaosList
{
    HistoricalModeChaosAchievements(index)
}

for stageId in MurasameLevelData
{
    achievement( title = MurasameLevelData[stageId][NIGHTMARE_MURASAME_TITLE],
                description = format("Complete the stage {0} in Murasame Castle on Nightmare Difficulty", MurasameCastleStageNameLookup[stageId]) ,
                points = MurasameLevelData[stageId][NIGHTMARE_MURASAME_POINTS],
                id = MurasameLevelData[stageId][NIGHTMARE_MURASAME_ID],
                trigger = GeneralProtection() &&
                        IsInMurasameCastleMode() &&
                        IsMurasameCastleNightmareMode() &&
                        MurasameCastleStageIndex() == stageId &&
                        IsMurasameCastleNightmareMode() &&
                        JustCompleteNightmareCastleStage(stageId) 
    )
}

achievement(
    title = "Stone Tanuki No Longer",
    description = "Collect all Tanuki in Murasame Castle on Nightmare Difficulty",
    points = 5,
    trigger = GeneralProtection() &&
              IsInMurasameCastleMode() &&
              IsMurasameCastleNightmareMode() &&
              JustReachedNightmareTanukiCount(MAX_TANUKI_COUNT)
)

for playerID in NO_MUSOU_CHARACTERS 
{
    if (ContainsKey(NO_MUSOU_CHARACTERS[playerID], ID))
    {
        achievement( title = NO_MUSOU_CHARACTERS[playerID][CHAOS_TACTICAL_TITLE],
                description = format("Complete {0} in Free Mode as {1} on Chaos Difficulty with all Tactical Bonuses", 
                                    StageNameLookup[NO_MUSOU_CHARACTERS[playerID][LEVEL]], 
                                    CHARACTER_NAME_LOOKUP[playerID]),
                points = 10,
                id = NO_MUSOU_CHARACTERS[playerID][ID],
                trigger = GeneralProtection() &&
                          IsInFreeMode() &&
                          IsChaosDifficultySelected() &&
                          CurrentPlayerID() == playerID &&
                          StageForceIndex() == NO_MUSOU_CHARACTERS[playerID][LEVEL] &&
                          TriggerJustWonMission() &&
                          AllTacticalBonusesCompletedForCurrentMission()
        )
    } 
    else
    {
        achievement( title = NO_MUSOU_CHARACTERS[playerID][CHAOS_TACTICAL_TITLE],
                description = format("Complete {0} in Free Mode as {1} on Chaos Difficulty with all Tactical Bonuses", 
                                    StageNameLookup[NO_MUSOU_CHARACTERS[playerID][LEVEL]], 
                                    CHARACTER_NAME_LOOKUP[playerID]),
                points = 10,
                trigger = GeneralProtection() &&
                          IsInFreeMode() &&
                          IsChaosDifficultySelected() &&
                          CurrentPlayerID() == playerID &&
                          StageForceIndex() == NO_MUSOU_CHARACTERS[playerID][LEVEL] &&
                          TriggerJustWonMission() &&
                          AllTacticalBonusesCompletedForCurrentMission()
        )
    }
    
}


for characterID in FOURTH_WEAPON_NAME
{
    achievement( title = FOURTH_WEAPON_NAME[characterID],
                description = format("Acquire the {0} as {1}", 
                                    FOURTH_WEAPON_NAME[characterID],
                                    CHARACTER_NAME_LOOKUP[characterID] ),
                points = 5,
                trigger = GeneralProtection() &&
                          IsInGameplayMode() &&
                          WonMission() &&
                          CurrentPlayerID() == characterID &&
                          CharacterWeaponJustChanged(characterID, characterID)
    )
}

for generalWeaponType in FOURTH_CUSTOM_WEAPON_TYPES
{
    achievement( title = FOURTH_CUSTOM_WEAPON_TYPES[generalWeaponType],
                description = format("Acquire a {0} as any custom character", 
                                    FOURTH_CUSTOM_WEAPON_TYPES[generalWeaponType] ),
                points = 5,
                trigger = GeneralProtection() &&
                          IsInGameplayMode() &&
                          WonMission() &&
                          any_of( range(FIRST_CUSTOM_CHARACTER_PLAYER_ID, LAST_CUSTOM_CHARACTER_PLAYER_ID), characterId =>
                                CustomCharacterGeneralWeaponType(characterId) == generalWeaponType &&
                                CharacterWeaponJustChanged(characterId, generalWeaponType))
    )
}


// skipping this because it's just "Beat a level" 
// Beat a stage with out using any items.


// Each of the six "unused" characters for Musou Mode, have a specific stage to beat on Hard, with all tactical bonuses


achievement(title = "A True Warrior of the Sengoku Era",
            description = "Earn 1000 KOs in a single stage",
            points = 3, 
            trigger = GeneralProtection() &&
                      (IsInGameplayMode()) &&
                      CurrentKOCounter() >= 1000 &&
                      prev(CurrentKOCounter())< 1000
)


function easyleaderboard( title, description, start, value, format, lower_is_better)
{

    leaderboard(
        title = title,
        description = description,
        start = start,
        cancel = always_false(),
        submit = always_true(),
        value = value,
        format = format,
        lower_is_better = lower_is_better
    )
}

function leaderboardGenerator( StageFactionID)
{

    start_condition = 
    (
        GeneralProtection() &&
        IsInGameplayMode() &&
        StageForceIndex() == StageFactionID &&
        JustWonMission()
    )
    
    start_condition_chaos =
    (
        start_condition &&
        IsChaosDifficultySelected()
    )

    
    kill_count = CurrentKOCounter()

    time_elapsed = CurrentTimeFrames()

    stage_name = StageNameLookup[StageFactionID]
    
    easyleaderboard(
        title = format("Most Kills on {0}",stage_name),
        description = format("Get the most kills on {0} and win the stage", stage_name),
        start = start_condition,
        value = kill_count,
        format = "VALUE",
        lower_is_better = false
    )

    easyleaderboard(
        title = format("Most Kills on {0} - Chaos", stage_name),
        description = format("Get the most kills on {0} on Chaos and win the stage", stage_name),
        start = start_condition_chaos,
        value = kill_count,
        format = "VALUE",
        lower_is_better = false
    )

    easyleaderboard(
        title = format("Fastest Run on {0}", stage_name),
        description = format("Get through the stage {0} the fastest", stage_name),
        start = start_condition,
        value = time_elapsed,
        format = "FRAMES",
        lower_is_better = true
    )

    easyleaderboard(
        title = format("Fastest Run on {0} - Chaos", stage_name),
        description = format("Get through the stage {0} the fastest on Chaos", stage_name),
        start = start_condition_chaos,
        value = time_elapsed,
        format = "FRAMES",
        lower_is_better = true
    )
}

for stageId in StageNameLookup
{
    leaderboardGenerator(stageId)
}



rich_presence_conditional_display(IsInMainMenu(), "Main Menu")
rich_presence_conditional_display(IsInDemoMode(), "Watching the Demos")

rich_presence_conditional_display(IsInStoryMode(), "Story Mode: Character: {0} Stage: {1} Difficulty: {2}",
                                  rich_presence_lookup("Character", CurrentPlayerID(), CHARACTER_NAME_LOOKUP),
                                  rich_presence_lookup("Stage", StageForceIndex(), StageNameLookup),
                                  rich_presence_lookup("Difficulty", DifficultySelected(), DifficultyNameLookup))

rich_presence_conditional_display(IsInFreeMode(), "Free Mode: Character: {0} Stage: {1} Difficulty: {2}",
                                  rich_presence_lookup("Character", CurrentPlayerID(), CHARACTER_NAME_LOOKUP),
                                  rich_presence_lookup("Stage", StageForceIndex(), StageNameLookup),
                                  rich_presence_lookup("Difficulty", DifficultySelected(), DifficultyNameLookup))

rich_presence_conditional_display(IsInHistoricalMode(), "Historical Mode: Character: {0} Stage: {1} Difficulty: {2}",
                                  rich_presence_lookup("Character", CurrentPlayerID(), CHARACTER_NAME_LOOKUP),
                                  rich_presence_lookup("Stage", StageForceIndex(), StageNameLookup),
                                  rich_presence_lookup("Difficulty", DifficultySelected(), DifficultyNameLookup))

rich_presence_conditional_display(IsInMurasameCastleMode(), "Murasame Castle Mode: Character: {0} Stage: {1} Difficulty: {2}",
                                  rich_presence_lookup("Character", CurrentPlayerID(), CHARACTER_NAME_LOOKUP),
                                  rich_presence_lookup("MurasameStage", MurasameCastleStageIndex(), MurasameCastleStageNameLookup),
                                  rich_presence_lookup("MurasameDifficulty", MurasameCastleDifficultyIndex(), MurasameCastleDifficultyNameLookup))

rich_presence_display("In the Menus")


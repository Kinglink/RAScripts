// Samurai Warriors 3
// #ID = 34694

function bitOffset(InitialLocation, BitValue)
{
    offset = BitValue / 8
    
    targetBit = BitValue % 8
    targetLocation = InitialOffset+offset
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
TAKAMURA_PLAYER_ID = 0x27
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
    TOSHIE_MAEDA_PLAYER_ID: "Toshie Maeda",
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
    TAKAMURA_PLAYER_ID: "Takamura",
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
    array_push(retValue, TAKAMURA_PLAYER_ID)
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

CHAOS_DIFFICULTY_VALUE = 0x03
function IsChaosDifficultySelected() => DifficultySelected() == CHAOS_DIFFICULTY_VALUE

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
    return measured(bitcount_5bit_char(TACTICALLY_COMPLETE_STAGE_START, characterId) == 5) && 
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
    return bitOffset(0x65464E, CastleStageIndex) && 
      !prev(bitOffset(0x65464E, CastleStageIndex))
}

function JustCompleteNightmareCastleStage(CastleStageIndex)
{
    nightmareBitValue = CastleStageIndex + NIGHTMARE_MODE_BIT_VALUE_OFFSET
    return bitOffset(0x65464E, nightmareBitValue) && 
      !prev(bitOffset(0x65464E, nightmareBitValue))
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

function CountofTanukisCollected()
{
    return bitcount_variable_bits(0x654654, 0, 54) 
}

function JustReachedTanukiCount(targetCount)
{
    return CountofTanukisCollected() == targetCount && 
      prev(CountofTanukisCollected()) == targetCount - 1
}

function CountofNightmareTanukisCollected()
{
    return bitcount_variable_bits(0x65465B, 0, 54) 
}

function JustReachedNightmareTanukiCount(targetCount)
{
    return CountofNightmareTanukisCollected() == targetCount && 
      prev(CountofNightmareTanukisCollected()) == targetCount - 1
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

function convertHistoricalStageToIndex(Stage, subStage) => ((Stage -1) * 5) + subStage - 1

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
    return tally_of(range(0, 5), 
                    6, 
                    i => dword_be(ObjectiveInfoForCurrentMissionLocation + (index * 4)) == 0xffffffff || 
                         dword_be(ObjectiveStatusForCurrentMissionLocation + (index * 4)) == 1)
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

function AllObjectivesCompletedForCurrentMission()
{
    return tally_of(range(0, 3), 
                    4, 
                    i => dword_be(TacticalBonusIndexForCurrentMissionLocation + (index * 4)) == 0xffffffff || 
                         dword_be(TacticalBonusStatusForCurrentMissionLocation + (index * 4)) == 1)
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

HISTORICAL_STAGE_1_LIST = 
[
    HISTORICAL_SIEGE_OF_KAWAGOE_CASTLE,
    HISTORICAL_BATTLE_OF_OKEHAZAMA,
    HISTORICAL_BATTLE_OF_KAWANAKAJIMA,
    HISTORICAL_BATLE_OF_ANGEGAWA,
    HISTORICAL_BATTLE_OF_MIKATAGAHARA
]

HISTORICAL_STAGE_2_LIST =
[
    HISTORICAL_BATTLE_OF_NAGASHINO,
    HISTORICAL_BATTLE_OF_TETORIGAWA,
    HISTORICAL_INCIDENT_AT_HONNOJI,
    HISTORICAL_BATTLE_OF_YAMAZAKI,
    HISTORICAL_BATTLE_OF_SHIGUZGATAKE
]

HISTORICAL_STAGE_3_LIST =
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
BATTLE_OF_ODANI_CASTLE_ODA_FORCE_INDEX= 0x12
BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX = 0x13
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

CHARACTER_MUSOU_MODE_LIST =
{
    YUKIMURA_SANADA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_NUMATA_CASTLE_SANADA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    KEIJI_MAEDA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_SHIZUGATAKE_SHIBATA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX
    },
    NOBUNAGA_ODA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        FIFTH_LEVEL: INCIDENT_AT_HONNOJI_ODA_FORCE_INDEX
    },
    MITSUHIDE_AKECHI_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX
    },
    KENSHIN_UESUGI_PLAYER_ID: { 
        FIRST_LEVEL: KANTO_CAMPAIGN_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KAWANAKAJIMA_UESUGI_FORCE_INDEX,
        THIRD_LEVEL: INVASION_OF_SURUGA_UESUGI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_SHIZUGATAKE_UESUGI_FORCE_INDEX
    },
    OICHI_PLAYER_ID : { 
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_LAKE_YOGO_AZAI_FORCE_INDEX
    },
    KUNOICHI_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    MAGOICHI_SAIKA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        SECOND_LEVEL: THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX,
        THIRD_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_HASEDO_DATE_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    SHINGEN_TAKEDA_PLAYER_ID: { 
        FIRST_LEVEL: SURUGA_SAGAMI_CONFLICT_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KAWANAKAJIMA_TAKEDA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_MIMASE_PASS_TAKEDA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_NAGASHINO_TAKEDA_FORCE_INDEX
    },
    MASAMUNE_DATE_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: THE_KASAI_OSAKI_UPRISING_PEASANT_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_DATE_FORCE_INDEX
    },
    HANZO_HATTORI_PLAYER_ID: { 
        FIRST_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    HIDEYOSHI_TOYOTOMI_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: RETREAT_FROM_KANEGASAKI_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX
    },
    TADAKATSU_HONDA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_UEDA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX
    },
    INA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_NUMATA_CASTLE_TOKUGAWA_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    IEYASU_TOKUGAWA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_SEKIGAHARA_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    MITSUNARI_ISHIDA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    NAGAMASA_AZAI_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_OKEHAZAMA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_MT_INABA_CASTLE_ODA_FORCE_INDEX,
        THIRD_LEVEL: RETREAT_FROM_KANEGASAKI_AZAI_ASAKURA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_ANEGAWA_AZAI_ASAKURA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_ODANI_CASTLE_AZAI_FORCE_INDEX
    },
    SAKON_SHIMA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_MIKATAGAHARA_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    YOSHIHIRO_SHIMAZU_PLAYER_ID: { 
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_SHIMAZU_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: FLIGHT_FROM_SEKIGAHARA_WESTERN_FORCE_INDEX
    },
    GINCHIYO_TACHIBANA_PLAYER_ID: { 
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_FUSHIMI_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KUZEGAWA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: RETREAT_FROM_ISHIGAKI_PLAINS_WESTERN_FORCE_INDEX
    },
    KANETSGU_NAOE_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_TETORIGAWA_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_UEDA_CASTLE_SANADA_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_TOYOTOMI_FORCE_INDEX,
        FOURTH_LEVEL: THE_RESCUE_OF_MITSUNARI_ISHIDA_FORCE_INDEX,
        FIFTH_LEVEL: BATTLE_OF_HASEDO_UESUGI_FORCE_INDEX
    },
    NENE_PLAYER_ID: { 
        FIRST_LEVEL: ESCAPE_THROUGH_IGA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        FIFTH_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX
    },
    MOTOCHIKA_CHOSOKABE_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_TETORIGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: INCIDENT_AT_HONNOJI_AKECHI_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_YAMAZAKI_AKECHI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_ANEGAWA_AKECHI_FORCE_INDEX
    },
    KIYOMASA_KATO_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_SHIZUGATAKE_HASHIBA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KOMAKI_NAGAKUTE_HASHIBA_FORCE_INDEX,
        THIRD_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        FOURTH_LEVEL: CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    KANBEI_KURODA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_YAMAZAKI_HASHIBA_FORCE_INDEX,
        FOURTH_LEVEL: CONFLICT_AT_ISHIGAKI_PLAINS_EASTERN_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOKUGAWA_FORCE_INDEX
    },
    MUNESHIGE_TACHIBANA_PLAYER_ID: { 
        FIRST_LEVEL: CONQUEST_OF_KYUSHU_TACHIBANA_FORCE_INDEX,
        SECOND_LEVEL: CONQUEST_OF_ODAWARA_TOYOTOMI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_OTSU_CASTLE_WESTERN_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_SEKIGAHARA_WESTERN_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_MIKATAGAHARA_TOYOTOMI_FORCE_INDEX
    },
    KAI_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_TONEGAWA_HOJO_TAKEDA_FORCE_INDEX,
        SECOND_LEVEL: STRUGGLE_FOR_KAI_PROVINCE_HOJO_FORCE_INDEX,
        THIRD_LEVEL: ASSAULT_ON_OSHI_CASTLE_HOJO_FORCE_INDEX,
        FOURTH_LEVEL: THE_KASAI_OSAKI_UPRISING_TOYOTOMI_FORCE_INDEX,
        FIFTH_LEVEL: THE_OSAKA_CAMPAIGN_TOYOTOMI_FORCE_INDEX
    },
    UJIYASU_HOJO_PLAYER_ID: { 
        FIRST_LEVEL: SIEGE_OF_KAWAGOE_CASTLE_HOJO_FORCE_INDEX,
        SECOND_LEVEL: SURUGA_SAGAMI_CONFLICT_HOJO_FORCE_INDEX,
        THIRD_LEVEL: KANTO_CAMPAIGN_HOJO_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_MIMASE_PASS_HOJO_FORCE_INDEX,
        FIFTH_LEVEL: GREAT_KANTO_DEFENSE_HOJO_FORCE_INDEX
    },
    HANBEI_TAKENAKA_PLAYER_ID: { 
        FIRST_LEVEL: BATTLE_OF_MT_INABA_CASTLE_SAITO_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_ANEGAWA_ODA_TOKUGAWA_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_NAGASHINO_ODA_TOKUGAWA_FORCE_INDEX,
        FOURTH_LEVEL: BATTLE_OF_KIZUGAWA_ODA_FORCE_INDEX,
        FIFTH_LEVEL: INVASION_OF_CHUGOKU_ODA_FORCE_INDEX
    },
    MOTONARI_MORI_PLAYER_ID: { 
        FIRST_LEVEL: MOTONARIS_RETURN_UESUGI_FORCE_INDEX,
        SECOND_LEVEL: BATTLE_OF_KIZUGAWA_MORI_FORCE_INDEX,
        THIRD_LEVEL: BATTLE_OF_KOZUKI_CASTLE_MORI_FORCE_INDEX,
        FOURTH_LEVEL: THE_TACHIBANA_CRISIS_MORI_FORCE_INDEX,
        FIFTH_LEVEL: CONFRONTATION_AT_YAMAZUKI_MORI_FORCE_INDEX
    }
}

NO_MUSOU_CHARACTERS =
[
    OKUNI_PLAYER_ID,
    NO_PLAYER_ID, // (NOHIME)
    RANMARU_MORI_PLAYER_ID,
    YOSHIMOTO_IMAGAWA_PLAYER_ID,
    KOTARO_FUMA_PLAYER_ID,
    TOSHIE_MAEDA_PLAYER_ID,
    KATSUITE_SHIBATA_PLAYER_ID
]


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
//          0x27 = Takamura
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

function CurrentKOCounter() => dword_be(KoPointer() + 0x4C)

// $107D950: (32-bit BE) Number of Items Player 1 currently has
function NumberOfItemsPlayer1CurrentlyHas() => dword_be(0x107D950)

HARD_CODED_NUMBER_OF_ITEMS_PLAYER_1_STARTS_WITH = 6

function PlayerHasNotUsedAnyItems() => 
    NumberOfItemsPlayer1CurrentlyHas() == HARD_CODED_NUMBER_OF_ITEMS_PLAYER_1_STARTS_WITH

achievement(
    title = "Your First Battle", points = 1,
    description = "Win Any Stage",
    id = 549285, badge = "00000",
    trigger = !IsInMainMenu() && JustWonMission() && IsInSinglePlayerMode()
)

achievement(
    title = "Assembled Your Forces", points = 5,
    description = "Unlock Every Character from the Dojo",
    id = 549286, badge = "00000",
    trigger = IsInDojoMode() && JustPurchasedAllCharacters()
)

achievement(
    title = "Dress Up Your Forces", points = 5,
    description = "Purchase every Customize Appearance from The Dojo",
    id = 549287, badge = "00000",
    trigger = IsInDojoMode() && JustPurchasedAllCustomizedCharacters()
)

achievement(
    title = "Unleash Your Forces", points = 5,
    description = "Purchase every Unlock Max Stats from the Dojo",
    id = 549288, badge = "00000",
    trigger = IsInDojoMode() && JustPurchasedAllMaxStatUnlocks()
)

achievement(
    title = "Equip Your Forces", points = 3,
    description = "Purchase every Unlock Weapon from the Dojo",
    id = 549289, badge = "00000", 
    trigger = IsInDojoMode() && JustPurchasedAllWeaponsUnlocks()
)

achievement(
    title = "(VOID) Oath of the Peach Garden", points = 3,
    description = "(VOID) Unlock Liu Bei",
    id = 549290, badge = "00000", published = "10/7/2025 4:47:12 AM", modified = "11/4/2025 8:21:42 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA4B4) == 1 && prev(dword(0x6FA4B4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Dance of Deception", points = 3,
    description = "(VOID) Unlock Diao Chan",
    id = 549291, badge = "00000", published = "10/7/2025 4:47:12 AM", modified = "11/4/2025 8:21:42 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA564) == 1 && prev(dword(0x6FA564)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Rage of Hulao", points = 3,
    description = "(VOID) Unlock Lu Bu",
    id = 549292, badge = "00000", published = "10/7/2025 4:47:13 AM", modified = "11/4/2025 8:21:42 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA614) == 1 && prev(dword(0x6FA614)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Fist of Justice", points = 3,
    description = "(VOID) Unlock Xu Zhu",
    id = 549293, badge = "00000", published = "10/7/2025 4:47:13 AM", modified = "11/4/2025 8:21:43 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA6C4) == 1 && prev(dword(0x6FA6C4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Mountain Breaker", points = 3,
    description = "(VOID) Unlock Xiahou Yuan",
    id = 549294, badge = "00000", published = "10/7/2025 4:47:13 AM", modified = "11/4/2025 8:21:43 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA774) == 1 && prev(dword(0x6FA774)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Iron Resolute", points = 3,
    description = "(VOID) Unlock Xu Huang",
    id = 549295, badge = "00000", published = "10/7/2025 4:47:13 AM", modified = "11/4/2025 8:21:43 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA824) == 1 && prev(dword(0x6FA824)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Castle Sentinel", points = 3,
    description = "(VOID) Unlock Cao Ren",
    id = 549296, badge = "00000", published = "10/7/2025 4:47:14 AM", modified = "11/4/2025 8:21:44 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA984) == 1 && prev(dword(0x6FA984)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Hidden Tiger", points = 3,
    description = "(VOID) Unlock Lu Meng",
    id = 549297, badge = "00000", published = "10/7/2025 4:47:14 AM", modified = "11/4/2025 8:21:44 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FAB94) == 1 && prev(dword(0x6FAB94)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Inferno General", points = 3,
    description = "(VOID) Unlock Huang Gai",
    id = 549298, badge = "00000", published = "10/7/2025 4:47:14 AM", modified = "11/4/2025 8:21:44 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FAC44) == 1 && prev(dword(0x6FAC44)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Master Defender", points = 3,
    description = "(VOID) Unlock Zhou Tai",
    id = 549299, badge = "00000", published = "10/7/2025 4:47:15 AM", modified = "11/4/2025 8:21:45 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FACF4) == 1 && prev(dword(0x6FACF4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Jiangdong Conqueror", points = 3,
    description = "(VOID) Unlock Sun Ce",
    id = 549300, badge = "00000", published = "10/7/2025 4:47:15 AM", modified = "11/4/2025 8:21:45 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FAE54) == 1 && prev(dword(0x6FAE54)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Lion of Jiang Dong", points = 3,
    description = "(VOID) Unlock Sun Quan",
    id = 549301, badge = "00000", published = "10/7/2025 4:47:15 AM", modified = "11/4/2025 8:21:45 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FAF04) == 1 && prev(dword(0x6FAF04)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Veteran's Resolve", points = 3,
    description = "(VOID) Unlock Huang Zhong",
    id = 549302, badge = "00000", published = "10/7/2025 4:47:16 AM", modified = "11/4/2025 8:21:46 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB064) == 1 && prev(dword(0x6FB064)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Burning Spirit", points = 3,
    description = "(VOID) Unlock Wei Yan",
    id = 549303, badge = "00000", published = "10/7/2025 4:47:16 AM", modified = "11/4/2025 8:21:46 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB114) == 1 && prev(dword(0x6FB114)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Dutiful Son", points = 3,
    description = "(VOID) Unlock Guan Ping",
    id = 549304, badge = "00000", published = "10/7/2025 4:47:16 AM", modified = "11/4/2025 8:21:46 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB1C4) == 1 && prev(dword(0x6FB1C4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Phoenix Rising", points = 3,
    description = "(VOID) Unlock Pang Tong",
    id = 549305, badge = "00000", published = "10/7/2025 4:47:17 AM", modified = "11/4/2025 8:21:47 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB274) == 1 && prev(dword(0x6FB274)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Crimson Overlord", points = 3,
    description = "(VOID) Unlock Dong Zhuo",
    id = 549306, badge = "00000", published = "10/7/2025 4:47:17 AM", modified = "11/4/2025 8:21:47 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB324) == 1 && prev(dword(0x6FB324)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Northern Wrath", points = 3,
    description = "(VOID) Unlock Yuan Shao",
    id = 549307, badge = "00000", published = "10/7/2025 4:47:17 AM", modified = "11/4/2025 8:21:47 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB3D4) == 1 && prev(dword(0x6FB3D4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Yellow Banner", points = 3,
    description = "(VOID) Unlock Zhang Jiao",
    id = 549308, badge = "00000", published = "10/7/2025 4:47:18 AM", modified = "11/4/2025 8:21:48 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB484) == 1 && prev(dword(0x6FB484)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Silent Beauty", points = 3,
    description = "(VOID) Unlock Zhen Ji",
    id = 549309, badge = "00000", published = "10/7/2025 4:47:18 AM", modified = "11/4/2025 8:21:48 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB534) == 1 && prev(dword(0x6FB534)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Gentle Fury", points = 3,
    description = "(VOID) Unlock Xiao Qiao",
    id = 549310, badge = "00000", published = "10/7/2025 4:47:18 AM", modified = "11/4/2025 8:21:48 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FB5E4) == 1 && prev(dword(0x6FB5E4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1)) 
)
//CharacterJustClearedMusouMode(characterId)
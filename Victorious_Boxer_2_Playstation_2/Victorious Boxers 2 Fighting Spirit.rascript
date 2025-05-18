// Victorious Boxers 2: Fighting Spirit
// #ID = 22836

// Helper function 
function ContainsKey(dictionary, key_name)
{
    for key in dictionary 
        if(key == key_name) return true
    return false
}

ID = "ID"
TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
PLAYER_CHARACTER = "PLAYER_CHARACTER"
OPPONENT_CHARACTER = "OPPONENT_CHARACTER"
ALT_OPPONENT_CHARACTER = "ALT_OPPONENT_CHARACTER"
ALT_PLAYER_CHARACTER = "ALT_PLAYER_CHARACTER"

EASY_TITLE = "EASY TITLE"
HARD_TITLE = "HARD TITLE"
SPECIAL_TITLE = "SPECIAL TITLE"
SPECIAL_CHECK = "SPECIAL CHECK"
SPECIAL_RESET = "SPECIAL RESET"
EASY_POINTS = "EASY POINTS"
HARD_POINTS = "HARD POINTS"
SPECIAL_POINTS = "SPECIAL POINTS"
SPECIAL_DESCRIPTION = "SPECIAL DESCRIPTION"

EXHIBITION_RULE = " (no modification to stats, Player Strength <= Cpu Strength)"

// $43AE4D: (8-bit) Win Lost check
//          
//          0x00 = Normal gameplay.
//          0x8a = Also normal gameplay
//          0x89 = Player won. (Not necessarily the P1)
//          0x0d = Player lost.
function winLostCheck() => byte(0x43AE4D)

WIN_LOST_CHECK_NORMAL = 0x00
WIN_LOST_CHECK_NORMAL_ALT = 0x8a
WIN_LOST_CHECK_NORMAL_SECOND_ALT = 0x40
WIN_LOST_CHECK_P1_WON = 0x89
WIN_LOST_CHECK_P1_LOST = 0x0d

// The Bear has special logic. 

WIN_LOST_CHECK_BEAR_NORMAL = 0x09
WIN_LOST_CHECK_BEAR_WON = 0x00

function playerJustWon(index)
{
    if (index ==TAKAMURA_VS_BEAR) 
        return playerJustBeatBear()
    else
        return playerJustWonNormal()
}

function playerJustWonNormal() => winLostCheck() == WIN_LOST_CHECK_P1_WON && (prev(winLostCheck()) == WIN_LOST_CHECK_NORMAL || prev(winLostCheck()) == WIN_LOST_CHECK_NORMAL_ALT || prev(winLostCheck()) == WIN_LOST_CHECK_NORMAL_SECOND_ALT)
function playerLost() => winLostCheck() == WIN_LOST_CHECK_P1_LOST
function playerJustBeatBear() => winLostCheck() == WIN_LOST_CHECK_BEAR_WON && prev(winLostCheck()) == WIN_LOST_CHECK_BEAR_NORMAL

// $43B980 : (32-bit) Fight Process speed
//            
//            0x3f800000 = Normal Fight Speed
//            0x40000000 = Knock down speed
//            0x40000001+ = Slow Mo Speed .  
function slowMoCheck() => dword(0x43B980)

SLOW_MO_CHECK_NORMAL = 0x3f800000
SLOW_MO_CHECK_KNOCK_DOWN = 0x40000000
function isSlowMo() => slowMoCheck() > SLOW_MO_CHECK_KNOCK_DOWN

// $43ED38: (8-bit) Mode selection
//          
//          0x00 = Story
//          0x01 = Exhibition(Versus)
//          0x02 = Tournament
function modeSelection() => byte(0x43ED38)

MODE_SELECTION_STORY = 0x00
MODE_SELECTION_EXHIBITION = 0x01
MODE_SELECTION_TOURNAMENT = 0x02

function isStoryMode() => modeSelection() == MODE_SELECTION_STORY
function isExhibitionMode() => modeSelection() == MODE_SELECTION_EXHIBITION
function isTournamentMode() => modeSelection() == MODE_SELECTION_TOURNAMENT

// 0x0043ed48 (8-bit) Story Mode Difficulty Selection
// 
// 0x00 = Easy
// 0x01 = Normal
// 0x02 = Hard
// 
// When exiting the mode, this is the difficulty the game reverts to on the main menu. 

function storyModeDifficulty() => byte(0x43ED48)
function isHardStoryMode() => storyModeDifficulty() == 0x02 && isStoryMode() // This value has NO meaning outside of story mode. 

EASY_DIFFICULTY = 0x00
NORMAL_DIFFICULTY = 0x01
HARD_DIFFICULTY = 0x02


DifficultyLookup =
{
    EASY_DIFFICULTY: "Easy",
    NORMAL_DIFFICULTY: "Normal",
    HARD_DIFFICULTY: "Hard"
}

// $43ED44: (8-bit)  Control value for Story Fight
//          
//          0X00 = Ippo Vs Miyata Spar
//          0x01 = Ippo Vs Naoya Ogawa
//          0x02 = Ippo vs Yuske Oda
//          0x03 = Ippo vs Yoshio Fujiwara
//          0x04 = Ippo Vs Jason Ozuma
//          0x05 = Ippo Vs. Kenta Kobashi
//          0x06 = Takamura vs Yoshiaki Yajima
//          0x07 = Ippo vs Ruichi Hayami
//          0x08 = Ippo Vs Ryo Mashiba
//          0x09 = Ippo Vs Takeshi Sendo
//          0x0a = Tatsuya Kimura vs Shinji Kanzaki
//          0x0b = Aoki vs Armand Garcia
//          0x0c = Takamura vs Bonchai Chuwatana
//          0x0d = Ippo vs Keigo Okita
//          0x0e = Miyata spar with Papyo
//          0x0f = Miyata vs Jimmy Sisfa
//          0x10 = Ippo Vs Takuma Saeki
//          0x11= Kimura vs Hiroshi Nishimura
//          0x12 = Aoki vs Bull Ushida
//          0x13 = Aoki vs Jackal ITo
//          0x14 = Kimura vs Takeshi Ryuzaki
//          0x15 = Ippo Vs Alexander Volg Zangiev
//          0x16 = Takamura vs Atsushi Tamaki
//          0x17 = Ippo vs Eiji Date
//          0x18 = Sendo Vs Alexander Volg Zangiev
//          0x19 = Miyata vs Lee Chonpil
//          0x1a = Aoki vs Snake Thomas
//          0x1b = Kimura vs Pone Morocotte
//          0x1c = Ippo vs Ponchai Chuwatana
//          0x1d = Takamura vs Bear
//          0x1e = Kimura vs Nefuma Ozca
//          0x1f = Aoki vs Boy Arade
//          0x20 = Takamura vs Takaaki Ito
//          0x21= Sendo vs Akira Shigeta
//          0x22 = Aoki vs Ippo Spar
//          0x23 = Ippo vs Takeshi Sendo
//          0x24 = Kimura vs Miyata Spar
//          0x25 = Kimura vs Mashiba
//          0x26 = Ippo vs Kazuki Sanada
//          0x27 = Miyata vs Arnie Crocodile Gregory
//          0x28 = Aoki vs Paddy Magramo
//          0x29 = Ippo vs Hammer Nao
//          0x2a = Itagaki vs Fumito Makino
//          0x2b = Tatsuya vs Armand Alegria
//          0x2c = Takamura vs Morris West
//          0x2d = Ippo vs Yi Yonsu
//          0x2e = Takamura vs Brian Hawk
//          0x2f = Ginpachi Nekota vs Dankichi Hama
//          0x30 = Genji Kamogawa vs Ginpachi Nekota
//          0x31 = Genji Kamogawwa vs Ralph Anderson
//          0x32 = Itagaki vs Haseo Baraki
//          0x33 = Ippo vs Iwao Shimabukuro
//          0x34 = Itagaki vs Tadashi Nakayama
//          0x35 = Aoki vs Katsutaka Imae
//          0x36 = Takamura vs Rally Bernard
//          0x37 = Alexander Volg Zangiev vs Ippo
//          0x38 = Ippo vs Ryuhei Sawamura
//          0x39 = Itagaki vs Yoshiharu Urayasu
//          0x3a = Itagaki vs Tetsuji Kiba
//          0x3b = Tatsuya vs Eleki Battery
//          0x3c = Aoki vs Papaya Dachiu
//          0x3d = Miyata vs Medgern Datchboy
//          0x3e = Takamura vs David Golden Eagle
//          0x3f = Itagaki vs Fumito Makino
//          0x40 = Ippo vs Takuzo Karasawa
//          0x41 = Itagaki vs Kyousuke Imai
//          0x42 = Ippo vs Keiichi Take
//          0x43 = Miyata vs Che Jounbong
//          0x44 = Ippo vs Miyata
//          0x45 = Eiji Date vs Ricardo Martinez
//          
//          Each value is a different fight. Some values aren't used.
//          
//          0x1e is a fight between Kimura and Oczma and 1f is Aoki vs Boy Allade.  Neither seem selectable though?
function currentStoryFightIndex() => byte(0x43ED44)

IPPO_VS_MIYATA_SPARRING = 0x00
IPPO_VS_NAOYA_OGAWA = 0x01
IPPO_VS_YUSUKE_ODA = 0x02
IPPO_VS_YOSHIO_FUJIWARA = 0x03
IPPO_VS_JASON_OZUMA = 0x04
IPPO_VS_KENTA_KOBASHI = 0x05
TAKAMURA_VS_YOSHIAKI_YAJIMA = 0x06
IPPO_VS_RUICHI_HAYAMI = 0x07
IPPO_VS_RYO_MASHIBA = 0x08
IPPO_VS_TAKESHI_SENDO = 0x09
TATSUYA_KIMURA_VS_SHINJI_KANZAKI = 0x0a
AOKI_VS_ARMAND_GARCIA = 0x0b
TAKAMURA_VS_BONCHAI_CHUWATANA = 0x0c
IPPO_VS_KEIGO_OKITA = 0x0d
MIYATA_SPARRING_WITH_PAPYO = 0x0e
MIYATA_VS_JIMMY_SISFA = 0x0f
IPPO_VS_TAKUMA_SAEKI = 0x10
KIMURA_VS_HIROSHI_NISHIMURA = 0x11
AOKI_VS_BULL_USHIDA = 0x12
AOKI_VS_JACKAL_ITO = 0x13
KIMURA_VS_TAKESHI_RYUZAKI = 0x14
IPPO_VS_ALEXANDER_VOLG_ZANGIEV = 0x15
TAKAMURA_VS_ATSUSHI_TAMAKI = 0x16
IPPO_VS_EIJI_DATE = 0x17
SENDO_VS_ALEXANDER_VOLG_ZANGIEV = 0x18
MIYATA_VS_LEE_CHONPIL = 0x19
AOKI_VS_SNAKE_THOMAS = 0x1a
KIMURA_VS_PONE_MOROCOTTE = 0x1b
IPPO_VS_PONCHAI_CHUWATANA = 0x1c
TAKAMURA_VS_BEAR = 0x1d
KIMURA_VS_NEFUMA_OZCA = 0x1e
AOKI_VS_BOY_ARADE = 0x1f
TAKAMURA_VS_TAKAAKI_ITO = 0x20
SENDO_VS_AKIRA_SHIGETA = 0x21
AOKI_VS_IPPO_SPARRING = 0x22
IPPO_VS_TAKESHI_SENDO_2 = 0x23
KIMURA_VS_MIYATA_SPARRING = 0x24
KIMURA_VS_RYO_MASHIBA = 0x25
IPPO_VS_KAZUKI_SANADA = 0x26
MIYATA_VS_ARNIE_CROCODILE_GREGORY = 0x27
AOKI_VS_PADDY_MAGRAMO = 0x28
IPPO_VS_HAMMER_NAO = 0x29
ITAGAKI_VS_FUMITO_MAKINO = 0x2a
TATSUYA_VS_ARMAND_ALEGRIA = 0x2b
TAKAMURA_VS_MORRIS_WEST = 0x2c
IPPO_VS_YI_YONSU = 0x2d
TAKAMURA_VS_BRIAN_HAWK = 0x2e
GINPACHI_NEKOTA_VS_DANKICHI_HAMA = 0x2f
GENJI_KAMOGAWA_VS_GINPACHI_NEKOTA = 0x30
GENJI_KAMOGAWA_VS_RALPH_ANDERSON = 0x31
ITAGAKI_VS_HASEO_BARAKI = 0x32
IPPO_VS_IWAO_SHIMABUKURO = 0x33
ITAGAKI_VS_TADASHI_NAKAYAMA = 0x34
AOKI_VS_KATSUTAKA_IMAE = 0x35
TAKAMURA_VS_RALLY_BERNARD = 0x36
ALEXANDER_VOLG_ZANGIEV_VS_IPPO = 0x37
IPPO_VS_RYUHEI_SAWAMURA = 0x38
ITAGAKI_VS_YOSHIHARU_URAYASU = 0x39
ITAGAKI_VS_TETSUJI_KIBA = 0x3a
TATSUYA_VS_ELEKI_BATTERY = 0x3b
AOKI_VS_PAPAYA_DACHIU = 0x3c
MIYATA_VS_MEDGERN_DATCHBOY = 0x3d
TAKAMURA_VS_DAVID_GOLDEN_EAGLE = 0x3e
ITAGAKI_VS_FUMITO_MAKINO_2 = 0x3f
IPPO_VS_TAKUZO_KARASAWA = 0x40
ITAGAKI_VS_KYOUSUKE_IMAI = 0x41
IPPO_VS_KEIICHI_TAKE = 0x42
MIYATA_VS_CHE_JOUNBONG = 0x43
IPPO_VS_MIYATA_2 = 0x44
EIJI_DATE_VS_RICARDO_MARTINEZ = 0x45

FIRST_BOUT = IPPO_VS_MIYATA_SPARRING
LAST_BOUT = EIJI_DATE_VS_RICARDO_MARTINEZ

boutTitleLookup =
{ 
    IPPO_VS_MIYATA_SPARRING: "Ippo vs Miyata Sparring",
    IPPO_VS_NAOYA_OGAWA: "Ippo vs Naoya Ogawa",
    IPPO_VS_YUSUKE_ODA: "Ippo vs Yusuke Oda",
    IPPO_VS_YOSHIO_FUJIWARA: "Ippo vs Yoshio Fujiwara",
    IPPO_VS_JASON_OZUMA: "Ippo vs Jason Ozuma",
    IPPO_VS_KENTA_KOBASHI: "Ippo vs Kenta Kobashi",
    TAKAMURA_VS_YOSHIAKI_YAJIMA: "Takamura vs Yoshiaki Yajima",
    IPPO_VS_RUICHI_HAYAMI: "Ippo vs Ruichi Hayami",
    IPPO_VS_RYO_MASHIBA: "Ippo vs Ryo Mashiba",
    IPPO_VS_TAKESHI_SENDO: "Ippo vs Takeshi Sendo",
    TATSUYA_KIMURA_VS_SHINJI_KANZAKI: "Tatsuya Kimura vs Shinji Kanzaki",
    AOKI_VS_ARMAND_GARCIA: "Aoki vs Armand Garcia",
    TAKAMURA_VS_BONCHAI_CHUWATANA: "Takamura vs Bonchai Chuwatana",
    IPPO_VS_KEIGO_OKITA: "Ippo vs Keigo Okita",
    MIYATA_SPARRING_WITH_PAPYO: "Miyata sparring with Papyo",
    MIYATA_VS_JIMMY_SISFA: "Miyata vs Jimmy Sisfa",
    IPPO_VS_TAKUMA_SAEKI: "Ippo vs Takuma Saeki",
    KIMURA_VS_HIROSHI_NISHIMURA: "Kimura vs Hiroshi Nishimura",
    AOKI_VS_BULL_USHIDA: "Aoki vs Bull Ushida",
    AOKI_VS_JACKAL_ITO: "Aoki vs Jackal Ito",
    KIMURA_VS_TAKESHI_RYUZAKI: "Kimura vs Takeshi Ryuzaki",
    IPPO_VS_ALEXANDER_VOLG_ZANGIEV: "Ippo vs Alexander Volg Zangiev",
    TAKAMURA_VS_ATSUSHI_TAMAKI: "Takamura vs Atsushi Tamaki",
    IPPO_VS_EIJI_DATE: "Ippo vs Eiji Date",
    SENDO_VS_ALEXANDER_VOLG_ZANGIEV: "Sendo vs Alexander Volg Zangiev",
    MIYATA_VS_LEE_CHONPIL: "Miyata vs Lee Chonpil",
    AOKI_VS_SNAKE_THOMAS: "Aoki vs Snake Thomas",
    KIMURA_VS_PONE_MOROCOTTE: "Kimura vs Pone Morocotte",
    IPPO_VS_PONCHAI_CHUWATANA: "Ippo vs Ponchai Chuwatana",
    TAKAMURA_VS_BEAR: "Takamura vs Bear",
    KIMURA_VS_NEFUMA_OZCA: "Kimura vs Nefuma Ozca",
    AOKI_VS_BOY_ARADE: "Aoki vs Boy Arade",
    TAKAMURA_VS_TAKAAKI_ITO: "Takamura vs Takaaki Ito",
    SENDO_VS_AKIRA_SHIGETA: "Sendo vs Akira Shigeta",
    AOKI_VS_IPPO_SPARRING: "Aoki vs Ippo Sparring",
    IPPO_VS_TAKESHI_SENDO_2: "Ippo vs Takeshi Sendo 2",
    KIMURA_VS_MIYATA_SPARRING: "Kimura vs Miyata Sparring",
    KIMURA_VS_RYO_MASHIBA: "Kimura vs Ryo Mashiba",
    IPPO_VS_KAZUKI_SANADA: "Ippo vs Kazuki Sanada",
    MIYATA_VS_ARNIE_CROCODILE_GREGORY: "Miyata vs Arnie Crocodile Gregory",
    AOKI_VS_PADDY_MAGRAMO: "Aoki vs Paddy Magramo",
    IPPO_VS_HAMMER_NAO: "Ippo vs Hammer Nao",
    ITAGAKI_VS_FUMITO_MAKINO: "Itagaki vs Fumito Makino",
    TATSUYA_VS_ARMAND_ALEGRIA: "Tatsuya vs Armand Alegria",
    TAKAMURA_VS_MORRIS_WEST: "Takamura vs Morris West",
    IPPO_VS_YI_YONSU: "Ippo vs Yi Yonsu",
    TAKAMURA_VS_BRIAN_HAWK: "Takamura vs Brian Hawk",
    GINPACHI_NEKOTA_VS_DANKICHI_HAMA: "Ginpachi Nekota vs Dankichi Hama",
    GENJI_KAMOGAWA_VS_GINPACHI_NEKOTA: "Genji Kamogawa vs Ginpachi Nekota",
    GENJI_KAMOGAWA_VS_RALPH_ANDERSON: "Genji Kamogawa vs Ralph Anderson",
    ITAGAKI_VS_HASEO_BARAKI: "Itagaki vs Haseo Baraki",
    IPPO_VS_IWAO_SHIMABUKURO: "Ippo vs Iwao Shimabukuro",
    ITAGAKI_VS_TADASHI_NAKAYAMA: "Itagaki vs Tadashi Nakayama",
    AOKI_VS_KATSUTAKA_IMAE: "Aoki vs Katsutaka Imae",
    TAKAMURA_VS_RALLY_BERNARD: "Takamura vs Rally Bernard",
    ALEXANDER_VOLG_ZANGIEV_VS_IPPO: "Alexander Volg Zangiev vs Ippo",
    IPPO_VS_RYUHEI_SAWAMURA: "Ippo vs Ryuhei Sawamura",
    ITAGAKI_VS_YOSHIHARU_URAYASU: "Itagaki vs Yoshiharu Urayasu",
    ITAGAKI_VS_TETSUJI_KIBA: "Itagaki vs Tetsuji Kiba",
    TATSUYA_VS_ELEKI_BATTERY: "Tatsuya vs Eleki Battery",
    AOKI_VS_PAPAYA_DACHIU: "Aoki vs Papaya Dachiu",
    MIYATA_VS_MEDGERN_DATCHBOY: "Miyata vs Medgern Datchboy",
    TAKAMURA_VS_DAVID_GOLDEN_EAGLE: "Takamura vs David Golden Eagle",
    ITAGAKI_VS_FUMITO_MAKINO_2: "Itagaki vs Fumito Makino 2",
    IPPO_VS_TAKUZO_KARASAWA: "Ippo vs Takuzo Karasawa",
    ITAGAKI_VS_KYOUSUKE_IMAI: "Itagaki vs Kyousuke Imai",
    IPPO_VS_KEIICHI_TAKE: "Ippo vs Keiichi Take",
    MIYATA_VS_CHE_JOUNBONG: "Miyata vs Che Jounbong",
    IPPO_VS_MIYATA_2: "Ippo vs Miyata 2",
    EIJI_DATE_VS_RICARDO_MARTINEZ: "Eiji Date vs Ricardo Martinez"
}

// $43ED58: (16-bit) Exhibiition/Tournament mode Power Stat for Player 1
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P1PowerStat() => word(0x43ED58)

// $43ED5A: (16-bit) Exhibiition/Tournament mode Speed Stat for Player 1
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P1SpeedStat() => word(0x43ED5A)

// $43ED5C: (16-bit) Exhibiition/Tournament mode Endurance Stat for Player 1
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P1EnduranceStat() => word(0x43ED5C)

// $43ED5E: (16-bit) Exhibiition/Tournament mode Power Stat for Player 2
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P2PowerStat() => word(0x43ED5E)

// $43ED60: (16-bit) Exhibiition/Tournament mode Speed Stat for Player 1
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P2SpeedStat() => word(0x43ED60)

// $43ED62: (16-bit) Exhibiition/Tournament mode Endurance Stat for Player 1
//          
//          0x0001 = None
//          0x01388 = Default
//          0x02529 = Full
//          
//          This only appears to be used for Exhibition and Tournament
function P2EnduranceStat() => word(0x43ED62)

// $43ED70: (16-bit) Exhibiition/Tournament Strength Level for Player 1
//          
//          0x00 = Weak
//          0x01 = Normal
//          0x02 = Strong
//          
//          This only appears to be used for Exhibition and Tournament
function P1StrengthLevel() => word(0x43ED70)

// $43ED72: (16-bit) Exhibiition/Tournament Strength Level for Player 2
//          
//          0x00 = Weak
//          0x01 = Normal
//          0x02 = Strong
//          
//          This only appears to be used for Exhibition and Tournament
function P2StrengthLevel() => word(0x43ED72)

NORMAL_PLAYER_STAT = 0x1388


function exhibitionStatCheck() => P1PowerStat() == NORMAL_PLAYER_STAT && 
                                  P1SpeedStat() == NORMAL_PLAYER_STAT && 
                                  P1EnduranceStat() == NORMAL_PLAYER_STAT && 
                                  P2PowerStat() == NORMAL_PLAYER_STAT && 
                                  P2SpeedStat() == NORMAL_PLAYER_STAT && 
                                  P2EnduranceStat() == NORMAL_PLAYER_STAT &&
                                  P1StrengthLevel() <= P2StrengthLevel()

// $43ED74: (bitfield) Player Controlled Opponents.
//          Exhibition Only. 
//          1 = Player 
//          0 = CPU
//          
//          bit 0 = Player 1
//          bit 1 = Player 2
PLAYER_CONTROLLED_BITFIELD = 0x43ED74
function playerControl() => byte(PLAYER_CONTROLLED_BITFIELD)

function playerControlCheck() => bit0(PLAYER_CONTROLLED_BITFIELD) == 0x01 && 
                                 bit1(PLAYER_CONTROLLED_BITFIELD) == 0x00
function player1Human() => bit0(PLAYER_CONTROLLED_BITFIELD) == 0x01
function player2Human() => bit1(PLAYER_CONTROLLED_BITFIELD) == 0x01

// $6D492C: (32-bit)  Player controlled boxing match
//          
//          0x4c4b40 =- In boxing ring and post game
//          All others are not.
//          Instead, try 32-bit Compared to  0x006d4930  Also != 0;
function inMatchCheck() => dword(0x6D492C)
function alternateInMatchCheck() => dword(0x6D4930)

function currentlyInMatch() => inMatchCheck() != 0x00000000 && inMatchCheck() == alternateInMatchCheck()
function justEnteredMatch() => currentlyInMatch() &&  prev(!currentlyInMatch())
                               

// $6D7C54: (8-bit) Potential Main player "move"
//          
//          This appears to be "State" or logic.
//          
//          0x00 = No action
//          0x01 = Left Straight
//          0x03 = Right Straight
//          0x04 = Left Hook
//          0x05 = Right Hook
//          0x08 = Left Uppe (Body Blowr?)
//          0x09 = Right Upper (Body blow?)
//          0x0a = Special Left Straight
//          0x0b = Special + Right straight
//          0x0c = Special Left Hook
//          0x0d = Special + Right Hook
//          0xa7 = walk to neutral corner
//          0xad = walk to corner end of round.
//          0x74 = prep for fight
//          0x76 = Victory (Opponent appears to have the same value when they loose) )
//          0x7f = Start of a round.
//          0x82 = Look away
//          0x83 = "hit by Look away"
//          0x87-89 = Knock down?
//          
//          Opponent Version = 0x0070d094
//          
//          Special Abilities
//          
//          Ippo Left Straight = Gazelle Punch
//          Ippo Right Straight = Deadly Smash
//          Ippo Left Hook = Dempsey Roll
//          Ippo Right Hook = Jofre Upper Cut
//          Mashiba Right Straight = Chopping Right
//          Mashiba Left Hook = Cross-armed Block
//          Mashiba Right Hook = Momentary Battle
//          Sendo Left Straight = Smash
//          Sendo Right Straight = Slow Battle
//          Sendo Left Hook = Ultra-Low Smash
//          Sendo Right Hook = Deadly Smash
//          Volg Left Hook = White Fang
//          Date Right Straight = Corkscrew
//          Date Left Hook = Slow Battle
//          Date Right Hook = Momentary Battle
//          Sawamura Left Straight = Bullet
//          Sawarmura Right Straight =  Head Jerk
//          Sawamura Left Hook = Slow Battle
//          Sawamura Right Hook = Momentary Battle
//          Miyata Right Straight = Jolt
//          Miyata Left Hook = Slow Battle
//          Miyata Right Hook = Momentary Battle
//          Itagaki Left Hook = Slow Battle
//          Itagaki Right Hook = Momentary Battle
//          Aoki Left Straight = Double Punch
//          Aoki Right Straight = Corkscrew
//          Aoki Left Hook = Look Away
//          Aoki Right Hook = Frog Punch
//          Kimura Left Straight = Slow Battle
//          Kimura Left Hook = Dragon Fish Blow
//          Tatsuya Left Straight = Slow Battle
//          Tatsuya Left Hook = Dragon Fish Blow
//          Takamura Left Straight  = Takamura's Look Away
//          Takamura Left Hook = Slow Battle
//          Takamura Right hook = Momentary Battle
//          Genji Kamogawa Left hook = Iron Fist
function P1CurrentMove() => byte(0x6D7C54)
JAB_MOVE_VALUE = 0x01
LEFT_STRAIGHT_MOVE_VALUE = 0x02
RIGHT_STRAIGHT_MOVE_VALUE = 0x03
LEFT_HOOK_MOVE_VALUE = 0x04
RIGHT_HOOK_MOVE_VALUE = 0x05
LEFT_UPPER_MOVE_VALUE = 0x08
RIGHT_UPPER_MOVE_VALUE = 0x09
SPECIAL_LEFT_STRAIGHT_MOVE_VALUE = 0x0a
SPECIAL_RIGHT_STRAIGHT_MOVE_VALUE = 0x0b
SPECIAL_LEFT_HOOK_MOVE_VALUE = 0x0c
SPECIAL_RIGHT_HOOK_MOVE_VALUE = 0x0d

HIT_BY_LOOK_AWAY_MOVE_VALUE = 0x83

IPPO_GAZELLE_PUNCH_MOVE_VALUE = 0xd0 // Due to dempsey, need to handle special. 
IPPO_DEADLY_SMASH_MOVE_VALUE = 0x0b
IPPO_DEMPSY_ROLL_MOVE_VALUE = 0xf0 // Needs special handling
IPPO_LEFT_DEMPSY_ROLL_MOVE_VALUE = 0xf1 // Needs special handling
IPPO_RIGHT_DEMPSY_ROLL_MOVE_VALUE = 0xf2 // Needs special handling
IPPO_JOFRE_UPPER_CUT_MOVE_VALUE = 0x0d
MASHIBA_CHOPPING_RIGHT_MOVE_VALUE = 0x0b
MASHIBA_CROSS_ARMED_BLOCK_MOVE_VALUE = 0x0c
MASHIBA_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
SENDO_SMASH_MOVE_VALUE = 0x0a
SENDO_SLOW_BATTLE_MOVE_VALUE = 0x0b
SENDO_ULTRA_LOW_SMASH_MOVE_VALUE = 0x0c
SENDO_DEADLY_SMASH_MOVE_VALUE = 0x0d
VOLG_WHITE_FANG_MOVE_VALUE = 0x0c
DATE_CORKSCREW_MOVE_VALUE = 0x0b
DATE_SLOW_BATTLE_MOVE_VALUE = 0x0c
DATE_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
SAWAMURA_BULLET_MOVE_VALUE = 0x0a
SAWAMURA_HEAD_JERK_MOVE_VALUE = 0x0b
SAWAMURA_SLOW_BATTLE_MOVE_VALUE = 0x0c
SAWAMURA_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
MIYATA_JOLT_MOVE_VALUE = 0x0b
MIYATA_SLOW_BATTLE_MOVE_VALUE = 0x0c
MIYATA_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
ITAGAKI_SLOW_BATTLE_MOVE_VALUE = 0x0c
ITAGAKI_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
AOKI_DOUBLE_PUNCH_MOVE_VALUE = 0x0a
AOKI_CORKSCREW_MOVE_VALUE = 0x0b
AOKI_LOOK_AWAY_MOVE_VALUE = 0x82
AOKI_FROG_PUNCH_MOVE_VALUE = 0x0d
KIMURA_SLOW_BATTLE_MOVE_VALUE = 0x0a
KIMURA_DRAGON_FISH_BLOW_MOVE_VALUE = 0x0c
TATSUYA_DRAGON_FISH_BLOW_MOVE_VALUE = 0x0c
TAKAMURA_LOOK_AWAY_MOVE_VALUE = 0x0a
TAKAMURA_SLOW_BATTLE_MOVE_VALUE = 0x0c
TAKAMURA_MOMENTARY_BATTLE_MOVE_VALUE = 0x0d
GENJI_IRON_FIST_MOVE_VALUE = 0x0c


function checkP1CurrentMove(value){
    if (value == IPPO_DEMPSY_ROLL_MOVE_VALUE)
    {
        // This is a special case because he throws 0x0c and then 0x0a back and forth.) 
        return checkP1CurrentMove(IPPO_LEFT_DEMPSY_ROLL_MOVE_VALUE) || 
               checkP1CurrentMove(IPPO_RIGHT_DEMPSY_ROLL_MOVE_VALUE)
    }
    if (value == IPPO_LEFT_DEMPSY_ROLL_MOVE_VALUE)
    {
        // This is a special case because he throws 0x0c and then 0x0a back and forth.) 
        return P1CurrentMove() == 0xc
    }
    if (value == IPPO_RIGHT_DEMPSY_ROLL_MOVE_VALUE)
    {
        return ( P1CurrentMove() == 0xa && prior(P1CurrentMove()) == 0x0c)
    }
    if (value == IPPO_GAZELLE_PUNCH_MOVE_VALUE)
    {
        // This is a special case to avoid Dempsey Roll.
        return P1CurrentMove() == 0xa && prior(P1CurrentMove()) != 0x0c
    }
    return P1CurrentMove() == value
}
function P1JustMoved(value) => P1CurrentMove() == value && prev(P1CurrentMove()) != value


// $6D861C: (8-bit) Player Current Round Jab Thrown
//          
//          (left and right together)
function P1JabsThrown() => byte(0x6D861C)

// $6D863C: (8-bit) Player Current Round Jab  Landed
//          
//          (Left or Right )
function P1JabsLanded() => byte(0x6D863C)

// $6D8640: (8-bit) Player Current Round/Total Left Straight Thrown
function P1LeftStraightThrown() => byte(0x6D8640)

// $6D8660: (8-bit) Player Current Round/Total Left Straight Landed
function P1LeftStraightLanded() => byte(0x6D8660)

// $6D8664: (8-bit) Player Current Round/Total Right Straight Thrown
function P1RightStraightThrown() => byte(0x6D8664)

// $6D8684: (8-bit) Player Current Round/Total Right Straight Landed
function P1RightStraightLanded() => byte(0x6D8684)

// $6D8688: (8-bit) Player Current Round  Left Hook Thrown
function P1LeftHookThrown() => byte(0x6D8688)

// $6D868C: (8-bit) Player Current Round/Total Left Hook Landed
function P1LeftHookLanded() => byte(0x6D868C)

// $6D86AC: (8-bit) Player Current Round Right Hook Thrown
function P1RightHookThrown() => byte(0x6D86AC)

// $6D86b0:(8-bit) Player Current Round Right Hook Landed
function P1RightHookLanded() => byte(0x6D86B0)

// $6D8718: (8-bit) Player Current Round Left Upper Thrown
function P1LeftUpperThrown() => byte(0x6D8718)

// $6D8738: (8-bit) Player Current Round Left Upper Landed
function P1LeftUpperLanded() => byte(0x6D8738)

// $6D873C: (8-bit) Player Current Round Right Upper Thrown
function P1RightUpperThrown() => byte(0x6D873C)

// $6D875C: (8-bit) Player Current Round Right Upper Landed
function P1RightUpperLanded() => byte(0x6D875C)

function P1LeftThrown() => P1LeftStraightThrown() > prev(P1LeftStraightThrown()) ||
                         P1LeftHookThrown() > prev(P1LeftHookThrown()) ||
                         P1LeftUpperThrown() > prev(P1LeftUpperThrown())

function P1RightThrown() => P1RightStraightThrown() > prev(P1RightStraightThrown()) ||
                            P1RightHookThrown() > prev(P1RightHookThrown()) ||
                            P1RightUpperThrown() > prev(P1RightUpperThrown()) 

function attackLanded() => P1JabsLanded() > prev(P1JabsLanded()) ||
                           P1LeftStraightLanded() > prev(P1LeftStraightLanded()) ||
                           P1RightStraightLanded() > prev(P1RightStraightLanded()) ||
                           P1LeftHookLanded() > prev(P1LeftHookLanded()) ||
                           P1RightHookLanded() > prev(P1RightHookLanded()) ||
                           P1LeftUpperLanded() > prev(P1LeftUpperLanded()) ||
                           P1RightUpperLanded() > prev(P1RightUpperLanded())

function rightHookLanded() => P1RightHookLanded() > prev(P1RightHookLanded())

// $6D8D40: (8-bit) Player Down
//          
//          0x00 = Not downed
//          0x01 = Slow mo down
//          0x02 = On the mat
//          0x04 = Getting up
//          0x05 = Standing waiting for count
function P1DownedStatus() => byte(0x6D8D40)
DOWN_STATUS_NORMAL_VALUE = 0x00
JUST_DOWNED_VALUE = 0x01

function P1JustDowned() => P1DownedStatus() == JUST_DOWNED_VALUE && prev(P1DownedStatus()) == DOWN_STATUS_NORMAL_VALUE
function P1StoppedDown() => P1DownedStatus() == DOWN_STATUS_NORMAL_VALUE && prev(P1DownedStatus()) != DOWN_STATUS_NORMAL_VALUE

// $70D094: (8-bit) Opponent "move"
//          
//          See 0x006d7c54 For values.
function P2CurrentMove() => byte(0x70D094)

function checkP2CurrentMove(value) => P2CurrentMove() == value
function P2JustMoved(value) => P2CurrentMove() == value && prev(P2CurrentMove()) != value

// $70E178 (8-bit) Opponent Knockdowns in current round.   

// If this matches  0x0070e170  it's a tko.  Modifying 0x0070e170 doesn't affect anything though.  

// This doesn't work for Takamura vs the Bear, but does count the 1 knock down

function P1_KnockDowns() => byte(0x70E178)
function TKO_KD_COUNT() => byte(0x70E170)
function is_TKO() => P1_KnockDowns() == TKO_KD_COUNT()




// $70E180: (8-bit) Opponent downed
//          
//          0x00 = normal gameplay
//          0x01 = Opponent slow mo down.
//          0x02 = Opponent on mat, count started
//          0x04 = Opponent rising
//          0x05 = Opponent ready for fight
function P2DownedStatus() => byte(0x70E180)

function P2JustDowned() => P2DownedStatus() == JUST_DOWNED_VALUE && prev(P2DownedStatus()) == DOWN_STATUS_NORMAL_VALUE
function P2StoppedDown() => P2DownedStatus() == DOWN_STATUS_NORMAL_VALUE && prev(P2DownedStatus()) != DOWN_STATUS_NORMAL_VALUE

function P1UsedMoveToKnockDown(value) => once (P2JustDowned() && checkP1CurrentMove(value) && never(P2StoppedDown()))
function slowMoToKnockDown() => once(slowMoCheck() == SLOW_MO_CHECK_KNOCK_DOWN && 
                                (
                                    prev(isSlowMo())
                                ) && 
                                P2JustDowned() && never(P2StoppedDown()))  

function moveLanded(move) => checkP1CurrentMove(move) && attackLanded() 
function lookAwayLanded() => checkP1CurrentMove(AOKI_LOOK_AWAY_MOVE_VALUE) && P2JustMoved(HIT_BY_LOOK_AWAY_MOVE_VALUE)

// $70E430: (16-bit) Player 1 Character index When in the ring.
//          
//          
//          0x83 = Ippo (Exhibition)
//          0x6a = Ippo (First Spar Exhibition)
//          0x04 = Naoya Ogawa
//          0x06 = Yusuke Oda
//          0x08 = Yoshio Fujiwara
//          0x0a = Jason Ozuma
//          0x0c = Kenta Kobashi
//          0x10 = Ruichi Hayami
//          0x12 = Ryo Mashiba (Featherweight)
//          0x4c = Ryo Mashiba (Jr. Lightweight)
//          0x48 = Takeshi Sendo
//          0x1c = Keigo Okita
//          0x22 = Takuma Saeki
//          0x32 = Volg Zangiev
//          0x30 = Eiji Date (Young)
//          0x8b = Eiji Date (Old)
//          0x3a = Ponchai Chuwatana(Featherweight)
//          0x4e = Kazuki Sanada
//          0x54 = Hammer Nao (Guromichi)
//          0x5c = Yi Yonsu
//          0x62 = Iwao Shimabukuro
//          0x6c = Ryuhei Sawamura
//          0x7c = Takuzo Karasawa
//          0x80 = Keiichi Take
//          0x8c = Ricardo Martinez
//          0x4a = Ichiro Miyata(Early Exhibition)
//          0x84 = Ichiro Miyata(Final Exhibition)
//          0xe3 = Lunsaku Paudy
//          0x1e = Payao
//          0x20 = Jimmy Sisfa
//          0x34 = Lee Chonpil
//          0x50 = Arnie Gregory
//          0x76 = Medngern Dachboy
//          0x82 = Che Jounbong
//          0x44 = Akira Shigeta
//          0x7d = Manabu Itagaki (Exhibition)
//          0x60 = Haseo Baraki
//          0x64 = Tadashi Nakayama
//          0x6e = Yoshiharu Urayasu
//          0x70 = Tetsuji Kiba
//          0x7a = Fumito Makino
//          0x7e = Kyosuke Imai
//          0x73 = Masaru Aoki(Exhibition)
//          0x4b = Tatsuya Kimura
//          0x71 = Tatsuya
//          0xf5 = Junichi Hotta
//          0xf6 = Hiroshi Yamanaka
//          0x16 = Shinji Kanzaki
//          0x18 = Armand Garcia
//          0x24 = Hiroshi Nishimura
//          0x26 = Bull Ushida
//          0x28 = Jackal Ito
//          0x2a = Takeshi Ryuzaki
//          0x36  = Snake Thomas
//          0x38 = Pone Morocotte
//          0x3e = Nefuma Ozca
//          0x40 = Boy Arade
//          0x52 = Paddy Magramo
//          0x58 = Armand Alegria
//          0x66 = Katsutaka Imae
//          0x72 = Eleki Battery
//          0x74 = Papaya Dachiu
//          0x59 = Mamoru Takamura (skinny Exhibition)
//          0x77 = Mamoru Takamura (Middle Weight)
//          0x1a = Bonchai Chuwatana
//          0x2e = Atsushi Tamaki
//          0xe = Yoshiaki Yajima
//          0x3c = Bear
//          0x42 = Takaaki Ito
//          0x5a = Morris West
//          0x5e = Brian Hawk
//          0x68 = Rally Bernard
//          0x78 = David Eagle
//          0x89 = Genji Kamogawa(Young)
//          0x85 = Ginpachi Nekota (Young)
//          0x86 = Dankichi Hama (Young)
//          0x8a = Ralph Anderson
//          0x115 = BroccoMan
//          0x116 = Genji Kamogaw (Old)
//          0x117 = Ginpachi Nekota(Old)
//          0x118 = Dankichi Hama(Old)
function P1CharacterIndex() => word(0x70E430)

EXHIBITION_CHARACTER_IPPO_FIRST_SPARRING = 0x6a
EXHIBITION_CHARACTER_IPPO_EXHIBITION = 0x83
EXHIBITION_CHARACTER_NAOYA_OGAWA = 0x04
EXHIBITION_CHARACTER_YUSUKE_ODA = 0x06
EXHIBITION_CHARACTER_YOSHIO_FUJIWARA = 0x08
EXHIBITION_CHARACTER_JASON_OZUMA = 0x0a
EXHIBITION_CHARACTER_KENTA_KOBASHI = 0x0c
EXHIBITION_CHARACTER_RUICHI_HAYAMI = 0x10
EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT = 0x12
EXHIBITION_CHARACTER_RYO_MASHIBA_JR_LIGHTWEIGHT = 0x4c
EXHIBITION_CHARACTER_TAKESHI_SENDO = 0x48
EXHIBITION_CHARACTER_KEIGO_OKITA = 0x1c
EXHIBITION_CHARACTER_TAKUMA_SAEKI = 0x22
EXHIBITION_CHARACTER_VOLG_ZANGIEV = 0x32
EXHIBITION_CHARACTER_EIJI_DATE_YOUNG = 0x30
EXHIBITION_CHARACTER_EIJI_DATE_OLD = 0x8b
EXHIBITION_CHARACTER_PONCHAI_CHUWATANA_FEATHERWEIGHT = 0x3a
EXHIBITION_CHARACTER_KAZUKI_SANADA = 0x4e
EXHIBITION_CHARACTER_HAMMER_NAO_GUROMICHI = 0x54
EXHIBITION_CHARACTER_YI_YONSU = 0x5c
EXHIBITION_CHARACTER_IWAO_SHIMABUKURO = 0x62
EXHIBITION_CHARACTER_RYUHEI_SAWAMURA = 0x6c
EXHIBITION_CHARACTER_TAKUZO_KARASAWA = 0x7c
EXHIBITION_CHARACTER_KEIICHI_TAKE = 0x80
EXHIBITION_CHARACTER_RICARDO_MARTINEZ = 0x8c
EXHIBITION_CHARACTER_ICHIRO_MIYATA_EARLY_EXHIBITION = 0x4a
EXHIBITION_CHARACTER_ICHIRO_MIYATA_FINAL_EXHIBITION = 0x84
EXHIBITION_CHARACTER_LUNSAKU_PAUDY = 0xe3
EXHIBITION_CHARACTER_PAYAO = 0x1e
EXHIBITION_CHARACTER_JIMMY_SISFA = 0x20
EXHIBITION_CHARACTER_LEE_CHONPIL = 0x34
EXHIBITION_CHARACTER_ARNIE_GREGORY = 0x50
EXHIBITION_CHARACTER_MEDNGERN_DACHBOY = 0x76
EXHIBITION_CHARACTER_CHE_JOUNBONG = 0x82
EXHIBITION_CHARACTER_AKIRA_SHIGETA = 0x44
EXHIBITION_CHARACTER_MANABU_ITAGAKI_EXHIBITION = 0x7d
EXHIBITION_CHARACTER_HASEO_BARAKI = 0x60
EXHIBITION_CHARACTER_TADASHI_NAKAYAMA = 0x64
EXHIBITION_CHARACTER_YOSHIHARU_URAYASU = 0x6e
EXHIBITION_CHARACTER_TETSUJI_KIBA = 0x70
EXHIBITION_CHARACTER_FUMITO_MAKINO = 0x7a
EXHIBITION_CHARACTER_KYOUSUKE_IMAI = 0x7e
EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION = 0x73
EXHIBITION_CHARACTER_TATSUYA_KIMURA = 0x4b
EXHIBITION_CHARACTER_TATSUYA = 0x71
EXHIBITION_CHARACTER_JUNICHI_HOTTA = 0xf5
EXHIBITION_CHARACTER_HIROSHI_YAMANAKA = 0xf6
EXHIBITION_CHARACTER_SHINJI_KANZAKI = 0x16
EXHIBITION_CHARACTER_ARMAND_GARCIA = 0x18
EXHIBITION_CHARACTER_HIROSHI_NISHIMURA = 0x24
EXHIBITION_CHARACTER_BULL_USHIDA = 0x26
EXHIBITION_CHARACTER_JACKAL_ITO = 0x28
EXHIBITION_CHARACTER_TAKESHI_RYUZAKI = 0x2a
EXHIBITION_CHARACTER_SNAKE_THOMAS = 0x36
EXHIBITION_CHARACTER_PONE_MOROCOTTE = 0x38
EXHIBITION_CHARACTER_NEFUMA_OZCA = 0x3e
EXHIBITION_CHARACTER_BOY_ARADE = 0x40
EXHIBITION_CHARACTER_PADDY_MAGRAMO = 0x52
EXHIBITION_CHARACTER_ARMAND_ALEGRIA = 0x58
EXHIBITION_CHARACTER_KATSUTAKA_IMAE = 0x66
EXHIBITION_CHARACTER_ELEKI_BATTERY = 0x72
EXHIBITION_CHARACTER_PAPAYA_DACHIU = 0x74
EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION = 0x59
EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT = 0x77
EXHIBITION_CHARACTER_BONCHAI_CHUWATANA = 0x1a
EXHIBITION_CHARACTER_ATSUSHI_TAMAKI = 0x2e
EXHIBITION_CHARACTER_YOSHIAKI_YAJIMA = 0x0e
EXHIBITION_CHARACTER_BEAR = 0x3c
EXHIBITION_CHARACTER_TAKAAKI_ITO = 0x42
EXHIBITION_CHARACTER_MORRIS_WEST = 0x5a
EXHIBITION_CHARACTER_BRIAN_HAWK = 0x5e
EXHIBITION_CHARACTER_RALLY_BERNARD = 0x68
EXHIBITION_CHARACTER_DAVID_EAGLE = 0x78
EXHIBITION_CHARACTER_GENJI_KAMOGAWA_YOUNG = 0x89
EXHIBITION_CHARACTER_GINPACHI_NEKOTA_YOUNG = 0x85
EXHIBITION_CHARACTER_DANKICHI_HAMA_YOUNG = 0x86
EXHIBITION_CHARACTER_RALPH_ANDERSON = 0x8a
EXHIBITION_CHARACTER_BROCCOMAN = 0x115
EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD = 0x116
EXHIBITION_CHARACTER_GINPACHI_NEKOTA_OLD = 0x117
EXHIBITION_CHARACTER_DANKICHI_HAMA_OLD = 0x118

CharacterNameLookup =
{
    EXHIBITION_CHARACTER_IPPO_EXHIBITION: "Ippo Makunouchi",
    EXHIBITION_CHARACTER_IPPO_FIRST_SPARRING: "Ippo Makunouchi (Training Gear)",
    EXHIBITION_CHARACTER_YUSUKE_ODA: "Yusuke Oda",
    EXHIBITION_CHARACTER_YOSHIO_FUJIWARA: "Yoshio Fujiwara",
    EXHIBITION_CHARACTER_JASON_OZUMA: "Jason Ozuma",
    EXHIBITION_CHARACTER_KENTA_KOBASHI: "Kenta Kobashi",
    EXHIBITION_CHARACTER_RUICHI_HAYAMI: "Ruichi Hayami",
    EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT: "Ryo Mashiba(Featherweight)",
    EXHIBITION_CHARACTER_RYO_MASHIBA_JR_LIGHTWEIGHT: "Ryo Mashiba(Jr. LightWeight)",
    EXHIBITION_CHARACTER_TAKESHI_SENDO: "Takeshi Sendo",
    EXHIBITION_CHARACTER_KEIGO_OKITA: "Keigo Okita",
    EXHIBITION_CHARACTER_TAKUMA_SAEKI: "Takuma Saeki",
    EXHIBITION_CHARACTER_VOLG_ZANGIEV: "Alexander Volg Zangiev",
    EXHIBITION_CHARACTER_EIJI_DATE_YOUNG: "Eiji Date (Young)",
    EXHIBITION_CHARACTER_EIJI_DATE_OLD: "Eiji Date (Old)",
    EXHIBITION_CHARACTER_PONCHAI_CHUWATANA_FEATHERWEIGHT: "Ponchai Chuwatana",
    EXHIBITION_CHARACTER_KAZUKI_SANADA: "Kazuki Sanada",
    EXHIBITION_CHARACTER_HAMMER_NAO_GUROMICHI: "Hammer Nao",
    EXHIBITION_CHARACTER_YI_YONSU: "Yi Yonsu",
    EXHIBITION_CHARACTER_IWAO_SHIMABUKURO: "Iwao Shimabukuro",
    EXHIBITION_CHARACTER_RYUHEI_SAWAMURA: "Ryuhei Sawamura",
    EXHIBITION_CHARACTER_TAKUZO_KARASAWA: "Takuzo Karasawa",
    EXHIBITION_CHARACTER_KEIICHI_TAKE: "Keiichi Take",
    EXHIBITION_CHARACTER_RICARDO_MARTINEZ: "Ricardo Martinez",
    EXHIBITION_CHARACTER_ICHIRO_MIYATA_EARLY_EXHIBITION: "Ichiro Miyata(Training Gear)",
    EXHIBITION_CHARACTER_ICHIRO_MIYATA_FINAL_EXHIBITION: "Ichiro Miyata",
    EXHIBITION_CHARACTER_LUNSAKU_PAUDY: "Lunsaku Paudy",
    EXHIBITION_CHARACTER_PAYAO: "Payao",
    EXHIBITION_CHARACTER_JIMMY_SISFA: "Jimmy Sisfa",
    EXHIBITION_CHARACTER_LEE_CHONPIL: "Lee Chonpil",
    EXHIBITION_CHARACTER_ARNIE_GREGORY: "Arnie Gregory",
    EXHIBITION_CHARACTER_MEDNGERN_DACHBOY: "Medngern Dachboy",
    EXHIBITION_CHARACTER_CHE_JOUNBONG: "Che Jounbong",
    EXHIBITION_CHARACTER_AKIRA_SHIGETA: "Akira Shigeta",
    EXHIBITION_CHARACTER_MANABU_ITAGAKI_EXHIBITION: "Manabu Itagaki",
    EXHIBITION_CHARACTER_HASEO_BARAKI: "Haseo Baraki",
    EXHIBITION_CHARACTER_TADASHI_NAKAYAMA: "Tadashi Nakayama",
    EXHIBITION_CHARACTER_YOSHIHARU_URAYASU: "Yoshiharu Urayasu",
    EXHIBITION_CHARACTER_TETSUJI_KIBA: "Tetsuji Kiba",
    EXHIBITION_CHARACTER_FUMITO_MAKINO: "Fumito Makino",
    EXHIBITION_CHARACTER_KYOUSUKE_IMAI: "Kyousuke Imai",
    EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION: "Masaru Aoki",
    EXHIBITION_CHARACTER_TATSUYA_KIMURA: "Tatsuya Kimura",
    EXHIBITION_CHARACTER_TATSUYA: "Tatsuya",
    EXHIBITION_CHARACTER_JUNICHI_HOTTA: "Junichi Hotta",
    EXHIBITION_CHARACTER_HIROSHI_YAMANAKA: "Hiroshi Yamanaka",
    EXHIBITION_CHARACTER_SHINJI_KANZAKI: "Shinji Kanzaki",
    EXHIBITION_CHARACTER_ARMAND_GARCIA: "Armand Garcia",
    EXHIBITION_CHARACTER_HIROSHI_NISHIMURA: "Hiroshi Nishimura",
    EXHIBITION_CHARACTER_BULL_USHIDA: "Bull Ushida",
    EXHIBITION_CHARACTER_JACKAL_ITO: "Jackal Ito",
    EXHIBITION_CHARACTER_TAKESHI_RYUZAKI: "Takeshi Ryuzaki",
    EXHIBITION_CHARACTER_SNAKE_THOMAS: "Snake Thomas",
    EXHIBITION_CHARACTER_PONE_MOROCOTTE: "Pone Morocotte",
    EXHIBITION_CHARACTER_NEFUMA_OZCA: "Nefuma Ozca",
    EXHIBITION_CHARACTER_BOY_ARADE: "Boy Arade",
    EXHIBITION_CHARACTER_PADDY_MAGRAMO: "Paddy Magramo",
    EXHIBITION_CHARACTER_ARMAND_ALEGRIA: "Armand Alegria",
    EXHIBITION_CHARACTER_KATSUTAKA_IMAE: "Katsutaka Imae",
    EXHIBITION_CHARACTER_ELEKI_BATTERY: "Eleki Battery",
    EXHIBITION_CHARACTER_PAPAYA_DACHIU: "Papaya Dachiu",
    EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION: "Mamoru Takamura(Jr. Middleweight)",
    EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT: "Mamoru Takamura (Middleweight)",
    EXHIBITION_CHARACTER_BONCHAI_CHUWATANA: "Bonchai Chuwatana",
    EXHIBITION_CHARACTER_ATSUSHI_TAMAKI: "Atsushi Tamaki",
    EXHIBITION_CHARACTER_YOSHIAKI_YAJIMA: "Yoshiaki Yajima",
    EXHIBITION_CHARACTER_BEAR: "Bear",
    EXHIBITION_CHARACTER_TAKAAKI_ITO: "Takaaki Ito",
    EXHIBITION_CHARACTER_MORRIS_WEST: "Morris West",
    EXHIBITION_CHARACTER_BRIAN_HAWK: "Brian Hawk",
    EXHIBITION_CHARACTER_RALLY_BERNARD: "Rally Bernard",
    EXHIBITION_CHARACTER_DAVID_EAGLE: "David Eagle",
    EXHIBITION_CHARACTER_GENJI_KAMOGAWA_YOUNG: "Genji Kamogawa (Young)",
    EXHIBITION_CHARACTER_GINPACHI_NEKOTA_YOUNG: "Ginpachi Nekota (Young)",
    EXHIBITION_CHARACTER_DANKICHI_HAMA_YOUNG: "Dankichi Hama (Young)",
    EXHIBITION_CHARACTER_RALPH_ANDERSON: "Ralph Anderson",
    EXHIBITION_CHARACTER_BROCCOMAN: "Broccoman",
    EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD: "Genji Kamogawa (Old)",
    EXHIBITION_CHARACTER_GINPACHI_NEKOTA_OLD: "Ginpachi Nekota (Old)",
    EXHIBITION_CHARACTER_DANKICHI_HAMA_OLD: "Dankichi Hama (Old)"
}

// $70E432: (16-bit) Player 2 Character index on the exhibition screen.
//          
//          See 0x0070e430 for values
function P2CharacterIndex() => word(0x70E432)

// $70E490: (16-bit) Time in Frames for the current round.
function timeInFrames() => word(0x70E490)
MAX_TIME_VALUE = 60*60*3

function timeInSecond() => timeInFrames() / 60

function storyModeConfigCheck() => currentlyInMatch() && isStoryMode()
function specialStoryModeConfigCheck() => never( !currentlyInMatch()) && isStoryMode()

function exhibitionModeConfigCheck() => 
                        isExhibitionMode() &&
                        exhibitionStatCheck() &&
                        playerControlCheck() &&
                        currentlyInMatch()

// $70e48c: (8-bit) Current Round of the Match
//          
//          0x01 = Round 1
function currentRound() => byte(0x70E48C)

story_data =
[
    { 
        ID: IPPO_VS_MIYATA_SPARRING, 
        EASY_TITLE: "A Courageous Step Forward",
        HARD_TITLE: "I Still Have One Thing I Want to Try",
        SPECIAL_TITLE: "One Centimeter of Destruction",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_JOFRE_UPPER_CUT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jofre Uppercut to Knock Out Miyata",
        SPECIAL_POINTS: 5
    },
    { 
        ID: IPPO_VS_NAOYA_OGAWA, 
        EASY_TITLE: "I'm Sticking to Featherweight",
        HARD_TITLE: "You Got a Good Punch, Man",
        SPECIAL_TITLE: "He Flipped Him With One Punch",
        SPECIAL_RESET: P1JustDowned(),
        SPECIAL_DESCRIPTION: "without getting knocked down",
        SPECIAL_POINTS: 3
    },
    { 
        ID: IPPO_VS_YUSUKE_ODA, 
        EASY_TITLE: "Beating's Aoki's Fortune",
        HARD_TITLE: "The Taste of the First Victory",
        SPECIAL_TITLE: "I'm Starting to Get Used to this",
        SPECIAL_RESET: P1JustDowned(),
        SPECIAL_DESCRIPTION: "Using a Right Straight to Knock Out Oda",
        SPECIAL_POINTS: 4
    },
    { 
        ID: IPPO_VS_YOSHIO_FUJIWARA, 
        EASY_TITLE: "Springboard to the Rookie King",
        HARD_TITLE: "He Really Is Strong",
        SPECIAL_TITLE: "It's Like Someone's Hitting Me With a Rock",
        SPECIAL_CHECK: (P1UsedMoveToKnockDown(LEFT_UPPER_MOVE_VALUE) || P1UsedMoveToKnockDown(RIGHT_UPPER_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "using a (normal) Uppercut to Knock Out Fujiwara"
    }, 
    { 
        ID: IPPO_VS_JASON_OZUMA, 
        EASY_TITLE: "Rookie King Opener",
        HARD_TITLE: "Stop Ozuma",
        SPECIAL_TITLE: "Applause for the Defeated",
        SPECIAL_RESET: checkP1CurrentMove(IPPO_JOFRE_UPPER_CUT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "Without throwing a Jofre Uppercut"
    },
    { 
        ID: IPPO_VS_KENTA_KOBASHI, 
        EASY_TITLE: "The Sweet, Dangerous Lure",
        HARD_TITLE: "Impossible Dreams",
        SPECIAL_TITLE: "Power Packed Punches",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Straightto Knock Out Kobashi"
    },
    { 
        ID: IPPO_VS_RUICHI_HAYAMI, 
        EASY_TITLE: "East Japan Rookie King Tournament Semi Final",
        HARD_TITLE: "Fall of the Prodigy",
        SPECIAL_TITLE: "Muzzling the Shotgun",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_JOFRE_UPPER_CUT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jofre Uppercut to Knock Out Hayami"
    },
    { 
        ID: IPPO_VS_RYO_MASHIBA, 
        EASY_TITLE: "East Japan Rookie King Final",
        HARD_TITLE: "Shattered Hand, Unbroken Spirit",
        SPECIAL_TITLE: "Here Comes the Right",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Straight to Knock Out Mashiba"
    },
    { 
        ID: IPPO_VS_TAKESHI_SENDO, 
        EASY_TITLE: "All-Japan Rookie King Tournament",
        HARD_TITLE: "Rocky of Naniwa",
        SPECIAL_TITLE: "Trying to Hit a Smash",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEADLY_SMASH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Deadly Smash to Knock Out Sendo"
    },
    { 
        ID: TATSUYA_KIMURA_VS_SHINJI_KANZAKI, 
        EASY_TITLE: "A Tough Match",
        HARD_TITLE: "Go Around Him",
        SPECIAL_TITLE: "Use Your Legs",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Kanzaki while using the Slow Battle Special Move"
    },
    { 
        ID: AOKI_VS_ARMAND_GARCIA, 
        EASY_TITLE: "Keep It Going",
        HARD_TITLE: "His Favorite Mud Fight",
        SPECIAL_TITLE: "Lucky Punch",
        SPECIAL_CHECK: (P1UsedMoveToKnockDown(AOKI_CORKSCREW_MOVE_VALUE) || P1UsedMoveToKnockDown(AOKI_DOUBLE_PUNCH_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "using a Corkscrew or Double Punch to Knock Out Garcia"
    },
    { 
        ID: IPPO_VS_KEIGO_OKITA, 
        EASY_TITLE: "New and Old Rookie King Fight",
        HARD_TITLE: "Date Lite",
        SPECIAL_TITLE: "Dynamite Punch",
        SPECIAL_RESET: currentRound() != 1,
        SPECIAL_DESCRIPTION: "in the first round"
    },
    { 
        ID: MIYATA_SPARRING_WITH_PAPYO, 
        EASY_TITLE: "The Man Who Never Laughs",
        HARD_TITLE: "Your Punch is Light",
        SPECIAL_TITLE: "A Counter to Surpass All Counters",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(MIYATA_JOLT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jolt to Knock Out Papaya"
    },
    { 
        ID: MIYATA_VS_JIMMY_SISFA, 
        EASY_TITLE: "Double Edged Sword",
        HARD_TITLE: "A Single Moment of Laughter",
        SPECIAL_TITLE: "Timing and Heart",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(MIYATA_JOLT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jolt to Knock Out Sisfa"
    },
    { 
        ID: IPPO_VS_TAKUMA_SAEKI, 
        EASY_TITLE: "Speed Star",
        HARD_TITLE: "The Declaration to Keep Standing",
        SPECIAL_TITLE: "A Damage Called Fear",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_JOFRE_UPPER_CUT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jofre Uppercut to Knock Out Saeki"
    },
    { 
        ID: KIMURA_VS_HIROSHI_NISHIMURA, 
        EASY_TITLE: "Kimura's Class-A Tournament First Round",
        HARD_TITLE: "A Win is a Win",
        SPECIAL_TITLE: "Going the Distance",
        SPECIAL_CHECK: currentRound() >= 6,
        SPECIAL_DESCRIPTION: "reach the 6th round and win"
    },
    { 
        ID: AOKI_VS_BULL_USHIDA, 
        EASY_TITLE: "Aoki's Class-A Tournament First Round",
        HARD_TITLE: "Aoki's Secret Weapon",
        SPECIAL_TITLE: "Leap Frog Man",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(AOKI_FROG_PUNCH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Frog Punch to Knock Out Ushida"
    },
    { 
        ID: IPPO_VS_ALEXANDER_VOLG_ZANGIEV, 
        EASY_TITLE: "White Fang",
        HARD_TITLE: "The Eternal War of Attrition",
        SPECIAL_TITLE: "Gazelle Vs Wolf",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_GAZELLE_PUNCH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Gazelle Punch to Knock Out Zangiev"
    },
    { 
        ID: IPPO_VS_EIJI_DATE, 
        EASY_TITLE: "Youth Vs. Experience",
        HARD_TITLE: "Explosion from Point-Blank Range",
        SPECIAL_TITLE: "Past Your Limits",
        SPECIAL_CHECK: currentRound() > 5,
        SPECIAL_DESCRIPTION: "reach the 6th round and win"
    },
    { 
        ID: SENDO_VS_ALEXANDER_VOLG_ZANGIEV, 
        EASY_TITLE: "The Tiger and the Wolf",
        HARD_TITLE: "Two Beasts",
        SPECIAL_TITLE: "Challenge Him Head On",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(SENDO_DEADLY_SMASH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Deadly Smash to Knock Out Zangiev"
    },
    { 
        ID: MIYATA_VS_LEE_CHONPIL, 
        EASY_TITLE: "Return From Overseas",
        HARD_TITLE: "1st Homecoming Fight",
        SPECIAL_TITLE: "Fighting an After Image",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(MIYATA_JOLT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jolt to Knock Out Chonpil"
    },
    { 
        ID: AOKI_VS_SNAKE_THOMAS, 
        EASY_TITLE: "Aoki's Road Back",
        HARD_TITLE: "The Frog Vs. The Snake",
        SPECIAL_TITLE: "I Have Something to Protect",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Thomas"
    },
    { 
        ID: KIMURA_VS_PONE_MOROCOTTE, 
        EASY_TITLE: "Kimura's Road Back",
        HARD_TITLE: "I Have Nothing to Fear Now",
        SPECIAL_TITLE: "I Don't Have Anyhting to Lose Anymore",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(LEFT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Left Hook to Knock Out Morocotte"
    },
    { 
        ID: IPPO_VS_PONCHAI_CHUWATANA, 
        EASY_TITLE: "The Face of a Boxer",
        HARD_TITLE: "What Did You Learn From That Loss!!",
        SPECIAL_TITLE: "Is This the Answer You Came Up With---?!",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Chuwatana"
    },
    { 
        ID: TAKAMURA_VS_BEAR, 
        EASY_TITLE: "Japan's Greatest Beast",
        HARD_TITLE: "It's Either Kill or Be Killed",
        SPECIAL_TITLE: "I'll Keep Going Until you Fall",
        SPECIAL_RESET: timeInFrames() > 60*60,
        SPECIAL_DESCRIPTION: "win the match in under 1 minute"
    },
    { 
        ID: TAKAMURA_VS_TAKAAKI_ITO, 
        EASY_TITLE: "Something will happen",
        HARD_TITLE: "Those who rules the Left...",
        SPECIAL_TITLE: "Will Rule the World",
        SPECIAL_RESET: P1RightThrown(),
        SPECIAL_DESCRIPTION: "win the match without throwing a punch with your right hand"
    },
    { 
        ID: SENDO_VS_AKIRA_SHIGETA, 
        EASY_TITLE: "Two Fighters",
        HARD_TITLE: "The Tiger's Rage",
        SPECIAL_TITLE: "King's Farewell Gift",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(SENDO_DEADLY_SMASH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Deadly Smash to Knock Out Shigeta"
    },
    { 
        ID: AOKI_VS_IPPO_SPARRING, 
        EASY_TITLE: "Dojo Duel Number 6",
        HARD_TITLE: "Stopping Ippo's KO Streak",
        SPECIAL_TITLE: "Everything I Got",
        SPECIAL_CHECK: measured(tally_of(
                                         [AOKI_CORKSCREW_MOVE_VALUE, AOKI_DOUBLE_PUNCH_MOVE_VALUE, AOKI_FROG_PUNCH_MOVE_VALUE], 
                                         3, 
                                         move => once(moveLanded(move))
                                        )
                                ),
        SPECIAL_DESCRIPTION: "landing a Corkscrew, Double Punch, and Frog Punch during the spar and winning"
    },
    { 
        ID: IPPO_VS_TAKESHI_SENDO_2, 
        EASY_TITLE: "Lallapallooza",
        HARD_TITLE: "The Day Makunouchi Becomes King",
        SPECIAL_TITLE: "The Greatest Weapon",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Sendo"
    },
    { 
        ID: KIMURA_VS_MIYATA_SPARRING, 
        EASY_TITLE: "Preparing to Fight the Reaper",
        HARD_TITLE: "The Future Weapon",
        SPECIAL_TITLE: "What The Fish Taught Me",
        SPECIAL_CHECK: measured( repeated(3, rightHookLanded() && checkP1CurrentMove(KIMURA_DRAGON_FISH_BLOW_MOVE_VALUE))),
        SPECIAL_DESCRIPTION: "land 3 Dragon Fish Blow, where the right fist also connects" 
    },
    { 
        ID: KIMURA_VS_RYO_MASHIBA, 
        EASY_TITLE: "Execution",
        HARD_TITLE: "Scene of Carnage",
        SPECIAL_TITLE: "If This Fist Can Reach",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(KIMURA_DRAGON_FISH_BLOW_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dragon Fish Blow to Knock Out Mashiba"
    },
    { 
        ID: IPPO_VS_KAZUKI_SANADA, 
        EASY_TITLE: "Champion Vs Champion",
        HARD_TITLE: "When the Last Fist Falls",
        SPECIAL_TITLE: "A Suicide Dash",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Sanada"
    },
    { 
        ID: MIYATA_VS_ARNIE_CROCODILE_GREGORY, 
        EASY_TITLE: "Claiming the OBPF Title",
        HARD_TITLE: "Defanging the Crocdile",
        SPECIAL_TITLE: "Using All Your Strength to Defeat The Bloody Cross",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(MIYATA_JOLT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jolt to Knock Out Gregory"
    },
    { 
        ID: IPPO_VS_HAMMER_NAO, 
        EASY_TITLE: "Proof of Power",
        HARD_TITLE: "Senpai and Kouhai",
        SPECIAL_TITLE: "Final Lesson",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Hammer"
    },
    { 
        ID: TATSUYA_VS_ARMAND_ALEGRIA, 
        EASY_TITLE: "I'm No Hunter",
        HARD_TITLE: "Taking His Time",
        SPECIAL_TITLE: "Going the Distance",
        SPECIAL_CHECK: currentRound() >= 10,
        SPECIAL_DESCRIPTION: "win the match in the 10th round (or by decision)"
    },
    { 
        ID: TAKAMURA_VS_MORRIS_WEST, 
        EASY_TITLE: "Apocalypse Now",
        HARD_TITLE: "Wild Hawk",
        SPECIAL_TITLE: "I Am Takamura Mamoru-Sama!!",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Straight to Knock Out West"
    },
    { 
        ID: IPPO_VS_YI_YONSU, 
        EASY_TITLE: "Annihilation Request",
        HARD_TITLE: "I'll Do What I'm Best At!!",
        SPECIAL_TITLE: "A Promise to Takamura",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE) && currentRound() == 1,
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Yonsu in the first round"
    },
    { 
        ID: TAKAMURA_VS_BRIAN_HAWK, 
        EASY_TITLE: "Battle of The Hawks",
        HARD_TITLE: "Not Everyone Who Works HArd Is Rewarded",
        SPECIAL_TITLE: "However, All Those Who Succeed Have Worked Hard",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Straight to Knock Out Hawk"
    },
    {
        ID: GINPACHI_NEKOTA_VS_DANKICHI_HAMA,
        EASY_TITLE: "The Untold Origin Story",
        HARD_TITLE: "I Won-Dani",
        SPECIAL_TITLE: "For Yuki's Honor",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Hama while using the Slow Battle Special Move"
    },
    {
        ID: GENJI_KAMOGAWA_VS_GINPACHI_NEKOTA,
        EASY_TITLE: "Friends, Enemies, Boxers!",
        HARD_TITLE: "I'd Like to Stay LIke This Forever",
        SPECIAL_TITLE: "I've Never Taken a Punch So Painful",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(LEFT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using an Left Hook to Knock Out Nekota"
    },
    {
        ID: GENJI_KAMOGAWA_VS_RALPH_ANDERSON,
        EASY_TITLE: "The Spirit Behind One Punch",
        HARD_TITLE: "You Haven't Faced My Fists Yet",
        SPECIAL_TITLE: "Tekken",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(GENJI_IRON_FIST_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using an Iron Fist to Knock Out Anderson"
    },
    {
        ID: IPPO_VS_IWAO_SHIMABUKURO,
        EASY_TITLE: "Submarine Wars",
        HARD_TITLE: "Zero-Distance Battle",
        SPECIAL_TITLE: "The Strength to Use the Dempsey Roll",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Shimabukuro"
    },
    {
        ID: AOKI_VS_KATSUTAKA_IMAE,
        EASY_TITLE: "Goddess of Victory",
        HARD_TITLE: "My Secret Weapon",
        SPECIAL_TITLE: "Giant Gamble",
        SPECIAL_CHECK: measured( tally_of(
                                            [moveLanded(AOKI_CORKSCREW_MOVE_VALUE), 
                                            moveLanded(AOKI_DOUBLE_PUNCH_MOVE_VALUE), 
                                            moveLanded(AOKI_FROG_PUNCH_MOVE_VALUE),
                                            lookAwayLanded()], 
                                            4, 
                                            move => once(move)
                                            )
                                ),
        SPECIAL_DESCRIPTION: "land a Corkscrew, Double Punch, Frog Punch, and Look Away during the spar and winning"
    },
    {
        ID: TAKAMURA_VS_RALLY_BERNARD,
        EASY_TITLE: "King of Hawk",
        HARD_TITLE: "Treacherous King",
        SPECIAL_TITLE: "Idiot, You Just Have to Glance Away",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE) && once(checkP1CurrentMove(TAKAMURA_LOOK_AWAY_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "use a Look Away during the match and then use a Right Hook to Knock out Rally (or Larry) Bernard"
    },
    {
        ID: ALEXANDER_VOLG_ZANGIEV_VS_IPPO,
        EASY_TITLE: "Vorg's Challenge",
        HARD_TITLE: "Udachi Chibe, Shinoke",
        SPECIAL_TITLE: "Sayonara",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Ippo"
    },
    {
        ID: IPPO_VS_RYUHEI_SAWAMURA,
        EASY_TITLE: "Dragon Slayer",
        HARD_TITLE: "Pendulum Champion",
        SPECIAL_TITLE: "Devastating Anti-Counter",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(IPPO_DEMPSY_ROLL_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Dempsey Roll to Knock Out Sawamura"
    },
    {
        ID: TATSUYA_VS_ELEKI_BATTERY,
        EASY_TITLE: "Kimura Rhapsody",
        HARD_TITLE: "First It's My Turn",
        SPECIAL_TITLE: "His Weakness is His Body!",
        SPECIAL_CHECK: (P1UsedMoveToKnockDown(LEFT_UPPER_MOVE_VALUE) || P1UsedMoveToKnockDown(RIGHT_UPPER_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "using an Uppercut to Knock Out Battery"
    },
    {
        ID: AOKI_VS_PAPAYA_DACHIU,
        EASY_TITLE: "Prepare Yourself Papaya",
        HARD_TITLE: "So Evenly Matched",
        SPECIAL_TITLE: "They Have the Same Smell",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(AOKI_DOUBLE_PUNCH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Double Punch to Knock Out Papaya"
    },
    {
        ID: MIYATA_VS_MEDGERN_DATCHBOY,
        EASY_TITLE: "Speed That Surpasses The Limits",
        HARD_TITLE: "Speaking Fist",
        SPECIAL_TITLE: "Incomplete Evolved Counter",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(MIYATA_JOLT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Jolt to Knock Out Datchboy"
    },
    {
        ID: TAKAMURA_VS_DAVID_GOLDEN_EAGLE,
        EASY_TITLE: "A Passing Point",
        HARD_TITLE: "Hawk Vs. Eagle",
        SPECIAL_TITLE: "Beyond a Death Match",
        SPECIAL_CHECK: slowMoToKnockDown() && (P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE) || P1UsedMoveToKnockDown(LEFT_STRAIGHT_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "and use either a right straight or a left straight to Knock Out Golden Eagle while using the Slow Battle Special Move"
    },
    {
        ID: IPPO_VS_TAKUZO_KARASAWA,
        EASY_TITLE: "Karasawa in the Palm of His Hand",
        HARD_TITLE: "The One Controlling the Match",
        SPECIAL_TITLE: "The Seal on the Finishing Blow",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(LEFT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Left Hook to Knock Out Karasawa"
    },
    {
        ID: ITAGAKI_VS_KYOUSUKE_IMAI,
        EASY_TITLE: "Process of Evolution",
        HARD_TITLE: "Next Time for the Title",
        SPECIAL_TITLE: "Gattsun Gattsun!!",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Imai while using the Slow Battle Special Move"
    },
    {
        ID: IPPO_VS_KEIICHI_TAKE,
        EASY_TITLE: "Fearless Challenger",
        HARD_TITLE: "Going Past The Limits",
        SPECIAL_TITLE: "Ruthless Right Hook",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(LEFT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Left Hook to Knock Out Take"
    },
    {
        ID: MIYATA_VS_CHE_JOUNBONG,
        EASY_TITLE: "Wingless Champion",
        HARD_TITLE: "I Can't Waste My Time Here",
        SPECIAL_TITLE: "So Don't Get in My Way",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Jounbong"
    },
    {
        ID: ITAGAKI_VS_FUMITO_MAKINO_2,
        EASY_TITLE: "Weed Vs Elite",
        HARD_TITLE: "When His Heart Breaks",
        SPECIAL_TITLE: "There's Nothing to Be Afraid of Any More",
        SPECIAL_CHECK: slowMoToKnockDown() && P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "and use a Right Hook to Knock Out Makino while using the Slow Battle Special Move"
    },
    {
        ID: IPPO_VS_MIYATA_2,
        EASY_TITLE: "The Promised Match",
        HARD_TITLE: "What It Means to Be Strong",
        SPECIAL_TITLE: "Using Everything I Learned",
        SPECIAL_CHECK: measured(tally_of(
                                         [IPPO_DEADLY_SMASH_MOVE_VALUE, 
                                          IPPO_LEFT_DEMPSY_ROLL_MOVE_VALUE, 
                                          IPPO_RIGHT_DEMPSY_ROLL_MOVE_VALUE, 
                                          IPPO_GAZELLE_PUNCH_MOVE_VALUE, 
                                          IPPO_JOFRE_UPPER_CUT_MOVE_VALUE
                                         ], 
                                         5, 
                                         move => once(moveLanded(move))
                                        )
                                ),
        SPECIAL_DESCRIPTION: "land a Deadly Smash, Gazelle Punch, Jofre Uppercut and both the left and right hook of a Dempsey Roll during the match and then win"
    },
]

function EasyStoryAchievement(data, type = "")
{
    points = 5
    if (ContainsKey(data, EASY_POINTS))
    {
        points = data[EASY_POINTS]
    }
    achievement(title = data[EASY_TITLE],
                description = format("Beat Story mission for {0}", boutTitleLookup[data[ID]]),
                points = 5,
                type = type,
                trigger = storyModeConfigCheck() && 
                          playerJustWon(data[ID]) && 
                          currentStoryFightIndex() == data[ID] 
                )
}

function HardStoryAchievement(data)
{
    points = 10
    if ( ContainsKey(data, HARD_POINTS))
    {
        points = data[HARD_POINTS]
    }
    achievement(title = data[HARD_TITLE],
                description = format("Beat Story mission for {0} on Hard Difficulty", boutTitleLookup[data[ID]]),
                points = points,
                trigger = storyModeConfigCheck() && 
                          playerJustWon(data[ID]) && 
                          currentStoryFightIndex() == data[ID] &&
                          isHardStoryMode()
                )
}

function start_bout(id)
{
    return once( currentStoryFightIndex() == id && 
                 currentRound() == 1 &&
                 timeInSecond() < 0.5  
                 // matches start when the time in frames is not 0.  So we'll give it a little leeway
               )
           
}

function SpecialStoryAchievement(data)
{
    points = 10
    if (ContainsKey(data, SPECIAL_POINTS))
    {
        points = data[SPECIAL_POINTS]
    }
    special_check = true
    if (ContainsKey(data, SPECIAL_CHECK))
    {
        special_check = data[SPECIAL_CHECK]
    }
    special_reset = true
    if ( ContainsKey(data, SPECIAL_RESET))
    {
        special_reset = never(data[SPECIAL_RESET]) && start_bout(data[ID])
    }

    specialDescription = "MISSING SPECIAL DESCRIPTION"
    if ( ContainsKey(data, SPECIAL_DESCRIPTION))
    {
        specialDescription = data[SPECIAL_DESCRIPTION] 
    }

    achievement(title = data[SPECIAL_TITLE],
                description = format("Beat Story mission for {0} on Hard Difficulty {1}", boutTitleLookup[data[ID]], specialDescription),
                points = points,
                trigger = specialStoryModeConfigCheck() && 
                          trigger_when(playerJustWon(data[ID])) && 
                          currentStoryFightIndex() == data[ID] &&
                          isHardStoryMode() &&
                          special_check &&
                          special_reset &&
                          never(!isHardStoryMode()) &&
                          never( currentStoryFightIndex() != data[ID])
    )
                          
}

for data in story_data
{
    EasyStoryAchievement(data, "Progression")
    HardStoryAchievement(data)
    SpecialStoryAchievement(data)
}

specialStoryBouts =
[
    {
        ID: TAKAMURA_VS_YOSHIAKI_YAJIMA,
        EASY_TITLE: "The Japan MiddleWeight Title Bou",
        HARD_TITLE: "I'll Take It for You in One Sec",
        SPECIAL_TITLE: "You Actually Think I could Lose?!",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_UPPER_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Uppercut to Knock Out Yajima"
    },
    {
        ID: TAKAMURA_VS_BONCHAI_CHUWATANA,
        EASY_TITLE: "Flight", 
        HARD_TITLE: "One Panel Fight",
        SPECIAL_TITLE: "Easy KO Victory",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Chuwatana"
    },
    {   
        ID: AOKI_VS_JACKAL_ITO,
        EASY_TITLE: "Frog Vs Jackal",
        HARD_TITLE: "The Light and Shadow In The Ring",
        SPECIAL_TITLE: "Open the Champaign Bottle",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(AOKI_CORKSCREW_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Corkscrew to Knock Out Ito"
    },
    {
        ID: KIMURA_VS_TAKESHI_RYUZAKI,
        EASY_TITLE: "KIMURA VS TAKESHI RYUZAKI",
        HARD_TITLE: "High Pace From the Very Beginning",
        SPECIAL_TITLE: "Extra Round",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Takeshi while using the Slow Battle Special Move"
    },
    {
        ID: TAKAMURA_VS_ATSUSHI_TAMAKI,
        EASY_TITLE: "The Power of the King",
        HARD_TITLE: "The Champion's Fist",
        SPECIAL_TITLE: "Takamura is InvincibleD",
        SPECIAL_CHECK: (P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE) ||
                       P1UsedMoveToKnockDown(LEFT_HOOK_MOVE_VALUE)),
        SPECIAL_DESCRIPTION: "using a Hook to Knock Out Tamaki"
    },
    {
        ID: KIMURA_VS_NEFUMA_OZCA,
        EASY_TITLE: "Shaking Hall",
        HARD_TITLE: "Confidence from Training Camp",
        SPECIAL_TITLE: "Rush Rush",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Ozca while using the Slow Battle Special Move"
    },
    {
        ID: AOKI_VS_BOY_ARADE,
        EASY_TITLE: "Stick to Him-Dani!",
        HARD_TITLE: "Fight With Your Spirit-Dani",
        SPECIAL_TITLE: "Show Some Guts-Dani!",
        SPECIAL_CHECK: is_TKO(),
        SPECIAL_DESCRIPTION: "win by TKO"
    },
    {
        ID: AOKI_VS_PADDY_MAGRAMO,
        EASY_TITLE: "Underdog Hunter",
        HARD_TITLE: "A Hideous Match",
        SPECIAL_TITLE: "I Can't Believe It Hit",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(AOKI_FROG_PUNCH_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Frog Punch to Knock Out Magramo"
    },
    {
        ID: ITAGAKI_VS_HASEO_BARAKI,
        EASY_TITLE: "Itagaki's Come Back",
        HARD_TITLE: "Itagaki's First Pro Win",
        SPECIAL_TITLE: "Blink And You'll Miss It",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Right Hook to Knock Out Baraki"
    },
    {
        ID: ITAGAKI_VS_TADASHI_NAKAYAMA,
        EASY_TITLE: "I Learned a Lesson", // not in the book? 
        HARD_TITLE: "Backflip Win",
        SPECIAL_TITLE: "Take Your Time",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Nakayama while using the Slow Battle Special Move"
    },
    {
        ID: ITAGAKI_VS_YOSHIHARU_URAYASU,
        EASY_TITLE: "Fishing BoatMakunouchi's Gym",
        HARD_TITLE: "I See",
        SPECIAL_TITLE: "I'll Never Lose Sight of your Back, My Goal!!",
        SPECIAL_CHECK: slowMoToKnockDown(),
        SPECIAL_DESCRIPTION: "and Knock Out Urayasu while using the Slow Battle Special Move"
    },
    {
        ID: ITAGAKI_VS_TETSUJI_KIBA,
        EASY_TITLE: "Fight From A Distance", // Not in book
        HARD_TITLE: "Use Your Legs",
        SPECIAL_TITLE: "Test Yourself",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(RIGHT_STRAIGHT_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "and use a Right Straight To Knock Out Kiba"
    },
    {
        ID: EIJI_DATE_VS_RICARDO_MARTINEZ,
        EASY_TITLE: "Revenge",
        HARD_TITLE: "Broken Heart",
        SPECIAL_TITLE: "I Will Take Your Life",
        SPECIAL_CHECK: P1UsedMoveToKnockDown(DATE_CORKSCREW_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "using a Corkscrew to Knock Out Martinez"        
    },
    {
        ID: ITAGAKI_VS_FUMITO_MAKINO,
        EASY_TITLE: "Itagaki's Pro Debut",
        HARD_TITLE: "A Clean Version of the Fight",
        SPECIAL_TITLE: "He's Not Moving Like a Rookie",
        SPECIAL_CHECK: slowMoToKnockDown() && P1UsedMoveToKnockDown(RIGHT_HOOK_MOVE_VALUE),
        SPECIAL_DESCRIPTION: "and use a Right Hook to Knock Out Makino while using the Slow Battle Special Move"
    }   
]

for data in specialStoryBouts
{
    EasyStoryAchievement(data)
    HardStoryAchievement(data)
    SpecialStoryAchievement(data)
}

exhibitionBattles = 
[
    
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION, 
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_HIROSHI_YAMANAKA,
        TITLE: "Aoki's Pro Debut Match"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RICARDO_MARTINEZ,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_EIJI_DATE_YOUNG,
        TITLE: "A Sad End, Eiji Date"
    },
    {
        PLAYER_CHARACTER:EXHIBITION_CHARACTER_ICHIRO_MIYATA_EARLY_EXHIBITION,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_FIRST_SPARRING,
        TITLE: "His First Time in The Ring"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_JACKAL_ITO,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION,
        TITLE: "Canon: Jackal Vs Aoki"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_ICHIRO_MIYATA_FINAL_EXHIBITION,
        TITLE: "The One-Legged Fight" // Updated
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_ICHIRO_MIYATA_FINAL_EXHIBITION,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT,
        TITLE: "Because He's Waiting for Me" // updated
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_BEAR,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT,
        TITLE: "How It Really Happened"
    },
    {    
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_TAKESHI_RYUZAKI,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_TATSUYA_KIMURA,
        TITLE: "Extra Rounds"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_EIJI_DATE_OLD,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        TITLE: "The Heart Break Shot"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RICARDO_MARTINEZ,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_EIJI_DATE_OLD,
        TITLE: "Goodbye, Eiji Date"
    },
    {   
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_HAMMER_NAO_GUROMICHI,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        TITLE: "Tell Him I've Gotten Strong with Every Punch I Throw in the Ring"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_JR_LIGHTWEIGHT,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_TATSUYA_KIMURA,
        TITLE: "The Grim Reaper Execution"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RYUHEI_SAWAMURA,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_JR_LIGHTWEIGHT,
        TITLE: "Chaos"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_RYUHEI_SAWAMURA,
        TITLE: "For My Sister's Honor"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        TITLE: "The Old Man Still Has Moves"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_KATSUTAKA_IMAE,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION,
        TITLE: "Conclusive Difference"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_KYOUSUKE_IMAI,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MANABU_ITAGAKI_EXHIBITION,
        TITLE: "Heir to the Throne"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_KYOUSUKE_IMAI,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        TITLE: "Kyosuke Imai's Dream Match"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_RICARDO_MARTINEZ,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_TAKESHI_SENDO,
        TITLE: "Hajime No Ippo 2025"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_TAKESHI_SENDO,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_RICARDO_MARTINEZ,
        TITLE: "The Strongest in the World"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_RICARDO_MARTINEZ,
        TITLE: "Perhaps One Day"
    },
    {
        PLAYER_CHARACTER: EXHIBITION_CHARACTER_ICHIRO_MIYATA_FINAL_EXHIBITION,
        OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
        TITLE: "The Final Showdown"
    },
]

for data in exhibitionBattles
{
    achievement(title = data[TITLE],
                description = format("As {0}, win a bout against {1} in Exhibition Mode" + EXHIBITION_RULE, 
                                     CharacterNameLookup[data[PLAYER_CHARACTER]], 
                                     CharacterNameLookup[data[OPPONENT_CHARACTER]]),
                points = 5,
                trigger = exhibitionModeConfigCheck() && 
                          trigger_when(playerJustWon(0x00)) && 
                          once( currentRound() == 1 && 
                                timeInSecond() == 0) &&
                          P1CharacterIndex() == data[PLAYER_CHARACTER] &&
                          P2CharacterIndex() == data[OPPONENT_CHARACTER] &&
                          never(!isExhibitionMode())
    )
}


// {
//     PLAYER_CHARACTER: EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD,
//     ALT_PLAYER_CHARACTER: EXHIBITION_CHARACTER_GINPACHI_NEKOTA_OLD,
//     OPPONENT_CHARACTER: EXHIBITION_CHARACTER_DANKICHI_HAMA_OLD,
//     TITLE: "The Rivalry Resolved",
// },

achievement(title = "The Rivalry Resolved",
            description = format("Win a match as {0} or {1} against {2} in Exhibition Mode" + EXHIBITION_RULE, 
                                 CharacterNameLookup[EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD],
                                 CharacterNameLookup[EXHIBITION_CHARACTER_GINPACHI_NEKOTA_OLD],
                                 CharacterNameLookup[EXHIBITION_CHARACTER_DANKICHI_HAMA_OLD]),
            points = 5,
            trigger = exhibitionModeConfigCheck() && 
                      trigger_when(playerJustWon(0x00)) && 
                      once( currentRound() == 1 && 
                            timeInSecond() == 0) &&
                      (P1CharacterIndex() == EXHIBITION_CHARACTER_GENJI_KAMOGAWA_OLD || P1CharacterIndex() == EXHIBITION_CHARACTER_GINPACHI_NEKOTA_OLD) &&
                      P2CharacterIndex() == EXHIBITION_CHARACTER_DANKICHI_HAMA_OLD
)

// {
//     PLAYER_CHARACTER: EXHIBITION_CHARACTER_TATSUYA,
//     ALT_PLAYER_CHARACTER: EXHIBITION_CHARACTER_TATSUYA_KIMURA,
//     OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION,
//     ALT_OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT
//     TITLE: "Kimura's Dream",
// }

achievement(title = "Kimura's Dream",
            description = format("As Kimura, land a single hit on Takamura in Exhibition Mode"+ EXHIBITION_RULE),
            points = 1,
            trigger = exhibitionModeConfigCheck() &&
                      trigger_when(attackLanded()) && 
                      once( currentRound() == 1 && 
                            timeInSecond() == 0) &&
                      (P1CharacterIndex() == EXHIBITION_CHARACTER_TATSUYA || 
                       P1CharacterIndex() == EXHIBITION_CHARACTER_TATSUYA_KIMURA
                      ) &&
                      ( P2CharacterIndex() == EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION ||
                        P2CharacterIndex() == EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT
                      )
)

// {
//     PLAYER_CHARACTER: EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION,
//     OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION,
//     ALT_OPPONENT_CHARACTER: EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT
//     TITLE: "Aoki's Dream",
// }

achievement(title = "Aoki's Dream",
            description = format("As Aoki, land a single hit on Takamura in Exhibition Mode"),
            points = 1,
            trigger = exhibitionModeConfigCheck() && 
                      trigger_when(attackLanded()) && 
                      once( currentRound() == 1 && 
                            timeInSecond() == 0) &&
                      P1CharacterIndex() == EXHIBITION_CHARACTER_MASARU_AOKI_EXHIBITION &&
                      ( P2CharacterIndex() == EXHIBITION_CHARACTER_MAMORU_TAKAMURA_SKINNY_EXHIBITION ||
                        P2CharacterIndex() == EXHIBITION_CHARACTER_MAMORU_TAKAMURA_MIDDLE_WEIGHT
                      )
)


// {
//     // He never wins with the chopping right. 
//     PLAYER_CHARACTER: EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT,
//     OPPONENT_CHARACTER: EXHIBITION_CHARACTER_IPPO_EXHIBITION,
//     TITLE: "The Dangerous Chopping Right",
//     DESCRIPTION: "<Replace>",
//     SPECIAL_CHECK: P1UsedMoveToKnockDown(MASHIBA_CHOPPING_RIGHT_MOVE_VALUE)
// },

achievement(title = "The Dangerous Chopping Right",
            description = format("As Mashiba (Featherweight), win a match against Ippo (Boxing Trunks) and finish the battle with a Chopping Right in Exhibition Mode"),
            points = 5,
            trigger = exhibitionModeConfigCheck() && 
                      trigger_when(playerJustWon(0x00)) && 
                      P1UsedMoveToKnockDown(MASHIBA_CHOPPING_RIGHT_MOVE_VALUE) &&
                      P1CharacterIndex() == EXHIBITION_CHARACTER_RYO_MASHIBA_FEATHERWEIGHT &&
                      P2CharacterIndex() == EXHIBITION_CHARACTER_IPPO_EXHIBITION &&
                      never(!isExhibitionMode())
)

achievement(title = "Maybe The Hair Held Him Back",
            description = format("As Broccoman, win a match in Exhibition Mode" + EXHIBITION_RULE),
            points = 3,
            trigger = exhibitionModeConfigCheck() && 
                      trigger_when(playerJustWon(0x00)) && 
                      once( currentRound() == 1 && 
                            timeInSecond() == 0) &&
                      P1CharacterIndex() == EXHIBITION_CHARACTER_BROCCOMAN &&
                      never(!isExhibitionMode())
            )




function leaderboardByDifficulty(bout_index, difficulty)
{
 
    leaderboard(
        title = format("{0}: {1} Speedrun", boutTitleLookup[bout_index], DifficultyLookup[difficulty]),
        description = format("Win the Story match {0} as fast as possible on {1} Difficulty" ,  boutTitleLookup[bout_index], DifficultyLookup[difficulty]),
        
        start  =
        (
            storyModeConfigCheck() && 
            playerJustWon(bout_index) && 
            currentStoryFightIndex() == bout_index &&
            storyModeDifficulty() == difficulty
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeInFrames() + (MAX_TIME_VALUE * (currentRound() - 1)),
        format = "FRAMES", 
        lower_is_better = true 
    )
}
for index in range(FIRST_BOUT,LAST_BOUT)
{
    leaderboardByDifficulty(index, EASY_DIFFICULTY)
    leaderboardByDifficulty(index, NORMAL_DIFFICULTY)
    leaderboardByDifficulty(index, HARD_DIFFICULTY)
}

    
rich_presence_conditional_display(isStoryMode() && currentlyInMatch(), 
                                  "is currently playing the story match between {0}. Round: {1} Time: {2} Difficulty: {3}",
                                  rich_presence_lookup("Match", currentStoryFightIndex(), boutTitleLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"),
                                  rich_presence_lookup("Difficulty", storyModeDifficulty(), DifficultyLookup))

rich_presence_conditional_display(isExhibitionMode() && currentlyInMatch() &&
                                  player1Human() && player2Human(), 
                                  "is currently playing Exhibition mode. P1: {0} P2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isExhibitionMode() && currentlyInMatch() &&
                                  player1Human() && !player2Human(), 
                                  "is currently playing Exhibition mode. P1: {0} CPU2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isExhibitionMode() && currentlyInMatch() &&
                                  !player1Human() && player2Human(), 
                                  "is currently playing Exhibition mode. CPU1: {0} P2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isExhibitionMode() && currentlyInMatch() &&
                                  !player1Human() && !player2Human(), 
                                  "is currently playing Exhibition mode. CPU1: {0} CPU2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isTournamentMode() && currentlyInMatch() &&
                                  player1Human() && player2Human(), 
                                  "is currently playing Tournament mode. P1: {0} P2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isTournamentMode() && currentlyInMatch() &&
                                  player1Human() && !player2Human(), 
                                  "is currently playing Tournament mode. P1: {0} CPU2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isTournamentMode() && currentlyInMatch() &&
                                  !player1Human() && player2Human(), 
                                  "is currently playing Tournament mode. CPU1: {0} P2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_conditional_display(isTournamentMode() && currentlyInMatch() &&
                                  !player1Human() && !player2Human(), 
                                  "is currently playing Tournament mode. CPU1: {0} CPU2: {1}. Round {2}: Time: {3}",
                                  rich_presence_lookup("Character", P1CharacterIndex(), CharacterNameLookup),
                                  rich_presence_lookup("Character", P2CharacterIndex(), CharacterNameLookup),
                                  rich_presence_value("Number", currentRound()),
                                  rich_presence_value("FRAMES", timeInSecond(),"SECS"))

rich_presence_display("In Menus") 

// Need to check all exhibition characters are used. 

// Still need leaderboards
// Victorious Boxers 2: Fighting Spirit
// #ID = 22836

// $43AE4D: (8-bit) Win Lost check
//          
//          0x00 = Normal gameplay.
//          0x8a = Also normal gameplay
//          0x89 = Player won. (Not necessarily the P1)
//          0x0d = Player lost.
function winLostCheck() => byte(0x43AE4D)

// $43B982: (8-bit) Potential Slow mo Check
//          
//          0x80 = Normal
//          0x3b = Slow
//          0x00 = Knock down.
function slowMoCheck() => byte(0x43B982)

// $43B983: (8-bit) Potential Slow mo Check
//          
//          0x3f = Normal
//          0x40 = Slow
function altSlowMoCheck() => byte(0x43B983)

// $43ED38: (8-bit) Mode selection
//          
//          0x00 = Story
//          0x01 = Exhibition(Versus)
//          0x02 = Tournament
function modeSelection() => byte(0x43ED38)

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

// $43ED74: (bitfield) Player Controlled Opponents.
//          
//          bit 0 = Player 1
//          bit 1 = Player 2
function playerControl() => byte(0x43ED74)

// $6D492C: (32-bit)  Player controlled boxing match
//          
//          0x4c4b40 =- In boxing ring and post game
//          All others are not.
function inMatchCheck() => dword(0x6D492C)

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

// $6D861C: (8-bit) Player Current Round Jab Thrown
//          
//          (left and right together)
function P1JabsThrown() => byte(0x6D861C)

// $6D863C: (8-bit) Player Current Round Jab  Landed
//          
//          (Left or Right )
function P1JabsLanded() => byte(0x6D863C)

// $6D8640: (8-bit) Player Current Round/Total Left Straight Landed
function P1LeftStraightLanded() => byte(0x6D8640)

// $6D8660: (8-bit) Player Current Round/Total Right Straight Landed
function P1RightStraightLanded() => byte(0x6D8660)

// $6D8664: (8-bit) Player Current Round/Total Right Straight Thrown
function P1RightStraightThrown() => byte(0x6D8664)

// $6D8684: (8-bit) Player Current Round/Total Right Straight Landed
function P1RightStraightLanded() => byte(0x6D8684)

// $6D8688: (8-bit) Player Current Round  Left Hook Thrown
function P1LeftHookThrown() => byte(0x6D8688)

// $6D868C: (8-bit) Player Current Round/Total Left Hook Landed
function P1LeftHookLanded() => byte(0x6D868C)

// $6D86AC: (8-bit) Player Current Round Right Hook Thrown
function P1RightHookLanded() => byte(0x6D86AC)

// $6D86CC: (8-bit) Player Current Round Left Upper Landed
function P1LeftUpperLanded() => byte(0x6D86CC)

// $6D8718: (8-bit) Player Current Round Left Upper Thrown
function P1LeftUpperThrown() => byte(0x6D8718)

// $6D8728: (8-bit) Player Current Round Left Hook Thrown
function P1LeftHook Thrown() => byte(0x6D8728)

// $6D8738: (8-bit) Player Current Round Left Upper Landed
function P1LeftUpperLanded() => byte(0x6D8738)

// $6D873C: (8-bit) Player Current Round Right Upper Thrown
function P1RightUpperThrown() => byte(0x6D873C)

// $6D8748: (8-bit) Player Current Round Left Hook Landed
function P1LeftHookLanded() => byte(0x6D8748)

// $6D875C: (8-bit) Player Current Round Right Upper Landed
function P1LeftUpperLanded() => byte(0x6D875C)

// $6D8D40: (8-bit) Player Down
//          
//          0x00 = Not downed
//          0x01 = Slow mo down
//          0x02 = On the mat
//          0x04 = Getting up
//          0x05 = Standing waiting for count
function P1DownedStatus() => byte(0x6D8D40)

// $70D094: (8-bit) Opponent "move"
//          
//          See 0x006d7c54 For values.
function P2CurrentMove() => byte(0x70D094)

// $70E180: (8-bit) Opponent downed
//          
//          0x00 = normal gameplay
//          0x01 = Opponent slow mo down.
//          0x02 = Opponent on mat, count started
//          0x04 = Opponent rising
//          0x05 = Opponent ready for fight
function P2DownedStatus() => byte(0x70E180)

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
//          0x116 = Genji Kamogaw (Old)
//          0x117 = Ginpachi Nekota(Old)
//          0x118 = Dankichi Hama(Old)
function P1CharacterIndex() => word(0x70E430)

// $70E432: (16-bit) Player 2 Character index on the exhibition screen.
//          
//          See 0x0070e430 for values
function P2CharacterIndex() => word(0x70E432)

// $70E490: (16-bit) Time in Frames for the current round.
function timeInFrames() => word(0x70E490)

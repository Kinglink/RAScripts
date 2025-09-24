// Dynasty Warriors 6
// #ID = 20788

// $3CD89C: (8-bit) Current Map
//          
//          Not a control value (or if it is, not sure what it controls. )
//          
//          Also changes on the Preparation page.
//          
//          
//          0x00 = The Yellow Turban Rebellion
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = Conquest of Wu
//          0x05 = Battle of Guan Du
//          0x06 = Invasion of Xu Chang
//          0x07 = Battle of Chang Ban
//          0x08 = Battle of Chi Bi
//          0X17 = Gauntlet Map
//          0x1a  = Battle of Tong Gate
function CurrentMap() => byte(0x3CD89C)

// $3CDC70: (8-bit possibly 32-bit) Two Player Check.
//          
//          0x01 = One Player
//          0x02 = Two Players.
//          
//          Missetting this causes MASSIVE slow down in two player mode.  (And disables the second player camera)
function TwoPlayerCheck() => dword(0x3CDC70)

// $4D6110: (32-bit Pointer) Main Character Pointer
//          
//          +0x108: (Float) Max Health
//          +0x10c: (Float) Health
//          
//          0x000 = Death!!!!
//          +0x114: (Float) Max Musou Power
//          +0x118: (Float)( Musou Power.
//          
//          When this reach the Max Musou Power  (Previous value -4 )
function MainCharacterPointer() => dword(0x4D6110)

// $6F5770: (32-bit) First Player Kills in the battle.
//          
//          This remains after going the post game.
function FirstPlayerKills() => dword(0x6F5770)

// $6F9A70: (49-bits bitfield) Xiahou Den's Skill list.
//          
//          Each bit is a Skill.  Note, the order is all over the place, but when this is 0x01ffffffffffff it's maxed.
//          
//          49 bits = number of levels.
//          
//          In addition 176 bytes between characters.
//          
//          Note these value cahnges will change the stats of the character immediately (On the front end)
function XiahouDenSkillList() => byte(0x6F9A70)

// $6F9B04: (32-bit) Xiahou Dun's Level
//          
//          0x00 = Level 1
//          0x18 = Outfit unlock (level 25)
//          0x31 = Level 50 (highest possible I believe)
//          Note changing this changes your stats! (going above 50 means you get extra stats! WOOOO)
function XiahouDunLevel() => dword(0x6F9B04)

// $6F9B20: (49-bits bitfield) Xiahou Den's Skill list.
//          
//          Each bit is a Skill.  Note, the order is all over the place, but when this is 0x01ffffffffffff it's maxed.
function SecondSkillList() => byte(0x6F9B20)

// $6FB6AC: (32-bit) Target Display for The Yellow Turban Rebellion (Allied Forces)
//          
//          Order of levels are based on 0x00722250.  0x1c (28) bytes between the entries.
function YellowTurbanTargetDisplay() => dword(0x6FB6AC)

// $6FB6B0: (bitfield) Target completed for Hu Lao Gate(Han Forces)
//          
//          bit0 = Target 1
//          bit1 =Target 2
//          bit2 =Target 3
function YellowTurbanTargetComplete() => byte(0x6FB6B0)

// $6FB6C8: (32-bit) Target Show for Hu Lao Gate(Han Forces)
//          
//          Decides if we should show the Hu Lao Gate Icons on the Free Mode.
function HuLaoHanForcesTargetDisplay.() => dword(0x6FB6C8)

// $6FBD84: (32-bit) Xiahou Dun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function XiahouDunUnlock() => dword(0x6FBD84)

// $6FBD90: (32-bit) Dian Wei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function DianWeiUnlock() => dword(0x6FBD90)

// $6FBD9C: (32-bit) Sima Yi Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SimaYiUnlocked() => dword(0x6FBD9C)

// $6FBDA8: (32-bit) Zhange Liao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangLiaoUnlocked() => dword(0x6FBDA8)

// $6FBDB4: (32-bit) Cao Cao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function CaoCaoUnlocked() => dword(0x6FBDB4)

// $6FBDC0: (32-bit) Zhou Yu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhouYuUnlocked() => dword(0x6FBDC0)

// $6FBDCC: (32-bit) Lu Xun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LuXunUnlocked() => dword(0x6FBDCC)

// $6FBDD8: (32-bit) Sun Shang Xiang  Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SunShangXiangUnlocked() => dword(0x6FBDD8)

// $6FBDE4: (32-bit) Gan Ning Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function GangNingUnlocked() => dword(0x6FBDE4)

// $6FBDF0: (32-bit) Sun Jian Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function SunJianUnlocked() => dword(0x6FBDF0)

// $6FBDFC: (32-bit) Zhao Yun Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhaoYunUnlocked() => dword(0x6FBDFC)

// $6FBE08: (32-bit) Guan Yu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function GuanYuUnlocked() => dword(0x6FBE08)

// $6FBE14: (32-bit) Zhang Fei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangFeiUnlocked() => dword(0x6FBE14)

// $6FBE20: (32-bit) Zhuge Liang Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhugeLiangUnlocked() => dword(0x6FBE20)

// $6FBE2C: (32-bit) Liu Bei Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LiuBeiUnlocked() => dword(0x6FBE2C)

// $6FBE38: (32-bit) Diao Chan Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function DiaoChanUnlocked() => dword(0x6FBE38)

// $6FBE44: (32-bit) Lu Bu Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LuBuUnlocked() => dword(0x6FBE44)

// $6FBE50: (32-bit) Cao Pi Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function CaoPiUnlocked() => dword(0x6FBE50)

// $6FBE5C: (32-bit) Zhang He Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function ZhangHeUnlocked() => dword(0x6FBE5C)

// $6FBE68: (32-bit) Ling Tong Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function LingTongUnlocked() => dword(0x6FBE68)

// $6FBE74: (32-bit) Taishi Ci Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function TaishiCiUnlocked() => dword(0x6FBE74)

// $6FBE80: (32-bit) Ma Chao Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function MaChaoUnlocked() => dword(0x6FBE80)

// $6FBE8C: (32-bit) Yue Ying Unlocked
//          
//          0x00 = Locked
//          0x01 = Unlocked and available.
function YueYingUnlocked() => dword(0x6FBE8C)

// $6FBE98: (32-bit) First Warhorse Display.
//          
//          0x00 = Brown horse
//          0x01 = Light Black Horse
//          0x02 = Redish Horse
//          0x03 = White Horse
//          0x04 = Dark Black Horse
//          0x05 = Red Horse
//          Set to 0x06 when it's disabled
function FirstWarhorseDisplay() => dword(0x6FBE98)

// $6FBE9C: (32-bit) First Warhorse Last Name
//          
//          0x00 = Star
//          0x01 = Cloud
//          0x02 = Mist
//          0x03 = Dream
//          0x04 = Shadow
//          0x05 = Fang
//          0x06 = Song
//          0x07 = Fox
//          0x08 = Leopard
//          0x09 = Cat
//          0x0a = Rat
//          0x0b = Tiger
//          0x0c = Bull
//          0x0d = Stone
//          0x0e = Boulder
//          0x0f = Beauty
//          0x10 = Warlord
//          0x11 = Sun
//          0x12 = Moon
//          0x13 = Comet
//          0x14 = Dasher
//          0x15 = Eagle
//          0x16 = Devil
//          0x17 = Sprinter
//          0x18 = Striker
//          0x19 = Emperor
//          0x1a = King
//          0x1b = Phoenix
//          0x1c = Titan
//          0x1d = Wave
//          0x1e = Zephyr
//          0x1f = Warrior
//          
//          Special Horse names
//          Ultimate Dream
//          Southern Striker
//          Blue Striker
//          Quiet Dream
//          Eastern  Comet
//          Evening Mist
//          Ginger Shadow
function FirstWarhorseLastName() => dword(0x6FBE9C)

// $6FBEA0: (32-bit) First Warhorse Last Name
//          
//          0x00 = Bay
//          0x01 = Black
//          0x02 = Chestnut
//          0x03 = Grey
//          0x04 = Blue
//          0x05 = Red
//          0x06 = Dapple
//          0x07 = Savage
//          0x08 = Roan
//          0x09 = Chrome
//          0x0a = Dun
//          0x0b = Pinto
//          0x0c = Dawn
//          0x0d = Dusk
//          0x0e = Evening
//          0x0f = Harvest
//          0x10 = Quiet
//          0x11 = Quiet
//          0x12 = Eastern
//          0x13 = Western
//          0x14 = Southern
//          0x15 = Northern
//          0x16 = Phantom
//          0x17 = Ginger
//          0x18 = Royal
//          0x19 = Cinnamon
//          0x1a = Saffron
//          0x1b = Sparkling
//          0x1c = Vailiant
//          0x1d = Brave
//          0x1e = Ultimate
//          0x1f = Cosmic
//          
//          Special Horse names
//          Ultimate Dream
//          Southern Striker
//          Blue Striker
//          Quiet Dream
//          Eastern  Comet
//          Evening Mist
//          Ginger Shadow
function FirstWarhorseFirstName() => dword(0x6FBEA0)

// $6FBEA4: (32-bit) First Horse Physique
//          
//          0x00 = Harbors Untold Power
//          0x01 = Well-Balanced
//          0x02 = Superior
//          0x03 = Heavenly
//          
//          Any other =- None shown.
function FirstHorsePhysique() => dword(0x6FBEA4)

// $6FBEA8: (32-bit)
//          
//          Not sure the exact values, multiple map to the same thing.
//          
//          0x00 - 0x02 =  Gaze into the distance
//          0x03 = Miss nothing
//          0x04 - 0x06
//          0x07 = View the world in clarity
//          0x0f = Consider the world
//          
//          
//          These get repeasted.
function FirstHorseGaze() => dword(0x6FBEA8)

// $6FBEAC: (32-bit) First horse Title
//          
//          These might be for the kings.
//          
//          0x1f = Shadow Runner King
//          0x23 = Red Hare King
//          0x0b = Grey King
//          0x17 = Auburn King
//          0x13 = Ebon King
//          0x0f = Dapple King
//          0x0b = Kingly Warhorse
function FirstHorseTitle() => dword(0x6FBEAC)

// $6FBEB0: (32-bit) First Horse Experience
//          
//          0x1388 = 5000 Experience (This also controls the Level)
function FirstHorseExperience() => dword(0x6FBEB0)

// $6FBED4: (32-bit) Second Warhorse Start (The name control)
function SecondWarhorseDisplay() => dword(0x6FBED4)

// $721D64: (8-bit) Stage Index for Musou Mode.
//          
//          Which Stage you're currently on in the musou   This is a control for when you beat a level. Setting it to 0x06 seems Play the final video.
function StageIndexForMusouMode() => byte(0x721D64)

// $72224C: (8-bit) Map Terrain Id for loading.
//          
//          Note this controls WHICH map loads.  However this doesn't choose which map is played.  Just the terrain.
//          
//          There is a danger if this doesn't match the rest of the map.  It will crash the game in some rare cases.
//          
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = conquest of Wu
//          0x04 = Battle of Guan Du
//          0x05Invasion of Xu Chang
//          0x6 = Battle of Chang Ban
//          0x07 Chibi
//          0x16  = Gauntlet
//          0x19 = Tong Gate
//          
//          This needs to match 0x00722250 for proper loading.  NOTE they are different values.
function MapTerrainId() => byte(0x72224C)

// $722250: (32-bit) Map Name Id for loading.
//          
//          Only for the name of the map. Counts up to 0x3e
//          
//          0x00 = The Yellow Turban Rebellion (Han Forces)
//          0x01 = Battle of Hu Lao Gate (Allied Forces)
//          0x02 = Battle of Hu Lao Gate (Lu Bu's Forces)
//          0x03 = Battle of Xia Pi (Cao Cao's Forces)
//          0x04 = Battle of Xia Pi (Sun Jian's Forces)
//          0x05 = Battle of Xia Pi (Lu Bu's Forces)
//          0x06 = Conquest of Wu (Sun Ce's Forces)
//          0x07 = Campaign Against Yuan Shu (Liu Bei's Forces)
//          0x08 = Battle of Guan Du (Cao Cao's Forces)
//          0x09 = Battle of Guan Du (Lu Bu's Forces)
//          0x0a = Invasion of Xu Chang (Sun Ce's Forces)
//          0x0b = Invasion of Xu Chang (Lu Bu's Forces)
//          0x0c = Invasion of Xu Chang (Sima Yi's Forces)
//          0x0d = Battle of Chang Ban (Cao Cao's Forces)
//          0x0e = Battle of Chang Ban (Liu Bei's Forces)
//          0x0f = Battle of Chi Bi (Cao Cao's Forces)
//          0x10 = Battle of Chi Bi (Allied Forces)
//          0x11 = Battle of Chi Bi (Lu Bu's Forces)
//          0x12 = Pacification of Cheng Du (Liu Bei's Forces)
//          0x13 = Battle of Jing Provice (Wu Forces)
//          0x14 = Battle of Jing Province (Sun Jian's Forces)
//          0x15 = Battle of Jing Province (Lu Bu's Forces
//          0x16 = Battle of He Fei (Wei Forces)
//          0x17 = Battle of He Fei (Wu Forces)
//          0x18 = Battle of He Fei (Sun Jian's Forces)
//          0x19 = Battle of He Fei (Lu Bu's Forces)
//          0x1a = Battle of Mt. Ding Jun (Wei Forces)
//          0x1b = Battle of Mt. Ding Jun (Shu Forces)
//          0x1c = Battle of Mt. Ding Jun (Lu Bu's Forces)
//          0x1d = Battle of Fan Castle (Allied Forces)
//          0x1e = Battle of Fan Castle (Sun Jian's Forces)
//          0x1f = Battle of Fan Castle (Shu Forces)
//          0x20 = Battle of Fan Castle (Lu Bu's Forces)
//          0x21 = Battle of Yi Ling (Wu Forces)
//          0x22 = Battle of Yi Ling (Shu Forces)
//          0x23 = Battle of Han Zhong (Wei Forces)
//          0x24 = Battle of Han Zhong (Shu Forces)
//          0x25 = Battle of Han Zhong (Lu Bu's Forces)
//          0x26 = Battle of Shi Ting (Wei Forces)
//          0x27 = Battle of Shi Ting (Wu Forces)
//          0x28 = Battle of Shi Ting (Lu Bu's Forces)
//          0x29 = Battle of He Fei Castle (Wei Forces)
//          0x2a = Battle of He Fei Castle (Wu Forces)
//          0x2b = Battle of Wu Zhang Plains (Wei Forces)
//          0x2c = Battle of Wu Zhang Plains (Shu Forces)
//          0x2d = Rampage
//          0x2e = Sudden Death
//          0x2f = Speed Run
//          0x30 = Havoc
//          0x31 = Gauntlet
//          0x32 = Battle of Jiang Dong (Liu Yong's Forces)
//          0x33  = Battle of Guan Du (Yuan Shao's Forces)
//          0x34 = Struggle at He Bei (Cao Cao's Forces)
//          0x35 = Battle of Tong Gate (Allied Forces)
//          0x36 = Pacification of Cheng Du (Liu Zhang's Forces)
//          0x37 = Battle of Jing Province (Shu Forces)
//          0x38 = Battle of Ru Xu Kou (Wu Forces)
//          0x39 = Battle of Jie Ting (Wei Forces)
//          0x3a = Battle of Jie Ting (Shu Forces)
//          0x3b = Invasion of Xu Chang (Wei Forces)
//          0x3c = Battle of Shi Ting (Wei Forces)
//          0x3d = Battle of Wu Zhang Plains (Wei Forces)
//          0x3e = Battle of Xia Pi Xia Pi
//          
//          Any others will likely crash your game hard.
//          
//          This needs to match 0x0072224c for proper loading.  NOTE they are different values.
//          
//          It appears this can be different depending on Team
//          
//          Not all levels are the same. 0x03, 0x4 0x5 are Xiapi varients.. as is 0x3e.  Probably order of being created (or patched in for Special)
function MapNameId() => dword(0x722250)

// $722254: (32-bit) Difficulty Setting.
//          
//          This appears to be the setting from the Start.  Then 0x722288 adopts this.
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Master
//          0x04 = Chaos
function DifficultySetting() => dword(0x722254)

// $722280: (8-bit) Second Map Id for loading.
//          
//          Note this controls WHICH map loads.  However this doesn't choose which map is played.  Just the terrain.
//          
//          There is a danger if this doesn't match the rest of the map.  It will crash the game in some rare cases.
//          
//          0x01 = Battle of Hu Lao Gate
//          0x02 = Battle of Xia Pi
//          0x03 = Conquest of Wu
//          0x04 = Battle of Guan Du
//          0x05 = Invasion of Xu Chang
//          0x06 = Battle of Chang Ban
//          0x07 = Chibi
//          0x16  = Gauntlet
//          0x19 = Tong Gate
function SecondMapIdForLoading() => byte(0x722280)

// $722288: (32-bit) Display Difficulty Setting.
//          
//          Changing this changes the difficulty on the pause screen.
//          
//          This appears to be the setting from the Start.  Then 0x722288 adopts this.
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          0x03 = Master
//          0x04 = Chaos
function DisplayDifficultSetting() => dword(0x722288)

// $722290: (32-bit) Time in Battle by frames.  (60 fps)
//          
//          This is still valid after the battle.
function TimeInBattle() => dword(0x722290)

// $722298: (8-bit) Mission results
//          
//          Starts at 0x05. Changes on death/failure.  This is a control, so if this is set to "victory" even if you die, you win the level.
//          
//          Similarly, setting it to 0, your character will "die" when you beat a level.
//          
//          0x00 = Character Death
//          0x01 = (Appears to be no result)
//          0x02 = Victory
//          0x03 = Failure (Defeated)
//          0x04 = Defeated (maybe Boss killed)   Liu Bei getting to the boat causes this)
//          0x04 = Timed out in Challenge mode.
//          0x05 = Normal Gameplay (skips "ending" results in game over.
//          
//          Other values appear to also do the same as 5.
function MissionResult() => byte(0x722298)

// $7E06EC: (32-bit) Victory Camera.
//          
//          0x00000000 = Won Level   (includes Gauntlet)
//          0x00000001 = Lost Level (Failure)
//          0x00000002 = Character died (zoom in)
//          0xffffffff = Normal Gameplay
//          
//          Others appear to do the same as 0xffffffff (no camera).  Note, this only controls trhe camera.  0x00722298 is the control for the results
function VictoryCamera() => dword(0x7E06EC)

// $9A4F14: (32-bit) Player Faction
//          
//          0x00 = Han Forces
//          0x01 = Allied Forces
//          0x02 = Wei Forces
//          0x03 = Wu Forces
//          0x04 = Shu Forces
//          0x05 = Cao Cao's Forces
//          0x06 = Sun Jian's Forces
//          0x07 = Sun Ce's Forces
//          0x08 = Sun Quan's Forces
//          0x09 = Liu Bei's Forces
//          0x0a = Dong Zhuo's Forces
//          0x0b = Lu Bu's Forces
//          0x0c = Yuan Shao's Forces
//          0x0d = Yellow Turbans
//          0x0e = Liu Zhang's Forces
//          0x0f = Yuan Shu's Forces
//          0x10 = Sima Yi's Forces
//          0x11 = Cao Pi's Forces
//          0x12 = Yuan Tan's Forces
//          0x13 = Liu Yong's Forces
function PlayerFaction() => dword(0x9A4F14)

// $9A4FF0: (32-bit) Opponet Faction
//          
//          0x00 = Han Forces
//          0x01 = Allied Forces
//          0x02 = Wei Forces
//          0x03 = Wu Forces
//          0x04 = Shu Forces
//          0x05 = Cao Cao's Forces
//          0x06 = Sun Jian's Forces
//          0x07 = Sun Ce's Forces
//          0x08 = Sun Quan's Forces
//          0x09 = Liu Bei's Forces
//          0x0a = Dong Zhuo's Forces
//          0x0b = Lu Bu's Forces
//          0x0c = Yuan Shao's Forces
//          0x0d = Yellow Turbans
//          0x0e = Liu Zhang's Forces
//          0x0f = Yuan Shu's Forces
//          0x10 = Sima Yi's Forces
//          0x11 = Cao Pi's Forces
//          0x12 = Yuan Tan's Forces
//          0x13 = Liu Yong's Forces
function OpponentFaction() => dword(0x9A4FF0)

// $9A50CC: (32-bit) Second Opponet's Faction
function SecondOpponetFaction() => dword(0x9A50CC)

// $A11068: (32-bit Array of 3) Targets
function InMissionTargets() => dword(0xA11068)

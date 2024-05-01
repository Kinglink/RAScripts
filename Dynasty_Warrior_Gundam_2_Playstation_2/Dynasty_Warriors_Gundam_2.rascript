// Dynasty Warriors: Gundam 2
// #ID = 20794

// $3B4CE8: (8-bit) Mode Selected.
//          
//          0x00 = Original Mode
//          0x01 = Mission Mode
//          0x02 = Versus Mode
//          0x03 = Gallery
//          0x04 = Options
//          0x05 = Restart (Interim Continue)
function gameModeSelected() => byte(0x3B4CE8)

// $648FE8: (8-bit) Save Indicator 1
//          
//          0x00 = Not Loading
//          0x01 = Loading a Save File
function saveIndicator1() => byte(0x648FE8)

// $64AAE8: (8-bit) Save Indicator 2
//          
//          0x00 = Not Loading
//          0x01 = Loading a Save File
function saveIndicator2() => byte(0x64AAE8)

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

// $68DA26: (16-bit) Amuro Ray's Name and character model.
function amuroRayName() => word(0x68DA26)

// $68DA28: (24-bit bitfield)  Amuro Ray's License Bitfield.
//          
//          0xffffff = All Licenses.
//          
//          Bit0 =Gundam
//          Bit1 = Char Zaku II
function amuroRayLicenseBitfield() => tbyte(0x68DA28)

// $68DA2C: (bitfield) Amuro Ray Mission information
//          
//          bit1 = Selectable
//          bit3 = New tag (goes away after usage)
//          bit6 = Change Outfits
//          
//          Becomes 0x22b when unlocked, but becomes 0x0203 after clicking on the mission list (don't know what the first 2 is but it disappears).
//          
//          Follows based on list of people at 0x006ce470 So 6 more and you get Domon Kasshu
function amuroRayMissionInfo() => byte(0x68DA2C)

// $68DA33: (8-bit) Amuro Ray's Level
//          
//          0x00 = Level 1
//          0x01 = Level 2
//          0x02 = Level 3
function amuroRayLevel() => byte(0x68DA33)

// $68DA34: (32-bit) Amuro Ray's Experience points
function amuroRayExperiencePoints() => dword(0x68DA34)

// $68DA48: (36-bit bitfield) Amuro Ray Skill list
//          
//          Max = 0x1fdfffffff  (That's 36 bits)
//          
//          Note: Specific order is unknown, and not investigates
function amuroRaySkillList() => byte(0x68DA48)

// $68DA76: (16-bit) Char Azable Name
//          
//          Saved for offset.
function charAzableName() => word(0x68DA76)

// $68DA7C: (bitfield) Char Aznable Mission informatikon
//          
//          bit1 = Selectable
//          bit3 = New tag (goes away after usage)
//          
//          Becomes 0x22b when unlocked, but becomes 0x0203 after clicking ont he mission list (don't know what the first 2 is but it disappears).
function charAznableMissionInfo() => byte(0x68DA7C)

// $68DA83: Char Anz
function charAznableLevel() => byte(0x68DA83)

// $691A30: (16-bit) Gundam (Suit 1) Display image
//          
//          0x00 = Gundam
//          0x01 = Zaku 2
//          and so on.
function suit1DisplayImage() => word(0x691A30)

// $691A56: (bitfield) Gundam (Suit 1) Ownership
//          
//          bit0 = All parts obtained.
function suit1Ownership() => byte(0x691A56)

// $691A68: (40-bit, Array of 5 bytes) Gundam (Suit 1) Equips
//          
//          For the next equips
//          0x00 = Exists,
//          0x01 =Not owned yet.
//          
//          Torso, Left Arm, Right Arm, Left Leg, Right Leg
function suit1ownedPieces() => byte(0x691A68)

// $691A72: (8-bit) Gundam (Suit 1) Part 1 Type
//          
//          0x00 = Torso
//          0x01 = Left Arm
//          0x02 = Right Arm
//          0x03 = Left Leg
//          0x04 = Right Leg
function suit1Part1Type() => byte(0x691A72)

// $691A73: (8-bit) Gundam (Suit 1) Part 1 Rank
//          
//          0x00 = Rank 1
//          0x01 = Rank 2
//          0x02 = Rank 3
//          0x04 = Rank 4
function suit1Part1Rank() => byte(0x691A73)

// $691A74: (8-bit) Gundam (Suit 1) Part 1 Ability
//          
//          0xff = Disabled (None)
//          0x00 - 0x16 = Suit Skills.
function suit1Part1Ability() => byte(0x691A74)

// $691A78: (16-bit) Gundam (Suit 1) Part 1 Power 1
//          
//          On Torso it's Armor
//          
//          Armor is divided by 10 to display.
function suit1Part1Power1() => word(0x691A78)

// $691A7A: (16-bit) Gundam (Suit 1) Part 1 Power 2
//          
//          For Torso it's SP lvl
//          
//          0x00 = Sp Lv 1
//          0x01 = Sp Lv 2
//          0x03 = Sp Lv 3
function suit1Part1Power2() => word(0x691A7A)

// $691A7C: (16-bit) Gundam (Suit 1) Part 1 Power 3
//          
//          On Torso it's Mobility
function suit1Part1Power3() => word(0x691A7C)

// $691A82: (8-bit) Gundam (Suit 1) Part 2 Type
//          
//          0x00 = Torso
//          0x01 = Left Arm
//          0x02 = Right Arm
//          0x03 = Left Leg
//          0x04 = Right Leg
function suit1Part2Type() => byte(0x691A82)

// $691A83: (8-bit) Gundam (Suit 1) Part 2 Rank
//          
//          0x00 = Rank 1
//          0x01 = Rank 2
//          0x02 = Rank 3
//          0x04 = Rank 4
function suit1Part2Rank() => byte(0x691A83)

// $691A84: (8-bit) Gundam (Suit 1) Part 2 Ability
//          
//          0xff = Disabled (None)
//          0x00 - 0x16 = Suit Skills.
function suit1Part2Ability() => byte(0x691A84)

// $691A88: (16-bit) Gundam (Suit 1) Part 2 Power 1
//          
//          Left Arm it's Melee
function suit1Part2Power1() => word(0x691A88)

// $691A8A: (16-bit) Gundam (Suit 1) Part 2 Power 2
//          
//          Left Arm it's Shot
function suit1Part2Power2() => word(0x691A8A)

// $691A8C: (16-bit) Gundam (Suit 1) Part 2 Power 3
//          
//          Left Arm it's Defense
function suit1Part2Power3() => word(0x691A8C)

// $691A8E: (16-bit) Gundam (Suit 1) Part 2 Power 4
//          
//          Left Arm it's Thruster
function suit1Part2Power4() => word(0x691A8E)

// $691AC0: (16-bit) Zaku II (Suit 2) Display image
//          
//          0x00 = Gundam
//          0x01 = Zaku II (Char)
//          and so on.
function suit2DisplayImage() => word(0x691AC0)

// $6965E0: (8-bit) Amuro's 1st Story mission complete status.
//          
//          Set to 0x04 when player wins.
//          
//          0x01 doesn't appear to mark complete.
function amuroFirstOriginalMission() => byte(0x6965E0)

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
function missionsSelected() => byte(0x6CE484)

// $6CE485: (8-bit) Demo Detector
//          
//          Appears to be a detection for Demo mode
//          0x00 = Not Demo.
//          0x01 = Demo
//          
//          Probably shouldn't require it for MSL or anything else that might occur outside of a level.
function demoDetector() => byte(0x6CE485)

// $6CE488: (8-bit) Selected character in Original Mode
//          
//          Note: Use  0x006ce470  instead, this is just information for the Original mode itself.
function selectedCharacterOriginalMission() => byte(0x6CE488)

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
function characterGalleryFirstEntryName() => word(0x6D0F1C)

// $6D0F1E: (8-bit) Character Gallery First entry Amuro Ray Image
//          
//          0x00 = Original Amuro Ray
//          0x04 = Quattro Bajeena
function acharacterGalleryFirstEntryImage() => byte(0x6D0F1E)

// $6D0F1F: (8-bit) Character Gallery First entry Amuro Ray Series
//          
//          0x00 = Mobile Suit Gundam
//          0x01 = Mobile Suit Zeta Gundam
//          0x02 = Mobile Suit Gundam ZZ
function characterGalleryFirstEntrySeries() => byte(0x6D0F1F)

// $6D0F20: (bitfield) Character Gallery First entry Amuro Ray Display Value
//          
//          bit0 = Visible
//          bit1 = New
//          
//          Note these are NOT in order on the screen.
function characterGalleryFirstEntryDisplay() => byte(0x6D0F20)

// $6D0F2C: (bitfield) Character Gallery Second entry Older Amuro Ray
//          
//          bit0 = Visible
//          bit1 = New.
function characterGallerySecondEntryName() => byte(0x6D0F2C)

// $6D1520: (bitfield) Mobile Suit Gallery First Suit Gundam
//          
//          Gundam
//          
//          bit0 = Visible
//          bit1 = New
function mobileSuitGalleryFirstSuitVisible() => byte(0x6D1520)

// $6D152C: (bitfield) Mobile Suit Gallery Second Suit
//          
//          Zaku II(Char)
//          
//          bit0 = Visible
//          bit1 = New
function mobileSuitGallerySecondSuitVisible() => byte(0x6D152C)

// $6D1B20: (bitfield) BattleShip Gallery First ship
//          
//          White Base
//          
//          bit0 = Visible
//          bit1 = New
function battleshipGalleryFirstShip() => byte(0x6D1B20)

// $6D1B2C: (bitfield) BattleShip Gallery Second ship
//          
//          Salamis
//          
//          bit0 = Visible
//          bit1 = New
function battleshipGallerySecondShip() => byte(0x6D1B2C)

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
//          Previous three bytes is repeating which movie it is.  Then the next movie.  For 47 movies.  Final movie display information at 0x006d1cd9
function firstMovieGalleryUnlock() => byte(0x6D1BDD)

// $6FDABF: (8-bit) Save Indicator 3
//          
//          0x00 = Not Loading
//          0x01 = Saving or Loading a Save File
//          
//          This one lingers for longer and used also for saving.  Should be safe to do both, but still appears to ONLY be for Save and load..
function saveIndicator3() => byte(0x6FDABF)

// $1B1DBBC: (32-bit) Which message is being viewed in the Terminal
//           
//           0xbd = Dynasty Warriors: Gundam 2 Quiz
//           0xbe = Dynasty Warriors: Gundam 2 Quiz
function messageViewedTeriminal() => dword(0x1B1DBBC)

// $1B1E874: (8-bit) Number of correct answers to the Dynasty Warriors Gundam Quizes.
function correctAnswersQuiz() => byte(0x1B1E874)

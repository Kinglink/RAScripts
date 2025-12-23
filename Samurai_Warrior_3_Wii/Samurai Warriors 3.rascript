// Samurai Warriors 3
// #ID = 34694

// $653420: (32-bit BE) Yukimura Complete Stages
//          
//          0x01 = Beat First stage.
//          0x05 = Complete Musou Mode (mark Cleared
function YukimuraCompleteStages() => dword_be(0x653420)

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

// $6535A0: (32-bit BE) Keiji Maeda Unlocked Part 1
//          
//          This is set to 1 when he's unlocked.  If this is NOT set to 0x90 it appears he's not selectable.  You also must set 0x00654872 to 0x90
function KeijiMaedaUnlockPart1() => dword_be(0x6535A0)

// $654630: (bitfield) Completed Stages
//          
//          bit0 = Yukimura's First stage
//          bit4 = Yukimura's Fifth Stage
//          bit5 = Second character (Keiji?) first stage
function CompletedMusouStages() => byte(0x654630)

// $654631: (bitfield) Completed Stages Part 2
//          
//          bit2 = Nobunaga's first stage
//          bit6 = Nobunaga's fifth stage
function CompletedMusouStagesPart2() => byte(0x654631)

// $65464E: (bitfield) Completed stages for normal Murasame Castle
//          
//          bit 2 = A Strange Rumor
//          bit 3 = The Mysterious Samurai
//          bit 4 = Follow Takamaru
//          bit 5 = Aosame Castle (Fourth Stage) worthy of an achievement?
//          bit 6 = The Plot Thickens
//          bit 7 = An Unexpected Encounter
function MurasameCompletePart1() => byte(0x65464E)

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
function MurasameCompletePart2() => byte(0x65464F)

// $654650: (bitfield) Complete Stagesfor Murasame Castle Part 3
//          
//          bit 0 = Murasame Castle
//          bit 1 = Down the Rabbit Hole (Bonus 1)
//          bit 2 = Through the Looking Glass (Bonus 2)
//          bit 3 = Curiouser and Curiouser (Bonus 3)
//          bit 4 = A Strange Rumor (Nightmare)
function MurasameCompletePart3() => byte(0x654650)

// $654651: (bitfield) Complete Stagesfor Murasame Castle Part 4
//          
//          Same as the original but offset.
//          
//          bit 7 = Momosame Castle (Nightmare
function MurasameCompletePart4() => byte(0x654651)

// $654652: (bitfield) Complete Stagesfor Murasame Castle Part 5
//          
//          Same as the original but offset.
//          
//          bit 0 - 5 is the final levels of Nightmare Murasame castle (offset from the original list)
//          Not sure what bit 6 and bit 7 are Likely messages,  6 was set when I was mucking,  7 gets set eventually, might be tutorial messages?
function MurasameCompletePart5() => byte(0x654652)

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
function TanukiUnlocksNightmare() => byte(0x65465B)

// $654677: (Bitfield) Weapon Unlock purchases
//          
//          Bit 2 = Yukimura
//          Bit 3 = Keiji Maeda
//          
//          
//          Rather than list the rest, here's the final value.
//          32-bit BE 0x fcffffef   Followed by 8-bit is 7f
function WeaponUnlockPurchases() => dword_be(0x654677)

// $6546A8: (32-bit BE) Yukimura Sanada Level
//          
//          Note when you load a save, it loads to this location
function YukimuraLevel() => dword_be(0x6546A8)

// $6546BA: (bitfield) Yukimura unlock status.
//          
//          bit 4 = New marker
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
function YukimuraFirstWeaponType() => dword_be(0x6546BC)

// $6546E8: (32-bit BE) Yukimura's Second Weapon Type
function YukimuraSecondWeapon() => dword_be(0x6546E8)

// $654714: (32-bit BE) Yukimura's Third Weapon Type
function YukimuraThirdWeapon() => dword_be(0x654714)

// $654860: (32-bit BE) Keiji Maeda Level
function KeijiMaedaLevel() => dword_be(0x654860)

// $654872: (8-bit) Keiji Maeda Unlocked Part 2
//          
//          This is set to 90 when he's unlocked.  If this is NOT set to 0x90 it appears he's not selectable.  You also must set 0x6535a0 to 0x01
function KeijiMaedaUnlockStatus() => byte(0x654872)

// $65B5B0: (32-bit BE) Amount of rice
//          
//          Currency for the Dojo
function RiceCount() => dword_be(0x65B5B0)

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
function HistoricalStage11Completed() => byte(0x65BC6A)

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
function HistoricalStage12CompleteStatus() => byte(0x65BC92)

// $6A08C8: (Array of 6 32-bit BE) Objective index... Not important should always be 00 -05 unless mission is not tracked then, 0xffffffff Might be useful to check.
function InGameObjectiveIndex() => dword_be(0x6A08C8)

// $6A08E0: (32-bit BE Array of 4 ) Current Mission Objective Statuses
//          
//          0x00 = In Progress (uncomplete)
//          0x01 = Successful
//          0x02 = Failed
function ObjectiveStatus() => dword_be(0x6A08E0)

// $6A14F8: (Array of 4 32-bit )  Tactical Bonuses Index
//          
//          This is how the game marks a Tactical Bonus Complete, I believe it will always be 0x00, 0x01, 0x02, 0x03.  Maybe 0xffffffff If not active.
function TacticalBonusIndex() => dword(0x6A14F8)

// $6A1508: (Array of 4 32-bit )  Tactical Bonuse Success Status
//          
//          0x00 = Incomplete
//          0x03 = Cleared (marker shown)
//          0x04 = Failure (no marker shown)
function TacticalBonusSuccess() => dword(0x6A1508)

// $787D94: (32-bit BE)  Stage/Force
//          
//          Note: This is only for the script (and maybe characters).  The level loaded is elsewhere.  Likely 0x00787da
//          
//          This also has values for maps that are only in Historical mode (The first one for instance)
//          
//          0x00 = Siege of Kawagoe Castle(Hojo Army)   (Historical Mode)
//          0x01 = Motonari's Return (Uesugi Army)
//          0x02 = The Suruga-Sagami Conflict (Hojo Army)
//          0x03 = The Suruga-Sagami Conflict (Hojo Army)
//          0x04 = The Kanto Campaign (Hojo Army)
//          0x05 = The Kanto Campaign (Uesugi Army)
//          0x06 = Battle of Okehazama (Oda Army)
//          0x07 = Battle of Kawanakajima(Uesugi Army)
//          0x08 = Battle of Kawanakajima(Takeda Army)
//          
//          0x01a = Battle of Nagashino(Oda-Tokugawa Army)
//          
//          
//          0x46 = The Osaka Campaign (Toyotomi Army)
//          0x47 = Confrontationat at Mikatagahara(Toyotomi Army)
//          0x48 = Siege of Kawagoe Castle (Sanada Army) (Though this is set for Murasame castle as well)
//          0x04a = Osaka Campaign(Hojo Army)
//          0x04b = Main Menu (Freezing this starts crashing the game.)
function StageForceIndex() => dword_be(0x787D94)

// $787D98: (32-bit BE) Musrasame Castle Difficulty Index
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
function MurasameDifficultYIndex() => dword_be(0x787D98)

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
//          
//          
//          (Guesses)
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
//          
//          <I assume the other characters exist, but I don't have values for them>
//          0x28 = First Character
//          0x3b = Last Custom Character
function CurrentPlayerIndex() => dword_be(0x787DA8)

// $787D68: (32-bit BE) Mission results
//          
//          0x00 = Mission won
//          0x01 = Time over.
//          0x03 = Killed
//          0x04 = Quit
//          0x05 = Normal Gameplay.
//          
//          if this is not set to 0x5, you get result screens when you quit
function MissionResult() => dword_be(0x787D68)

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
function DifficultySelected() => byte(0x787D6F)

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
function ModeSelected() => dword_be(0x787D78)

// $787D7C: (32-bit BE) Two Player indicator.
//          
//          0x00 = 1 Player.
//          0x01 = 2 Player.
//          0x03 = Main Menu potentially
function TwoPlayerIndicator() => dword_be(0x787D7C)

// $787D9C: (32-bit BE) Musrasame Castle Stage Index
//          
//          In Murasame Castle, this controls which level you will play
//          
//          0x00 = A Strange Rumor
//          0x01 = The Mysterious Samurai
//          0x02 = Follow Takamaru
//          0x03 = Aosame Castle
function MurasameCastleStageIndex() => dword_be(0x787D9C)

// $78B0CC: (Float BE) Actual Time control. This is Seconds (Floating point value)
//          
//          Setting this to 3600 (on a 3600 second mission) Fails the mission immediately.
function TimeControl() => float_be(0x78B0CC)

// $107D6F4: (32-bit BE) KO pointer
//           
//           +0x8000004c: KO counter   Control, changing this changes the KO count. (If this is ever bellow the current count, it'll count forever, just a comment.)
function KoPointer() => dword_be(0x107D6F4)

// $107D950: (32-bit BE) Number of Items Player 1 currently has
function NumberOfItemsCarried() => dword_be(0x107D950)

// $107E708: (32-BE) First Player Kill Count
function FirstPlayerKillCount() => byte(0x107E708)

achievement(
    title = "(VOID) Thunder General", points = 3,
    description = "(VOID) Unlock Zhang Liao",
    id = 549285, badge = "00000", published = "10/7/2025 4:47:10 AM", modified = "11/4/2025 8:21:40 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6F9D24) == 1 && prev(dword(0x6F9D24)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Poet of War", points = 3,
    description = "(VOID) Unlock Cao Cao",
    id = 549286, badge = "00000", published = "10/7/2025 4:47:11 AM", modified = "11/4/2025 8:21:40 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6F9DD4) == 1 && prev(dword(0x6F9DD4)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Chaos on the Water", points = 3,
    description = "(VOID) Unlock Gan Ning",
    id = 549287, badge = "00000", published = "10/7/2025 4:47:11 AM", modified = "11/4/2025 8:21:41 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA094) == 1 && prev(dword(0x6FA094)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) Founder's Flame", points = 3,
    description = "(VOID) Unlock Sun Jian",
    id = 549288, badge = "00000", published = "10/7/2025 4:47:11 AM", modified = "11/4/2025 8:21:41 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA144) == 1 && prev(dword(0x6FA144)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
)

achievement(
    title = "(VOID) The Sleeping Dragon", points = 3,
    description = "(VOID) Unlock Zhuge Liang",
    id = 549289, badge = "00000", published = "10/7/2025 4:47:12 AM", modified = "11/4/2025 8:21:41 AM",
    trigger = dword(0x3CDC70) == 1 && dword(0x3CDC38) != 0 && byte(0x722298) == 2 && dword(0x4D50B8) == 30 &&
              dword(0x6FA404) == 1 && prev(dword(0x6FA404)) == 0 &&
              ((dword(0x3CD8B4) == 0) ||
               (dword(0x3CD8B4) == 1))
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

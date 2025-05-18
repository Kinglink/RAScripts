// Devil Kings
// #ID = 20696

// $488DE8: (8-Bit) Difficulty Setting
//          
//          0x00 = Easy
//          0x01 = Normal
//          0x02 = Hard
//          
//          Must be past the initial "Engage"   Probably best to ensure time is over 0 and at least at state 8.
function difficultySetting() => byte(0x488DE8)

// $54C404: (8-bit) Post game Result.
//          
//          This changes after a match.  Note: It does NOT change when returning to the main menu.
//          
//          0x00 = Normal gameplay
//          0x01 = Won
//          0x02 = Game Over
//          
//          Freezing this will change what is shown after a win/death... But doesn't change the actual result.
//          
//          We don't need that, we can live with this.
function winCheck() => byte(0x54C404)

// $55CA70: (8-bit) Expected Scorpio Saved Level
//          
//          Look at 0x0055d094  for more info
function larkSataStartFirst() => byte(0x55CA70)

// $55CC7C: (8-bit) Actual Azure Dragon Saved Level
//          
//          Look at 0x0055d094  for more info.
function azureDragonSaveData() => byte(0x55CC7C)

// $55CE88: (8-bit) Actual Scorpio Saved Level
//          
//          Look at 0x0055d094  for more info
function scorpioSaveData() => byte(0x55CE88)

// $55D094: (8-bit) Actual Devil King's Saved Level
//          This is the level for Devil King.  But this is updated when you save the game.  The game will pull from this when you go back to the main menu.   However it doesn't update the player chooses to Save the game  If he doesn't the level increases in game and NOT the front end.
//          
//          In addition once you've returned to the front end.  Changing this doesn't change the level.   Likely it's stored in a separate place once in the front end.
//          
//          830 415
function devilKingSaveData() => byte(0x55D094)

// $55D8C4: (8-bit) Hornet Saved Level
//          
//          See 0x0055d094 for more info
function hornetSaveData() => byte(0x55D8C4)

// $55EB20: (8-bit) Item Unlock: Spartan Brace
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function spartanBraceItemLevel() => byte(0x55EB20)

// $55EB21: (8-bit) Item Unlock: Armor
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function armorItemLevel() => byte(0x55EB21)

// $55EB22: (8-bit) Item Unlock: Energy Bead
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function energyBeadItemLevel() => byte(0x55EB22)

// $55EB23: (8-bit) Item Unlock: Health Ring
//          
//          0x00 = Unowned
//          All others Level. (0x11 = 17)
function healthRingItemLevel() => byte(0x55EB23)

// $55EB24: (8-bit) Item Unlock: Fire Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function fireCharmItemOwned() => byte(0x55EB24)

// $55EB25: (8-bit) Item Unlock: Lightning Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function lightningCharmItemOwned() => byte(0x55EB25)

// $55EB26: (8-bit) Item Unlock: Ice Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function iceCharmItemOwned() => byte(0x55EB26)

// $55EB27: (8-bit) Item Unlock: Dark Charm
//          
//          0x00 = Unowned
//          0x01 = Owned
function darkCharmItemOwned() => byte(0x55EB27)

// $55EB28: (8-bit) Item Unlock: Fury Quencher
//          0x00 = Unowned
//          0x01 = Owned
function furyQuencherItemOwned() => byte(0x55EB28)

// $55EB29: (8-bit) Item Unlock: Shield Crusher
//          
//          0x00 = Unowned
//          0x01 = Owned
function shieldCrusherItemOwned() => byte(0x55EB29)

// $55EB2A: (8-bit) Item Unlock: Awakening Vial
//          
//          0x00 = Unowned
//          0x01 = Owned
function awakeningVialItemOwned() => byte(0x55EB2A)

// $55EB2B: (8-bit) Item Unlock: Sage Hairpin
//          
//          0x00 = Unowned
//          0x01 = Owned
function sageHairpinItemOwned() => byte(0x55EB2B)

// $55EB2C: (8-bit) Item Unlock: Rally Pipe
//          
//          0x00 = Unowned
//          0x01 = Owned
function rallyPipeItemOwned() => byte(0x55EB2C)

// $55EB2D: (8-bit) Item Unlock: Fury Soul
//          
//          0x00 = Unowned
//          0x01 = Owned
function furySoulItemOwned() => byte(0x55EB2D)

// $55EB2E: (8-bit) Item Unlock: Saddle of the Whirlwind
//          
//          0x00 = Unowned
//          0x01 = Owned
function saddleWhirlwindItemOwned() => byte(0x55EB2E)

// $55EB2F: (8-bit) Item Unlock: Hourglass of Fate
//          
//          0x00 = Unowned
//          0x01 = Owned
function hourglassofFateItemOwned() => byte(0x55EB2F)

// $55EB30: (8-bit) Item Unlock: Ground Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function groundKillerGauntletItemOwned() => byte(0x55EB30)

// $55EB31: (8-bit) Item Unlock: Air Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function airKillerGauntletItemOwned() => byte(0x55EB31)

// $55EB32: (8-bit) Item Unlock: Flame Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function flakeKillerGauntlerItemOwned() => byte(0x55EB32)

// $55EB33: (8-bit) Item Unlock: Shadow Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function shadowKillerGauntletItemOwned() => byte(0x55EB33)

// $55EB34: (8-bit) Item Unlock: Machine Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function machineKillerGauntletItemOwned() => byte(0x55EB34)

// $55EB35: (8-bit) Item Unlock: Iron Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function ironKillerGauntletItemOwned() => byte(0x55EB35)

// $55EB36: (8-bit) Item Unlock: Wood Killer Gauntlets
//          
//          0x00 = Unowned
//          0x01 = Owned
function woodKillerGauntletItemOwned() => byte(0x55EB36)

// $55EB37: (8-bit) Item Unlock: Parchment of Infamy
//          
//          0x00 = Unowned
//          0x01 = Owned
function parchmentInfamyItemOwned() => byte(0x55EB37)

// $55EB38: (8-bit) Item Unlock: Disciplinarian Paddle
//          
//          0x00 = Unowned
//          0x01 = Owned
function disciplinarianPaddleItemOwned() => byte(0x55EB38)

// $55EB39: (8-bit) Item Unlock: Bronze Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function bronzeAwardItemOwned() => byte(0x55EB39)

// $55EB3A: (8-bit) Item Unlock: Silver Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function silverAwardItemOwned() => byte(0x55EB3A)

// $55EB3B: (8-bit) Item Unlock: Gold Award
//          
//          0x00 = Unowned
//          0x01 = Owned
function goldAwardItemOwned() => byte(0x55EB3B)

// $55EB3C: (8-bit) Item Unlock: Headdress of the Minotaur
//          
//          0x00 = Unowned
//          0x01 = Owned
function headdressofTheMinotaurItemOwned() => byte(0x55EB3C)

// $55EB3D: (8-bit) Item Unlock: Wheel of Gale - I
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIItemOwned() => byte(0x55EB3D)

// $55EB3E: (8-bit) Item Unlock: Wheel of Gale - II
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIIItemOwned() => byte(0x55EB3E)

// $55EB3F: (8-bit) Item Unlock: Wheel of Gale - III
//          
//          0x00 = Unowned
//          0x01 = Owned
function wheelofGaleIIIItemOwned() => byte(0x55EB3F)

// $55EB40: (8-bit) Item Unlock: Hilt of Reflection
//          
//          0x00 = Unowned
//          0x01 = Owned
function hitlReflectionItemOwned() => byte(0x55EB40)

// $55EB41: (8-bit) Item Unlock: Face of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function faceBerserkerItemOwned() => byte(0x55EB41)

// $55EB42: (8-bit) Item Unlock: Skull of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function skullBerserkerItemOwned() => byte(0x55EB42)

// $55EB43: (8-bit) Item Unlock: Eyes of the Berserker
//          
//          0x00 = Unowned
//          0x01 = Owned
function eyeofBerserkerItemOwned() => byte(0x55EB43)

// $55EB44: (8-bit) Item Unlock:  Power Shot
//          
//          0x00 = Unowned
//          0x01 = Owned
function powerShotItemOwned() => byte(0x55EB44)

// $55EB45: (8-bit) Item Unlock: Bounty Chest - I
//          
//          0x00 = Unowned
//          0x01 = Owned
function bountyChestIItemOwned() => byte(0x55EB45)

// $55EB46: (8-bit) Item Unlock: Bounty Chest - II
//          
//          0x00 = Unowned
//          0x01 = Owned
function bountyChestIIItemOwned() => byte(0x55EB46)

// $55EB6F: (8-bit) Item Unlock: Warrior's Code - Honor
//          
//          0x00 = Unowned
//          0x01 = Owned
function warriorsCodeHonorItemOwned() => byte(0x55EB6F)

// $55EB70: (16-bit Bitfield)Character Unlocks
//          
//          bit 0 = Devil King
//          bit 1 = Azure Dragon
//          bit 2 = Scorpio
//          bit 3 = Venus
//          bit 4 = Lady Butterfly
//          bit 5 = Red Minotaur
//          bit 6 = Frost
//          bit 7 = Talon
//          bit 8 = Hornet
//          bit 9 = Puff
//          bit 10= Q-Ball
//          bit 11 = Iron Ox
function characterUnlocksFirst() => word(0x55EB70)

// $55EB71: (16-bit Bitfield)Character Unlocks
//          
//          bit 0 = Hornet
//          bit 1 = Puff
//          bit 2= Q-Ball
//          bit 3 = Iron Ox
function characterUnlocksSecond() => word(0x55EB71)

// $55EB74: (8-bit) Stage Unlock
//          
//          Bit 0 = Ruse at River Glen (Red Minotaur
//          Bit 1 = Arctica Rebellion (Puff)
//          Bit 2 = Siege of Dark Spire (Orwik)
//          Bit 3 = Assault on Bloomdale (Frost)
//          Bit 4 = Flooding Giuthas Nam (Kahz)
//          Bit 5 = Leveling Kush(Zaan)
//          Bit 6 = Storm of the Great Plains (Irdene)
//          Bit 7 = Landing at Nanvia (Arslan)
function stageUnlockfirst() => byte(0x55EB74)

// $55EB75: (8-bit) Stage Unlock
//          
//          Bit 0 = Fall of the High Temple (Devil King)
//          Bit 1 = Chase at the Tablelands (Azure Dragon)
//          Bit 2 = Twisted High Temple (Reaper)
//          Bit 3 = Dead Wood Offensive (Red Minotaur)
//          Bit 4 = Ambush at Shadow Gorge (Muri)
//          Bit 5 = Divide & Conquer Faylinn (Lark)
//          Bit 6 = Pilgrimage to Cathedral City (Q-Ball)
//          Bit 7 = Crossing the River Styx (Reaper)
function stageUnlockSecond() => byte(0x55EB75)

// $55EB76: (8-bit) Stage Unlock
//          
//          Bit 0 = Border Control
//          Bit 1 = Battle at Riverglen(Frost)
function stageUnlockThird() => byte(0x55EB76)

// $55EBDC: (35-bit bitfield) Music Unlocks
function musicUnlocks() => byte(0x55EBDC)

// $55EBE4: (28-bit bitfield) Movie Unlocks
//          
//          Not listing them all 0x01 = unlocked 0x00 = locked.
//          
//          Starts with Game Opening (always unlocked) and ends with Credits (Always unlocked?)
function movieUnlocks() => byte(0x55EBE4)

// $55EFE4: (8-bit) Expected Lark In Game Level
function ingameFirstSaveFileLark() => byte(0x55EFE4)

// $55F3FC: (8-bit) In game/Between levels  Scorpio level.
function ingameSecondSaveFileScorpio() => byte(0x55F3FC)

// $55F41E: (8-bit) Scorpio's First Equipped Item
function inGameScorpioEquippedItem() => byte(0x55F41E)

// $55F608: (8-bit) Devil King's In-Game Level.
//          
//          Note this doesn't change when you change your character.  Choosing Azure Dragon leaves this value as the Devil King's
function inGamedevilKingInGameLevel() => byte(0x55F608)

// $55F613: (Array of 6 8-bit) Weapon Level for each of the six weapons.
//          
//          0x00 = Not owend
//          0x01 = Level 1 and every level matches that.
function inGameweaponlevelDevilKing() => byte(0x55F613)

// $55F626: (8-bit) In Game Devil King's First (Square) Special skill
//          
//          0xff = None
//          0x00 = Devil King's first  (Whiplash)
//          0x01 = Devil King's Second Skill (Thornbush)
function inGameDevilKingFirstSpecial() => byte(0x55F626)

// $55F627: (8-bit) In Game Devil King's Second (Triangle) Special skill
//          
//          0xff = None
//          0x00 = Devil King's first  (Whiplash)
//          0x01 = Devil King's Second Skill (Thornbush)
function inGameDevilKingSecondSpecialSkill() => byte(0x55F627)

// $55F628: (8-bit) In Game, Devil King's Current Equipped Weapon Index
function inGameDevilKingWeaponIndex() => byte(0x55F628)

// $55F629: (8-bit) In Game, Devil King's Current Equipped Weapon Level.
function inGameDevilKingCurrentWeaponLevel() => byte(0x55F629)

// $55F62A: (8-bit) Devil King's First Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingFirstEquippedItem() => byte(0x55F62A)

// $55F62B: (8-bit) Devil King's Second Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingSecondEquippedItem() => byte(0x55F62B)

// $55F62C: (8-bit) Devil King's Third Equipped Item
//          
//          0xff = None
//          0x00 = Health Ring and then increments from there.
function inGameDevilKingThirdEquippedItem() => byte(0x55F62C)

// $5610E8: (24-bitfield) Stage Unlocks in the front end
//          
//          See 0x0055eb74.  This is just the value once in the front end.
function stageUnlocksFrontEnd() => byte(0x5610E8)

// $563B3A: (8-bit) Level ID for current stage
//          
//          0x00 = Ruse at Riverglen
//          0x01 = Arctic Rebellion
//          0x02 = Siege of Dark Spire
//          0x03 = Assault on Bloomdale
//          0x04 = Flooding Giuthas Nam
//          0x05 = Leveling Kush
//          0x06 = Storm of the Great Plain
//          0x07 = Landing at Nanvia
//          0x08 = Fall of the High Temple
//          0x09 = Chase at the Tablelands
//          0x0a = Twisted High Temple
//          0x0b = Deadwood Counteroffensive
//          0x0c = Ambush at Shadow Gorge
//          0x0d = Divide and Conquer Faylinn\
//          0x0e = Pilgrimage to Cathedral City
//          0x0f = Crossing the River Styx
//          0x10 = Border Patrol
//          0x11 = Battle at Riverglen
function levelID() => byte(0x563B3A)

// $563C54: (8-bit) Screen states.
//          
//          Appears to be progression.
//          
//          0x00 = System start up
//          0x03 = Capcom logo
//          0x04 = Press start screen and main menu, demo mode.
//          0x05 = Character select Screen
//          0x06 = Road to Conquest (map screen)
//          0x07 = Prepare Screen
//          0x08 = In Game
//          0x09 = Spoils of War  and Battle Results
//          0x0a = Total Conquest screen Total Conquest Results)  Post Conquest Mode movie  Credits
//          0x0c = Load/save screen on boot up or post game/ Post Conquest.
function screenState() => byte(0x563C54)

// $563C74: (8-bit) Current player.
//          
//          0x00 = Lark
//          0x01 = Azure Dragon
//          0x02 = Scorpio
//          0x03 = Devil King
//          0x04 = Lady Butterfly
//          0x05 = Red Minotaur
//          0x06 = Frost
//          0x07 = Horne
//          0x08 = Puff
//          0x09 = Talon
//          0x0b = Q-Ball
//          0x0d = Iron OX
//          
//          
//          Note some more characters exist but they aren't real characters.  ZAAN works but turns the menus Japanese?
//          0x0a = Reaper
//          0x0c = Zaan
//          0x0e = Bramblet
//          0x0f = Venus
//          0x10 Reports Orwik, but crashes.
function currentPlayerId() => byte(0x563C74)

// $17C844C: (32-bit) Player's Health
//           
//           Can't be larger than 0x017c8454
//           
//           0x00000000 = Dead
function playerHealth() => dword(0x17C844C)

// $17C8616: (32-bit) Frames spent in the current level
//           
//           60 fps
function frameeInLevel() => dword(0x17C8616)

// $17C93A4: (32-bit) Total Hit Counter  (Combo)
//           
//           This is the true value.
function totalHitCounter() => dword(0x17C93A4)

// $17C93E4: (32-bit)  Fury Drive Level (Musou Level)
//           
//           Likely when you reach 0x017c93ec you can trigger your musou.
function furyDriveLevel() => dword(0x17C93E4)

// $1D94678: (8-bit) Guard Durability in Border control
//           
//           0x00 = Death.
//           0x64 (100) = Max
function guardDurabilityBorderControl() => byte(0x1D94678)

// $1DA8C95: (8-bit) Red Minotaur's Cavalry Ally Strength
//           
//           This is for the mini game for the Red Minotaur's Cavalry in the charge.
function calvaalryStrengthRedMinotaur() => byte(0x1DA8C95)

// $1DCC094: (8-bit) Special Bonus for each level.
//           
//           After certain levels if this is 0x01  It means you get a bonus (5k)   If it's 0 it means you missed it.
//           Use 32-bit because it's better to look at all four vaaues.
//           
//           0X00 = Not earned.
//           0x01 = Earned.
//           
//           NOTE: NOT ALL LEVELS HAVE A SPECIAL
//           
//           
//           
//           Ruse at Riverglen = Killed all of the Messengers
//           Arctic Rebellion = N/A
//           Siege of Dark Spire = Blew the Gate Up
//           Assault on Bloomdale = N/A
//           Flooding Giuthas Nam = N/A
//           Leveling Kush = Lured out Zaan (killed 16 guards?)
//           Storm of the Great Plain = Defeated Iron Ox
//           Landing at Nanvia = Kill Gun Captain
//           Fall of the High Temple = Defeated All of the Guard Captains
//           Chase at the Tablelands = Defeated Azure Dragon before he Reached His stronghold
//           Twisted High Temple = Defeated all of the Guard Captains
//           Deadwood Counteroffensive = Defeated Scorpio and Talon
//           Ambush at Shadow Gorge = N/A
//           Divide and Conquer Faylinn = Prevented Lark and Bramble from Joining Forces
//           Pilgrimage to Cathedral City = N/A
//           Crossing the River Styx = Prevented Reaper from forming his line at Devil's Point
//           Border Patrol = Defeated All of the Guard Captains
//           Battle at Riverglen = Defeated Venus
//           
//           
//           Not all levels have special bonuses.  Ambush ant Shadow Gorge doesn't
function specialBonusforLevel() => dword_be(0x1DCC094)

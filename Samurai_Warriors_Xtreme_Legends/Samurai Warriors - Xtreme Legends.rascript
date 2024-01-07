// Samurai Warriors - Xtreme Legends
// #ID = 20790

// $4F8530: (32-bit) Pointer to First Player information
//          
//          May be duplicated by 0x51c498, 0x69ecb0, check those if this proves untrue.
//          
//          +0x0270=(16-bit signed) First Player's max HP divided by 10.  Note, thie second byte may not be exact, but does contribute to the MAX
//          +0x0272=(16-bit signed)First Player's HP
//          +0x0276=(16-bit signed) First Player's max MP divided by 10.  Note, thie second byte may not be exact, but does contribute to the MAX
//          +0x0276=(16-bit signed)First Player's MP (Musou Power)
function pointerToFirstPlayerObject() => word(0x4F8530)

// $4F8585: (8-bit) Second Player Controller Control
//          
//          0x00= Player one controls the second player
//          0x01 = Second player's inputs accepted
function secondPlayerController() => byte(0x4F8585)

// $4F8586: (8-bit) Second Player animation Control
//          
//          0x00= Player one controls the second player
//          0x01 = Second player's animation is frozen.
function secondPlayerAnimation() => byte(0x4F8586)

// $4FF7E4: (352-bit) Yukimura Sanada's stats
//          
//          11 Stats 32 bits a piece. Note most of these won't be larger than 255. Order
//          
//          Life
//          Musou
//          Attack
//          Defense
//          Ranged Attack
//          Ranged Defense
//          Horse Attack
//          Horse Defense
//          Agility
//          Jump
//          Speed
//          
//          Note those last three are reversed on the character screen.  Be aware.
function arrayOfCharacterStats() => dword(0x4FF7E4)

// $4FF822: (40-bit) Yukimura's equip array.
//          
//          0x00 = Solar Gem
//          0x01 = Moon Stone
//          0x02 = Power Bracer
//          0x03 = Himiko's Rune
//          0x04 = Vixen Tail
//          0x05 = Tengu Sandals
//          0x06 = Hare Greaves
//          0x07 = Kappa Amulet
//          0x08 = Wind Gloves
//          0x09 = Cloak of Might
//          0x0A = Demon Staff
//          0x0B = Serpent Bracer
//          0x0C = Saddle
//          0x0D = Arabian Saddle
//          0x0E = Matsukaze Saddle
//          0x0F = Horse Armor
//          0x10 = Warrior's Tale
//          0x11 = Battle Drum
//          0x12 = Gold Incense
//          0x13 = War Rations
//          0x14 = Guiding Doll
//          0x15 = Healing Balm
//          0x16 = Hachiman Bell
//          0x17 = Lantern
//          0x18 = Element Rune
//          0x19 = Ninja Suit
//          0x1A = The Kage Scroll
//          0x1B = War Baton
//          0x1C = Book of Healing
//          0x1D = Shield Wall
//          0x1E = Golden Rune
//          0x1F = Book of Earth
//          0x20 = Book of Water
//          0x21 = Book of Fire
//          0x22 = Book of Wind
//          0x23 = Book of Air
//          0x24 = no item.
function yukimura items() => byte(0x4FF822)

// $4FF827: (384-bit) Yukimura's Skills.
//          
//          Exact values not determined (But available when looking at his screen.
//          
//          Note: He will NOT be able to purchase most of these abilities
//          
//          If a value only allows 0x01 that's the max value.  However if any additional purchases can be had, players can add up to 255 on the purchase screen.
//          
//          This 8-bit value for this one is 2x Jump (can only be bought once).  However it allows Yukimura to jump twice. Even though his character model doesn't have an animation for it.
function yukimurasStoredSkills() => byte(0x4FF827)

// $4FF857: (8-bit) Yukimura's Stored Level
function yukimurasStoredLevel() => byte(0x4FF857)

// $4FF89E: (40-bit) Keiji's Maeda's equipped items
function keijiMaedaItems() => byte(0x4FF89E)

// $500155: (8-bit) Musket for New Officer 1
//          
//          Given by Magouchi
function newOfficerMusketSkill() => byte(0x500155)

// $500156: (40-bit)Array of weapons for first New Officer
function newOfficerArrayWeaponsFirstOfficer() => byte(0x500156)

// $50015E: (8-bit) Frenzy Skill for New Officer 1
//          
//          Given by Ranmaru
function newOfficerFrenzySkill() => byte(0x50015E)

// $50015F: (8-Bit) Reach for New Officer 1
//          
//          Given by Keiji Maeda
function newOfficerReachSkill() => byte(0x50015F)

// $500160: (8-bit) Rage skill for New Officer 1
//          
//          Date Masamune gives you the skill
function newOfficerRageSkill() => byte(0x500160)

// $500166: (8-bit) Drive skill for New Officer.
//          
//          Given by Okuni
function newOfficerDriveSkill() => byte(0x500166)

// $500169: (8-bit) Focus skill for New Officer 1
//          
//          Kunoichi gives you the ability.
function newOfficerFocusSkill() => byte(0x500169)

// $50016A: (8-bit) Forttitude Skill for New Officer 1
//          
//          Dokkimaru gives yyou this
function newOfficerFortitudeSkill() => byte(0x50016A)

// $50016B: (8-bit) New Officer's Discern skill
//          
//          Goemon  gives this.
function newOfficerDiscernSkill() => byte(0x50016B)

// $5001D2: (40-bit)Array of weapons for second New Officer
function newOfficerArrayWeaponsSecondOfficer() => byte(0x5001D2)

// $50125C: (8-bit) Solar Gem Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Life Power
//          
//          See 0x0050134e for the unlock array
function solarGemPower() => byte(0x50125C)

// $50125D: (8-bit) Moon Stone Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Musou Power
//          
//          See 0x0050134e for the unlock array
function moonStonePower() => byte(0x50125D)

// $50125E: (8-bit) Power Bracer Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Attack
//          
//          See 0x0050134e for the unlock array
function powerBracerPower() => byte(0x50125E)

// $50125F: (8-bit) Himko's Rune Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Defense Power
//          
//          See 0x0050134e for the unlock array
function himikoRunePower() => byte(0x50125F)

// $501260: (8-bit) Vixen Tail Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Musou Charge Power
//          
//          See 0x0050134e for the unlock array
function vixenTailPower() => byte(0x501260)

// $501261: (8-bit) Tengu Sandals Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Speed Power
//          
//          See 0x0050134e for the unlock array
function tenguSandalsPower() => byte(0x501261)

// $501262: (8-bit) Hare Greavs Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Jump Power
//          
//          See 0x0050134e for the unlock array
function hareGreavesPower() => byte(0x501262)

// $501263: (8-bit) Kappa Amulet Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Luck Power
//          
//          See 0x0050134e for the unlock array
function kappaAmuletPower() => byte(0x501263)

// $501264: (8-bit) Wind Gloves Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Ranged Attack Power
//          
//          See 0x0050134e for the unlock array
function windGlovesPower() => byte(0x501264)

// $501265: (8-bit) Cloak of Might Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Ranged Defense Power
//          
//          See 0x0050134e for the unlock array
function cloakOfMightPower() => byte(0x501265)

// $501266: (8-bit) Demon Staff Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Attack Power
//          
//          See 0x0050134e for the unlock array
function demonStaffPower() => byte(0x501266)

// $501267: (8-bit) Serpent Bracer Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Defense Power
//          
//          See 0x0050134e for the unlock array
function serpentBracerPower() => byte(0x501267)

// $501268: (8-bit) Saddle Item Power
//          
//          Does not appear to unlock the item, but once unlocked shows the Horse Power Power (Called just Power, assuming it's horse power)
//          
//          See 0x0050134e for the unlock array
function saddlePower() => byte(0x501268)

// $50134E: (8-bit)(Bitfield)  Item Owned Bitfield (1 of 5)
//          
//          Bit 0=Solar Gem
//          Bit 1=Moon Stone
//          Bit 2=Power Bracer
//          Bit 3=Himiko's Rune
//          Bit 4=Vixen Tail
//          Bit 5=Tengu Sandals
//          Bit 6=Hare Greaves
//          Bit 7=Kappa Amulet
function itemOwnedBitfield1() => byte(0x50134E)

// $50134F: (8-bit)(Bitfield) Item Owned Bitfield (2 of 5)
//          
//          Bit 0=Wind Gloves
//          Bit 1=Cloak of Might
//          Bit 2=Demon Staff
//          Bit 3=Serpent Bracer
//          Bit 4=Saddle
//          Bit 5=Arabian Saddle
//          Bit 6=Matsukaze Saddle
//          Bit 7=Horse Armor
function itemOwnedBitfield2() => byte(0x50134F)

// $501350: (8-bit)(Bitfield) Item Owned Bitfield (3 of 5)
//          
//          Bit 0=Warrior's Tale
//          Bit 1=Battle Drum
//          Bit 2=Gold Incense
//          Bit 3=War Rations
//          Bit 4=Guiding Doll
//          Bit 5=Healing Balm
//          Bit 6=Hachiman Bell
//          Bit 7=Lantern
function itemOwnedBitfield3() => byte(0x501350)

// $501351: (8-bit)(Bitfield) Item Owned Bitfield (4 of 5)
//          
//          Bit 0=Element Rune
//          Bit 1=Ninja Suit
//          Bit 2=The Kage Scroll
//          Bit 3=War Baton
//          Bit 4=Book of Healing
//          Bit 5=Sheild Wall
//          Bit 6=Golden Rune
//          Bit 7=Book of Earth
function itemOwnedBitfield4() => byte(0x501351)

// $501352: (8-bit)(Bitfield) Item Owned Bitfield (5 of 5)
//          
//          Bit 0=Book of Water
//          Bit 1=Book of Fire
//          Bit 2=Book of Wind
//          Bit 3=Book of Air
//          
//          Other values are not used.
function itemOwnedBitfield5() => byte(0x501352)


// Samurai Warriors - Xtreme Legends
// #ID = 20790

// $5015F8: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's The Battle of Anegawa
//          
//          bit0 = Showdown begins
//          bit1 = Wave Attack
//          bit2 = Wind
//          bit3 = Forest
//          bit4 = Fire
//          bit5 = Mountain
function completeKenshinBattleOfAnegawa() => byte(0x5015F8)

// $5015FC: (8-bit)(bitfield) Completed Missions for Oichi's The Battle of Anegawa
//          
//          bit0 = Engage the Enemy
//          bit1 = Keiji's Dance
//          bit2 = Sister-In-Law
//          bit3 = Three Mino Generals
//          bit4 = Brother and Sister
function completeOichiBattleOfAnegawa() => byte(0x5015FC)

// $501600: (8-bit)(bitfield) Completed Missions for Magoichi Saika's The Battle of Echizen
//          
//          bit0 = Salvation or Destruction
//          bit1 = Target: Mitsuhide
//          bit2 = Flee
//          bit3 = Predator or Prey
//          bit4 = Dance with the Shadow
//          bit5 = The Second Shot
//          bit6 = Go if you want
//          bit7 = Talent
function compelteMagioichiBattleOfEchizen() => byte(0x501600)

// $501604: (8-bit)(bitfield) Completed Missions for Noh's The Battle of Anegawa
//          
//          see 0x00501604
//          
//          bit0 = Vanguard
//          bit1 = Asakura's Fall
//          bit2 = Keiji's Stand
//          bit3 = Stronghold Defense
//          bit4 = Side Attack
//          bit5 = The Weak and the Strong
//          bit6 = Tearful Revolution
function completeNohBattleOfAnegawa() => byte(0x501604)

// $501608: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's The Battle of Anegawa
//          
//          bit0 = Regroup
//          bit1 = Masamune's Assault
//          bit2 = Protect the Middle
//          bit3 = Unseen Foe
//          bit4 = Query
//          bit5 = Doubt
//          bit6 = Sorrow
function completeRanmaruBattleOfAnegawa() => byte(0x501608)

// $50160C: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba Retreat at Kanegasaki
//          
//          bit0 = Rain of Fire
//          bit1 = Crossing Bridges
//          bit2 = Friends for now
//          bit3 = Retreat to Victory
//          bit4 = Monkey Business
//          bit5 = Ready, Aim Fire
//          bit6 = Against the Wall
function completeHideyoshiRetreatAtKanegasaki() => byte(0x50160C)

// $501610: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's Retreat at Kanegasaki
//          
//          bit0 = Licking One's Wounds
//          bit1 = The Japanese Zhang Fei
//          bit2 = Roar of the Rat
//          bit3 = Lending a Hand
//          bit4 = Reckless
//          bit5 = Carelessness Ahead
//          bit6 = Running Earnestly
function completeTadakatsuRetreatAtKanegasaki() => byte(0x501610)

// $501614: (8-bit)(bitfield) Completed Missions Ina's Retreat at Kanegasaki
//          
//          
//          bit0 = Cuts Like a Sharp Knife
//          bit1 = Look Where You're go
//          bit2 = In a PIncer
//          bit3 = Fear of Ambush
//          bit4 = Reversal of Fortune
//          bit5 = A Way Out
function completeInaRetreateAtKanegasaki() => byte(0x501614)

// $501618: (8-bit)(bitfield) Completed Missions for Keiji Maeda's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = Surrender
//          bit6 = Life is Power
//          bit7 = Peasant's Escape
function completeKeijiBattleOfIse() => byte(0x501618)

// $50161C: (8-bit)(bitfield) Complete Missions for Nobunaga Oda's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = No Surrender
//          bit6 = Destroy and Create
function completeNobunagaBattleOfIse() => byte(0x50161C)

// $501620: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = Surrender
//          bit6 = Life is Power
//          bit7 = Pesants' Escape
function completeMitsuhideBattleOfISe() => byte(0x501620)

// $501624: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Crossing Iga
//          
//          bit0 = Stop Ieyasu
//          bit1 = Fake Trap
//          bit2 = Which is the Decoy?
//          bit3 = The Real Trap
//          bit4 = No Escape
//          bit5 = Lonely Guy
//          bit6 = The Real Shadow
function completeGoemonCrossingIga() => byte(0x501624)

// $501628: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Ise
//          
//          bit0 = One Mind, One Body
//          bit1 = No one passes
//          bit2 = Brat in the Way
//          bit3 = !! UNUSED !!
//          bit4 = Thinking Ahead
//          bit5 = Greatest Obstacle
function completeDanceofIse() => byte(0x501628)

// $50162C: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Kyoto
//          
//          bit0 = One Mind, One Body
//          bit1 = !! UNUSED !!
//          bit2 = Beauty in the Way
//          bit3 = Ranmaru, my Love
//          bit4 = Thinking Ahead
//          bit5 = Mitsuhide, my Love
//          bit6 = Greatest Obstacle
//          bit7= Hanzo, my Love
function completeOkuniDanceOfKyoto() => byte(0x50162C)

// $501630: (8-bit)(bitfield) Completed Missions for Magoichi Saika's The Battle of Ise
//          
//          bit0 = Cannon
//          bit1 = Barrage
//          bit2 = Escort
//          bit3 = Retreat
//          bit4 = Safety
//          bit5 = The Preview
function completeMagoichiBattleofIse() => byte(0x501630)

// $501634: (16-bit)(bitfield) Completed Missions for Masamune Date's Ise Campaign
//          
//          bit0 = Ikko Fortress
//          bit1 = Oda Army
//          bit2 = Monks
//          bit3 = Magoichi's Arrival
//          bit4 = Elimination!
//          bit5 = Silence the Cannons
//          bit6 = Foil the Fire Attack
//          bit7 = Nobunaga must fall
//          bit8 = Peasants approaching
//          
//          Note it's one bit in the next byte.
function completeMasaumeIseCampaign() => word(0x501634)

// $501638: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Crossing Iga
//          
//          bit0 = Escape Route
//          bit1 = All for One
//          bit2 = Lure
//          bit3 = Obedience
//          bit4 = Subterfuge
//          bit5 = Beckoning
//          bit6 = Compatriots
function completeHanzoCrossingIga() => byte(0x501638)

// $50163C: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's The Battle of Ise
//          
//          bit0 = Ready Fire Attack
//          bit1 = Ready Cannons
//          bit2 = Rekindling
//          bit3 = Fire Ploy
//          bit4 = Occupation
//          bit5 = No Surrender
//          bit6 = Destroy and Create
function completeRanmaruBattleOfIse() => byte(0x50163C)

// $501640: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's Crossing Iga
//          
//          bit0 = Guiding the Guide
//          bit1 = Shadow Warrior
//          bit2 = Regrouping
//          bit3 = Calm Closing
//          bit4 = Welcome Home
//          bit5 = Rear Guard
//          bit6 = Lord Hunting
function completeTadakatsuCrossingIge() => byte(0x501640)

// $501644: (8-bit)(bitfield) Completed Missions for Ina's Crossing Iga
//          
//          bit0 = Shadowing the Shadow Warrior
//          bit1 = Here's the Shadow Warrior
//          bit2 = Shooting Gallery
//          bit3 = Blood Boiling
//          bit4 = Merge Ahead
//          bit5 = All's Well
//          bit6 = Drastic Measures
//          bit7 = Crimson Sea
function completeInaCrossingIga() => byte(0x501644)

// $501648: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba The battle of Komaki-Nagakute
//          
//          bit0 = A Castle Amidst the Chaos
//          bit1 = The Unparalleled Warrior
//          bit2 = Two Brothers for the Ages
//          bit3 = The Time is Now
//          bit4 = The Long Road to Peace
//          bit5 = History Repeats Itself
//          bit6 = The Enemy Moves
//          bit7 = Penetrating the Shadows
function completeHideyoshiTheBattleOfKomakiNagaku() => byte(0x501648)

// $50164C: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Komaki- Nagakute
//          
//          bit0 = The Castle Falls Today
//          bit1 = Lambs to the Slaughter
//          bit2 = Death will Find You
//          bit3 = The Four Guardians Attack
//          bit4 = On to Komakiyama
//          bit5 = The Mysterious Komakiyama Castle
//          bit6 = The End is Near
function completeYoshimotoBattleOfKomaki() => byte(0x50164C)

// $501650: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Komaki-Nagakute
//          
//          Check 0x00501650 for completed and values
//          
//          bit0 = Strategic Location
//          bit1 = That's the Way
//          bit2 = Weak Eaten by the Strong
//          bit3 = The Meaning of Endurance
//          bit4 = Justice in a Nutshell
//          bit5 = Winner Takes All
//          bit6 = Pincher in Pursuit
//          bit7 = Hanging Out to Dry
function completeTadakatsuBattleOfKomaki() => byte(0x501650)

// $501654: (16-bit)(bitfield) Completed Missions for Ina's The Battle of Komaki-Nagakute
//          
//          bit0 = Breakwater
//          bit1 = The Winning Move
//          bit2 = One Keiji Villian
//          bit3 = Kessen
//          bit4 = Duel to the Death
//          bit5 = Supporting Cast
//          bit6 = Got Guts?
//          bit7 = Strategist Vs Tactician
//          bit8 = Tadakatsu Honda the Man
//          bit9 = Nobukatsu Oda the Man
function completeInaBattleOfKomaki() => word(0x501654)

// $501658: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Okehazama
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeNobunagaBattleofOkehazama() => byte(0x501658)

// $50165C: (8-bit)(bitfield) Completed Missions for Oichi's The Battle of Okehazama
//          
//          Check 0x0050165c for completed and values
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeOichiBattleOfOkehazama() => byte(0x50165C)

// $501660: (8-bit)(bitfield) Completed Missions for Masamune Date's Okehazama Campaign
//          
//          bit0 = Get Yoshimoto
//          bit1 = Get Nobunaga
//          bit2 = Ambition
//          bit3 = Ieyasu flees
//          bit4 = Surpass Nobunaga!
//          bit5 = Sister
//          bit6 = Whirlwind
function completeMasaumeOkehazamaCampaign() => byte(0x501660)

// $501664: (8-bit)(bitfield) Completed Missions for Noh's The Battle of Okehazama
//          
//          bit0 = Smokescreen
//          bit1 = Help Hideyoshi
//          bit2 = Lightning Battle
//          bit3 = Storm Warning
//          bit4 = Old Friend
//          bit5 = All will be Mine
//          bit6 = The Imagawa
//          bit7 = Faster than Shadow
function completeNohBattleOfOkehazama() => byte(0x501664)

// $501668: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's The Battle of Okehazama
//          
//          Check 0x00501668 for completed and values
//          
//          bit0 = Fly
//          bit1 = Narumi Castle
//          bit2 = Seal
//          bit3 = Master's Peril
//          bit4 = Finale
//          bit5 = Obliteration
//          bit6 = Shadow Path
function completeHanzoBattleOfOkehazama() => byte(0x501668)

// $50166C: (8-bit)(bitfield) Completed Missions for New Officer's The Battle of Okehazama
//          
//          bit0 = Advance Force
//          bit1 = Protect Me!
//          bit2 = Ieyasu's Doubt
//          bit3 = Next Assailant
//          bit4 = No Escape
//          bit5 = Momentum
//          bit6 = Viper's Fangs
function completeNewOfficerBattleOfOkehazama() => byte(0x50166C)

// $501670: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Okehazama
//          
//          bit0 = To the Capital!
//          bit1 = Eagle Hunting
//          bit2 = The Underdog
//          bit3 = A Shadowy Attack
//          bit4 = The Demon and Me
function completeYoshimotoBattleOfOkehazama() => byte(0x501670)

// $501674: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Okehazama
//          
//          bit0 = Information War
//          bit1 = A Lord is..
//          bit2 = Governing the Land
//          bit3 = Lack of Foresight
//          bit4 = A Troubled Future
//          bit5 = The Main Camp In Danger
//          bit6 = Forget about Appearances
function completeTadakatsuBattleOfOkehazama() => byte(0x501674)

// $501678: (16-bit)(bitfield) Completed Missions for Yukimura's The Battle of Kaawanakajima
//          Correct value appears to be 0x197
//          
//          bit0 = Pincer
//          bit1 = Return to Camp
//          bit2 = Defend Kaizu
//          bit3 = !!UNUSED!!
//          bit4 = Kenshin
//          bit5 = !!UNUSED!!
//          bit6 = !!UNUSED!!
//          bit7 = Power
//          bit8 = Peril
//          
//          What a strange bitfield.
function completeYukimuraBattleOfKawankajima() => word(0x501678)

// $50167C: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Kawanakajima Challenge
//          
//          bit0 = The Great Keiji
//          bit1 = The Yukimura Kid
//          bit2 = Love is Blind
function completeKiejiKawanakajimaChallenge() => byte(0x50167C)

// $501680: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's The Battle of Kawanakajima
//          
//          bit0 = It's a Pincer!
//          bit1 = Occupy Kaizu
//          bit2 = Famed Contest
//          bit3 = The Pincer will Fail
//          bit4 = Prayers
//          bit5 = The tide must flow
//          bit6 = Flanked
//          bit7 = Parting Shot
function completeKenshinBattleOfKawanakajima() => byte(0x501680)

// $501684: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Kawanakajima Showdown
//          
//          bit0 = Hachimanbara
//          bit1 = Attack Kaizu
//          bit2 = Mt. Saijyo
//          bit3 = Zenkouji
//          bit4 = Stop Yukimura
//          bit5 = Retreat for now
//          bit6 = Last Charge
//          bit7 = Mt. Chausu
function completeKenshinKawanakajimaShowdown() => byte(0x501684)

// $501688: (16-bit)(bitfield) Completed Missions for Okuni's Dance of Kawanakima
//          
//          bit0 = Kawanakajima Dance
//          bit1 = Plea to Shingen
//          bit2 = Plea to Kenshin
//          bit3 = Rescue unit
//          bit4 = Shingen, my Love
//          bit5 = Destroy unit
//          bit6 = Kicked by Horse
//          bit7 = Kenshin, my Love
//          bit8 = Love's Retreat
//          bit9 = Three's a Crowd
//          bit10 = ???
//          bit11 = ???
function completeOkuniDanceOfKawanakima() => word(0x501688)

// $50168C: (16-bit)(bitfield) Completed Missions for Kuniochi's The Battle of Kawanakajima
//          
//          Correct value appears to be 0x1fd
//          
//          bit0 = Pincer
//          bit2 = Defend Kaizu
//          bit3 = Kunoichi's Flight
//          bit4 = Kenshin
//          bit5 = Sword and Fan
//          bit6 = Save Yukimura
//          bit7 = Power
//          bit8 = Peril
function completeKuniochiBattleOfKawanakajima() => word(0x50168C)

// $501690: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Kawanakajima
//          
//          bit0 = Night and Fog
//          bit1 = Defend the Camp
//          bit2 = Kenshin
//          bit3 = Tide has not changed
function completeShingenBattleOfKawankajima() => byte(0x501690)

// $501694: (16-bit)(bitfield) Completed Missions for Shingen Takeda's Kawanakjima Showdown
//          
//          bit0 = Cattle Wagon
//          bit1 = One-Eyed Dragon
//          bit2 = Creeping Shadow
//          bit3 = The Young Dragon strikes
//          bit4 = A good time for prayer
//          bit5 = Doom from the North
//          bit6 = Defeat the Shadow
//          bit7 = The Wild One
//          bit8 = Lone Charge
//          bit9 = Last Gamble
function completeShingenKawanakijimaShowdown() => word(0x501694)

// $501698: (8-bit)(bitfield) Completed Missions for Masamune Date's Kawanakjima Campaign
//          
//          bit0 = Prelude to the Hunt
//          bit1 = Old Tiger
//          bit2 = Tiger Hunt
//          bit3 = No reinforcements!
//          bit4 = The Expert Retreater
//          bit5 = The Dragon awaits
//          bit6 = Dragon Hunt
//          bit7 = Fake Pincer
function completeMasamuneKawanakjimaCampaign() => byte(0x501698)

// $50169C: (8-bit)(bitfield) Completed Missions for New Officer's The Battle of Kawanakajima
//          
//          bit0 = Night and Fog
//          bit1 = !!UNUSED!!
//          bit2 = Kenshin
//          bit3 = Tide has not changed
//          bit4 = Save Yukimura
function completeNewOfficerBattleOfKawanakajima() => byte(0x50169C)

// $5016A0: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's The Battle of Kawanakajjima
//          
//          bit0 = The Peacemaker
//          bit1 = The Truth is in the Fog
//          bit2 = Justice?
//          bit3 = Virtue?
//          bit4 = The Path to Righteousness
//          bit5 = Wicked Ways
//          bit6 = Firm Resistance
//          bit7 = Bonds of Evil
function completeYoshimotoBattleOfKawanakajima() => byte(0x5016A0)

// $5016A4: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The Battle of Kawanakajira
//          
//          bit0 = Hachimanbara
//          bit1 = Rescue Yasumasa Sakakibara
//          bit2 = Sneak the Sneak
//          bit3 = Somebody's Waiting
//          bit4 = Through Annihilation
//          bit5 = Uesugi on the Move
//          bit6 = A Time for Vengeance
//          bit7 = Waves of Anger
function completeTadakatsuBattleOfKawanakajira() => byte(0x5016A4)

// $5016A8: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Dance of Kyoto
//          
//          bit0 = Show of Force
//          bit1 = Between Men
//          bit2 = Celebrity
//          bit3 = Unwanteds
//          bit4 = Miscreants
//          bit5 = Go Away
//          bit6 = !!UNUSED!!
function completeKeijiDanceOfKyoto() => byte(0x5016A8)

// $5016AC: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's Betrayal at Honnouji
//          
//          bit0 = Sister
//          bit1 = Viper's Fangs
//          bit2 = Sacrifice
//          bit3 = Traitor
function completeNobunagaBetrayalAtHonnouji() => byte(0x5016AC)

// $5016B0: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's  Betrayal at Honnouji
//          
//          bit0 = Saying Goodbye
//          bit1 = Bellflower
//          bit2 = Promise to the Dead
//          bit3 = Innocence Lost
//          bit4 = The Enemy
function completeMitsuhideBetrayalAtHonnouji() => byte(0x5016B0)

// $5016B4: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Kyoto
//          
//          bit0 = Compete with Okuni
//          bit1 = Elusive, Part 1
//          bit2 = Elusive, Part 2
//          bit3 = Elusive, Part 3
//          bit4 = Elusive, Finale
//          bit5 = Uninvited Guests
//          bit6 = The Cycle ends
function completeGoemonDanceOfKyoto() => byte(0x5016B4)

// $5016B8: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Goemon the Wild
//          
//          bit0 = What's mine is mine
//          bit1 = Venting Anger
//          bit2 = Little Rat
//          bit3 = Help from my friends
//          bit4 = For Love
//          bit5 = Good Grief
function completeGoemonGoemonTheWild() => byte(0x5016B8)

// $5016BC: (8-bit)(bitfield) Completed Missions for Oichi's Betrayal at Honnouji
//          
//          bit0 = Fire Safety
//          bit1 = Brother!
//          bit2 = Not Expendable
//          bit3 = Brother and Wife
//          bit4 = Blood Feud
//          bit5 = Escape Southeast
//          bit6 = Escape Northeast
//          bit7 = Score to Settle
function completeOichiBetrayalAtHonnouji() => byte(0x5016BC)

// $5016C0: (16-bit)(bitfield) Completed Missions for Oichi's The Battle at Honnouji
//          
//          bit0 = Mitsuhide's Ambition
//          bit1 = Nagamasa's Effort
//          bit2 = Impatience
//          bit3 = Unrequited Love
//          bit4 = Monkey and Badger
//          bit5 = The Rivals
//          bit6 = Power Triangle
//          bit7 = The Badger
//          bit8 = I will stop you!
//          bit9 = Thank you and goodbye
function completeOichiBattleAtHonnouji() => word(0x5016C0)

// $5016C4: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Kyoto
//          
//          Should be 0x7e
//          
//          bit0 = !! UNUSED !!
//          bit1 = Elusive, Part 1
//          bit2 = Elusive, Part 2
//          bit3 = Elusive, Part 3
//          bit4 = Elusive, Finale
//          bit5 = Uninvited Guests
//          bit6 = The Cycle ends
function completeOkuniDanceAtKyoto() => byte(0x5016C4)

// $5016C8: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Skirmish at Kyoto
//          
//          bit0 = For Starters...
//          bit1 = One-Trick Pony
//          bit2 = The Third Shot
//          bit3 = Beginning of the End
//          bit4 = Farewell to Arms
function completeMagoichiSkirmishAtKyoto() => byte(0x5016C8)

// $5016CC: (8-bit)(bitfield) Completed Missions for Masamune Date's Attak on Honnouji
//          
//          bit0 = Endgame
//          bit1 = Ambition or Justice?
//          bit2 = Nobunaga's Trap
//          bit3 = Closure
//          bit4 = Rebellion
//          bit5 = Wavering Blade
//          bit6 = You cannot escape!
function completeMasamuneAttackOnHonnouji() => byte(0x5016CC)

// $5016D0: (8-bit)(bitfield) Completed Missions for Noh's Betrayal at Honnouji
//          
//          bit0 = Head for the Main Hall
//          bit1 = Black Widow
//          bit2 = Fiery Escape
//          bit3 = Tragedy continues
//          bit4 = Naivete
//          bit5 = Impatience brings Death
function completeNohBetrayalAtHonnouji() => byte(0x5016D0)

// $5016D4: (8-bit)(bitfield) Completed Missions for Noh's Betrayal at Honnouji (Second)
//          
//          bit0 = Show me the Way
//          bit1 = Protector of Love
//          bit2 = The Long Path
//          bit3 = Thorns
function completeNohBetrayalAtHonnoujiSecond() => byte(0x5016D4)

// $5016D8: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Betrayal at Honnouji
//          
//          bit0 = Blockage
//          bit1 = Flames of Vengeance
//          bit2 = Blood of the Viper
//          bit3 = Blade of Judgment
//          bit4 = Trap
//          bit5 = Retribution
function completeRanmaruBetrayalAtHonnouji() => byte(0x5016D8)

// $5016DC: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Betrayal at Honnouji
//          
//          bit0 = A Strange Change
//          bit1 = A Mountain of Bodies
//          bit2 = The Sun is Falling
//          bit3 = Honnouji in Flames
//          bit4 = A Monkey's Love
//          bit5 = No Going Back
function completeHideyoshiBetrayalAtHonnouji() => byte(0x5016DC)

// $5016E0: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Kemari in the Capital
//          
//          bit0 = A Strategic Detour
//          bit1 = The Southern Gate
//          bit2 = Raising Dogs
//          bit3 = Show Strength, Feel Fear
//          bit4 = If not Kunoichi then who?
//          bit5 = Is the Betrayal Real?
//          bit6 = Red and White
//          bit7 = The Final Battle
function completeYoshimotoKemariInTheCapital() => byte(0x5016E0)

// $5016E4: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Struggle at Honnouji
//          
//          bit0 = Trials of the Ultimate Warrior
//          bit1 = Trials of the Kabuki
//          bit2 = Trials of the One Eyed Dragon
//          bit3 = Trials of the Demon
//          bit4 = Screams within Honnouji
function completeYoshimotoStruggleAtHonnouji() => byte(0x5016E4)

// $5016E8: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Mikatagahara
//          
//          bit0 = Youth
//          bit1 = Tadakatsu
//          bit2 = Sinking Ship
//          bit3 = Harsh Lesson
//          bit4 = Assassination
//          bit5 = Last Stand
function completeYukimuraBattleOfMikatagahara() => byte(0x5016E8)

// $5016EC: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Nagashino
//          
//          bit0 = Nagashino
//          bit1 = Prodigy
//          bit2 = Counterattack
//          bit3 = Spear and Musket
//          bit4 = Rain of Fire
//          bit5 = Blue Bullet
function completeYukimuraBattleOfNagashino() => byte(0x5016EC)

// $5016F0: (8-bit)(bitfield) Completed Missions for Yukimura's The Battle of Nagashino (Second)
//          
//          bit0 = Severance
//          bit1 = Rear Guard
//          bit2 = Tiger awakens
//          bit3 = Rain and Bullets
//          bit4 = Champions
//          bit5 = Raw Power
//          bit6 = Tiger and Demon
function completeYukimuraBattleOfNagashinoSecond() => byte(0x5016F0)

// $5016F4: (16-bit)(bitfield) Completed Missions for Keiji Maeda's The Battle of Nagashino
//          
//          bit0 = Front Line
//          bit1 = Distraction
//          bit2 = Mayhem
//          bit3 = !! UNUSED !!
//          bit4 = Katsuyori
//          bit5 = Sound of Terror
//          bit6 = Barricade
//          bit7 = Young Tiger
//          bit8 = Go Home
function completeKeijiBattleOfNagashino() => word(0x5016F4)

// $5016F8: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Nagashino
//          
//          bit0 = Front Line
//          bit1 = Distraction
//          bit2 = Mayhem
//          bit3 = Divine Wind
//          bit4 = Katsuyori
//          bit5 = Sound of Terror
//          bit6 = Barricade
function completeNobunagaBattleOfNagahino() => byte(0x5016F8)

// $5016FC: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The Battle of Nagashino (Second)
//          
//          bit0 = Masakage
//          bit1 = Nobufusa
//          bit2 = Tainted Hands
//          bit3 = Withdrawal
//          bit4 = Crumbling
//          bit5 = Friendly Fire
function completeNobunagaBattleOfNagashinoSecond() => byte(0x5016FC)

// $501700: (8-bit)(bitfield) Completed Missions for Kuniochi's The battle of Mikatagahara
//          
//          bit0 = Youth
//          bit1 = Tadakatsu
//          bit2 = Sinking Ship
//          bit3 = Harsh Lesson
//          bit4 = Ninja's Pride
//          bit5 = Last stand
function completeKunioichiBattleOfMikatagahara() => byte(0x501700)

// $501704: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Nagashino
//          
//          bit0 = Severance
//          bit1 = Rear Guard
//          bit2 = Tiger awakens
//          bit3 = Tactical Contest
//          bit4 = Champion
//          bit5 = Raw Power
//          bit6 = Tiger devours Demon
function completeShingenBattleOfNagashino() => byte(0x501704)

// $501708: (8-bit)(bitfield) Completed Missions for Masamune Date's Nagashino Campaign
//          
//          bit0 = Musket Unit
//          bit1 = Cavalry
//          bit2 = Speed for Muskets
//          bit3 = Power for Cavalry
//          bit4 = The Rear Guardian
//          bit5 = Old Soldier
//          bit6 = Foolish Badger
function completeMasamuneNagashinoCampaign() => byte(0x501708)

// $50170C: (8-bit)(bitfield) Completed Missions for Hanzo Hattorii's The battle of Mikatagahara
//          
//          bit0 = Falling Star
//          bit1 = Scale
//          bit2 = Blade of Justice
//          bit3 = Shadow Flight
//          bit4 = Assassin
//          bit5 = Falcon's Nest
//          bit6 = Tombo-Giri
//          bit7 = Our Mikawa
function completeHanzoBattleOfMikatagahara() => byte(0x50170C)

// $501710: (8-bit)(bitfield) Completed Missions for New Officer's The battle of Nagashino
//          
//          bit0 = Nagashino
//          bit1 = Prodigy
//          bit2 = Counterattack
//          bit3 = Spear and Musket
//          bit4 = Rain of Fire
function completeNewOfficerBattleOfNagashino() => byte(0x501710)

// $501714: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Mikatagahara
//          
//          bit0 = The Decoy
//          bit1 = Gone Fishing
//          bit2 = The Cutting Edge
//          bit3 = An Impressive Figure
//          bit4 = On Wings of a Crane
//          bit5 = The Will to Power
//          bit6 = Capture the Ruler
function completeTadakatsuBattleOfMikatagahara() => byte(0x501714)

// $501718: (8-bit)(bitfield) Completed Missions for Ina's The battle of Mikatagahara
//          
//          bit0 = Fishing Bait
//          bit1 = Tempered Tantrum
//          bit2 = Thanks to the Shadow
//          bit3 = Femme Fatale
//          bit4 = The Land is Ours
//          bit5 = Spread Your Wings
//          bit6 = Preparing to Withdraw
//          bit7 = Withdrawing the Withdrawal
function completeInaBattleOfMikatagahara() => byte(0x501718)

// $50171C: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's The battle of Yamasaki
//          
//          bit0 = Breaking through
//          bit1 = Keiji
//          bit2 = The Deep Fog
//          bit3 = Find Nobunaga
//          bit4 = Stop the Pincer
//          bit5 = Keiji, once again
//          bit6 = Cave Assau
function completeYukimuraBattleOfYamasaki() => byte(0x50171C)

// $501720: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The battle of Yamasaki
//          
//          bit0 = Trapped
//          bit1 = Infernal Sniper
//          bit2 = True Samurai
//          bit3 = Hideyoshi isolated
//          bit4 = Cruel Fate
//          bit5 = Road to Victory
//          bit6 = Enemy in the Fog
function completeNobunagaBattleOfYamasaki() => byte(0x501720)

// $501724: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's The battle of Yamasaki
//          
//          bit0 = Mt. Ten-oh
//          bit1 = Saving Matsuda
//          bit2 = The Summit
//          bit3 = No Reinforcements
//          bit4 = Great Tiger
//          bit5 = Tragedy of War
//          bit6 = Clear the Cave
//          bit7 = Monkey Tactics
function completeMitsuhideBattleOfYamasaki() => byte(0x501724)

// $501728: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's The battle of Yamasaki (Second)
//          
//          bit0 = East Gate
//          bit1 = West Gate
//          bit2 = Dark Enemy
//          bit3 = Avenger
//          bit4 = Reason
//          bit5 = Nobunaga advances
function completeNobunagaBattleOfYamasakiSecond() => byte(0x501728)

// $50172C: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Yamasaki Crossfire
//          
//          bit0 = Advance Force
//          bit1 = The First Shot
//          bit2 = Furious Assault
//          bit3 = Ambush Party
//          bit4 = Cease resistance?
//          bit5 = Reason to fight
function completeMagoichiYamasakiCrossfire() => byte(0x50172C)

// $501730: (8-bit)(bitfield) Completed Missions for Shingen Takeda's The Battle of Yamasaki
//          
//          bit0 = Breaking through
//          bit1 = Keiji
//          bit2 = The Deep Fog
//          bit3 = Find Nobunaga
//          bit4 = Stop the Pincer
//          bit5 = Keiji, once again
//          bit6 = Cave Assault
//          bit7 = Artistic Battle
function completeShingenBattleOfYamasaki() => byte(0x501730)

// $501734: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's The battle of Yamasaki
//          
//          bit0 = The Battle for Mt. Ten-oh
//          bit1 = No Margin for Error
//          bit2 = The Defense of Mt. Ten-oh
//          bit3 = Monkeying Around
//          bit4 = Three Days to Glory
//          bit5 = The General of Mt. Ten-oh
//          bit6 = To Be Taken Seriously
//          bit7 = Until We Meet Again
function completeHideyoshiBattleOfYamasaki() => byte(0x501734)

// $501738: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Yamasaki
//          
//          bit0 = Turning Point
//          bit1 = Atop the Mountain
//          bit2 = Mountain Climbing
//          bit3 = A Princess from the West
//          bit4 = A Warrior from the North
//          bit5 = A Squire from the South
//          bit6 = Soul Searching
function completeTadatsuBattleOfYamasaki() => byte(0x501738)

// $50173C: (8-bit)(bitfield) Completed Missions for Tadakatsu Honda's The battle of Yamasaki
//          
//          bit0 = Waiting for Luck
//          bit1 = A Cornered Rat
//          bit2 = Monkey Calling
//          bit3 = Foggy Mountain Cave
//          bit4 = Monkey on the Mountain
//          bit5 = Rodent Infestation
//          bit6 = Can't Wait on Luck
//          bit7 = Mitsuhide Returns
function completeInaBattleOfYamasaki() => byte(0x50173C)

// $501740: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Siege of Azuchi Castle
//          
//          bit0 = Azuchi in flames
//          bit1 = !! Unused !!
//          bit2 = !! Unused !!
//          bit3 = !! Unused !!
//          bit4 = !! Unused !!
//          bit5 = Colossal Gate
//          bit6 = Trapped Tiger
//          bit7 = Mismatch
//          
//          
//          Additional Missions available at 0x00517ac
function completeSiegeOfAzuchi() => byte(0x501740)

// $501744: (16-bit)(bitfield) Completed Missions for Nobunaga Oda 's Retaking of Azuchi Castle
//          
//          Continued at 0x005017b0
//          
//          bit0 = Burn
//          bit1 = Unsettled Business
//          bit2 = Invaders
//          bit3 = Inferno
//          bit4 = Destruction
//          bit5 = No Mercy in Battle
//          bit6 = Dangerous Man
//          bit7 = Desperation
//          bit8 = Dangerous Woman
//          bit9 = Unforgivable
function completeNobunagaRetakingAzuchi() => word(0x501744)

// $501748: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi 's Defense of Azuchi Castle
//          
//          bit0 = Stop the Fire
//          bit1 = The Flames spread
//          bit2 = Prediction
//          bit3 = Stop the Hashiba
//          bit4 = Stop the Shibata
//          bit5 = Moth to a Flame
//          bit6 = Nothing Sacred
//          bit7 = Demon's March
function completeMitsuhideDefenseOfAzuchiCastle() => byte(0x501748)

// $50174C: (8-bit)(bitfield) Completed Missions for Oichi 's Siege of Azuchi Castle
//          
//          Continued at 0x005017bc
//          
//          bit0 = Colossal Gate
//          bit1 = Castle Grounds
//          bit2 = Three for One
//          bit3 = Silence the Muskets
//          bit4 = Misunderstanding
//          bit5 = Pressure
//          bit6 = The Shield
//          bit7 = Azai victorious?
function completeOichiSiegeOfAzuchiCastlePart1() => byte(0x50174C)

// $501750: (8-bit)(bitfield) Completed Missions for Shingen Takeda 's Siege of Azuchi Castle
//          
//          bit0 = Azuchi in Flames
//          bit1 = The Right Place
//          bit2 = Dull Blade
//          bit3 = War God's Challenge
//          bit4 = The Race is On
//          
//          4 missing missions
function completeShingenSiegeOfAzuchiCastle() => byte(0x501750)

// $501754: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Siege of Azuchi Castle
//          
//          Continued at 0x005017d4
//          
//          bit0 = The Sun and the Moon
//          bit1 = Rodsent Logic
//          bit2 = Foolish Actions
//          bit3 = Conclusion - Lord
//          bit4 = Conclusion - Friend
//          bit5 = The Warrior's Way
//          bit6 = Foolish Thoughts
function completeHideyoshiSiegeOfAzuchiCastle() => byte(0x501754)

// $501758: (8-bit)(bitfield) Completed Missions for Nobunaga Oda's Defense of Gifu Castle
//          
//          bit0 = Siege Ramp
//          bit1 = Sunomata
//          bit2 = Kenshin and Keiji
//          bit3 = !! UNUSED!!
//          bit4 =Betrayal means Death
//          bit5 = War God's Army
//          bit6 = Luring Kenshin
//          bit7 = White Fangs
function completeNobunagaDefenseOfGifuCastle() => byte(0x501758)

// $50175C: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's Defense of Inabayama Castle
//          
//          bit0 = Inbayama
//          bit1 = Lumber
//          bit2 = Resolution
//          bit3 = Prove Yourself
//          bit4 = Hanbei's Revolt
function completeMitsuhideDefenseOfInabayamaCastl() => byte(0x50175C)

// $501760: (16-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Gifu Castle
//          
//          Continued at 0x005017e0
//          
//          bit0 = Mighty Shibata
//          bit1 = Bridge to Heaven
//          bit2 = Take Sunomata
//          bit3 = Direct Attack
//          bit4 = Split Forces
//          bit5 = The Stalwart
//          bit6 = The Tactician
//          bit7 = Gods and Demons
//          bit8 = No contest
//          bit9 = Castle occupied!
//          bit10 = Sweep
function completeKenshinSiegeOfGifuCastlePart1() => word(0x501760)

// $501764: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Inabayama Castle
//          
//          continued at
//          
//          bit0 = One Night Castle
//          bit1 = Get the Lumber
//          bit2 = Clear the Fortress
//          bit3 = Ploy uncovered
//          bit4 = Reckless Charge
//          bit5 = Path of Thorns
//          bit6 = The Tactician
//          bit7 = Gods and Demons
//          
//          4 additional missions, not located yet.
function completeOichiSiegeOfInabayamaCastle() => byte(0x501764)

// $501768: (8-bit)(bitfield) Completed Missions for Noh's Siege of Inabayama Castle
//          
//          Continued at 0x005017ec
//          
//          bit0 = One Night Castle
//          bit1 = Get the Lumber
//          bit2 = Clear the Fortress!
//          bit3 = Ploy uncovered
//          bit4 = Reckless Charge
//          bit5 = Path of Thorns
function completeNohSiegeOfInabayamaPart1() => byte(0x501768)

// $50176C: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Defense of Inabayama Castle
//          
//          bit0 = Inabayama
//          bit1 = Lumber
//          bit2 = Resolution
//          bit3 = Prove Yourself
//          bit4 = Hanbei's Revolt
function completeRanmaruDefenseOfInabayamaCastle() => byte(0x50176C)

// $501770: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's Siege of Inabayama Castle
//          
//          Continued at 0x005017f8
//          
//          bit0 = Sunomata Castle- Lumber
//          bit1 = Sunomata Castle- Land
//          bit2 = Stairway to the Sky
//          bit3 = Western Whirlwind
//          bit4 = Sunomata Castle- People
//          bit5 = Be a Hero!
//          bit6 = The Raging Rodent
//          bit7 = The Theory of Evolution
function completeHideyoshiSiegeOfInabayamaCastle() => byte(0x501770)

// $501774: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Defense of Ueda Castle
//          
//          bit0 = First Strike
//          bit1 = Diversion
//          bit2 = Flood
//          bit3 = Rage
//          bit4 = Assassin
//          bit5 = Father
//          bit6 = Brother
function completeYukimuraDefenseOfUedaCastle() => byte(0x501774)

// $501778: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Ueda Castle
//          
//          Continued at 0x005017fc
//          
//          bit0 = Sanada's Son
//          bit1 = Decoy
//          bit2 = Illusion
//          bit3 = Enchantment
//          bit4 = Camp Surrounded
//          bit5 = Relentless
//          bit6 = I see you, Nemesis
//          bit7 = Inside the Castle
function completeKenshinSeigeOfUedaPart1() => byte(0x501778)

// $50177C: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Ueda Castle
//          
//          Continued at 0x005017f8
//          
//          bit0 = Secret Plan
//          bit1 = Quick Strike
//          bit2 = Invasion
//          bit3 = Stone in the Water
//          bit4 = Badger Hunt
//          bit5 = Stop Yukimura
//          bit6 = Plan Continues
//          
//          Missing 8 achievements
function completeNewOfficerSiegeOfUedaCastlePart1() => byte(0x50177C)

// $501780: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Siege of Ueda Castle
//          
//          Continued at 0x050180c
//          
//          bit0 = Triple Strike
//          bit1 = Sharpening Swords
//          bit2 = Attacking by Surprise
//          bit3 = Where There's Smoke
//          bit4 = Old Friends
//          bit5 = Surrounded
//          bit6 = The Raging Rodent
//          bit7 = The Theory of Evolution
function YoshimotoSiegeOfUedaCastle() => byte(0x501780)

// $501784: (8-bit)(bitfield) Completed Missions for Ina's Defense of Ueda Castle
//          
//          bit0 = Bringing Back The Bow
//          bit1 = Why Wish for War?
//          bit2 = Dancing with Kunoichi
//          bit3 = A Messy Situation
//          bit4 = Ina's Last Bow
//          bit5 = The Princess Trials
//          bit6 = The Raging Rodent
//          bit7 = The Theory of Evolution
function completeInaDefenseOfUedaCastle() => byte(0x501784)

// $501788: (8-bit)(bitfield) Completed Missions for Yukimura Sanada's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = Distrust
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = Burning Soul
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
function completeYukimuraSiegeOfOsaka() => byte(0x501788)

// $50178C: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Osaka
//          
//          bit0 = Goddess of Victory
//          bit1 = Playtime is not over
//          bit2 = Forbidden Love
//          bit3 = Repel the Invader
function completeGoemonDanceOfOsaka() => byte(0x50178C)

// $501790: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Osaka
//          
//          bit0 = Goddess of Victory
//          bit1 = Playtime is not over
//          bit2 = Forbidden Love
//          bit3 = Repel the Invader
function completeOkuniDanceOfOsaka() => byte(0x501790)

// $501794: (8-bit)(bitfield) Completed Missions for Kunoichi's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = Distrust
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = !! Unused !!
//          bit6 = Withering Hope
//          bit7 = !! Unused !!
//          
//          Missing 3
function completeKunioichiSiegeOfOsaka() => byte(0x501794)

// $501798: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Siege of Osaka - Summer
//          
//          Continued at 0x00501814
//          
//          bit0 = Crimson Fortress
//          bit1 = Undying Spirit
//          bit2 = Sanada Ninjas
//          bit3 = Lion's Roar
//          bit4 = Just in Time
//          bit5 = Burning Soul
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
//          
//          4 missing
function completeHanzoSiegeOfOsakaSummerPart1() => byte(0x501798)

// $50179C: (16-bit)(bitfield) Completed Missions for Yukimura Sanada's Siege of Osaka - Summer
//          
//          bit0 = Power of Sanada
//          bit1 = Cannon
//          bit2 = Distrust
//          bit3 = Supporter
//          bit4 = Resolve
//          bit5 = !! UNUSED !!
//          bit6 = Withering Hope
//          bit7 = Legendary Maneuver
//          bit8 = !! UNUSED !!
//          bit9 = !! UNUSED !!
//          bit10 = To the Death
//          
//          1 missing
function completeYukimuraSiegeOfOsakaSummer() => word(0x50179C)

// $5017A0: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Osaka - Summer
//          
//          Continued at 0x0050181c
//          
//          bit0 = !! UNUSED!!
//          bit1 = Undying Spirit
//          bit2 = !! UNUSED!!
//          bit3 = Lion's Roar
//          bit4 = Just in time
//          bit5 = Sanada-Maru
//          
//          4 missing
function completeNewOfficerSiegeOfOsakaSummerPart() => byte(0x5017A0)

// $5017A4: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's The Saika Campaign
//          
//          bit0 = Start Quietly
//          bit1 = There's Nobody Left
//          bit2 = An Invisible Attack
//          bit3 = Fasting
//          bit4 = Hideyoshi the Hero
//          bit5 = Finish Strongly
//          4 missing
function completeHideyoshiTheSaikaCampaign() => byte(0x5017A4)

// $5017A8: (8-bit)(bitfield) Completed Missions for Ina's Siege of Osaka Castle
//          
//          Continued at 0x00501820
//          
//          bit0 = Waiting at the Sanada-Maru
//          bit1 = Filial Piety
//          bit2 = The Main Camp is Calling
//          bit3 = This is It!
//          bit4 = Pearls before Swine
//          bit5 = Osaka Castle before Monkeys
//          bit6 = The Coming Evil
//          bit7 = The Sound of Muskets
function completeInaSiegeOfOsakaCastlePart1() => byte(0x5017A8)

// $5017AC: (8-bit)(bitfield) Completed Missions for Yukimura Sanad's Siege of Azuchi Castle Part 2
//          
//          Continuation of 0x00501740
//          
//          bit0 = Princess
//          bit1 = Brute
//          bit2 = !! UNUSED!!
//          bit3 = Squire
//          bit4 = Demon Lord
function completeYukimuraRetakingOfAzuchiCastle() => byte(0x5017AC)

// $5017B0: (16-bit)(bitfield) Completed Missions for Nobunaga Oda 's Retaking of Azuchi Castle
//          
//          Continued from 0x00501744
//          
//          bit0 = Desiring Death
//          bit1 = More Desperation
//          bit2 = Solitude
//          bit3 = Two Monsters
function completeNobunagaRetakingOfAzuchiCastle() => word(0x5017B0)

// $5017B4: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Dance of Azuchi Castle
//          
//          bit0 = Guide
//          bit1 = Patrol
//          bit2 = Food and Shelter
//          bit3 = Lineage
//          bit4 = Escort
function completeGoemonDanceOfAzuchiCastle() => byte(0x5017B4)

// $5017B8: (8-bit)(bitfield) Completed Missions for Oichi's Azuchi Infiltration
//          
//          bit0 = Three Mino Generals
//          bit1 = Triple Threat 1
//          bit2 = Triple Threat 2
//          bit3 = Fight with no Glory
//          bit4 = My Brother and Mitsuhide
function completeOichiAzuchiInfiltration() => byte(0x5017B8)

// $5017BC: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Azuchi Castle Part 2
//          
//          Continued from 0x0050174c
//          
//          bit0 = Opening Battle
//          bit1 = Self Sacrifice
//          bit2 = Disruptive Monkey
//          bit3 = Between Siblings
function completeOichiSiegeOfAzuchiCastlePart2() => byte(0x5017BC)

// $5017C0: (8-bit)(bitfield) Completed Missions for Okuni's Dance of Azuchi Castle
//          
//          bit0 = Guide
//          bit1 = Patrol
//          bit2 = Spare Time
//          bit3 = Lineage
//          bit4 = Choice
function completeOkuniDanceOfAzuchiCastle() => byte(0x5017C0)

// $5017C4: (8-bit)(bitfield) Completed Missions for Magoichi Saika's Azuchi Infiltration
//          
//          bit0 = The Final Shot
//          bit1 = I'm hot toda!y
//          bit2 = Chivalry
//          bit3 = Last Scuffle
//          bit4 = Gentleman
function completeMagoichiAzuchiInfiltration() => byte(0x5017C4)

// $5017C8: (8-bit)(bitfield) Completed Missions for Shingen Takeda's Siege of Azuchi Castle
//          
//          bit0 = Princess
//          bit1 = Brute
//          bit2 = !!UNUSED
//          bit3 = Squire
//          bit4 = Demon Lord
function completeShingenSiegeOfAzuchiCastle() => byte(0x5017C8)

// $5017CC: (8-bit)(bitfield) Completed Missions for Noh's Azuchi Infiltration
//          
//          bit0 = Unsightly Beast
//          bit1 = Sniper's Passion
//          bit2 = Intruder!
//          bit3 = Tokugawa Menace
//          bit4 = The interloper
function completeNohAzuchiInfiltration() => byte(0x5017CC)

// $5017D0: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Defense of Azuchi Castle
//          
//          bit0 = !!UNUSED!!
//          bit1 = Hate
//          bit2 = Danger
//          bit3 = Null
//          bit4 = Life
//          bit5 = Chaos
function completeRanmaruDefenseOfAzuchiCastle() => byte(0x5017D0)

// $5017D4: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashiba's  Siege of Azuchi Castle part 2
//          
//          Continued from 0x00501754
//          
//          bit0 = Together
//          bit1 = Destruction
//          bit2 = Companions
//          bit3 = Creation
//          bit4 = Farewell
function completeHideyoshiSiegeOfAzuchiCastlePar2() => byte(0x5017D4)

// $5017D8: (8-bit)(bitfield) Completed Missions for Mitsuhide Akechi's Gifu Infiltration
//          
//          bit0 = Ninjas
//          bit1 = Ninja Master
//          bit2 = Beautiful Prey
//          bit3 = Trespass
//          bit4 = Conviction
function completeMitsuhideGifuIniltration() => byte(0x5017D8)

// $5017DC: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Gifu Infiltration
//          
//          bit0 = Treasure's mine!
//          bit1 = Brat
//          bit2 = Don't put on airs!
//          bit3 = Wife and Brat
//          bit4 = Silent Treatment
//          bit5 = Popular Guy
function completeGoemonGifuInfiltration() => byte(0x5017DC)

// $5017E0: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Gifu Castle Part 2
//          
//          Continued from 0x0501760
//          
//          bit0 = First Floor
//          bit1 = Second Floor
//          bit2 = Third Floor
//          bit3 = Fourth Floor
function completeKenshinSiegeOfGifuCastlePart2() => byte(0x5017E0)

// $5017E4: (8-bit)(bitfield) Completed Missions for Oichi's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501764
//          
//          bit0 = Talented Youth
//          bit1 = Clever Tactician
//          bit2 = A Stern Man
//          bit3 = Way of the Viper
function completeOichiSiegeOfInabayamaCastlePart2() => byte(0x5017E4)

// $5017E8: (8-bit)(bitfield) Completed Missions for Kunoichi's Gifu Infiltration
//          
//          bit0 = Goemon Ruckus
//          bit1 = Mr. Serious
//          bit2 = The Snake Woman
//          bit3 = Ooh La La
//          bit4 = Goemon Explosion
//          bit5 = Ultimate Ninja
//          bit6 = Lies, Tears and Revenge
function completeKunoichiGifuInfilitration() => byte(0x5017E8)

// $5017EC: (8-bit)(bitfield) Completed Missions for Noh's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501768
//          
//          bit0 = Talented Youth
//          bit1 = Clever Tactician
//          bit2 = A Stern Man
//          bit3 = Way of the Viper
function completeSiegeOfInabayamaCastlePart2() => byte(0x5017EC)

// $5017F0: (8-bit)(bitfield) Completed Missions for Noh's Gifu Infiltration
//          
//          bit0 = Scurrying Vixen
//          bit1 = Chasing Viper
//          bit2 = Relentless Sniper
//          bit3 = An Honest Man
//          bit4 = Doom, for you
//          bit5 = Gates of Chaos
//          bit6 = Principle and Conviction
//          bit7 = Because...
function completeNohGifuInfiltration() => byte(0x5017F0)

// $5017F4: (8-bit)(bitfield) Completed Missions for Ranmaru Mori's Gifu Infiltration
//          
//          bit0 = Enemy Ninjas
//          bit1 = Dark Beast
//          bit2 = Vendetta
//          bit3 = Obstacle
//          bit4 = Persistence
//          bit5 = Wild One
//          bit6 = Friend and Foe
function completeRanmaruGifuInfiltration() => byte(0x5017F4)

// $5017F8: (8-bit)(bitfield) Completed Missions for Hideyoshi Hashibai's Siege of Inabayama Castle Part 2
//          
//          Continued from 0x00501770
//          
//          bit0 = A Defenseless Defense
//          bit1 = The Enemy Within
//          bit2 = The Threads of Fate
//          bit3 = On the Brink
//          bit4 = Near Death
function completeHideyoshiSiegeInabayamaCastlePa2() => byte(0x5017F8)

// $5017FC: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Siege of Ueda Castle Part 2
//          
//          Continued from 0x00501778
//          
//          bit0 = Race is on
//          bit1 = Elder Sanada
//          bit2 = Younger Sanada
//          bit3 = Brothers
//          bit4 = Sanada Patriarch
function completeKenshinSiegeOfUedaCastlePart2() => byte(0x5017FC)

// $501800: (8-bit)(bitfield) Completed Missions for Kunoichi's Rescue at Ueda Castle
//          
//          bit0 = Become the Wind
//          bit1 = Stealthy Steps
//          bit2 = Reach for Tomorrow
//          bit3 = End is near
//          bit4 = Iga Illusion
function completeKunoichiRescueAtUedaCastle() => byte(0x501800)

// $501804: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Ueda Infiltration
//          
//          bit0 = Espionage
//          bit1 = Intelligence
//          bit2 = Confirmation
//          bit3 = Unbreakable
//          bit4 = Secrecy
function completeHanzoUedaInfiltration() => byte(0x501804)

// $501808: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Ueda Castle Part 2
//          
//          Continued from 0x0050177c
//          
//          bit0 = First Time
//          bit1 = Second Time
//          bit2 = Third Time
//          bit3 = Fourth Time
//          bit4 = Fifth Time
//          bit5 = Sixth Time
//          bit6 = Tokugawa Rule
//          bit7 = Sanada Rule
function completeNewOfficerSiegeOfUedaCastlePart2() => byte(0x501808)

// $50180C: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Siege of Ueda Castle Part 2
//          
//          Continued from 0x00501780
//          
//          bit0 = Like Father, Like Son
//          bit1 = Noble in Peace
//          bit2 = Fierce in War
//          bit3 = The Two Warriors
//          bit4 = The Mirage
//          bit5 = Under Pressure
function completeYoshimotoSiegeOfUedaCastlePart2() => byte(0x50180C)

// $501810: (8-bit)(bitfield) Completed Missions for Goemon Ishikawa's Osaka Intrusion
//          
//          bit0 = Treasure found
//          bit1 = Bad Student
//          bit2 = Not over Yet
//          bit3 = Shake the Castle
//          bit4 = Burning Spirit
//          bit5 = No Cannons Allowed
function completeGoemonIshikawaOsakaIntrusion() => byte(0x501810)

// $501814: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Siege of Osaka - Summer
//          
//          Continued from 0x00501798
//          
//          bit0 = Undisciplined Ninja
//          bit1 = Muddle
//          bit2 = True Ninja
//          bit3 = Ruse
function completeHanzoSiegeOfOsakaSummerPart2() => byte(0x501814)

// $501818: (8-bit)(bitfield) Completed Missions for Hanzo Hattori's Osaka Infiltration
//          
//          bit0 = Goemon
//          bit1 = Way of Ninjitsu
//          bit2 = Rogue's Fate
//          bit3 = Rematch
//          bit4 = Battle Royale
//          bit5 = Light and Shadow
//          bit6 = The Darkness
function completeHanzoOsakaInfiltration() => byte(0x501818)

// $50181C: (8-bit)(bitfield) Completed Missions for New Officer's Siege of Osaka - Summer Part 2
//          
//          Continued from 0x005017a0
//          
//          bit0 = Just in time
//          bit1 = Muddle
//          bit2 = True Ninja
//          bit3 = Ruse
function completeNewOfficerSiegeOfOsakaSummerPar2() => byte(0x50181C)

// $501820: (8-bit)(bitfield) Completed Missions for Ina's Siege of Osaka Castle Part 2
//          
//          Continued from 0x005017a8
//          
//          bit0 = A Rhapsody for Keiji
//          bit1 = A Melody for Kunoichi
//          bit2 = Chasing Yukimura
//          bit3 = A Lullaby from Magoichi
//          bit4 = An Ode to Bow
//          bit5 = Kunoichi's Last Dance
//          bit6 = Dancing Monkeys
//          bit7 = A Duet with Father
function completeInaSiegeOfOsakaCastlePart2() => byte(0x501820)

// $501824: (8-bit)(bitfield) Completed Missions for Keiji Maeda's Odawara Infiltration
//          
//          bit0 = Babysitting
//          bit1 = Serious Warrior
function completeKeijiOdawaraInfiltration() => byte(0x501824)

// $501828: (8-bit)(bitfield) Completed Missions for Kenshin Uesugi's Odawara Infiltration
//          
//          bit0 = No Knowledge
//          bit1 = Stalling
//          bit2 = Appearances
//          bit3 = Aftermath
function completeKenshinOdawaraInfiltration() => byte(0x501828)

// $50182C: (8-bit)(bitfield) Completed Missions for Kunoichi's Odawara Infiltration
//          
//          bit0 = Goemon again...
//          bit1 = Make it stop!
//          bit2 = Enough already!
//          bit3 = Dragon and Vixen
//          bit4 = Hi, I'm an assassin
//          bit5 = Got me but Good
//          bit6 = 5 seconds to Detonation!
function completeKunoichiOdawaraInfiltration() => byte(0x50182C)

// $501830: (8-bit)(bitfield) Completed Missions for Shingen Takeda's Odawara Infiltration
//          
//          bit0 = Ominous Shadow
//          bit1 = The Shadow returns
//          bit2 = From the North
//          bit3 = The Nemesis cometh
//          bit4 = People are the Walls
function completeShingenOdawaraInfiltration() => byte(0x501830)

// $501834: (8-bit)(bitfield) Completed Missions for Masamune Date's Odawara Campaign
//          
//          bit0 = Inconspicuous
//          bit1 = Love...?
//          bit2 = Personal Challenge
//          bit3 = Battle between Men
function MasamuneOdawaraCampaign() => byte(0x501834)

// $501838: (8-bit)(bitfield) Completed Missions for Yoshimoto Imagawa's Odawara Infiltration
//          
//          bit0 = Watch Your Step!
//          bit1 = The Hojo Brothers
//          bit2 = Kemari for Kids
//          bit3 = Read My Lips
//          bit4 = Beatuiful yet Irrational
function completeYoshimotoOdawaraInfiltration() => byte(0x501838)

// $521210: (8-bit) Current Mission ID
//          
//          Mission number is as follows (names are not recorded right now)
//          
//          0x00 = Yukimura's First Mission
//          0x01 = Yukimura's Second Mission
//          0x02 = Yukimura's Third Mission Upper Path
//          0x03 = Yukimura's Fourth Mission Upper Path
//          0x04 = Yukimura's Fifth Mission Upper Path
//          0x05 = Yukimura's Third Mission Lower Path
//          0x06 = Yukimura's Fourth Mission Lower Path
//          0x07 = Yukimura's Fifth Mission Lower Path
//          0x08 = Keiji's First Mission
//          0x09 = Keiji's Second Mission
//          0x0A = Keiji's Third Mission
//          0x0B = Keiji's Fourth Mission
//          0x0C = Keiji's Fifth Mission
//          0x0D = Nobunaga's First Mission
//          0x0E = Nobunaga's Second Mission
//          0x0F = Nobunaga's Third Mission Upper Path
//          0x10 = Nobunaga's Fourth Mission Upper Path
//          0x11 = Nobunaga's Fifth Mission Upper Path
//          0x12 = Nobunaga's Third Mission Lower Path
//          0x13 = Nobunaga's Fourth Mission Lower Path
//          0x14 = Nobunaga's Fifth Mission Lower Path
//          0x15 = Mitsuhide's First Mission
//          0x16 = Mitsuhide's Second Mission
//          0x17 = Mitsuhide's Third Mission
//          0x18 = Mitsuhide's Fourth Mission Upper Path
//          0x19 = Mitsuhide's Fifth Mission Upper Path
//          0x1A = Mitsuhide's Fourth Mission Lower Path
//          0x1B = Mitsuhide's Fifth Mission Lower Path
//          0x1C = Goemon's First Mission
//          0x1D = Goemon's Second Mission
//          0x1E = Goemon's Third Mission Upper Path
//          0x1F = Goemon's Fourth Mission Lower Path
//          0x20 = Goemon's Fifth Mission Upper Path
//          0x21 = Goemon's Third Mission Lower Path
//          0x22 = Goemon's Fourth Mission Lower Path
//          0x23 = Goemon's Fifth Mission Lower Path
//          0x24 = Kenshin's First Mission
//          0x25 = Kenshin's Second Mission
//          0x26 = Kenshin's Third Mission
//          0x27 = Kenshin's Fourth Mission
//          0x28 = Kenshin's Fifth Mission Upper Path
//          0x29 = Kenshin's Fifth Mission Lower Path
//          0x2A = Oichi's First Mission
//          0x2B = Oichi's Second Mission
//          0x2C = Oichi's Third Mission
//          0x2D = Oichi's Fourth Mission Upper Path
//          0x2E = Oichi's Fifth Mission Upper Path
//          0x2F = Oichi's Fourth Mission Lower Path
//          0x30 = Oichi's Fifth Mission Lower Path
//          0x31 = Okuni's First Mission
//          0x32 = Okuni's Second Mission
//          0x33 = Okuni's Third Mission
//          0x34 = Okuni's Fourth Mission
//          0x35 = Okuni's Fifth Mission
//          0x36 = Kunoichi's First Mission
//          0x37 = Kunoichi's Second Missions
//          0x38 = Kunoichi's Third Mission
//          0x39 = Kunoichi's Fourth Mission
//          0x3A = Kunoichi's Fifth Mission Upper Path
//          0x3B = Kunoichi's Fifth Mission Lower Path
//          0x3C = Magoichi's First Mission
//          0x3D = Magoichi's Second Mission
//          0x3E = Magoichi's Third Mission
//          0x3F = Magoichi's Fourth Mission
//          0x40 = Magoichi's Fifth Mission
//          0x41 = Shingen's First Mission
//          0x42 = Shingen's Second Mission
//          0x43 = Shingen's Third Mission
//          0x44 = Shingen's Fourth Mission
//          0x45 = Shingen's Fifth Mission Upper Path
//          0x46 = Shingen's Fifth Mission Lower Path
//          0x47 = Masamune's First Mission
//          0x48 = Masamune's Second Mission
//          0x49 = Masamune's Third Mission
//          0x4A = Masamune's Fourth Mission
//          0x4B = Masamune's Fifth Mission Upper Path
//          0x4C = Masamune's Fifth Mission Lower Path
//          0x4D = Noh's First Mission
//          0x4E = Noh's Second Mission
//          0x4F = Noh's Third Mission
//          0x50 = Noh's (Fourth Mission Upper Path)
//          0x51 = Noh's Retaking of Azuchi Castle (Fifth Mission Upper Path
//          0x52 = Noh's Betrayal at Honnouji (Fourth Mission Lower Mission)
//          0x53 = Noh's Azuchi Infiltration (Fifth Mission Lower Path)
//          0x54 = Hanzo's(The Battle of Okehazama (First Mission)
//          0x55 = Hanzo's The Battle of Mikatagahara (Second Mission)
//          0x56 = Hanzo's Crossing Iga (Third Mission)
//          0x57 = Hanzo's Ueda Infiltration (Fourth Mission)
//          0x58 = Hanzo's Siege of Osaka - Summer (Fifth Mission Upper Path)
//          0x59 = Hanzo's Osaka Infiltration (Fifth Mission Lower Path)
//          0x5A = Ranmaru's Defense of Inabayama Castle (First Mission)
//          0x5B = Ranmaru's The Battle of Ise (Second Mission)
//          0x5C = Ranmaru's Betrayal at Honnouji (Third Mission)
//          0x5D = Ranmaru's The Battle of Anegawa (Fourth Mission)
//          0x5E = Ranmaru's Gifu Infiltration (Fifth Mission Upper Path)
//          0x5F = Defense of Azuchi Castle (Ranmaru's Fifth Mission Lower Path)
//          0x60 = Hideyoshi's Siege of Inabayama Castle (First Mission)
//          0x61 = Hideyoshi's Retreat at Kanegasaki (Second Mission)
//          0x62 = Hideyoshi's The Saika Campaign (Third Mission)
//          0x63 = Hideyoshi's The Battle of Yamasaki (Fourth Mission Upper Path)
//          0x64 = Hideyoshi's The Battle of Komaki-Nagakute (Fifth Mission Upper Path)
//          0x65 = Hideyoshi's Betrayal at Honnouji (Fourth Mission Lower Path)
//          0x66 = Hideyoshi's Siege of Azuchi Castle (Fifth Mission Lower Path)
//          0x67 = Yoshimoto's The Battle of Okehazama (First Mission)
//          0x68 = Yoshimoto's Odawara Infiltration (Second Mission)
//          0x69 = Yoshimoto's The Battle of Kawanakajima (Third Mission)
//          0x6A = Yoshimoto's The Battle of Komaki-Nagakute (Fourth Mission Upper Path)
//          0x6B = Yoshimoto's Kemari in the Capital (Fifth Mission Upper Path)
//          0x6C = Yoshimoto's Siege of Ueda Castle (Fourth Mission Lower Path)
//          0x6D = Yoshimoto's Struggle at Honnouji (Fifth Mission Lower Path)
//          0x6E = Tadakatsu's The Battle of Okehazama  (First Mission)
//          0x6F = Tadakatsu's Retreat at Kanegasaki (Second Mission)
//          0x70 = Tadakatsu's The Battle of Mikatagahara (Third Mission)
//          0x71 = Tadakatsu's Crossing Iga (Fourth Mission Upper Path)
//          0x72 = Tadakatsu's The Battle of Komaki-Nagakute (Fifth Mission Upper Path)
//          0x73 = Tadakatsu's The Battle of Kawanakajima (Fourth Mission Lower Path)
//          0x74 = Tadakatsu's The Battle of Yamasaki (Fifth Mission Lower Path)
//          0x75 = Ina's Retreat at Kanegasaki (First Mission)
//          0x76 = Ina's The Battle of Mikatagahara (Second Mission)
//          0x77 = Ina's Crossing Iga (Third Mission)
//          0x78 = Ina's The Battle of Komaki-Nagakute(Fourth Mission Upper Path)
//          0x79 = Ina's Defense Of Ueda Castle (Fifth Mission Upper Path)
//          0x7A = Ina's The Battle of Yamasaki (Fourth Mission Lower Path)
//          0x7B = Ina's Siege of Osaka Castle(Fifth Mission Lower Path)
//          0x7C = New Officer's The Battle of Okehazama (First Mission)
//          0x7D = New Officer's The Battle of Kawanakajima (Second Mission)
//          0x7E = New Officer's The Battle of Nagashino (Third Mission)
//          0x7F = New Officer's Siege of Ueda (Fourth Mission)
//          0x80 = New Officer's Siege Of Osaka - Summer (Fifth Mission Upper Path)
//          0x81 = New Officer's Siege Of Osaka - Summer 2 (Fifth Mission Lower Path)
//          0x82 = Melee Mission
//          0x83 = Combo Mission
//          0x84 = Musou Mission
//          0x85 = Archery Mission
//          0x86 =
//          0x87 = Deflect Mission
//          0x88 = Burst Mission
//          0x89 =
//          0x8A = Riding Mission
//          0x8N =
//          0x8c = Survival Mode
//          0x8d = High Tower
//          0X8e = Gold Rush
function currentMissionID() => byte(0x521210)

// $521218: (8-bit) High Tower and Abyss Level count
//          
//          0x00 = First floor.
function survivalFloorLevel() => byte(0x521218)

// $521294: (8-bit) 2-player Indicator
//          
//          Unknown what this changes.
function secondPlayerIndicator() => byte(0x521294)

// $5212A8: (32-bit) First Dropped Item in level.
//          
//          Likely followed by a 32-bit for power.
//          
//          Then followed by up to 7 additional items.  Note 0x24 is "No Weapon
function firstDroppedItem() => dword(0x5212A8)

// $5212E8: (32-bit) In Level First Dropped Weapon
//          
//          There's 20 bytes between objects
//          
//          Then followed by up to 7 additional weaponsNote 0x84 is "No Weapon
function firstDroppedWeapon() => dword(0x5212E8)

// $52140C: (8-bit) Actual Value of Points
//          
//          Used for New Officer's Combo training
function comboTrainingScore() => byte(0x52140C)

// $521430: (8-bit) Gameplay indicator
//          
//          0x0c = In game  (Or demo)
//          0x00 = Won Stage
//          0x00= Won Abyss Mode
//          0x01= Lost Musou stage
//          0x00 = Won Gold Rush
//          0x01 Result from dying in deep abyss  or High Twoer
//          0x03 = Time out of watching Demo (or finished Mission byt "Failure" aka archery which always ends in failure)
//          0x04 =Time over "Success" in Mission.
//          0x06 = Exit from Game or player exit from demo.
//          0x08 = Mid level in Survival.
function gameplayIndicator() => byte(0x521430)

// $521438: (32-bit) Time spent in a level.
//          
//          This counts up, but in game it is shown as Time left.
//          
//          Works on a normal level and Survival mode.
function timeSpentInLevelinFrames() => dword(0x521438)

// $521668: (16-bit) Gold in Gold Rush
//          
//          Does not appear to be the "real value"
function goldInGoldRush() => word(0x521668)

// $52533D: (8-bit) In-Game Difficulty
//          
//          0x01 = Novice
//          0x02 = Easy
//          0x03 = Normal
//          0x04 = Hard
//          0x05 = Chaos
//          
//          If this is ever shown to be false, check 0x005255dd
function inGameDifficulty() => byte(0x52533D)

// $52D6B0: (16-bit) First Player KO Count
//          
//          Note: Going above 0x8000 seems to break the UI
//          
//          If this is proven wrong 0x0061e8f0, 0x0061e90c and 0x0061e910.  Those appear to be UI elements.
function firstPlayerKoCount() => word(0x52D6B0)

// $61E90E: Data Values
//          
//          Highest Leaderboards
//          Melee Mission 514
//          Musou Mission 702
//          Combo Mission 113
//          Archery Mission 41
//          Deflect Mission 74
//          Burst 1'09'26 (out of 2 minutes)
//          Riding 1'12'00 (out of 4:30?)
//          
//          Gold Rush 7000G
//          Deep Abyss 2000 KOs
//          Hugh Tower 30
function dataValueJUSTVALUES() => byte(0x61E90E)

// $695D6C: (32-bit) Save.load indicator Part 1
//          
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x00 = Initial Save Load on boot up
//          0x01 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart1() => dword(0x695D6C)

// $695D70: (32-bit) Save.load indicator Part 2
//          
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x01 = Initial Save Load on boot up
//          0x02 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart2() => dword(0x695D70)

// $695D74: (32-bit) Save.load indicator Part 1
//          
//          Check 0x00695d6c, 0x00695d70, 0x00695d74 (All 32-bit numbers technically)
//          
//          0x02 = Initial Save Load on boot up
//          0x03 = Save/Load in Options menu.
//          0x07 = All other time.
function saveLoadIndicatorPart3() => dword(0x695D74)

// $6D7188: (32-bit) New Officer's Melee's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerMeleeProgression() => dword(0x6D7188)

// $6D718C: (32-bit) New Officer's Combo's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerComboProgression() => dword(0x6D718C)

// $6D7190: (32-bit) New Officer's Musou's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerMusouProgression() => dword(0x6D7190)

// $6D7194: (32-bit) New Officer's Archery's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerArcheryProgression() => dword(0x6D7194)

// $6D719C: (32-bit) New Officer's Deflect's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerDeflectProgression() => dword(0x6D719C)

// $6D71A0: (32-bit) New Officer's Burst's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerBurstProgression() => dword(0x6D71A0)

// $6D71A8: (32-bit) New Officer's Riding's Progression
//          
//          0x00000000 = Novice(Starting)
//          0x00000003 = Veteren
//          0x00000006 = Expert
//          0xffffffff = Disabled
//          
//          Note: 0xffffffff is just the value, it's not actually disabling the option.
//          
//          Numnbers in between are floored (0x02 = Novice) Any number higher than 0x06 is expert
function newOfficerRidingProgression() => dword(0x6D71A8)

// Batman Forever
// #ID = 28

// $C564: (8-bit) Current level
//        
//        If this is higher than 0x00c568 you auto advance to the next level, but report that you also beat that level *shrug*
//        
//        Updates after you choose your weapons for the next level. +
function currentLevel() => byte(0x00C564)

// $C566: (8-bit) "Current Scene"
//        
//        Which scene is loaded and playing, similar to Next Scene most of the time.
//        0x00 = Scene 1
//        
//        Final Scene Level 1 0x0b
//        Final Scene Level 2 0x0e
//        Final Scene Level 3 0x07
//        Final Scene Level 4 0x0d
//        Final Scene Level 5 0x04
//        Final Scene Level 6 0x0a (Higher values were seen)
//        Final Scene Level 7 0x04 (Note 0x05 is greetings 0x06 = ending credits I believe)
//        Final Scene Level 8 0x06
//        0xff = Intro or ending
//        
//        NOTE: Not all scenes are sequencial, many are alternate paths.
function currentScene() => byte(0x00C566)

// $C568: (8-bit) Next Level
//        
//        0x00 = Level 1
//        0x07 = Final Level
//        0x08 = Won game.
//        0x00 =  End Game.
//        
//        Changes at the end of the level (Before score accruing)
function nextLevel() => byte(0x00C568)

// $C56A: (8-bit) "Next Scene"
//        
//        Which scene is going to get loaded and play.
function nextScene() => byte(0x00C56A)

// $C580: (256-bit bitfield) Health boxes picked up in the level
//        Will look at 192-bit for level 1.  More on level 2.
//        
//        Total Level 1 = 23
//        Total Level 2 = 39
//        Total Level 3 = 34
//        Total Level 4 = 43
//        Total Level 5 = 16
//        Total Level 6 = 50
//        Total Level 7 = 22
//        Total Level 8 = 31
function pickupBitField() => byte(0x00C580)

// $C5E0: (256-bit bitfield) Enemies killed in the level.
//        
//        Total Level 1 = 34
//        Total Level 2 = 64
//        Total Level 3 = 37
//        Total Level 4 = 65
//        Total Level 5 = 42
//        Total Level 6 = 61
//        Total Level 7 = 33
//        Total Level 8 = 31
function enemiesBitField() => byte(0x00C5E0)

// $C600: (256-bit bitfield) Secret Areas found in the level.
//        
//        Tested the length.
//        
//        Total Level 1 Secret Areas = 9
//        Total Level 2 Secret Areas = 2
//        Total Level 3 Secret Areas = 6
//        Total Level 4 Secret Areas = 12
//        Total Level 5 Secret Areas = 0 (Not shown)
//        Total Level 6 Secret Areas  = 10
//        Total Level 7 Secret Areas = 4
//        Total Level 8 Secret Areas = 2
function secretAreasBitfield() => byte(0x00C600)

// $D9D4: (8-bit) Lives
//        
//        0x00 = (final life)
//        0x06= Starting lives left.
//        
//        Control value.
function totalLives() => byte(0x00D9D4)

// $E6FC: (8-bit) Display Health
//        
//        See 0x00e916 for real value.  This is only what is displayed it will Lerp down)
function playerHealth() => byte(0x00E6FC)

// $E85A: (16-bit BE ) Attack Used
//        
//        0x00f0 = Batman Throw bomb
//        0x0ef2 = Batman High Kick
//        0x1a02 = Batman Slippery Goo
//        0x1cf6 = Batman Ducking Back Punch
//        0x20ef = Batman Batarang Thrown
//        0x3802 = Batman Sticky Goo
//        0x3ef1 = Batman Bat Cuffs
//        0x46f0 = Batman Bola thrown
//        0x48f6 = Batman Ducking High Kick
//        0x4aef = Batman Cape Morph
//        0x50f2 = Batman Back kick
//        0x50f7 = Batman Rolling attack
//        0x5afb = Batman Standing Guard
//        0x66f0 = Batman Electric shot
//        0x6af1 = Batman Rocket Boots
//        0x74ee = Batman High Punch
//        0x7cf2 = Batman Roundkick
//        0x86f9 = Batman Grappling hook up
//        0x88fe = Batman Ducking Back Kick
//        0x90f0 = Batman Flash Pellet
//        0x96f9 = Batman Grappling Hook
//        0xa0f1 = Batman Kick
//        0xa6f6 = Batman Sweep kick
//        0xb0f0 = Batman Force Wall
//        0xb6ef = Batman Homing Batarang
//        0xccf0 = Batman Gas Attack
//        0xd2f5 = Batman Ducking Guard
//        0xe0ef = Batman Bat Smoke
//        0xe2f6 = Batman Upper Cut
//        0xf4ee = Batman Back Punch
//        0x2af9 = Batman Head cracker (2 enemies grab)
//        0x2cf8 = Batman Grab and Headbutt
//        
//        0x3844 = Robin Low Punch
//        0x7e4d = Robin Upper Cut
//        0xb844 = Robin High Punch
//        0x0452 = Robin Block
//        0x3448 = Robin Kick
//        0x424d = Robin Sweep Attack
//        0x6445 = Robin Batarang
//        0x3846 = Robin Bat Bola
//        0x3845 = Robin Back Punch
//        0x0c47 = Robin Staff Charge
//        0x8a45 = Robin Electro Shield
//        0xc245 = Robin Homing Batarang
//        0x9e47 = Robing Traquilizer Dart
//        0xe845 = Robin Smoke Pellet
//        0xec47 = Robin Sonic Blast Weapon
//        0xee58 = Robin Sticky Goo
//        0x1048 = Robin Heat Gun
//        0x5c47 = Robin Electro Staff Prod
//        0xc247 = Robin Wrist Rivets
//        0xb046 = Robin Bat Cuffs
//        0xd646 = Robin Rocket Boots
//        0xc84f = Robin Head cracker
//        
//        0xfc99 = Inmate Pepper Spray
//        0x3c99 = Inmate Knife Hurl (really stick)
//        0x4698 = Inmate Sparky
//        0x449a = Inmate Stampede
//        0xea97 = Inmate Grab n Throw
//        
//        0xf8de = Clown Pedal Power
//        0xa6e0 = Clown Cartwheel
//        0xbae1 = Clown Sticky Spit
//        0x9aee = Clown Circus Spin
//        0xfae1 = Clown Horn
//        0x1adf = Clown Skip Rock Bomb
//        0x90e5 = Clown Smash Jump
//        
//        0x522c = Thug 1 Chainsaw Blast
//        0xb42e = Thug 1 Chainsaw Rip
//        0x3a27 = Thug 1 Homestyle Bomb
//        0xde27 = Thug 1 Here 'n There
//        0xea2d = Thug 1 Motosaw
//        0x0e2f = Thug 1 Pin
//        
//        
//        
//        0x82b2 = Riddler Thug Electroshield
//        0xe4ab = Riddler Thug Balloon Bomb
//        0x56ab = Riddler Thug Portable Hole
//        0x80b0 = Riddler Thug Stick 'n Reel
//        0xfaa0 = Riddler Thug Acid Rain
//        0x8eae = Riddler Thug No-See-Um
//        
//        0xc6f0 = Sugar/Spice Jump Warp
//        0x28ed = Sugar/Spice Pipe Bomb
//        0xb2ed = Sugar/Spice Handcuffs
//        0xbcef = Sugar/Spice Slash 'n Whirl
//        0x20f1 = Sugar/Spice Warp Kick
//        
//        
//        0xea62 = Two Face Kickflip
//        0x529f = Two Face Cut-Cut
//        0x305f = Two Face Skidtrap
//        0x029f = Two Face Buzzsaw
//        
//        0x085e = Thug 2 Puff 'o Fire
//        0xba5e = Thug 2 Ground Roaster
//        0xe865 = Thug 2 Slash
//        0xe86d = Thug 2 Shuriken Blast
//        0xa65d = Thug 2 Hot Air
//        0xf460 = Thug 2 Shuriken Rain
function playerOneAttack() => word_be(0x00E85A)

// $E916: (8-bit) Player's Health
//        
//        Health for player.
//        
//        0x50 max health.
//        0x00 Death
function playerHealthAlt() => byte(0x00E916)

// $EA2A: (8-bit) Enemy 2's Health
//        
//        Right side enemy.
//        
//        0x00 = Death.
//        Starting value will change
function enemyTWOHealth() => byte(0x00EA2A)

// $EAB2: (8-bit) Chosen Character
//        
//        0x00 = Batman
//        0x02 = Robin
//        0x04 = Inmate
//        0x06 = Clown
//        0x08 = Thug 1
//        0x0a = Thug 2
//        0x0c = Riddler Thug
//        0x0e = Sugar
//        0x12 = Two-Face
//        
//        Note: also at 0x00eab4
function chosenCharacter() => byte(0x00EAB2)

// $EAB6: (8-bit) Character selection on Character selection screen.
//        
//        Training has you choose twice.
//        
//        0x00 = Batman
//        0x02 = Robin
//        0x04 = Inmate
//        0x06 = Clown
//        0x08 = Thug 1
//        0x0a = Thug 2
//        0x0c = Riddler Thug
//        0x0e = Sugar
//        0x12 = Two-Face
function characterSelection() => byte(0x00EAB6)

// $F838: (8-bit) Training Level
//        
//        0x00 = Level 1
//        0x0f = Level 16
//        0x10 = Won
function trainingLevel() => byte(0x00F838)

// $FA24: (8-bit)  In Game Check
//        
//        0x00 = In Front end/character select
//        0x08 = In Game
function inGameCheck() => byte(0x00FA24)

// $FB90: (8-bit) Cheat code on main menu progress.
//        
//        0xfe = Normal
//        0x00 = Left
//        0x02 = Up
//        Increments by 2 up to
//        0x0a = Cheat menu open
//        
//        Note:  returns to 0x0fe after leaving that menu.
function cheatCode() => byte(0x00FB90)

// $FBAA: (8-bit) Game Mode
//        
//        0x00 = Game mode
//        0x01 = Training Mode
function gameMode() => byte(0x00FBAA)

// $FBAC: (8-bit) Players
//        
//        0x00 = 1 Player (only acceptable value)
//        0x01 = Cooperative Duo
//        0x02 = Competitive Duo
function numberOfPlayers() => byte(0x00FBAC)

// $FBB0: (8-bit) Control Method 1/2 from main menu.
//        
//        0x00 = Control Method 1
//        0x01 = Control Method 2
//        
//        Honestly I don't know what that means, nor do I care.
function controlMethod() => byte(0x00FBB0)

// $FBB2: (8-bit) Music On/Off from main menu
//        
//        0x00 = Music On
//        0x01 = Music Off
function music() => byte(0x00FBB2)

// $FBB4: (8-bit) Game Difficulty)
//        
//        0x00 = Easy
//        0x01 = Medium (default)
//        0x02 = Hard
function gameDifficulty() => byte(0x00FBB4)

// $FBB6: (8-bit) Level Selection from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Goes up to 0x07 (Level 8)
function cheatLevelSelection() => byte(0x00FBB6)

// $FBB8: (8-bit) Scene Selection from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Goes up to 0x0f Scene 16)  Note if the scene doesn't exist it appears to go back to the main menu (at least on level 8 it does)
function cheatSceneSelection() => byte(0x00FBB8)

// $FBBA: (8-bit) Pres Text from Cheat Menu.
//        
//        0x00 = Only valid number.
//        
//        Technically it's just the opening cutscene.
function cheatPresText() => byte(0x00FBBA)

// $FBBC: (8-bit) Normal or Easy Kill on Cheat Menu.
//        
//        0x00 = Normal Kill, only acceptable value.
//        
//        Easy kill makes everything spawn with 0 life.
function cheatEasyKill() => byte(0x00FBBC)

// $FBBE: (8-bit) Number of weapons from Cheat Menu
//        
//        0x00 = Two Weapons, only acceptable option.
//        0x01 = All Weapons
//        
//        (Can Batman/Robin use more than the two weapons they can equip?)
function cheatWeapons() => byte(0x00FBBE)

// $FBC0: (8-bit) Pause Cheat option in Cheat Menu
//        
//        0x00 = Off (only acceptable option)
//        0x01 = On
//        
//        If you pause the game and hit B you kill all the enemies.
//        If you pause the game and hit C you go back to the Title Screen.
function cheatPauseCheat() => byte(0x00FBC0)

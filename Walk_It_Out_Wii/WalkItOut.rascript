// Walk It Out!
// #ID = 38111

// $45FC98: (8-bit) First Player (0x00) Miss Penalty Setting
//          
//          0x00 = None
//          0x01 = One
//          0x02 = Ten
//          0x03 = ALL!
function FirstPlayer0x00MissPenaltySetting() => byte(0x45FC98)

// $45FC99: (8-bit) First Player (0x00) Capsule Value
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Very Hard
//          0x01 = Hard
//          0x02 = Normal
//          0x03 = Easy
//          0x04 = Very Easy
function FirstPlayer0x00CapsuleValue() => byte(0x45FC99)

// $45FC9A: (8-bit) First Player (0x00) Timing Window
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Hard
//          0x01 = Normal
//          0x02 = Easy
function FirstPlayer0x00TimingWindow() => byte(0x45FC9A)

// $45FC9B: (8-bit) First Player (0x00) Stepping Mode
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Quarter
//          0x01 = Half
function FirstPlayer0x00SteppingMode() => byte(0x45FC9B)

// $45FC9C: (8-bit) First Player (0x00) Lyric Settings
//          
//          This is technically reverse
//          
//          0x00 = On
//          0x01 = Off
function FirstPlayer0x00LyricSettings() => byte(0x45FC9C)

// $4632CC: (8-bit) Pause menu representation of route outside of Stadium .  This is where 0x005120fc is sent when the game is paused.  When the game isn't paused, this gets pushed back to 0x005120fc
function PauseMenuRouteOutsideStadium() => byte(0x4632CC)

// $468090: (8-bit) Award for Go Hard Easy Save Slot 1
//          
//          0x00 = Happy face or no score)
//          0x01 = Bronze Medal
//          0x02 = Silver Medal
//          0x03 = Gold Medal
//          0x04 = Diamond
function AwardForGoHardEasySaveSlot1() => byte(0x468090)

// $468091: (8-bit) Award for for Go Hard Hard Save Slot 1
//          
//          0x00 = Happy face or no score)
//          0x01 = Bronze Medal
//          0x02 = Silver Medal
//          0x03 = Gold Medal
//          0x04 = Diamond
function AwardForGoHardHardSaveSlot1() => byte(0x468091)

// $468330: (32-bit BE)  High Score for Love Me Tonight  (Player 1?)
function HighScoreForLoveMeTonight() => dword_be(0x468330)

// $468CBC: (32-bit BE) The perfect count of Love Me Tonight in  Whack-A Slack
function LoveMeTonightWhackASlackPerfectCount() => dword_be(0x468CBC)

// $469434: (32-bit BE) First Psycolo! Time Logged  (Save Slot 1)  (ID 1)  (unknown name)
//
//          0x057e3f = --:--:-- (no time logged / not completed)
//          Any other value means all 10 levels of this Psycolo song were beaten.
function FirstPsycoloTimeLoggedSaveSlot1Id1() => dword_be(0x469434)

PSYCOLO_SONG_1_BASE   = 0x469434
PSYCOLO_NO_TIME       = 0x057E3F

// $46948C: (32-bit BE) La La Land Psycolo! Time Logged  (Save Slot 1)  (ID 23)
//
//          0x057e3f = --:--:-- (no time logged / not completed)
//          Any other value means all 10 levels of this Psycolo song were beaten.
//          La La Land is song index 22 (0-based), ID 23 (1-based).
function LaLaLandPsycoloTimeLoggedSaveSlot1() => dword_be(0x46948C)

PSYCOLO_SONG_23_BASE  = 0x46948C
PSYCOLO_SONG_STRIDE   = (PSYCOLO_SONG_23_BASE - PSYCOLO_SONG_1_BASE) / 22

// $46A4C8: (32-bit) Save Slot 1 File Total Rainbows Collected
//
//          This is COMPLETED Rainbows from previous days (including potentially today's if you already have 7 spheres when you save)
function SaveSlot1FileTotalRainbowsCollected() => dword(0x46A4C8)

SAVE_SLOT_1_RAINBOW_BASE = 0x46A4C8
// SaveSlotFileTotalRainbowsCollected(save_slot_index) helper defined below after SAVE_SLOT_STRIDE is established

// $46A4F0: (16-bit BE) Save Slot 1  Saved Town-Build Purchase Total
//
//          Persistent saved total for town-building/event purchases.
//          Use with 0x50EAF0 current-session town-build purchases:
//          saved total + current-session total = Total purchased.
//
//          Total is 3346
function SaveSlot1SavedTownBuildPurchaseTotal() => word_be(0x46A4F0)

SAVE_SLOT_1_PURCHASE_BLOCK  = 0x46A4F0
SAVED_TOWN_BUILD_OFFSET     = 0x00
SAVED_ROUTE_OFFSET          = 0x02
SAVED_SONG_OFFSET           = 0x04
SAVED_MAGIC_CLOCK_OFFSET    = 0x05
SAVED_ZODIAC_OFFSET         = 0x06

// $46A4F2: (16-bit BE) Save Slot 1 Saved Route Purchase Total
//          
//          Persistent saved total for route purchases.
//          Use with 0x50EAF4 current-session route purchases:
//          saved total + current-session total.
//          
//          Total 69 routes.
function SaveSlot1SavedRoutePurchaseTotal() => word_be(0x46A4F2)

// $46A4F4: 0x46A4F4
//          (8-bit) Save Slot 1 Saved Song Purchase Total
//          
//          Persistent saved total for song purchases.
//          Use with 0x50EAF8 current-session song purchases.
//          
//          This is total SONGS not parts of song.
//          
//          Total 120 Songs.
function SaveSlot1SavedSongPurchaseTotal() => byte(0x46A4F4)

// $46A4F5: (8-bit) Save Slot 1 Saved Magic Clock Purchase Total
//          
//          Persistent saved total for magic clock purchases.
//          Use with 0x50EAFC current-session magic clock purchases.
//          This is full clocks
//          
//          Total clocks 24
function SaveSlot1SavedMagicClockPurchaseTotal() => byte(0x46A4F5)

// $46A4F6: 0x46A4F6
//          (8-bit) Save Slot 1 Saved Zodiac Purchase Total / Completion
//          
//          Persistent saved zodiac purchase/completion value.
//          Use with 0x50EB00 current-session zodiac purchases.
//          
//          
//          Total Zodiacs 12
function SaveSlot1SavedZodiacPurchaseTotal() => byte(0x46A4F6)

// $4743D0: (8-bit) Second player (0x01) Miss Penalty Setting.
//          
//          Please see 0x45fc98 for all information.
function SecondPlayer0x01MissPenaltySetting() => byte(0x4743D0)

// $47DBC4: (32-bit BE) La La Land Psycolo! Time Logged  (Second Save Slot)  (ID 23)
//
//          0x057e3f = --:--:-- (no time logged / not completed)
//          Any other value means all 10 levels of this Psycolo song were beaten.
//          Slot stride confirmed: 0x47DBC4 - 0x46948C = SAVE_SLOT_STRIDE (0x14738)
function LaLaLandPsycoloTimeLoggedSecondSaveSlot() => dword_be(0x47DBC4)

function PsycoloSongTimeLogged(save_slot_index, song_index) =>
    dword_be(PSYCOLO_SONG_1_BASE + save_slot_index * SAVE_SLOT_STRIDE + song_index * PSYCOLO_SONG_STRIDE)

function PsycoloSongCompleted(save_slot_index, song_index) =>
    PsycoloSongTimeLogged(save_slot_index, song_index) != PSYCOLO_NO_TIME

function ActivePlayerPsycoloSongCompleted(song_index) =>
    PsycoloSongCompleted(WhichSaveFileIsBeingUsedForPlayer1(), song_index)

// $47EC28: (16-bit BE) Save Slot 2 Saved Town Build Purchase Total.
//
//          Save Slot index mapping (0-based):
//          0 = Save Slot 1 / Link   (0x46A4F0)
//          1 = Save Slot 2 / 1P     (0x47EC28)
//          2 = Save Slot 3          (0x493360, predicted)
//          3 = Save Slot 4 / Zelda  (0x4A7A98, predicted)
function SaveSlot2SavedTownBuildPurchaseTotal() => word_be(0x47EC28)

SAVE_SLOT_2_PURCHASE_BLOCK = 0x47EC28
SAVE_SLOT_STRIDE = SAVE_SLOT_2_PURCHASE_BLOCK - SAVE_SLOT_1_PURCHASE_BLOCK

function SaveSlotFileTotalRainbowsCollected(save_slot_index) =>
    dword(SAVE_SLOT_1_RAINBOW_BASE + save_slot_index * SAVE_SLOT_STRIDE)

function SaveSlotPurchaseBlock(save_slot_index) =>
    SAVE_SLOT_1_PURCHASE_BLOCK + save_slot_index * SAVE_SLOT_STRIDE

function SaveSlotSavedTownBuildPurchaseTotal(save_slot_index) =>
    word_be(SaveSlotPurchaseBlock(save_slot_index) + SAVED_TOWN_BUILD_OFFSET)

function SaveSlotSavedRoutePurchaseTotal(save_slot_index) =>
    word_be(SaveSlotPurchaseBlock(save_slot_index) + SAVED_ROUTE_OFFSET)

function SaveSlotSavedSongPurchaseTotal(save_slot_index) =>
    byte(SaveSlotPurchaseBlock(save_slot_index) + SAVED_SONG_OFFSET)

function SaveSlotSavedMagicClockPurchaseTotal(save_slot_index) =>
    byte(SaveSlotPurchaseBlock(save_slot_index) + SAVED_MAGIC_CLOCK_OFFSET)

function SaveSlotSavedZodiacPurchaseTotal(save_slot_index) =>
    byte(SaveSlotPurchaseBlock(save_slot_index) + SAVED_ZODIAC_OFFSET)

// $49D240: (8-bit) Player 0x03 Miss Penalty Setting
//          
//          0x00 = None
//          0x01 = One
//          0x02 = Ten
//          0x03 = ALL!
function Player0x03MissPenaltySetting() => byte(0x49D240)

// $49D241: (8-bit) Player 0x03 Capsule Value
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Very Hard
//          0x01 = Hard
//          0x02 = Normal
//          0x03 = Easy
//          0x04 = Very Easy
function Player0x03CapsuleValue() => byte(0x49D241)

// $49D242: (8-bit) Player 0x03 Timing Window
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Hard
//          0x01 = Normal
//          0x02 = Easy
function Player0x03TimingWindow() => byte(0x49D242)

// $49D243: (8-bit) Player 0x03 Stepping Mode
//          
//          THIS IS REVERSED THIS IS INTENTIONAL.
//          
//          0x00 = Quarter
//          0x01 = Half
function Player0x03SteppingMode() => byte(0x49D243)

// $49D244: (8-bit) Player 0x03 Lyric Settings
//          
//          This is technically reverse
//          
//          0x00 = On
//          0x01 = Off
function Player0x03LyricSettings() => byte(0x49D244)

// $4A7A98: (16-bit BE) Save Slot 4 Town Build Purchase Total
function SaveSlot4TownBuildPurchaseTotal() => word_be(0x4A7A98)


// $50EABC: (32-bit) Points (Coins) currently held.
//          
//          Note this is NOT Saved.  so you can trust this is earned this session.
function PointsCoinsCurrentlyHeld() => dword(0x50EABC)

// $50EAC0: (32-bit) Steps this session
function StepsThisSession() => dword(0x50EAC0)

// $50EAD8: (32-bit) Current Session's Perfects
//          
//          0x0000 Start
//          0x0190 = 400 Perfects, Gold Medal
//          0x03eb =  1000 Perfect Diamond Medal
function CurrentSessionsPerfects() => dword(0x50EAD8)

// $50EADC: (32-bit) Current Session's Greats
function CurrentSessionsGreats() => dword(0x50EADC)

// $50EAE4: (32-bit) Calories Burnt this session
//          
//          THIS IS NOT CALORIES AS YOU KNOW THEM.
//          
//          Calories as you think about them are kilocalories. You say you burnt 1000 calories, you really burnt 1000 kilocalories, this is measured in ACTUAL small calories, but will be displayed in kilo calories.
//          
//          Calories are stupid.
//          
//          200,000 small Calories (value here) = Gold medal
//          500,000 small Calories = Diamond
function CaloriesBurntThisSession() => dword(0x50EAE4)

// $50EAE8: (32-bit BE) Current Session Distance (in Meters)
//          
//          Starts at 0x000.
//          2000 = Gold Medals
//          5000 = Diamond Medals.
//          
//          This rounds (so 7dc = 1.3 miles  7db = 1.2 miles
function CurrentSessionDistance() => dword_be(0x50EAE8)

// $50EAF0: (32-bit) Town-build Events Purchases this session
//
//          0x0000 = Starting Value
//          3346 (Decimal) = Max.
//
//          Note this is a control when in the game, but in the pause menu... It will be copied over when you go back to the game.  Makes total sense (/s)
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//
//          ACHIEVEMENT NOTE: This session counter must be the value that changes to
//          reach the threshold. Use prev(TownbuildEventsPurchasesThisSession()) in
//          triggers to ensure a real purchase happened — not a save file edit.
function TownbuildEventsPurchasesThisSession() => dword(0x50EAF0)

function TotalTownBuildPurchases() =>
    SaveSlotSavedTownBuildPurchaseTotal(WhichSaveFileIsBeingUsedForPlayer1()) + TownbuildEventsPurchasesThisSession()

// $50EAF4: (32-bit) Routes Purchases this session
//
//          0x0000 = Starting Value
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//
//          ACHIEVEMENT NOTE: This session counter must be the value that changes to
//          reach the threshold. Use prev(RoutespurchasesThisSession()) in triggers.
function RoutespurchasesThisSession() => dword(0x50EAF4)

function TotalRoutePurchases() =>
    SaveSlotSavedRoutePurchaseTotal(WhichSaveFileIsBeingUsedForPlayer1()) + RoutespurchasesThisSession()

// $50EAF8: (32-bit) Song Purchases this session
//
//          0x0000 = Starting Value
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//
//          ACHIEVEMENT NOTE: This session counter must be the value that changes to
//          reach the threshold. Use prev(SongPurchasesThisSession()) in triggers.
function SongPurchasesThisSession() => dword(0x50EAF8)

function TotalSongPurchases() =>
    SaveSlotSavedSongPurchaseTotal(WhichSaveFileIsBeingUsedForPlayer1()) + SongPurchasesThisSession()

// $50EAFC: (32-bit) Magic Clocks Purchases this session
//
//          0x0000 = Starting Value
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//
//          ACHIEVEMENT NOTE: This session counter must be the value that changes to
//          reach the threshold. Use prev(MagicClocksPurchasesThisSession()) in triggers.
function MagicClocksPurchasesThisSession() => dword(0x50EAFC)

function TotalMagicClockPurchases() =>
    SaveSlotSavedMagicClockPurchaseTotal(WhichSaveFileIsBeingUsedForPlayer1()) + MagicClocksPurchasesThisSession()

// $50EB00: (32-bit) Zodiac Purchases this session
//
//          0x0000 = Starting Value
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//
//          ACHIEVEMENT NOTE: This session counter must be the value that changes to
//          reach the threshold. Use prev(ZodiacPurchasesThisSession()) in triggers.
function ZodiacPurchasesThisSession() => dword(0x50EB00)

function TotalZodiacPurchases() =>
    SaveSlotSavedZodiacPurchaseTotal(WhichSaveFileIsBeingUsedForPlayer1()) + ZodiacPurchasesThisSession()

// $50EB04: (32-bit) Rainbow Pieces Purchased this session
//
//          0x0000 = Starting Value
//
//          This gets added to the Total BUT is set to 0 when loading the save.
//          Note, the total is not necessarily going to add up to 7.
//
//          ACHIEVEMENT NOTE: Use prev(RainbowPiecesCollectedToday()) == 6 &&
//          RainbowPiecesCollectedToday() == 7 to detect a completed rainbow.
function RainbowPiecesPurchasedThisSession() => dword(0x50EB04)

function TotalRainbowsCollected() =>
    SaveSlotFileTotalRainbowsCollected(WhichSaveFileIsBeingUsedForPlayer1())

// $50EBC4: (32-bit) Upcoming Direction
//          
//          In the Stadium this is
//          
//          0x0 = Stay in the Stadium
//          0x01 = Leave Stadium
//          
//          Modifying this DOES change the route, anything above 0x01 means turn around.  Since there are three way paths, I assume it's anything more than the highest.
//          
//          Leaving the stadium
//          
//          0x00 = Forward
//          0x01 = Left
//          0x02 = Right
//          
//          Note 0x00 is not always "straight" Seems like a direction based on direction you're approaching
function UpcomingDirection() => dword(0x50EBC4)

// $5120FC: (8-bit) In World Representation of Route outside of Stadium.
//          
//          Set to 0x01 at the beginning, when purchased it becomes 0x02
//          
//          This is for the IN WORLD experience.  This does not control the map.
//          
//          It appears for the map, Three values must be set.  0x15120f9
function InWorldRepresentationOfRouteOutsideOfStadium() => byte(0x5120FC)

// $512A92: (8-bit) Status for a  random Street light near the stadium
//          
//          This is just a random purchase, but I want to use it to detail the purchase system.
//          
//          0x00 = Starting Value, purchasable
//          0x01 = In the Queue to be purchased (Top of the screen, the 3 bubbles) .
//          0x02 = Purchase paid off, Object is not unlocked.
//          0x03 = Object appears
//          
//          All other values appear the purchase disappear BUT not display the object.
//          
//          
//          There's not a good rhyme or reason to the layout of this memory, but this is how it works, a single object however can be found with this data.
function StatusForARandomStreetLightNearTheStadium() => byte(0x512A92)

// $5166B4: (Array of 3 32-bit BE Pointer) Three Queued Objects to be purchased by the player.
//          
//          Not sure what this is a pointer to, or if this is an index, however the purchased object are not the correct bytes apart (0x57e48 here = is about 8 bytes away from 0x57e40 here)
function ArrayOf3_32BitBePointerThreeQueuedObjectsToBePurchasedByThePlayer() => dword_be(0x5166B4)

// $51CD3B: (8-bit) Rainbows Pieces Collected "Today"
//          
//          Note this will set to to how many rainbow pieces you have collected today (Even if you save and quit).  This is a derived value.  Changing this doesn't affect anything.
//          
//          However if the player goes from 6 to 7, with the same save file, that likely means they completed a Rainbow.
function RainbowPiecesCollectedToday() => byte(0x51CD3B)

// $51CE1B: (8-bit) Which Save file is being used.for player 1
function WhichSaveFileIsBeingUsedForPlayer1() => byte(0x51CE1B)

// $51CF34: (32-bit BE)  Minigame Selection
//          
//          0x00 = Whack-A-Slack!
//          0x01 = Psycholo!
//          0x02 = SMASH & RUN!
function MinigameSelection() => dword_be(0x51CF34)

// $51CF38: (32-bit BE) single/endless Game decision
//          
//          0x00 = Single
//          0x01 = Endless
function SingleEndlessGameDecision() => dword_be(0x51CF38)

// $51CF3C: (32-bit BE) Mini Game Difficulties.  Need to dig in more.
function MinigameDifficultySelection() => dword_be(0x51CF3C)

// $81B888: (32-bit BE) Score for Smash and Grab
function ScoreForSmashAndRun() => dword_be(0x81B888)

// $81BE67: (8-bit) Stage Number for Smash and Run.
//          
//          0x01 = Stage 1
function StageNumberForSmashAndRun() => byte(0x81BE67)

// $820C08: (32-bit BE)  Perfects during the Whack-a-mole game.
function WhackASlackPerfectsThisRound() => dword_be(0x820C08)

// $820C0C: (32-bit BE)  Greats during the Whack-a-mole game.
function WhackASlackGreatsThisRound() => dword_be(0x820C0C)

// $820C10: (32-bit BE)  Good during the Whack-a-mole game.
function WhackASlackGoodsThisRound() => dword_be(0x820C10)

// $B35060: (32-bit) Settings Penalty.
//          
//          Note this is on the Settings menu, but if you back out of it, those values are NOT applied.   Do not use this.
function SettingsPenalty() => dword(0xB35060)

// $B3595C: (32-bit BE) La La Land Psychocolo High Score Logged
function LaLaLandPsychocoloHighScoreLogged() => dword_be(0xB3595C)

// $B3599C: (32-bit BE) La La Land Psychocolo Time Logged   (ID 26)
//          
//          0x057e3f = --:--:--
//          Other values means there's a time logged.
//          Time logged means player beat ALL 10 levels of PSychocolo.
function LaLaLandPsychocoloTimeLogged() => dword_be(0xB3599C)

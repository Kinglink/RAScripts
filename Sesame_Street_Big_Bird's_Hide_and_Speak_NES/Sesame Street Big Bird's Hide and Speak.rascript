// Sesame Street: Big Bird's Hide and Speak
// #ID = 1937

// $001c: (8-bit) Entrance trigger
//
//        0x0a = Normal gameplay
//        0x0b = Character intros 
function entranceTrigger() => byte(0x00001C)

function characterIntro() => entranceTrigger() == 0x0b

// $001D: (8-bit) How many correct
function correctAnswers() => byte(0x00001D)

// $002A: (8-bit) Game 6 score.
//        
//        0xff = 0 Words
//        0x00 = 1 word spelt
function game6Score() => byte(0x00002A)

// $01FA: (8-bit) Which game are you playing.
//        
//        0x00 = Open window Find Character
//        0x01 = Closed Window Find Character
//        0x00 = Open window Find Letter
//        0x01 = Closed Window Find Letter
//        0x00 = Open window Find Spell Word
//        0x01 = Closed Window Sun Run
function gameChosen() => byte(0x0001FA)

// $020F: (8-bit) Whose mid round cutscene are we seeing.
//        
//        0x00-0x04 from 0x26 values.
//        
//        0x05 if not showing a cutscene.
function midRoundCutscene() => byte(0x00020F)

function finishedLevel(target) => prev(midRoundCutscene()) == 0x05 &&
                                  midRoundCutscene() != 0x05 &&
                                  correctAnswers() == target &&
                                  !characterIntro()

// $0253: (8-bit) Game 6 timer
//
//        0x00- 0x056
//
//        At 0x056 Game is reset. p
function game6Timer() => byte(0x253)


achievement(title = "You Know the Characters!",
            description = "Beat Game 1",
            points = 1,
            trigger = gameChosen() == 0x00 && finishedLevel(4))

achievement(title = "You Remember the Characters!",
            description = "Beat Game 2",
            points = 1,
            trigger = gameChosen() == 0x01 && finishedLevel(4))

achievement(title = "You Know the Letters!",
            description = "Beat Game 3",
            points = 1,
            trigger = gameChosen() == 0x02 && finishedLevel(4))

achievement(title = "You Remember the Letters!",
            description = "Beat Game 4",
            points = 1,
            trigger = gameChosen() == 0x03 && finishedLevel(4))

achievement(title = "You Can Spell!",
            description = "Beat Game 5",
            points = 1,
            trigger = gameChosen() == 0x04 && finishedLevel(0))

achievement(title = "Spelling Bee",
            description = "Spell 5 words in Game 6 in one round",
            points = 1,
            trigger = gameChosen() == 0x05 && prev(game6Score()) == 0x03 && game6Score() == 0x04)

achievement(title = "Spelling Master",
            description = "Spell 10 words in Game 6 in one round",
            points = 3,
            trigger = gameChosen() == 0x05 && prev(game6Score()) == 0x08 && game6Score() == 0x09)

achievement(title = "Spelling Wizard",
            description = "Spell 15 words in Game 6 in one round",
            points = 5,
            trigger = gameChosen() == 0x05 && prev(game6Score()) == 0x0d && game6Score() == 0x0e)
            
achievement(title = "You've Met All Your New Friends",
            description = "Watch all the character round celebrations.  (Game 1-5)",
            points = 3,
            trigger = measured(tally_of(range(0x00, 0x04), 5, index => once(prev(midRoundCutscene()) == 0x05 && midRoundCutscene() == index))) &&
                      unless(gameChosen() == 0x05)
)

rich_presence_conditional_display( gameChosen() == 0x0, "is Meeting the Characters")
rich_presence_conditional_display( gameChosen() == 0x1, "is Remembering the Characters")
rich_presence_conditional_display( gameChosen() == 0x2, "is Learning the Letters")
rich_presence_conditional_display( gameChosen() == 0x3, "is Remembering the Letters")
rich_presence_conditional_display( gameChosen() == 0x4, "is Spelling Words")
rich_presence_conditional_display( gameChosen() == 0x5, "is Speed Spelling Words")
rich_presence_display("Is Doing Something Else")
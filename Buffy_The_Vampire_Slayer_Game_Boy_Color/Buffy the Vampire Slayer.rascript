// Buffy the Vampire Slayer
// #ID = 7109

// $C2C3: (8-bit) Level ID
//        
//        Note: This changes before the intro cutscene
//        
//        0x00 = Initial (does not appear after death))
//        0x01 = The Graveyard
//        0x02 = The Bronze
//        0x03 =The Sewers
//        0x04 = The Zoo
//        0x05 = The Mansion
//        0x06 = The Initiative Lab
//        0x07 = The Hellmouth
//        0x08 =The Chamber
//        0xff = Password
function levelID() => byte(0x00C2C3)

PASSWORD_VALUE = 0xff

// $C74B: (8-bit) Health
//        
//        0x00 = Dead
//        0x7f = Full
function health() => byte(0x00C74B)

// $C74D: (8-bit) Stamina
//        
//        0x00 = Instant knock down.  (Can be knocked down at higher stamina)
//        0x3f = Full
//        
//        
//        
//        3f=FULL
function stamina() => byte(0x00C74D)

// $E75A: (8-bit) Cola Cans collected
//        
//        Control for How many cans have been picked up.  Not sure it actually changes anything, but does control the visual display of it.
function colaCans() => byte(0x00C75A)

// $C7DF: (8-bit) Enemy's Stamina
//        
//        0x00 = Instant Knock Down  (Can be knocked down with a leg sweep or a throw before this)
//        0x3f = Full
function enemyStamina() => byte(0x00C7DF)

function mainMenu() => byte(0x9292) == 0x00 && 
                       byte(0x9294) == 0x00 &&
                       byte(0x9315) == 0x00

function prevMainMenu() => prev(byte(0x9292)) == 0x00 && 
                           prev(byte(0x9294)) == 0x00 &&
                           prev(byte(0x9315)) == 0x00

FIRST_LEVEL = 0x01
LAST_LEVEL = 0x08
LEVEL = "LEVEL"
TITLE = "TITLE"
DESCRIPTION = "DESCRIPTION"
POINTS = "POINTS"
TYPE = "TYPE"
NO_DAMAGE_TITLE = "No Damage"
NO_DAMAGE_DESCRIPTION = "NO_DAMAGE_DESCRIPTION"
NO_DAMAGE_POINTS = "NO_DAMAGE_POINTS"

achievement( title = "Pepsi is Better",
             description = "Collect a can of generic Cola Can",
             points = 1,
             trigger = colaCans() == 1 &&
                       prev(colaCans()) == 0
)


levelAchievementData = 
[
    {
        LEVEL: 0x01,
        TITLE: "Ooooh a Spooky Graveyyard",
        DESCRIPTION: "Complete the Graveyard",
        TYPE: "Progression",
        POINTS: 2,
        NO_DAMAGE_TITLE: "A Nightly Graveyard Patrol",
        NO_DAMAGE_DESCRIPTION: "Complete the Graveyard without taking health damage",
        NO_DAMAGE_POINTS: 2
    },
    {
        LEVEL: 0x02,
        TITLE: "A Trip to the Bronze",
        DESCRIPTION: "Complete the Bronze",
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "Dancing All Night Long",
        NO_DAMAGE_DESCRIPTION: "Complete the Bronze without taking health damage",
        POINTS: 2,
        NO_DAMAGE_POINTS: 3
    },
    {
        LEVEL: 0x03,
        TITLE: "Of Course There's a Sewer Level",
        DESCRIPTION: "Complete the Sewers",
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "Hope You Brought Your Boots",
        NO_DAMAGE_DESCRIPTION: "Complete the Sewers without taking health damage",
        POINTS: 3,
        NO_DAMAGE_POINTS: 3
    },
    {
        LEVEL: 0x04,
        TITLE: "Don't Go in the Hyena House",
        DESCRIPTION: "Complete the Zoo",
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "Night at the Zoo",
        NO_DAMAGE_DESCRIPTION: "Complete the Zoo without taking health damage",
        POINTS: 4,
        NO_DAMAGE_POINTS: 10
    },
    {
        LEVEL: 0x05,
        TITLE: "Generic Mansion: Check",
        DESCRIPTION: "Complete the Mansion",
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "House Party",
        NO_DAMAGE_DESCRIPTION: "Complete the Mansion without taking health damage",
        POINTS: 5,
        NO_DAMAGE_POINTS: 10
    },
    {
        LEVEL: 0x06,
        TITLE: "There’s a Lot of Vampires in This Lab",
        DESCRIPTION: "Complete the Initiative Lab",
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "Science!",
        NO_DAMAGE_DESCRIPTION: "Complete the Initiative Lab without taking health damage",
        POINTS: 5,
        NO_DAMAGE_POINTS: 10
    },
    {
        LEVEL: 0x07,
        TITLE: "Egyptian Hellmouth",
        DESCRIPTION: "Complete the Hellmouth",
        POINTS: 10,
        TYPE: "Progression",
        NO_DAMAGE_TITLE: "Hellmouth? More Like Hell Yeah!",
        NO_DAMAGE_DESCRIPTION: "Complete the Hellmouth without taking health damage",
        NO_DAMAGE_POINTS: 25
    },
    {
        LEVEL: 0x08,
        TITLE: "Jus Another Day Living on a Hellmouth",
        DESCRIPTION: "Complete the game",
        TYPE: "Progression",
        POINTS: 10,
        NO_DAMAGE_TITLE: "Even the Devil Can't Touch You",
        NO_DAMAGE_DESCRIPTION: "Complete the Chamber (Final Level) without taking health damage",
        NO_DAMAGE_POINTS: 25
    }
]

for data in levelAchievementData
{
    achievement( title = data[TITLE] ,
                 description = data[DESCRIPTION],
                 points = data[POINTS], 
                 type = data[TYPE],
                 trigger = levelID() == data[LEVEL] + 1 &&
                           prev(levelID()) == data[LEVEL]
    )
}  

for data in levelAchievementData 
{
    onceTrigger = once(levelID() == data[LEVEL] && 
                       prev(levelID()) != data[LEVEL]) 
    if(data[LEVEL] == 1)
    {
        onceTrigger = once(prevMainMenu() && !mainMenu() && levelID() == data[LEVEL])
    }
    achievement( title = data[NO_DAMAGE_TITLE] ,
                 description = data[NO_DAMAGE_DESCRIPTION],
                 points = data[NO_DAMAGE_POINTS],
                 type = "Missable",
                 trigger = onceTrigger &&
                           never (levelID() != data[LEVEL] && 
                                  levelID() != data[LEVEL] + 1) &&
                           never(health() < prev(health()) && health() != 0x00) && // The game flashing 0x00 for one frame when entering a level. 
                           trigger_when(levelID() == data[LEVEL] + 1 &&
                                        prev(levelID()) == data[LEVEL])
                           
    )
}

achievement( title = "The Slayer",
             description = "Complete the game without continuing",
             points = 25,
             type = "Missable",
             trigger = once(levelID() == FIRST_LEVEL) &&
                       never(levelID() == PASSWORD_VALUE) &&
                       never(mainMenu()) &&
                       trigger_when(levelID() == LAST_LEVEL + 1 &&
                                    prev(levelID()) == LAST_LEVEL)
)

levelLookup = 
{
    0x01: "The Graveyard",
    0x02: "The Bronze",
    0x03: "The Sewers",
    0x04: "The Zoo",
    0x05: "The Mansion",
    0x06: "The Initiative Lab",
    0x07: "The Hellmouth",
    0x08: "The Chamber"
}


rich_presence_conditional_display( mainMenu(), "Main Menu")

rich_presence_display( "Buffy is fighting through {0}",
                       rich_presence_lookup("LevelLookup", levelID(), levelLookup))
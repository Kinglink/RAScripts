// Tokyo Xtreme Racer 3
// #ID = 20776

function timeConversion(minutes, seconds) => ((minutes * 60) +seconds) * 60

TokyoTeamInformation = [
    {
        "TeamName": "Rolling Guy", 
        "TeamLeader": "Rolling Guy 1",
        "TeamLeaderID": 1,
        "LastMember": 6,
        "Points":2
    },
    {
        "TeamName": "Fine Drive", 
        "TeamLeader": "Shooting star",
        "TeamLeaderID": 7,
        "LastMember": 14,
        "Points":2
    },
    {
        "TeamName": "SS Limited", 
        "TeamLeader": "Evening Star",
        "TeamLeaderID": 15,
        "LastMember": 22,
        "Points":2
    },
    {
        "TeamName": "The Road of Justice", 
        "TeamLeader": "Hearing Master",
        "TeamLeaderID": 86,
        "LastMember": 92,
        "Points":2
    },
    {
        "TeamName": "Rings", 
        "TeamLeader": "Outstanding Jackle",
        "TeamLeaderID": 93,
        "LastMember": 100,
        "Points":2
    },
    {
        "TeamName": "Galaxy Racers", 
        "TeamLeader": "Mister Othello",
        "TeamLeaderID": 23,
        "LastMember": 29,
        "Points":2
    },
    {
        "TeamName": "Max Racing", 
        "TeamLeader": "Bloody Rose",
        "TeamLeaderID": 30,
        "LastMember": 37,
        "Points":2
    },
    {
        "TeamName": "Twister", 
        "TeamLeader": "The Incadescent Flame",
        "TeamLeaderID": 38,
        "LastMember": 44,
        "Points":2
    },
    {
        "TeamName": "Ratt", 
        "TeamLeader": "The Monkey",
        "TeamLeaderID": 101,
        "LastMember": 107,
        "Points":2
    },
    {
        "TeamName": "Departures", 
        "TeamLeader": "Happy Chappy",
        "TeamLeaderID": 108,
        "LastMember": 113,
        "Points":2
    },
    {
        "TeamName": "Diamond Image", 
        "TeamLeader": "Lightning Shift, Takuya",
        "TeamLeaderID": 45,
        "LastMember": 51,
        "Points":2
    },
    {
        "TeamName": "Wind Stars", 
        "TeamLeader": "Wolf Requiem",
        "TeamLeaderID": 52,
        "LastMember": 58,
        "Points":2
    },
    {
        "TeamName": "Highway Outlaw", 
        "TeamLeader": "Spirit Crasher",
        "TeamLeaderID": 59,
        "LastMember": 65,
        "Points":2
    },
    {
        "TeamName": "Explosion", 
        "TeamLeader": "Wind Monster",
        "TeamLeaderID": 114,
        "LastMember": 119,
        "Points":2
    },
    {
        "TeamName": "Top Level", 
        "TeamLeader": "Tarmac Suzuki",
        "TeamLeaderID": 120,
        "LastMember": 126,
        "Points":2
    },
    {
        "TeamName": "R.Gangs", 
        "TeamLeader": "Shiver Drift Dancer",
        "TeamLeaderID": 66,
        "LastMember": 72,
        "Points":2
    },
    {
        "TeamName": "Tokio Jungle", 
        "TeamLeader": "Io",
        "TeamLeaderID": 73,
        "LastMember": 79,
        "Points":2
    },
    {
        "TeamName": "Cupid Arrows", 
        "TeamLeader": "Sonic Runner",
        "TeamLeaderID": 80,
        "LastMember": 85,
        "Points":2
    },
    {
        "TeamName": "Another Star", 
        "TeamLeader": "Blue Speed",
        "TeamLeaderID": 127,
        "LastMember": 131,
        "Points":2
    },
    {
        "TeamName": "Free Way", 
        "TeamLeader": "The Blue Star",
        "TeamLeaderID": 132,
        "LastMember": 139,
        "Points":2
    },
    {
        "TeamName": "True Ride", 
        "TeamLeader": "Perfect Driver",
        "TeamLeaderID": 140,
        "LastMember": 147,
        "Points":2
    },
    {
        "TeamName": "Unlimited", 
        "TeamLeader": "Killing Machine",
        "TeamLeaderID": 148,
        "LastMember": 155,
        "Points":2
    },
    {
        "TeamName": "R.R.", 
        "TeamLeader": "The Nobleman",
        "TeamLeaderID": 156,
        "LastMember": 163,
        "Points":2
    },
    {
        "TeamName": "Neo Limited", 
        "TeamLeader": "Lemon Flavor",
        "TeamLeaderID": 164,
        "LastMember": 170,
        "Points":2
    },
    {
        "TeamName": "Sanjyushi", 
        "TeamLeader": "The Forbidden Privateer",
        "TeamLeaderID": 171,
        "LastMember": 176,
        "Points":2
    },
    {
        "TeamName": "Big Wave", 
        "TeamLeader": "The Master",
        "TeamLeaderID": 177,
        "LastMember": 184,
        "Points":2
    },
    {
        "TeamName": "A.P.S.", 
        "TeamLeader": "Yokohane's Heavy Fighter",
        "TeamLeaderID": 185,
        "LastMember": 191,
        "Points":2
    },
    {
        "TeamName": "Commander", 
        "TeamLeader": "Senna's Foot",
        "TeamLeaderID": 192,
        "LastMember": 199,
        "Points":2
    },
    {
        "TeamName": "Miracle Dogs", 
        "TeamLeader": "The Sepherd",
        "TeamLeaderID": 200,
        "LastMember": 205,
        "Points":2
    },
    {
        "TeamName": "Speed Master", 
        "TeamLeader": "The Insane moon",
        "TeamLeaderID": 206,
        "LastMember": 215,
        "Points":2
    },
    {
        "TeamName": "Knife and Forks", 
        "TeamLeader": "Matchless Full Course",
        "TeamLeaderID": 216,
        "LastMember": 222,
        "Points":2
    },
    {
        "TeamName": "Team Alpha", 
        "TeamLeader": "Texas Wolf",
        "TeamLeaderID": 223,
        "LastMember": 228,
        "Points":2
    },
    {
        "TeamName": "Rhythm Box", 
        "TeamLeader": "Hip-hop Red",
        "TeamLeaderID": 229,
        "LastMember": 234,
        "Points":2
    },
    {
        "TeamName": "Thunder Dragoon", 
        "TeamLeader": "Black Dragon",
        "TeamLeaderID": 235,
        "LastMember": 241,
        "Points":2
    },
    {
        "TeamName": "Infinity", 
        "TeamLeader": "Marvelous",
        "TeamLeaderID": 242,
        "LastMember": 248,
        "Points":2
    },
]

TokyoBoss = [
    {
        "BossName": "Betrayal Jack Knife", 
        "BossID": 249,
        "Points":2
    },
    {
        "BossName": "Blood Hound", 
        "BossID": 250,
        "Points":2
    },
    {
        "BossName": "Dejected Angel", 
        "BossID": 251,
        "Points":2
    },
    {
        "BossName": "Steal Heart", 
        "BossID": 252,
        "Points":2
    },
    {
        "BossName": "Dying Star", 
        "BossID": 253,
        "Points":2
    },
    {
        "BossName": "Midnight Rose", 
        "BossID": 254,
        "Points":2
    },
    {
        "BossName": "Pursuit Tailgunner", 
        "BossID": 255,
        "Points":2
    },
    {
        "BossName": "Shadow Eyes", 
        "BossID": 256,
        "Points":2
    },
    {
        "BossName": "Pluto", 
        "BossID": 257,
        "Points":2
    },
    {
        "BossName": "The Red Devil", 
        "BossID": 258,
        "Points":2
    },
    {
        "BossName": "Jintei", 
        "BossID": 259,
        "Points":2
    },    
]

TokyoWanderers = [
    {
        "WanderersName": "Rikochan", 
        "WanderersID": 260,
        "Points":2
    },
    {
        "WanderersName": "The Divine Wind", 
        "WanderersID": 261,
        "Points":2
    },
    {
        "WanderersName": "White Tiger", 
        "WanderersID": 262,
        "Points":2
    },
    {
        "WanderersName": "Immortal Clown", 
        "WanderersID": 263,
        "Points":2
    },
    {
        "WanderersName": "Sorrow SIX STAR", 
        "WanderersID": 264,
        "Points":2
    },
    {
        "WanderersName": "Straying Idol Freak", 
        "WanderersID": 265,
        "Points":2
    },
    {
        "WanderersName": "Bloody Mary", 
        "WanderersID": 266,
        "Points":2
    },
    {
        "WanderersName": "Illusion B", 
        "WanderersID": 267,
        "Points":2
    },
    {
        "WanderersName": "Caffeine X3", 
        "WanderersID": 268,
        "Points":2
    },
    {
        "WanderersName": "Paul Suzuki", 
        "WanderersID": 269,
        "Points":2
    },
    {
        "WanderersName": "Funabashi Hooligan", 
        "WanderersID": 270,
        "Points":2
    },
    {
        "WanderersName": "Rolling Master", 
        "WanderersID": 271,
        "Points":2
    },
    {
        "WanderersName": "The Death Driver", 
        "WanderersID": 272,
        "Points":2
    },
    {
        "WanderersName": "Shutokou Leader", 
        "WanderersID": 273,
        "Points":2
    },
    {
        "WanderersName": "Mosquito Lemon", 
        "WanderersID": 274,
        "Points":2
    },
    {
        "WanderersName": "Wild Child", 
        "WanderersID": 275,
        "Points":2
    },
    {
        "WanderersName": "Crossroad Queen", 
        "WanderersID": 276,
        "Points":2
    },
    {
        "WanderersName": "Yellow Desperado", 
        "WanderersID": 277,
        "Points":2
    },
    {
        "WanderersName": "Gold License", 
        "WanderersID": 278,
        "Points":2
    },
    {
        "WanderersName": "Master Position", 
        "WanderersID": 279,
        "Points":2
    },
    {
        "WanderersName": "Glamorous Mami", 
        "WanderersID": 280,
        "Points":2
    },
    {
        "WanderersName": "Raspberry Kiss", 
        "WanderersID": 281,
        "Points":2
    },
    {
        "WanderersName": "Kaoru", 
        "WanderersID": 282,
        "Points":2
    },
    {
        "WanderersName": "Cutie Hip", 
        "WanderersID": 283,
        "Points":2
    },
    {
        "WanderersName": "Drift Samurai", 
        "WanderersID": 284,
        "Points":2
    },
    {
        "WanderersName": "Silver Wolf", 
        "WanderersID": 285,
        "Points":2
    },
    {
        "WanderersName": "VIP Style", 
        "WanderersID": 286,
        "Points":2
    },
    {
        "WanderersName": "Dirty HATO", 
        "WanderersID": 287,
        "Points":2
    },
    {
        "WanderersName": "PAst 12 o'clock Cinderella", 
        "WanderersID": 288,
        "Points":2
    },
    {
        "WanderersName": "Golden Wolf", 
        "WanderersID": 289,
        "Points":2
    },
    {
        "WanderersName": "Mark of Outburst", 
        "WanderersID": 290,
        "Points":2
    },
    {
        "WanderersName": "ZERO", 
        "WanderersID": 291,
        "Points":2
    },
    {
        "WanderersName": "White Dragon Revolution", 
        "WanderersID": 292,
        "Points":2
    },
    {
        "WanderersName": "Late Night Salesman", 
        "WanderersID": 293,
        "Points":2
    },
    {
        "WanderersName": "Osaka Blond", 
        "WanderersID": 294,
        "Points":2
    },
    {
        "WanderersName": "Gentle Rain", 
        "WanderersID": 295,
        "Points":2
    },
    {
        "WanderersName": "Electric Shark", 
        "WanderersID": 296,
        "Points":2
    },
    {
        "WanderersName": "Exotic Butterfly", 
        "WanderersID": 297,
        "Points":2
    },
    {
        "WanderersName": "Night Rocket", 
        "WanderersID": 298,
        "Points":2
    },
    {
        "WanderersName": "SPEED BOX", 
        "WanderersID": 299,
        "Points":2
    },
    {
        "WanderersName": "I, Shiotani", 
        "WanderersID": 300,
        "Points":2
    },
    {
        "WanderersName": "S. Agata Cattle", 
        "WanderersID": 301,
        "Points":2
    },
    {
        "WanderersName": "Ghost Soul", 
        "WanderersID": 302,
        "Points":2
    },
    {
        "WanderersName": "The Surf Goblin", 
        "WanderersID": 303,
        "Points":2
    },
    {
        "WanderersName": "Mr. N-zuka", 
        "WanderersID": 304,
        "Points":2
    },
    {
        "WanderersName": "NOB", 
        "WanderersID": 305,
        "Points":2
    },
    {
        "WanderersName": "Armadillo", 
        "WanderersID": 306,
        "Points":2
    },
    {
        "WanderersName": "Obi-Wan Kenori", 
        "WanderersID": 307,
        "Points":2
    },
    {
        "WanderersName": "Yamaachi", 
        "WanderersID": 308,
        "Points":2
    },
    {
        "WanderersName": "Let's GO!", 
        "WanderersID": 309,
        "Points":2
    },
]

NagoyaTeamInformation = [
    {
        "TeamName": "Racing Funs", 
        "TeamLeader": "Big Deal",
        "TeamLeaderID": 1,
        "LastMember": 6,
        "Points":2
    },
    {
        "TeamName": "Real Echo", 
        "TeamLeader": "Steel Dinosaur",
        "TeamLeaderID": 7,
        "LastMember": 11,
        "Points":2
    },
    {
        "TeamName": "Genesis R", 
        "TeamLeader": "Darkness Seven",
        "TeamLeaderID": 12,
        "LastMember": 16,
        "Points":2
    },
    {
        "TeamName": "Hot head", 
        "TeamLeader": "Forever Night",
        "TeamLeaderID": 17,
        "LastMember": 22,
        "Points":2
    },
    {
        "TeamName": "@-Tention", 
        "TeamLeader": "4 PRIDE",
        "TeamLeaderID": 23,
        "LastMember": 29,
        "Points":2
    },
    {
        "TeamName": "Seeks", 
        "TeamLeader": "Ogre Deity",
        "TeamLeaderID": 30,
        "LastMember": 34,
        "Points":2
    },
    {
        "TeamName": "M/R", 
        "TeamLeader": "The flame",
        "TeamLeaderID": 35,
        "LastMember": 41,
        "Points":2
    },
    {
        "TeamName": "Castle Stage", 
        "TeamLeader": "Golden Dolphin",
        "TeamLeaderID": 42,
        "LastMember": 46,
        "Points":2
    },
    {
        "TeamName": "Face to Faith", 
        "TeamLeader": "Summer Time Again",
        "TeamLeaderID": 47,
        "LastMember": 53,
        "Points":2
    },
    {
        "TeamName": "Willows", 
        "TeamLeader": "The Stomach",
        "TeamLeaderID": 54,
        "LastMember": 59,
        "Points":2
    },
    {
        "TeamName": "Shake Hips", 
        "TeamLeader": "Sweet Veronica",
        "TeamLeaderID": 60,
        "LastMember": 66,
        "Points":2
    },
    {
        "TeamName": "Tribute-J", 
        "TeamLeader": "Atomic Heart",
        "TeamLeaderID": 67,
        "LastMember": 72,
        "Points":2
    },
    {
        "TeamName": "Purple Bullet", 
        "TeamLeader": "Night Lord",
        "TeamLeaderID": 73,
        "LastMember": 78,
        "Points":2
    },
    {
        "TeamName": "Another Heaven", 
        "TeamLeader": "Brown Satan",
        "TeamLeaderID": 79,
        "LastMember": 85,
        "Points":2
    },
    {
        "TeamName": "Flower Dancers", 
        "TeamLeader": "Blue Rose",
        "TeamLeaderID": 86,
        "LastMember": 91,
        "Points":2
    },
    {
        "TeamName": "Glory Days", 
        "TeamLeader": "Wind Walker",
        "TeamLeaderID": 92,
        "LastMember": 98,
        "Points":2
    },
    {
        "TeamName": "DE LA Speed", 
        "TeamLeader": "Planet HArmony",
        "TeamLeaderID": 99,
        "LastMember": 104,
        "Points":2
    },
    {
        "TeamName": "Breath Less", 
        "TeamLeader": "2nd Generation Landlady",
        "TeamLeaderID": 105,
        "LastMember": 111,
        "Points":2
    },
]

NagoyaBoss = [
    {
        "BossName": "Flame Dragon", 
        "BossID": 112,
        "Points":2
    },
    {
        "BossName": "J", 
        "BossID": 113,
        "Points":2
    },
    {
        "BossName": "The rook", 
        "BossID": 114,
        "Points":2
    },
    {
        "BossName": "The Bishop", 
        "BossID": 115,
        "Points":2
    },
    {
        "BossName": "The Knight", 
        "BossID": 116,
        "Points":2
    },
]

NagoyaWanderers = [
    {
        "WanderersName": "Hyper Groove", 
        "WanderersID": 117,
        "Points":2
    },
    {
        "WanderersName": "Snow Dancer", 
        "WanderersID": 118,
        "Points":2
    },
    {
        "WanderersName": "Maniac Bun Bun Maru", 
        "WanderersID": 119,
        "Points":2
    },
    {
        "WanderersName": "Midnight Black Sun", 
        "WanderersID": 120,
        "Points":2
    },
    {
        "WanderersName": "White Leopard", 
        "WanderersID": 121,
        "Points":2
    },
    {
        "WanderersName": "Fascinating Magician", 
        "WanderersID": 122,
        "Points":2
    },
    {
        "WanderersName": "100,000 km Rotary", 
        "WanderersID": 123,
        "Points":2
    },
    {
        "WanderersName": "YV Gen-san", 
        "WanderersID": 124,
        "Points":2
    },
    {
        "WanderersName": "Phantom Spectacle", 
        "WanderersID": 125,
        "Points":2
    },
    {
        "WanderersName": "Kuso Chimpan", 
        "WanderersID": 126,
        "Points":2
    },
    {
        "WanderersName": "Turbo Man", 
        "WanderersID": 127,
        "Points":2
    },
    {
        "WanderersName": "WEST No. 5", 
        "WanderersID": 128,
        "Points":2
    },
    {
        "WanderersName": "Cram Instructor", 
        "WanderersID": 129,
        "Points":2
    },
    {
        "WanderersName": "Shocking White Dog", 
        "WanderersID": 130,
        "Points":2
    }
]


OsakaTeamInformation = [
    {
        "TeamName": "Nippon-Bashi", 
        "TeamLeader": "Humanoid Precision",
        "TeamLeaderID": 1,
        "LastMember": 7,
        "Points":2
    },
    {
        "TeamName": "Vip Project", 
        "TeamLeader": "Burning Passion",
        "TeamLeaderID": 8,
        "LastMember": 14,
        "Points":2
    },
    {
        "TeamName": "Drifters", 
        "TeamLeader": "Rokko",
        "TeamLeaderID": 15,
        "LastMember": 20,
        "Points":2
    },
    {
        "TeamName": "First Lady", 
        "TeamLeader": "Provactive Secretary",
        "TeamLeaderID": 21,
        "LastMember": 27,
        "Points":2
    },
    {
        "TeamName": "Birken Club", 
        "TeamLeader": "Lucky Come Come",
        "TeamLeaderID": 28,
        "LastMember": 33,
        "Points":2
    },
    {
        "TeamName": "TuTenKaku", 
        "TeamLeader": "Passion Runner",
        "TeamLeaderID": 34,
        "LastMember": 39,
        "Points":2
    },
    {
        "TeamName": "No Loser", 
        "TeamLeader": "Naniwa Warship",
        "TeamLeaderID": 40,
        "LastMember": 45,
        "Points":2
    },
    {
        "TeamName": "Home Run", 
        "TeamLeader": "Angry Hoshino",
        "TeamLeaderID": 46,
        "LastMember": 53,
        "Points":2
    },
    {
        "TeamName": "Millennium 2", 
        "TeamLeader": "Final Revolution",
        "TeamLeaderID": 54,
        "LastMember": 59,
        "Points":2
    },
    {
        "TeamName": "Miyabi", 
        "TeamLeader": "Meteor Storm",
        "TeamLeaderID": 60,
        "LastMember": 66,
        "Points":2
    },
    {
        "TeamName": "Baldy's", 
        "TeamLeader": "The Captain",
        "TeamLeaderID": 67,
        "LastMember": 72,
        "Points":2
    },
    {
        "TeamName": "Low Position", 
        "TeamLeader": "Anti-Gravity Dimension",
        "TeamLeaderID": 73,
        "LastMember": 78,
        "Points":2
    },
    {
        "TeamName": "Perfect Works", 
        "TeamLeader": "Kishiwada Crisis",
        "TeamLeaderID": 79,
        "LastMember": 84,
        "Points":2
    },
    {
        "TeamName": "Team Kengo", 
        "TeamLeader": "The Old Man",
        "TeamLeaderID": 85,
        "LastMember": 90,
        "Points":2
    },
    {
        "TeamName": "G.R.O.", 
        "TeamLeader": "Angry Naito",
        "TeamLeaderID": 91,
        "LastMember": 98,
        "Points":2
    },
    {
        "TeamName": "Night Wing", 
        "TeamLeader": "Gold Wing",
        "TeamLeaderID": 99,
        "LastMember": 104,
        "Points":2
    },
    {
        "TeamName": "Univer-Saru", 
        "TeamLeader": "Jurassic Period Shikkyusha",
        "TeamLeaderID": 105,
        "LastMember": 111,
        "Points":2
    },
    {
        "TeamName": "Shoryu Group", 
        "TeamLeader": "Dragon of Sakai",
        "TeamLeaderID": 112,
        "LastMember": 118,
        "Points":2
    },
    {
        "TeamName": "Kaze", 
        "TeamLeader": "Miracle Divine Wind",
        "TeamLeaderID": 119,
        "LastMember": 125,
        "Points":2
    },
    {
        "TeamName": "Harisen Chop", 
        "TeamLeader": "Nishi Nagahori Justice",
        "TeamLeaderID": 126,
        "LastMember": 132,
        "Points":2
    },
    {
        "TeamName": "Darts", 
        "TeamLeader": "God's Estuary",
        "TeamLeaderID": 133,
        "LastMember": 141,
        "Points":2
    }
]

OsakaWanderers = [
    {
        "WanderersName": "POU@MSR", 
        "WanderersID": 142,
        "Points": 2
    },
    {
        "WanderersName": "Mistral@MSR", 
        "WanderersID": 143,
        "Points": 2
    },
    {
        "WanderersName": "EIC@MSR", 
        "WanderersID": 144,
        "Points": 2
    },
    {
        "WanderersName": "Sports Newspaper Mania", 
        "WanderersID": 145,
        "Points": 2
    },
    {
        "WanderersName": "Night King", 
        "WanderersID": 146,
        "Points": 2
    },
    {
        "WanderersName": "FD Tomo-san", 
        "WanderersID": 147,
        "Points": 2
    },
    {
        "WanderersName": "Beat Ignition", 
        "WanderersID": 148,
        "Points": 2
    },
    {
        "WanderersName": "Jet-Black", 
        "WanderersID": 149,
        "Points": 2
    },
    {
        "WanderersName": "Wangan Runner", 
        "WanderersID": 150,
        "Points": 2
    },
    {
        "WanderersName": "Fire Legend", 
        "WanderersID": 151,
        "Points": 2
    },
    {
        "WanderersName": "Orimabu", 
        "WanderersID": 152,
        "Points": 2
    },
    {
        "WanderersName": "Stalker Hammer", 
        "WanderersID": 153,
        "Points": 2
    },
    {
        "WanderersName": "Radiant Storm", 
        "WanderersID": 154,
        "Points": 2
    },
    {
        "WanderersName": "YOO@TFB", 
        "WanderersID": 155,
        "Points": 2
    },
    {
        "WanderersName": "Magazine", 
        "WanderersID": 156,
        "Points": 2
    },
    {
        "WanderersName": "Whiurlwind Fanfare", 
        "WanderersID": 157,
        "Points": 2
    },
    {
        "WanderersName": "Mister Orange Road", 
        "WanderersID": 158,
        "Points": 2
    },
    {
        "WanderersName": "The Pinball", 
        "WanderersID": 159,
        "Points": 2
    },
    {
        "WanderersName": "The Driver", 
        "WanderersID": 160,
        "Points": 2
    }   
]

// $3394AB: (8-bit) Part of a pointer for driving.
//          
//          However if this is not set to 01, it likely will crash the game.
function drivingPointerIndicator() => byte(0x3394AB)
VALUE_DRIVING_IN_GAME = 0x01

// $3461E0: (8-bit) Visibility Value
//          
//          If set to 0 The screen goes to almost black.   Set to 2 when driving
function cityBackgroundIndicator() => byte(0x3461E0)
VALUE_BACKGROUND_IN_GAME = 0x02

function isDriving() => cityBackgroundIndicator() == VALUE_BACKGROUND_IN_GAME && drivingPointerIndicator() == VALUE_DRIVING_IN_GAME
function justWasDriving() => (prev(cityBackgroundIndicator()) == VALUE_BACKGROUND_IN_GAME || 
                              prev(drivingPointerIndicator()) == VALUE_DRIVING_IN_GAME) &&
                              cityBackgroundIndicator() != VALUE_BACKGROUND_IN_GAME && 
                              drivingPointerIndicator() != VALUE_DRIVING_IN_GAME
                            

// $352544: (8-bit) Raining control
// 
//          If this is set to 0x00 it's a clear day.
//          If this is set to 0x01 there is rain. 
//
//          Changing this to 0x01 mid race WILL start the rain. 
//          
//          0x08 removes barriers, not sure why. 
//          0x09 and above seems to show graphical corruption
//
//          NOTE snow and others will also say 0x01
function rainControl() => byte(0x352544)

RAINING_VALUE = 0x01
function isRaining() => rainControl() == RAINING_VALUE

// $3565B4: (32-bit likely larger) A timer for the current battle.
//          
//          Note, can't find the one who controls the UI, this however keeps in step with that (one frame ahead)
function timerForQuestBattle() => dword(0x3565B4)

// $3AEBBA: (8-bit) Garage Index of current car in game
//          
//          This moves to 0x008153ba when going back to the front end
//          
//          0x00-0x04 for Indexes
//          0x05 for Default Car.
function garageIndexInGame() => byte(0x3AEBBA)

VALUE_DEFAULT_CAR = 0x05
    
function isDefaultCar() => garageIndexInGame() == VALUE_DEFAULT_CAR


// $3AF39E: (8-bit) Rolling Guy #1 Beat Indicator
//          
//          0x01 or 0x02 marks opponent beaten, 0x00 not beat.  See 600 bytes before this for Met value.
//          
//          This is the source of truth in game
function tokyoStartingBeat() => byte(0x3AF39E)
function tokyoStartingBeatMemoryLocation() => 0x3AF39E

VALUE_NOT_BEATEN_OPPONENT = 0x00

// We test against not beaten, because 0x02 is possible along with 0x01
function justBeatOpponent(data) => data != VALUE_NOT_BEATEN_OPPONENT && prev(data) == VALUE_NOT_BEATEN_OPPONENT

function calculateMemoryLocation(startingMemory, index) => byte(startingMemory + index - 1)

// $3AF4D3: (8-bit) Final Boss Beat Indicator
//          
//          0x01 Marks opponent beaten, 0x00 not beat.  
//          
//          This is the source of truth in game
function finalBossBeatIndicator() => byte(0x3AF4D3)
function finalBossBeatMemoryLocation() => 0x3AF4D3

// $3AF4D4: (8-bit) In game value for if Big Deal is beaten (Begining of Nagoya)
//          
//          In Game Source of Truth
function nagoyaStartingBeat() => byte(0x3AF4D4)
function nagoyaBeatMemoryLocation() => 0x3AF4D4

// $3AF556: (8-bit) In Game value for if Humanoid Precision is beaten
//          
//          (First of Osaka)
function osakaStartingBeat() => byte(0x3AF556)
function osakaBeatMemoryLocation() => 0x3AF556

// $41E90C: (8-bit) Race Result
//          
//          0x01 = Win
//          0x02 = Lose
//          0x03 = Draw
//          0x0d= Goal (For Time Attack)
function raceResult() => byte(0x41E90C)
RESULT_NONE_VALUE = 0x00
RESULT_WIN_VALUE = 0x01
RESULT_GOAL_VALUE = 0x0d

function justFinishedTimeAttack() => raceResult() == RESULT_GOAL_VALUE && prev(raceResult()) == RESULT_NONE_VALUE
function justFinishedQuestRace() => raceResult() == RESULT_WIN_VALUE && prev(raceResult()) == RESULT_NONE_VALUE

// $41E959: (16-bit) Player's SP
//          
//          Starts at 4c4b
function playerHealth() => word(0x41E959)

MAX_HEALTH = 0x4c4b

// $41E9A9: (16-bit) Enemy's SP
function enemyHealth() => word(0x41E9A9)

// $41EAAA: (16-bit) Win Combo
function currentWinCombo() => word(0x41EAAA)

// $41EAE4: (Float) Today's Max Speed in KPH
//          
//          Only works in Quest Mode
function todayMaxSpeedKPH() => float(0x41EAE4)
function todayMaxSpeedMPHconverted() => todayMaxSpeedKPH() / 1.609

// $41EB4C: (32-bit) Total time in Time Attack mode
//          
//          Displayed as Lap Time but not a control
function timeTimeAttackMode() => dword(0x41EB4C)

// $41EEF0: (8-bit) Max Win Combo Today
function todayMaxWinCombo() => byte(0x41EEF0)

// $8052D2: (8-bit) Game Mode
//          
//          0x00 = Quest Mode Or Main Menu
//          0x01 = Time attack
//          0x02 = Free Run
//          0x03 = Versus
//          0x07 = Demo Mode
//          0x08 = Replay Theater
// This fails when you set up rain in Time attack mode. 
function gameModeFailed() => byte(0x8052D2)

// $80ec58: (8-bit) Game Mode while Driving 
// 
//          0x00 = Quest Mode Or Main Menu
//          0x01 = Time attack
//          0x02 = Free Run
//          0x03 = Versus
//          0x07 = Demo Mode
//          0x08 = Replay Theater
// 
// (Exiting gameplay appears to work too) 
function gameMode() => byte(0x80ec58)

QUEST_MODE_VALUE = 0x00
TIME_ATTACK_MODE_VALUE = 0x01
DEMO_MODE_VALUE = 0x07
function questMode() => gameMode() == QUEST_MODE_VALUE
function timeAttackMode() => gameMode() == TIME_ATTACK_MODE_VALUE
function demoMode() => gameMode() == DEMO_MODE_VALUE

// $806AD0: (8-bit) Vehicle Name ID
//          
//          Exact values are not available at this time
//          
//          0x01 = Nissan Skyline GT-R
//          0x0d = Nissan 180SX
//          0x13 = Mitsubishi Lancer Evolution V
//          0x15 = Mitsubishi GTO
//          0x18 = Mazda RX-7 Type RZ.0
//          0x1a = Mazda MX-5  Miata RS
//          0x30 = Suburu Impreza WRX STi TypeRA SpecC
//          If wrong check 0x8082d0
function vehicleNameID() => byte(0x806AD0)

NISSAN_350_ZX = 0x00
NISSAN_SKYLINE_GT_R_V_SPECII = 0x01
NISSAN_SKYLINE_GT_R_V_SPEC = 0x02
NISSAN_SKYLINE_GT_R_V_SPECII = 0x03
NISSAN_350_ZX_TWINTURBO = 0x04
NISSAN_240Z = 0x05
NISSAN_200SX_S15 = 0x06
NISSAN_200SX_S14 = 0x07
NISSAN_200SX_PS13 = 0x08
NISSAN_MAXIMA = 0x09
NISSAN_PULSAR = 0x0a
NISSAN_CIMA = 0x0b
NISSAN_280Z_T = 0x0c
NISSAN_180SX = 0x0d
NISSAN_SYKLINE_HT20000GT_R = 0x0e
NISSAN_CEDRIC = 0x0f
NISSAN_GLORIA = 0x10
NISSAN_350_Z = 0x11
MITSUBISHI_LANCER_EVOLUTION_VII = 0x12
MITSUBISHI_LANCER_EVOLUTION_V = 0x13
MITSUBISHI_FTO = 0x14
MITSUBISHI_GTO = 0x15
MITSUBISHI_STARION = 0x16
MITSUBISHI_LANCER_EX = 0x17
MAZDA_RX_7_TYPE_RZ_0 = 0x18
MAZDA_RX_7_INFINITI = 0x18
MAZDA_MX_5_MIATA_RS = 0x1a
MAZDA_MX_5_MIATA_S_SPECIAL_TYPE_II = 0x1b
MAZDA_RX_8 = 0x1c
MAZDA_RX_7_TURBO_GT_X = 0x1d
MAZDA_RX_3_GT = 0x1e
TOYOTA_MR2 = 0x1f
TOYOTA_SUPRA = 0x20
TOYOTA_LEXUS_GS300 = 0x21
TOYOTA_SPRINTER_TRUENO = 0x22
TOYOTA_COROLLA_LEVIN_3DOOR = 0x23
TOYOTA_MARK_2 = 0x25
TOYOTA_CELICA = 0x25
TOYOTA_MR_S_JAPANESE_NAME = 0x26
TOYOTA_LEXUS_LS430 = 0x27
TOYOTA_CHASER = 0x28
TOYOTA_STARLET = 0x28
TOYOTA_COROLLA_LEVIN = 0x2a
TOYOTA_MR2_1_6G = 0x2b
TOYOTA_SUPRA_2_5GT = 0x2c
TOYOTA_2000GT = 0x2d
TOYOTA_COROLLA_FX = 0x2e
TOYOTA_BB_JAPANESE_NAME = 0x2f
SUBURU_IMPREZA_WRX_STI_TYPERA_SPECC = 0x30
SUBURU_IMPREZA_WRX_STI_VERSION_VI = 0x31
SUBURU_LEGACY_B4 = 0x32
SUBURU_LEGACY_TOURING_WAGON = 0x33
SUBURU_ALCYONE = 0x34
ISUZU_VEHICROSS = 0x35
IZUSU_PIAZZA = 0x36
SUZUKI_WAGON_R_RR = 0x37
SUZUKI_CAPPUCCINO = 0x38
DAIHATSU_COPEN = 0x39
DAIHATSU_MOVE = 0x3a
GM_CORVETTE_Z51 = 0x3c
GM_CORVETTE = 0x3d
GM_FIREBIRD = 0x3e
FORD_GT = 0x3f
FORD_MUSTANG = 0x40
DODGE_VIPER = 0x41
MERCEDES_BENZ_SL_CLASS = 0x42
MERCEDES_BENZ_S_CLASS = 0x43
MERCEDES_BENZ_500E = 0x44
VOLKSWAGEN_NEW_BETTLE = 0x45
VOLKSWAGEN_GOLF_GTI = 0x44
LOTUS_ESPRIT = 0x49
LOTUS_TURBO_ESPRIT = 0x4a
LOTUS_EUROPA = 0x4b
DETOMASO_PANTERA = 0x4c
GEMBALLA_GTR750 = 0x4e
GEMBALLA_GTR500 = 0x4f
TOYOTA_VITZ_JAPANESE_NAME = 0x50
MCR_R34 = 0x52
RIDOX_SUPRA = 0x53
NOB_S15 = 0x54
WEST_CORVETTE = 0x55
NAGINATA = 0x56
EMPEROR = 0x57
THE_ROOK = 0x58
THE_BISHOP = 0x59
THE_KNIGHT = 0x5a
JACK_KNIFE = 0x5b
BLOOD_HOUND = 0x5c
DEJECTED_ANGEL = 0x5d
STEAL_HEART = 0x5e
DYING_STAR = 0x5f
MIDNIGHT_ROSE = 0x60
TAIL_GUNNER = 0x61
SHADOW_EYES = 0x62
GRIEF_PLUTO = 0x63
FLAME_DRAGON = 0x64
ALIAS_THE_J = 0x65
THE_LORD = 0x66
NIHILISMS_ENVOY = 0x67
HEAVENS_ENVORY = 0x68
EARTHS_ENVOY = 0x69
DUTYS_ENVOY = 0x6a
WIND_CONDUCTOR = 0x6b
WOODS_CONDUCTOR = 0x6c
FIRE_CONDUCTOR = 0x6d
MT_CONDUCTOR = 0x6e
NANIWAS_WARSHIP = 0x6f
TERRIBLE_NUCLEAR = 0x70
MAD_TERRORIST = 0x71
TIMEBOMB_STALKER = 0x72
STEALTH_FIGHTER = 0x73
KAMIKAZE = 0x74
MIDNIGHT_CINDERELLA = 0x76
DEATH_DRIVER = 0x77

CarNameLookup =
{
    NISSAN_350_ZX: "Nissan 350 ZX",
    NISSAN_SKYLINE_GT_R_V_SPECII: "Nissan Skyline GT-R V-SpecII",
    NISSAN_SKYLINE_GT_R_V_SPEC: "Nissan Skyline GT-R V-Spec",
    NISSAN_SKYLINE_GT_R_V_SPECII: "Nissan Skyline GT-R V-SpecII",
    NISSAN_350_ZX_TWINTURBO: "Nissan 350 ZX TwinTurbo",
    NISSAN_240Z: "Nissan 240Z",
    NISSAN_200SX_S15: "Nissan 200SX S15",
    NISSAN_200SX_S14: "Nissan 200SX S14",
    NISSAN_200SX_PS13: "Nissan 200SX PS13",
    NISSAN_MAXIMA: "Nissan Maxima",
    NISSAN_PULSAR: "Nissan Pulsar",
    NISSAN_CIMA: "Nissan Cima",
    NISSAN_280Z_T: "Nissan 280Z-T",
    NISSAN_180SX: "Nissan 180SX",
    NISSAN_SYKLINE_HT20000GT_R: "Nissan Sykline HT20000GT-R",
    NISSAN_CEDRIC: "Nissan Cedric",
    NISSAN_GLORIA: "Nissan Gloria",
    NISSAN_350_Z: "Nissan 350 Z",
    MITSUBISHI_LANCER_EVOLUTION_VII: "Mitsubishi Lancer Evolution VII",
    MITSUBISHI_LANCER_EVOLUTION_V: "Mitsubishi Lancer Evolution V",
    MITSUBISHI_FTO: "Mitsubishi FTO",
    MITSUBISHI_GTO: "Mitsubishi GTO",
    MITSUBISHI_STARION: "Mitsubishi Starion",
    MITSUBISHI_LANCER_EX: "Mitsubishi Lancer EX",
    MAZDA_RX_7_TYPE_RZ_0: "Mazda RX-7 Type RZ.0",
    MAZDA_RX_7_INFINITI: "Mazda RX-7 Infiniti",
    MAZDA_MX_5_MIATA_RS: "Mazda MX-5  Miata RS",
    MAZDA_MX_5_MIATA_S_SPECIAL_TYPE_II: "Mazda MX-5  Miata S-Special Type-II",
    MAZDA_RX_8: "Mazda RX-8",
    MAZDA_RX_7_TURBO_GT_X: "Mazda RX-7 Turbo GT-X",
    MAZDA_RX_3_GT: "Mazda RX-3 GT",
    TOYOTA_MR2: "Toyota MR2",
    TOYOTA_SUPRA: "Toyota Supra",
    TOYOTA_LEXUS_GS300: "Toyota Lexus GS300",
    TOYOTA_SPRINTER_TRUENO: "Toyota Sprinter Trueno",
    TOYOTA_COROLLA_LEVIN_3DOOR: "Toyota Corolla Levin 3door",
    TOYOTA_MARK_2: "Toyota Mark 2",
    TOYOTA_CELICA: "Toyota Celica",
    TOYOTA_MR_S_JAPANESE_NAME: "Toyota MR-S(Japanese Name)",
    TOYOTA_LEXUS_LS430: "Toyota Lexus LS430",
    TOYOTA_CHASER: "Toyota Chaser",
    TOYOTA_STARLET: "Toyota Starlet",
    TOYOTA_COROLLA_LEVIN: "Toyota Corolla Levin",
    TOYOTA_MR2_1_6G: "Toyota MR2 1.6G",
    TOYOTA_SUPRA_2_5GT: "Toyota Supra 2.5GT",
    TOYOTA_2000GT: "Toyota 2000GT",
    TOYOTA_COROLLA_FX: "Toyota Corolla FX",
    TOYOTA_BB_JAPANESE_NAME: "Toyota bB(Japanese Name)",
    SUBURU_IMPREZA_WRX_STI_TYPERA_SPECC: "Suburu Impreza WRX STi TypeRA SpecC",
    SUBURU_IMPREZA_WRX_STI_VERSION_VI: "Suburu Impreza WRX STi Version VI",
    SUBURU_LEGACY_B4: "Suburu Legacy B4",
    SUBURU_LEGACY_TOURING_WAGON: "Suburu Legacy Touring Wagon",
    SUBURU_ALCYONE: "Suburu Alcyone",
    ISUZU_VEHICROSS: "Isuzu VehiCROSS",
    IZUSU_PIAZZA: "Izusu Piazza",
    SUZUKI_WAGON_R_RR: "Suzuki wagon R RR",
    SUZUKI_CAPPUCCINO: "Suzuki Cappuccino",
    DAIHATSU_COPEN: "Daihatsu Copen",
    DAIHATSU_MOVE: "Daihatsu Move",
    GM_CORVETTE_Z51: "GM Corvette Z51",
    GM_CORVETTE: "GM Corvette",
    GM_FIREBIRD: "GM Firebird",
    FORD_GT: "Ford GT",
    FORD_MUSTANG: "Ford Mustang",
    DODGE_VIPER: "Dodge Viper",
    MERCEDES_BENZ_SL_CLASS: "Mercedes-Benz SL-Class",
    MERCEDES_BENZ_S_CLASS: "Mercedes-Benz S-Class",
    MERCEDES_BENZ_500E: "Mercedes-Benz 500E",
    VOLKSWAGEN_NEW_BETTLE: "Volkswagen New Bettle",
    VOLKSWAGEN_GOLF_GTI: "Volkswagen Golf GTi",
    LOTUS_ESPRIT: "Lotus Esprit",
    LOTUS_TURBO_ESPRIT: "Lotus Turbo Esprit",
    LOTUS_EUROPA: "Lotus Europa",
    DETOMASO_PANTERA: "Detomaso Pantera",
    GEMBALLA_GTR750: "Gemballa GTR750",
    GEMBALLA_GTR500: "Gemballa GTR500",
    TOYOTA_VITZ_JAPANESE_NAME: "Toyota Vitz(Japanese Name)",
    MCR_R34: "MCR R34",
    RIDOX_SUPRA: "Ridox Supra",
    NOB_S15: "NOB S15",
    WEST_CORVETTE: "West Corvette",
    NAGINATA: "Naginata",
    EMPEROR: "Emperor",
    THE_ROOK: "The Rook",
    THE_BISHOP: "The Bishop",
    THE_KNIGHT: "The Knight",
    JACK_KNIFE: "Jack Knife",
    BLOOD_HOUND: "Blood Hound",
    DEJECTED_ANGEL: "Dejected Angel",
    STEAL_HEART: "Steal Heart",
    DYING_STAR: "Dying Star",
    MIDNIGHT_ROSE: "Midnight Rose",
    TAIL_GUNNER: "Tail Gunner",
    SHADOW_EYES: "Shadow Eyes",
    GRIEF_PLUTO: "Grief Pluto",
    FLAME_DRAGON: "Flame Dragon",
    ALIAS_THE_J: "Alias The J",
    THE_LORD: "The Lord",
    NIHILISMS_ENVOY: "Nihilism's Envoy",
    HEAVENS_ENVORY: "Heaven's Envory",
    EARTHS_ENVOY: "Earth's Envoy",
    DUTYS_ENVOY: "Duty's Envoy",
    WIND_CONDUCTOR: "Wind Conductor",
    WOODS_CONDUCTOR: "Woods Conductor",
    FIRE_CONDUCTOR: "Fire Conductor",
    MT_CONDUCTOR: "Mt. Conductor",
    NANIWAS_WARSHIP: "Naniwa's Warship",
    TERRIBLE_NUCLEAR: "Terrible Nuclear",
    MAD_TERRORIST: "Mad Terrorist",
    TIMEBOMB_STALKER: "Timebomb Stalker",
    STEALTH_FIGHTER: "Stealth Fighter ",
    KAMIKAZE: "Kamikaze",
    MIDNIGHT_CINDERELLA: "Midnight Cinderella ",
    DEATH_DRIVER: "Death Driver",
}

function carCheck(vehicleId) => vehicleNameID() == vehicleId
function nissanGTR() => vehicleNameID() == NISSAN_SKYLINE_GT_R_V_SPECII
function nissan180Sx() => vehicleNameID() == NISSAN_180SX
function lancerEvoV() => vehicleNameID() == MITSUBISHI_LANCER_EVOLUTION_V
function mitsubishiGTO() => vehicleNameID() == MITSUBISHI_GTO
function mazdaRX7() => vehicleNameID() == MAZDA_RX_7_TYPE_RZ_0
function suburaWRX() => vehicleNameID() == SUBURU_IMPREZA_WRX_STI_TYPERA_SPECC


// $8153B0: (32-bit) Player's Money in Quest mode.
//          
//          Money in 10s (0x10 = 160)
//          
//          
//          Also "cash" for searching code notes purpose.
function playerMoney() => dword(0x8153B0)

// $82D8A8: (Float) Quest Mode Current speed in KPH
function questModeCurrentSpeedKPH() => float(0x82D8A8)

// $82D8AC: (Float) Quest Mode Current speed in MPH
function questModeCurrentSpeedMPH() => float(0x82D8AC)

// $17F595E: (8-bit) UI element for Course Select for Time Attack Mode
//           Note there's duplicates here, so it can't be used.
function courseSelectedForTimeAttackMode() => byte(0x17F595E)

// $82BD90: (32-bit) Unique identifier for Time Attack
//          
//          Tokyo
//          0x4360bb24 = Kandabashi C1 Inner Loop
//          0x434c2db9 = Shibakouen C1 Outer Loop
//          0x45b8e60f = Ariake ShinKanjou CCL
//          0x4509f5b0 = Daiba ShinKanjou CWL
//          0x44f75d21 = Route 13 Are Wangan Out
//          0xc4caa43a = Daikoku Futou Wangan In
//          0xc3948282 = Shibaura Yokohane Out
//          0xc4525469 = Shioiri Yokohane In
//          0xc61f8292 = Asada Yokohama CCL
//          0xc5d83333 = Asada Yokohama CWL
//          
//          Nagoya
//          0x450e7226 = Meieki Nagoya Kanjou
//          0x43e8a24f = Kurokawa W. Higashimeihan
//          0xc5e2566e = Kasumori E. Higashimeihan
//          
//          Osaka
//          0x4613dd92 = Shinanobashi Kanjou Shortcut
//          0x461bfc99 = Yotsuhashi Kanjou Long
//          0x45f5e83c = Shiomibashi Sakai Out
//          0x45ead4df = Sakai Sakai In
//          0x4585eefc = W. Nagahori Wangan Out
//          0x456fe94c = Oohama Wangan In
function timeAttackTrackId() => dword(0x82BD90)

// Tokyo
KANDABASHI_C1_INNER_LOOP = 0x4360BB24
SHIBAKOUEN_C1_OUTER_LOOP = 0x434C2DB9 
ARIAKE_SHINKANJOU_CCL = 0x45B8E60F
DAIBA_SHINKANJOU_CWL = 0x4509F5B0
ROUTE_13_AREA_WANGAN_OUT = 0x44F75D21 
DAIKOKU_FUTOU_WANGAN_IN = 0xC4CAA43A 
SHIBAURA_YOKOHANE_OUT = 0xC3948282 
SHIOIRI_YOKOHANE_IN = 0xC4525469 
ASADA_YOKOHAMA_CCL = 0xC61F8292 
ASADA_YOKOHAMA_CWL = 0xC5D83333 
         
// Nagoya
MEIEKI_NAGOYA_KANJOU = 0x450E7226 
KUROKAWA_W_HIGASHIMEIHAN = 0x43E8A24F
KASUMORI_E_HIGASHIMEIHAN = 0xC5E2566E
         
// Osaka
SHINANOBASHI_KANJOU_SHORTCUT = 0x4613DD92
YOTSUHASHI_KANJOU_LONG = 0x461BFC99
SHIOMIBASHI_SAKAI_OUT = 0x45F5E83C 
SAKAI_IN = 0x45EAD4DF
W_NAGAHORI_WANGAN_OUT = 0x4585EEFC
OOHAMA_WANGAN_IN = 0x456FE94C


TrackLookup =
{
    KANDABASHI_C1_INNER_LOOP: "Kandabashi C1 Inner Loop",
    SHIBAKOUEN_C1_OUTER_LOOP: "Shibakouen C1 Outer Loop",
    ARIAKE_SHINKANJOU_CCL: "Ariake ShinKanjou CCL",
    DAIBA_SHINKANJOU_CWL: "Daiba ShinKanjou CWL",
    ROUTE_13_AREA_WANGAN_OUT: "Route 13 Area Wangan Out",
    DAIKOKU_FUTOU_WANGAN_IN: "Daikoku Futou Wangan In",
    SHIBAURA_YOKOHANE_OUT: "Shibaura Yokohane Out",
    SHIOIRI_YOKOHANE_IN: "Shioiri Yokohane In",
    ASADA_YOKOHAMA_CCL: "Asada Yokohame CCL",
    ASADA_YOKOHAMA_CWL: "Asada Yokohame CWL",
    MEIEKI_NAGOYA_KANJOU: "Meieki Nagoya Kanjou",
    KUROKAWA_W_HIGASHIMEIHAN: "Kurokawa W Higashimeihan",
    KASUMORI_E_HIGASHIMEIHAN: "Kasumori E Higashimeihan",
    SHINANOBASHI_KANJOU_SHORTCUT: "Shinanobashi Kanjou Shortcut",
    YOTSUHASHI_KANJOU_LONG: "Yotsuhashi Kanjou Long",
    SHIOMIBASHI_SAKAI_OUT: "Shiomibashi Sakai Out",
    SAKAI_IN: "Sakai Sakai In",
    W_NAGAHORI_WANGAN_OUT: "W Nagahori Wangan Out",
    OOHAMA_WANGAN_IN: "Oohama Wangan In",
}

LeaderboardIdLookup =
{
    KANDABASHI_C1_INNER_LOOP: 87747,
    SHIBAKOUEN_C1_OUTER_LOOP: 87746,
    ARIAKE_SHINKANJOU_CCL: 87754,
    DAIBA_SHINKANJOU_CWL: 87750,
    ROUTE_13_AREA_WANGAN_OUT: 87749,
    DAIKOKU_FUTOU_WANGAN_IN: 87761,
    SHIBAURA_YOKOHANE_OUT: 87759,
    SHIOIRI_YOKOHANE_IN: 87760,
    ASADA_YOKOHAMA_CCL: 87745,
    ASADA_YOKOHAMA_CWL: 87743,
    MEIEKI_NAGOYA_KANJOU: 87751,
    KUROKAWA_W_HIGASHIMEIHAN: 87748,
    KASUMORI_E_HIGASHIMEIHAN: 87744,
    SHINANOBASHI_KANJOU_SHORTCUT: 87757,
    YOTSUHASHI_KANJOU_LONG: 87758,
    SHIOMIBASHI_SAKAI_OUT: 87756,
    SAKAI_IN: 87755,
    W_NAGAHORI_WANGAN_OUT: 87753,
    OOHAMA_WANGAN_IN: 87752,
}

for key in TrackLookup
{
    leaderboard(
        id = LeaderboardIdLookup[key],
        title = format("Fastest time on {0}",  TrackLookup[key]),
        description = format("Record the fastest time on {0} in Time Trial Mode", TrackLookup[key]),
        start = 
        (
            isDriving() && 
            justFinishedTimeAttack() && 
            timeAttackMode() && 
            timeTimeAttackMode() > 0 &&
            timeAttackTrackId() == key
    
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeTimeAttackMode(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

ShortCarName = 
{
    NISSAN_SKYLINE_GT_R_V_SPECII: "GT-R",
    NISSAN_180SX: "180SX",
    MITSUBISHI_LANCER_EVOLUTION_V: "Evo V",
    MITSUBISHI_GTO: "GTO",
    MAZDA_RX_7_TYPE_RZ_0: "RX-7",
    SUBURU_IMPREZA_WRX_STI_TYPERA_SPECC: "WRX STi",
}

CarName = 
{
    NISSAN_SKYLINE_GT_R_V_SPECII: "Nissan Skyline GT-R",
    NISSAN_180SX: "Nissan 180SX",
    MITSUBISHI_LANCER_EVOLUTION_V: "Mitsubishi Lancer Evolution V",
    MITSUBISHI_GTO: "Mitsubishi GTO",
    MAZDA_RX_7_TYPE_RZ_0: "Mazda RX-7 Type RZ.0",
    SUBURU_IMPREZA_WRX_STI_TYPERA_SPECC: "Suburu Impreza WRX STi TypeRA SpecC",
}

CAR = "Car"
TRACK = "Track"
CREATOR = "Creator"
ID = "WanderersID"
TIME = "Time"
ACHIEVEMENT_NAME = "Title"
TIMESTRING = "DisplayString"

SpecificLeaderboard =
[
    { TRACK: SHIBAKOUEN_C1_OUTER_LOOP,
      CAR: MITSUBISHI_LANCER_EVOLUTION_V,
      CREATOR: "Borysewicz",
      ID: 87762,
      TIME: timeConversion(5,00),
      ACHIEVEMENT_NAME: "King of C1",
      TIMESTRING: "5:00"
    },
    { TRACK: DAIBA_SHINKANJOU_CWL,
      CAR: NISSAN_180SX,
      CREATOR: "jintei",
      ID: 87763,
      TIME: timeConversion(6,00),
      ACHIEVEMENT_NAME: "King of ShinKanjou",
      TIMESTRING: "6:00"
    },    
    { TRACK: SHINANOBASHI_KANJOU_SHORTCUT,
      CAR: MITSUBISHI_GTO,
      CREATOR: "WeerDough",
      ID: 87764,
      TIME: timeConversion(1,48),
      ACHIEVEMENT_NAME: "King of Osaka",
      TIMESTRING: "1:48"
    },    

    { TRACK: MEIEKI_NAGOYA_KANJOU,
      CAR: NISSAN_SKYLINE_GT_R_V_SPECII,
      CREATOR: "letdowNN",
      ID: 87765,
      TIME: timeConversion(3,0),
      ACHIEVEMENT_NAME: "King of Nagoya",
      TIMESTRING: "3:00"
    },   
]

for data in SpecificLeaderboard
{
    leaderboard(    
        title = format("Fastest {1} on {0}",  TrackLookup[data[TRACK]],  ShortCarName[data[CAR]]),
        description = format("Record the fastest time on {0} while driving the Default Car of {1} in Time Trial Mode. Thanks to {2} For the suggestion", TrackLookup[data[TRACK]], CarName[data[CAR]], data[CREATOR]),
        start = 
        (
            isDriving() && 
            justFinishedTimeAttack() && 
            timeAttackMode() && 
            timeTimeAttackMode() > 0 &&
            timeAttackTrackId() == data[TRACK] &&
            carCheck(data[CAR]) &&
            isDefaultCar()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeTimeAttackMode(),
        lower_is_better = true,
        format = "FRAMES",
        id = data[ID]
    )

    achievement(title = data[ACHIEVEMENT_NAME],
                description = format("Beat {0} on {1} while driving the Default Car of {2} in Time Trial Mode.  Thanks to {3} for designing this achievement", data[TIMESTRING], TrackLookup[data[TRACK]], CarName[data[CAR]], data[CREATOR]),
                points = 5,
                trigger = isDriving() && 
                          justFinishedTimeAttack() && 
                          timeAttackMode() && 
                          timeTimeAttackMode() > 0 &&
                          timeTimeAttackMode() < data[TIME] &&
                          timeAttackTrackId() == data[TRACK] &&
                          carCheck(data[CAR]) &&
                          isDefaultCar()

    )
}

leaderboard(
        id = 89760,
        title = format("Fastest AE86T on Nagahori in Rain"),
        description = format("Record the fastest time on W Nagahori Wangan Out while driving the Default Car of Toyota Sprinter Trueno in the rain in Time Trial Mode."),
        start = 
        (
            isDriving() && 
            justFinishedTimeAttack() && 
            timeAttackMode() && 
            timeTimeAttackMode() > 0 &&
            timeAttackTrackId() == W_NAGAHORI_WANGAN_OUT &&
            carCheck(TOYOTA_SPRINTER_TRUENO) &&
            isDefaultCar() &&
            isRaining()
        ),
        cancel = always_false(),
        submit = always_true(),
        value = timeTimeAttackMode(),
        lower_is_better = true,
        format = "FRAMES"
    )
 achievement(title = "Time to deliver some Tofu",
                description = format("Beat 5:15 on N WNagahori Wangan Out while driving the Default Car of Toyota Sprinter Trueno in the rain in Time Trial Mode."),
                points = 3,
                trigger = isDriving() && 
                          justFinishedTimeAttack() && 
                          timeAttackMode() && 
                          timeTimeAttackMode() > 0 &&
                          timeTimeAttackMode() < timeConversion(5,15) &&
                          timeAttackTrackId() == W_NAGAHORI_WANGAN_OUT &&
                          carCheck(TOYOTA_SPRINTER_TRUENO) &&
                          isDefaultCar() &&
                          isRaining()
    )



function winAchievement(title, description, points, index, memoryLocation)
{
    byteTarget = calculateMemoryLocation(memoryLocation, index)
    
    achievement(title = title,
                description = description,
                points = points,
                trigger = justBeatOpponent(byteTarget) &&
                          justFinishedQuestRace() &&
                          questMode() &&
                          isDriving() &&
                          !demoMode() 
                )
}

function teamAchievements(data, memoryLocation)
{
    winAchievement(title = data["TeamName"],
                   description = format("Beat {0} from {1} in Quest Mode", data["TeamLeader"], data["TeamName"]),
                   points = data["Points"],
                   index = data["TeamLeaderID"],
                   memoryLocation = memoryLocation
                  )
    
}

function wanderersAchievements(data, memoryLocation)
{
    winAchievement(title = data["WanderersName"],
                   description = format("Beat Wanderer {0} in Quest Mode", data["WanderersName"]),
                   points = data["Points"],
                   index = data["WanderersID"],
                   memoryLocation = memoryLocation
                   )
}

function bossAchievements(data, memoryLocation)
{
    winAchievement(title = data["BossName"],
                   description = format("Beat {0} in Quest Mode", data["BossName"]),
                   points = data["Points"],  
                   index = data["BossID"],
                   memoryLocation = memoryLocation
                   )
    
}

for info in TokyoTeamInformation
{
    teamAchievements(info, tokyoStartingBeatMemoryLocation())
}

for info in NagoyaTeamInformation
{
    teamAchievements(info, nagoyaBeatMemoryLocation())
}

for info in OsakaTeamInformation
{
    teamAchievements(info, osakaBeatMemoryLocation() )
}

for info in TokyoBoss
{
    bossAchievements(info, tokyoStartingBeatMemoryLocation())
}

for info in NagoyaBoss
{
    bossAchievements(info, nagoyaBeatMemoryLocation())
}

for info in TokyoWanderers
{
    wanderersAchievements(info, tokyoStartingBeatMemoryLocation())
}

for info in NagoyaWanderers
{
    wanderersAchievements(info, nagoyaBeatMemoryLocation())
}

for info in OsakaWanderers
{
    wanderersAchievements(info, osakaBeatMemoryLocation())
}

achievement(title = "Too easy",
            description = "Win a battle in Quest Mode losing only a small amount (1 percent max)",
            points = 3,
            trigger = justFinishedQuestRace() &&
                      questMode() &&
                      isDriving() &&
                      !demoMode() &&
                      playerHealth() >= MAX_HEALTH * 0.99
            )

achievement(title = "By the skin of your grill",
            description = "Win a battle in Quest Mode with less than 1 percent health left",
            points = 2,
            trigger = justFinishedQuestRace() &&
                      questMode() &&
                      isDriving() &&
                      !demoMode() &&
                      playerHealth() <= MAX_HEALTH * 0.01
            )


achievement(title = "All Night Battle",
            description = "Win a battle in Quest Mode that lasted for more than 2 minutes",
            points = 2,
            trigger = justFinishedQuestRace() &&
                      questMode() &&
                      isDriving() &&
                      !demoMode() &&
                      timerForQuestBattle() >= timeConversion(2,0)
            )

function speedAchievement(title, speedValue) 
{
    achievement(title = title,
            description = format("Reach {0} MPH in quest mode",speedValue),
            points = 2,
            trigger = questMode() &&
                      isDriving() &&
                      !demoMode() &&
                      questModeCurrentSpeedMPH() >= speedValue &&
                      prev(questModeCurrentSpeedMPH()) < speedValue
            )
}

speedAchievement("Speed Boy", 100)
speedAchievement("Speed Demon",150 )
speedAchievement("Speed King",200)
speedAchievement("Speed God",230)

function winStreakAchievement(title, targetValue) 
{
    achievement(title = title,
            description = format("Have a {0} win streak in quest mode", targetValue),
            points = 2,
            trigger = questMode() &&
                      isDriving() &&
                      !demoMode() &&
                      currentWinCombo() == targetValue &&
                      prev(currentWinCombo()) < targetValue
            )
}

winStreakAchievement("Are they even trying?", 10)
winStreakAchievement("No one can stop you", 15)
winStreakAchievement("All you do is win", 20) 


leaderboard(
    id = 89757,
    title = format("Faster Speed in Quest Mode"),
    description = format("Record the fastest time in Quest Mode"),
    start = 
    (
        justWasDriving() && 
        questMode() &&
        !demoMode()

    ),
    cancel = always_false(),
    submit = always_true(),
    value = todayMaxSpeedMPHconverted(),
    format = "VALUE"
)

leaderboard(
    id = 89758,
    title = format("Highest Win Combo in Quest Mode"),
    description = format("Record the wins combo counter in Quest Mode"),
    start = 
    (
        justWasDriving() && 
        questMode() &&
        !demoMode()

    ),
    cancel = always_false(),
    submit = always_true(),
    value = todayMaxWinCombo(),
    format = "VALUE"
)


leaderboard(
    id = 89759,
    title = format("Longest battle in Quest Mode"),
    description = format("Record the longest battle"),
    start = 
    (
        justFinishedQuestRace() &&
        questMode() &&
        isDriving() &&
        !demoMode() 
    ),
    cancel = always_false(),
    submit = always_true(),
    value = timerForQuestBattle(),
    format = "FRAMES"
)
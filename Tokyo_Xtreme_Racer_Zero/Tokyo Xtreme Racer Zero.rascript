// Tokyo Xtreme Racer - Zero
// #ID = 20774

// $274270: (32-bytes)The player's current car's configuration.
//          
//          Possibly bigger than 32 bytes.
//          
//          See 0x00309620 for information on each value,  (technically starting at 0x00309634)
function inGameCarConfiguration() => byte(0x274270)

// $305654: (8-bit) Current Car Class
//          
//          Front end Car class. Remains the same in gam as well.
//          
//          Changes based on what car class you're looking at when buying a car, but will revert to your current car when leaving that.
//          
//          Works in Time Trial, as well as Quest.
//          
//          There are multiple other options for this if it proves untrue, however this will work both in the front end and in game.
//          
//          0x00 = A Class
//          0x01 = B Class
//          0x02 = C Class.
function inGameCarClass() => byte(0x305654)

// $305674: (16-bit array) Class A Car indexes
//          
//          Number of cars at 0x0030b560
//          
//          Additional car information at 0x003057a0
//          
//          You can use https://gamefaqs.gamespot.com/ps2/448657-tokyo-xtreme-racer-zero/faqs/11886 to look up the correct names for these.
//          0x00 = AE86L3
//          0x01 = AE86T3
//          0x02 = AE86L2
//          0x03 = AE86T2
//          0x04 = SW20GT
//          0x05 = SW20G
//          0x06 = A80RZ
//          0x07 = A80SZ
//          0x08 = A80RZM
//          0x09 = A80SZM
//          0x0a = XE10RS
//          0x0b = XE10AS
//          0x0c = 100TV
//          0x0d = 100TVM
//          0x0e = 100MV
//          0x0f = 100MVM
//          0x10 = S13K
//          0x11 = S13Q
//          0x12 = PS13K
//          0x13 = PS13Q
//          0x14 = PS13KK
//          0x15 = S14K
//          0x16 = S14Q
//          0x17 = S14KM
//          0x18 = S14QM
//          0x19 = S15R
//          0x1a = S15S
//          0x1b = RPS13X
//          0x1c = RPS133
//          0x1d = R32RV2
//          0x1e = R32RN
//          0x1f = R32GTM
//          0x20 = R33RV
//          0x21 = R33RVM
//          0x22 = R34RV
//          0x23 = R34RVM
//          0x24 = R34GT
//          0x25 = R34GTM
//          0x26 = Z32VS
//          0x27 = Z32ZX
//          0x28 = Y33CV
//          0x29 = Y33GTU
//          0x2a = QX7
//          0x2b = QX7A
//          0x2c = QW
//          0x2d = MH5
//          0x2e = MH8
//          0x2f = ML3
//          0x30 = ML5
//          0x31 = RPT6
//          0x32 = RPT7
//          0x33 = CE9A
//          0x34 = CN9A
//          0x35 = CP9A5
//          0x36 = CP9A6
//          0x37 = CP9A6M
//          0x38 = FC3E3
//          0x39 = FC3X
//          0x3a = FD3RS
//          0x3b = FD3RZ
//          0x3c = GC8K
//          0x3d = GC8S4
//          0x3e = GC8C4
//          0x3f = GC8S5
//          0x40 = GC8C5
//          0x41 = GC8S6
//          0x42 = GC8C6
//          0x43 = GF8W4
//          0x44 = GF8W5
//          0x45 = GF8W6
//          0x46 = JS4
//          0x47 = JS4L
//          0x48 = 964T
//          0x49 = 964C2
//          0x4a = S30Z
//          0x4b = S30Z6
//          0x4c = AE111RL
//          0x4d = AE111RT
//          0x4e = UZZ30
//          0x4f = JZZ30
//          0x50 = NB8RS
//          0x51 = NB8RSM
//          0x52 = QW3
//          0x53 = ST205
//          0x54 = ST202
//          0x55 = Z15AM
//          0x56 = Z15A
//          0x57 = Z16A
//          0x58 = DE3A
//          0x59 = N15N1
//          0x5a = BE5
//          0x5b = BH5B
//          0x5c = T231
//          0x5d = W30
//          0x5e = Y34CV
//          0x5f = Y34GU
//          0x60 = E36
//          0x61 = N5S16M
//          0x62 = N5S16
//          0x63 = C34M
//          0x64 = C34
//          0x65 = S161V
//          0x66 = S161VM
//          0x67 = ML11
//          0x68 = ML11C
//          0x69 = 4K1
//          0x6a = 4E1
//          0x6b = YT1
//          0x6c = PG6SA
//          0x6d = EA11R
//          0x6e = EA21R
//          0x6f = JCESE
//          0x70 = A31C
//          0x71 = RF2
//          0x72 = A187
//          0x73 = RX3
//          0x74 = KPGC10
//          0x75 = R30M
//          0x76 = R30
//          0x77 = SAGTX
//          0x78 = VGTS
//          0x79 = S30ZX
//          0x7a = 4BV
//          0x7b = 4BU
//          0x7c = D32AGS
//          0x7d = ECGT
//          0x7e = 089G
//          0x7f = NCP35
//          0x80 = UCF308
//          0x81 = A70GTA
//          0x82 = A70TTR
//          0x83 = CT9A
//          0x84 = TAGDA
//          0x85 = TASTI
//          0x86 = CBAEP
//          0x87 = 100TVK
//          0x88 = JS4X
//          0x89 = JZZ30K
//          0x8a = Z15AMK
//          0x8b = RPT7B
//          0x8c = A70GTK
//          0x8d = R34RKK
//          0x8e = Y34GUK
//          0x8f = UZZ30K
//          0x90 = R34RK
//          0x91 = Z32VSK
//          0x92 = A80RZK
//          0x93 = FD3RK
//          0x94 = NCP35K
//          0x95 = S15RK
//          0x96 = R33RK
//          0x97 = FD3RKK
//          0x98 = S13KKK
//          0x99 = Z32ZXK
//          0x9a = S14KMK
//          0x9b = Y33CVK
//          0x9c = S161VK
//          0x9d = A80RK
//          0x9e = FC3E3K
//          0x9f = Z16AK
//          0xa0 = RPT6B
//          0xa1 = PS13XK
//          0xa2 = S15RKK
//          0xa3 = JCESEK
//          0xa4 = R32RNK
//          NOTE: After this is cars normally not purchasable.
//          0xa5 = YXS10
//          0xa6 = WHR69
//          0xa7 = EE98V
//          0xa8 = NKR58E
//          0xa9 = FV
//          0xaa = EE98VS
//          0xab = NKR585
//          0xac = NKR58R
//          0xad = SCP10
//          0xae = RA9
//          0xaf = CHRT
//          Note: Values over 0xb0 appears to cause the game to have issues.
function classACarIndexes() => word(0x305674)

// $3056D8: (16-bit array) Class B Car indexes
//          
//          Number of cars at 0x0030b562
//          
//          Additional car information at 0x003076e0
//          
//          Check 0x00305674 for meaning of each index
function classBCarIndexes() => word(0x3056D8)

// $30573C: (16-bit array) Class C Car indexes
//          
//          Number of cars at 0x0030b564
//          
//          Additional car information at 0x00309620
//          
//          Check 0x00305674 for meaning of each index
function classCCarIndexes() => word(0x30573C)

// $3057A0: This begins the array of Class A owned cars.  Note cars get shuffled around, if you sell the first car, all cars move up a slot.
//          
//          The number of car's owned (And thus size of the array is located at 0x0030b563
//          
//          Cars appear to be 160 bytes wide.
//          
//          There appears to be 32 slots.
function classAArray() => byte(0x3057A0)

// $3076E0: This begins the array of Class B owned cars.  Note cars get shuffled around, if you sell the first car, all cars move up a slot.
//          
//          The number of car's owned (And thus size of the array is located at 0x0030b562
//          
//          Cars appear to be 160 bytes wide.
//          
//          There appears to be 32 slots.
function classBArray() => byte(0x3076E0)

// $309620: (Array of 50 160-byte values) Class C Cars
//          
//          This begins the array of Class C owned cars.  Note cars get shuffled around, if you sell the first car, all cars move up a slot.
//          
//          The number of car's owned (And thus size of the array is located at 0x0030b564
//          
//          
//          There appears to be 32 slots.
function classCArray() => byte(0x309620)

// $309621: (Ascii Text)  1st class C car slot name in Ascii format.
//          
//          Up to 16 characters. Null terminated.  Adding extra characters cause them to be represented.
//          
//          Note, not true ascii, some additional characters are added, and some hidden characters exist (ff = small c like in copyright)
function classC1stCarName() => byte(0x309621)

// $309634: (16-bit) 1st class C car equipped sticker index
//          
//          0xffff = normal.
//          0x2 = Fast and furious
//          0x3 = Genki
//          0x4 = HMS
//          
//          Negligable change.  Likely the original number
function classC1stCarSticker() => word(0x309634)

// $3096B8: (32-bit) Distance traveled in car
//          
//          Controls a number of unlocks.
function classC1stCarDistanceTraveled() => dword(0x3096B8)

// $30B560: (16-bit) Number of Class A cars Owned
//          
//          Note: These also sum up to the "owned cars" in the player's record.
//          
//          Max of 50 cars total between Class A, Class B, and Class C
function classACarsOwned() => word(0x30B560)

// $30B562: (16-bit) Number of Class B cars Owned
//          
//          Note: These also sum up to the "owned cars" in the player's record.
//          
//          Max of 50 cars total between Class A, Class B, and Class C
function classBCarsOwned() => word(0x30B562)

// $30B564: (16-bit) Number of Class C cars Owned
//          
//          Note: These also sum up to the "owned cars" in the player's record.
//          
//          Max of 50 cars total between Class A, Class B, and Class C
function classCCarsOwned() => word(0x30B564)

// $3115A4: (32-bit) Previous Races won in quest mode
//          
//          This is set as you enter Quest mode and used on the post race screen to calculate the delta.
//          
//          Previous Wins is located at 0x003115a4
function questModePrevRacesWon() => dword(0x3115A4)

// $3115A8: (32-bit) Previous Races lost in quest mode
//          
//          This is set as you enter Quest mode and used on the post race screen to calculate the delta.
function questModePrevRacesLost() => dword(0x3115A8)

// $3115AC: (32-bit) Previous Races drawn in quest mode
//          
//          This is set as you enter Quest mode and used on the post race screen to calculate the delta.
function questModePrevRacesDrawn() => dword(0x3115AC)

// $375944: (32-bit)  Rear View Hanging model
//          
//          0xfffffff = No "Decoration"
//          0x00 = Toothy monster
//          0x01 = Pink Creature
//          0x02 = Blue Creature
//          0x03 = Green Monster Chungus
function mirrorHanger() => dword(0x375944)

// $375C0C: (16-bit) Car Index while driving
//          
//          Similar to 0x0375c0c, 0x37dc3c and 0x742b6e
//          
//          See 0x00305674 for car index.
function inGameCarIndex() => word(0x375C0C)

// $37DC50: (Float) Displayed value of Max Speed at end of night.
//          
//          Starts at 0, and increases.  This gets multiplied by 3.6 and then multiplied by .6 (To convert to Mph?)
function endOfNIghtMaxSpeed() => float(0x37DC50)

// $37DC60: (32-bit) In game Total Odometer Value per car.
//          
//          Not related to unlocks.
function inGameTotalOdometer() => dword(0x37DC60)

// $37DCA5: [408-bit]  Off by 1 array note.  List of all Rival who has beaten the player.
//          
//          Does not appear to get cleared when winning.  However beating the enemy with out losing will not set this. .
//          
//          Just a few key words.  Won, Beaten, win.
//          
//          Values (NOTE This is 1-index, due to how it is in game, it maybe be 0-index in game.
//          1=Rolling Guy 1 (Rolling Guy Leader)
//          2=Rolling Guy 2 (Rolling Guy 1)
//          3=Rolling Guy 3 (Rolling Guy 2)
//          4=Rolling Guy 4 (Rolling Guy 3)
//          5=Rolling Guy 5 (Rolling Guy 4)
//          6=Rolling Guy 6 (Rolling Guy 5)
//          7=Happy Run (Little Gang Leader)
//          8=Kiss My Bumper (Little Gang 1)
//          9=Talking Head (Little Gang 2)
//          10=Mr. Thanks (Little Gang 3)
//          11=Spring Bird (Little Gang 4)
//          12=Lazy Butt (Little Gang 5)
//          13=Old Star (SS Limited Leader)
//          14=Heaven's Door (SS Limited 1)
//          15=Black Rain (SS Limited 2)
//          16=Red Thunder (SS Limited 3)
//          17=Sports Killer (SS Limited 4)
//          18=New Star (SS Limited 5)
//          19=Chemistry (SS Limited 6)
//          20=Excite Carmine (SS Limited 7)
//          21=Invincible Dinner (Knife and Forks Leader)
//          22=Table Manner (Knife and Forks 1)
//          23=Street Wine (Knife and Forks 2)
//          24=Golden Cream Soup (Knife and Forks 3)
//          25=Midnight � la Mode (Knife and Forks 4)
//          26=4 Star Driver (Knife and Forks 5)
//          27=Red Table Cloth (Knife and Forks 6)
//          28=Sword of Dragon (Black Knights Leader)
//          29=Dark Varlet (Black Knights 1)
//          30=Dark Killer (Black Knights 2)
//          31=Dark Eyes (Black Knights 3)
//          32=Dark Crow (Black Knights 4)
//          33=Dark Cloud (Black Knights 5)
//          34=Dark Miracle (Black Knights 6)
//          35=Red Meteor (Fine Drive Leader)
//          36=Sylvester (Fine Drive 1)
//          37=Hell's Drifter (Fine Drive 2)
//          38=King of 2000cc (Fine Drive 3)
//          39=Drift King (Fine Drive 4)
//          40=Funky Monkey (Fine Drive 5)
//          41=Natural Soldier (Fine Drive 6)
//          42=Fire Bird (Fine Drive 7)
//          43=Flying Sasuke (RATT Leader)
//          44=Red Shadow (RATT 1)
//          45=Thunder Bird (RATT 2)
//          46=Rental Driver (RATT 3)
//          47=Gamer Racer (RATT 4)
//          48=Drift Queen (RATT 5)
//          49=Shocking Joe (Queen's Paradise Leader)
//          50=Sunday Driver (Queen's Paradise 1)
//          51=Balalaika Man (Queen's Paradise 2)
//          52=Chopper (Queen's Paradise 3)
//          53=Lucky Guy (Queen's Paradise 4)
//          54=Ballad (Queen's Paradise 5)
//          55=Mr. Mystery (Queen's Paradise 6)
//          56=Lonely Jackal (RINGS Leader)
//          57=Shocking Slide Tail (RINGS 1)
//          58=Meteor (RINGS 2)
//          59=Tune Up Junky (RINGS 3)
//          60=Silver Angel (RINGS 4)
//          61=White Devil (RINGS 5)
//          62=Flume (RINGS 6)
//          63=Myna Bird (RINGS 7)
//          64=Highway Prince (Curving Edge Leader)
//          65=Mr. Fire (Curving Edge 1)
//          66=Wind of Night (Curving Edge 2)
//          67=Professor Robledo (Curving Edge 3)
//          68=Thunder Flare (Curving Edge 4)
//          69=Road Killer (Curving Edge 5)
//          70=Mr. Firm (Galaxy Racers Leader)
//          71=Broken Arrow (Galaxy Racers 1)
//          72=Lovely Erotica (Galaxy Racers 2)
//          73=Mr. Othello (Galaxy Racers 3)
//          74=Sweet Honey (Galaxy Racers 4)
//          75=Sabrina (Galaxy Racers 5)
//          76=Bloody Rose (Max Racing Leader)
//          77=Golden Beast (Max Racing 1)
//          78=Crazy Hooligan (Max Racing 2)
//          79=Blue Shadow (Max Racing 3)
//          80=Dark Panther (Max Racing 4)
//          81=High Speed Blue Thunder (Max Racing 5)
//          82=High Speed White Blade (Max Racing 6)
//          83=High Speed Blood Rain (Max Racing 7)
//          84=300 Mile Red Ruby (Elegant Wild Leader)
//          85=Deep Green (Elegant Wild 1)
//          86=White Revolution (Elegant Wild 2)
//          87=Hostman Hut (Elegant Wild 3)
//          88=Black Cinderella (Elegant Wild 4)
//          89=Unfinish Yellow (Elegant Wild 5)
//          90=Happy Chappy (Departures Leader)
//          91=Night Killer (Departures 1)
//          92=Sweet Surrender (Departures 2)
//          93=Cool Sight (Departures 3)
//          94=Great Finance (Departures 4)
//          95=Up Beat (Departures 5)
//          96=Crystal Prince (Departures 6)
//          97=Burning Mirage (Twister Leader)
//          98=Smile (Twister 1)
//          99=Sweet Blues (Twister 2)
//          100=Blue Writer (Twister 3)
//          101=Shooting Star (Twister 4)
//          102=Baron (Twister 5)
//          103=Rainy Day (Twister 6)
//          104=Fire Revenge (Catz Leader)
//          105=Dark Mist (Catz 1)
//          106=Highway Wall (Catz 2)
//          107=Wine Chase (Catz 3)
//          108=Firefighter (Catz 4)
//          109=Fire Driver (Catz 5)
//          110=Unlucky Duke (Catz 6)
//          111=Hearing Master (The Road of Justice Leader)
//          112=Highway Magician (The Road of Justice 1)
//          113=Fighting Master (The Road of Justice 2)
//          114=Wall Street (The Road of Justice 3)
//          115=Flame Canon (The Road of Justice 4)
//          116=Shining (The Road of Justice 5)
//          117=Happy Camper (The Road of Justice 6)
//          118=Thunder Shift (Diamond Image Leader)
//          119=Lone Wolf (Diamond Image 1)
//          120=Spring Rain (Diamond Image 2)
//          121=Silver Bullet (Diamond Image 3)
//          122=Troubleshooter (Diamond Image 4)
//          123=Yellow Angel (Diamond Image 5)
//          124=Hip Hop Red (Rhythm Box Leader)
//          125=Jazz Green (Rhythm Box 1)
//          126=Classical Blue (Rhythm Box 2)
//          127=Stormy Calligrapher (Rhythm Box 3)
//          128=Pink Groove (Rhythm Box 4)
//          129=Midnight Blue (Rhythm Box 5)
//          130=Requiem (Wind Stars Leader)
//          131=R Magic (Wind Stars 1)
//          132=Diamond Dust (Wind Stars 2)
//          133=Yellow Flare (Wind Stars 3)
//          134=Mad Train (Wind Stars 4)
//          135=Speedy Valkyrie (Wind Stars 5)
//          136=Blue Star (Wind Stars 6)
//          137=Moody Queen (Wind Stars 7)
//          138=Visual Driver (Harmonize Leader)
//          139=Curve Block (Harmonize 1)
//          140=Highway Silver Arrow (Harmonize 2)
//          141=Aero Star (Harmonize 3)
//          142=Water Drift (Harmonize 4)
//          143=Brand New Thunder (Harmonize 5)
//          144=Dream Light (Harmonize 6)
//          145=Revolution (Super Speed Wagon Leader)
//          146=Magical (Super Speed Wagon 1)
//          147=Belly-ache (Super Speed Wagon 2)
//          148=Fruit Basket (Super Speed Wagon 3)
//          149=Jumping (Super Speed Wagon 4)
//          150=Shuffle (Super Speed Wagon 5)
//          151=Blue Speed (Another Star Leader)
//          152=Silver Speed (Another Star 1)
//          153=Lightning Bird (Another Star 2)
//          154=Red Shut (Another Star 3)
//          155=Battle Scratch (Another Star 4)
//          156=Lightning Eyes (Another Star 5)
//          157=U Violet (Another Star 6)
//          158=Time is Money (Gesellschaft Leader)
//          159=Lost Kid (Gesellschaft 1)
//          160=Lone Survivor (Gesellschaft 2)
//          161=Cool Guy (Gesellschaft 3)
//          162=Happy Extreme (Gesellschaft 4)
//          163=Angry Princess (Gesellschaft 5)
//          164=Wind Blade (Explosion Leader)
//          165=Golden Fang (Explosion 1)
//          166=Trouble Maker (Explosion 2)
//          167=Silent Sense (Explosion 3)
//          168=Blue Phoenix (Explosion 4)
//          169=Through Dog (Explosion 5)
//          170=Spirit Crasher (Highway Outlaw Leader)
//          171=Pride Killer (Highway Outlaw 1)
//          172=Cold Prince (Highway Outlaw 2)
//          173=Mad Driver (Highway Outlaw 3)
//          174=Driving Sir (Highway Outlaw 4)
//          175=Totem Pole (Highway Outlaw 5)
//          176=Spiral (Highway Outlaw 6)
//          177=Drift Dancer (R.Gangs Leader)
//          178=Street Dancer (R.Gangs 1)
//          179=Hell's Bartender (R.Gangs 2)
//          180=Professor Speedy (R.Gangs 3)
//          181=Wind Impala (R.Gangs 4)
//          182=Black Mirage (R.Gangs 5)
//          183=Rain Drop (R.Gangs 6)
//          184=Sonic Runner (Cupid Arrows Leader)
//          185=Mysterious Nymph (Cupid Arrows 1)
//          186=Moon Light Child (Cupid Arrows 2)
//          187=Cowboy Girl (Cupid Arrows 3)
//          188=Silver Impact (Cupid Arrows 4)
//          189=246 Heart Breaker (Cupid Arrows 5)
//          190=Ion (Tokio Jungle Leader)
//          191=MJ6feet6 (Tokio Jungle 1)
//          192=Black Wind (Tokio Jungle 2)
//          193=White Fox (Tokio Jungle 3)
//          194=Salty Dog (Tokio Jungle 4)
//          195=Slide Freek (Tokio Jungle 5)
//          196=Driving Blue Wave (Tokio Jungle 6)
//          197=Unstoppable Dream (TR Racing Leader)
//          198=Lovely Girl (TR Racing 1)
//          199=Rule Breaker (TR Racing 2)
//          200=180 Master (TR Racing 3)
//          201=Dawn Shaker (TR Racing 4)
//          202=Night Worker (TR Racing 5)
//          203=Dancing Chaser (TR Racing 6)
//          204=Car Maniac (Top Level Leader)
//          205=Mystery Girl (Top Level 1)
//          206=Red Tears (Top Level 2)
//          207=Sir General (Top Level 3)
//          208=Legendary Digger (Top Level 4)
//          209=Midnight Through (Top Level 5)
//          210=Russian Blue (Top Level 6)
//          211=Blue Meteor (Free Way Leader)
//          212=Orange Head (Free Way 1)
//          213=Silver Fox (Free Way 2)
//          214=Nightmare (Free Way 3)
//          215=Silent Reviver (Free Way 4)
//          216=Ultimate Killer (Free Way 5)
//          217=Crystal Knight (Free Way 6)
//          218=Speed Junky (Free Way 7)
//          219=Highway Bomber (Free Way 8)
//          220=Tobby (Dry Cruise Leader)
//          221=Midnight Owl (Dry Cruise 1)
//          222=Entrepreneur (Dry Cruise 2)
//          223=Rain Master (Dry Cruise 3)
//          224=Mr. Max (Dry Cruise 4)
//          225=Mr. Muscle (Dry Cruise 5)
//          226=Angel Smile (Dry Cruise 6)
//          227=Mr. Terminate (E.R.O. Leader)
//          228=Non Stop Emotion (E.R.O. 1)
//          229=Brand New Morning (E.R.O. 2)
//          230=Cool B (E.R.O. 3)
//          231=Star Holder (E.R.O. 4)
//          232=Sentimental Flame (E.R.O. 5)
//          233=Strange Devil (E.R.O. 6)
//          234=Texas' White Wolf (Team Alpha Leader)
//          235=Gattling Gun (Team Alpha 1)
//          236=Mike the Horseman (Team Alpha 2)
//          237=Smiling Shadow (Team Alpha 3)
//          238=Rock Spider (Team Alpha 4)
//          239=Code F (Team Alpha 5)
//          240=A+ Driver (True Ride Leader)
//          241=Large Impact (True Ride 1)
//          242=Iron Blocker (True Ride 2)
//          243=Genius Rookie (True Ride 3)
//          244=Wolter Wolf (True Ride 4)
//          245=Pink Lily (True Ride 5)
//          246=Strike Star (True Ride 6)
//          247=Sunny Dragon (True Ride 7)
//          248=Killing Machine (Unlimited Leader)
//          249=Lone MONSTER (Unlimited 1)
//          250=Scotch (Unlimited 2)
//          251=Yesman (Unlimited 3)
//          252=Daimajin (Unlimited 4)
//          253=Spider (Unlimited 5)
//          254=Sleepy Driver (Unlimited 6)
//          255=Silver Prince (R.R. Leader)
//          256=Turning Artist (R.R. 1)
//          257=Asphalt's Cry (R.R. 2)
//          258=HIROSHI (R.R. 3)
//          259=Dark Memory (R.R. 4)
//          260=Risky Cat (R.R. 5)
//          261=Black Bird (R.R. 6)
//          262=High Speed Star (R.R. 7)
//          263=Black Dragon (Thunder Dragoon Leader)
//          264=White Dragon (Thunder Dragoon 1)
//          265=Yellow Dragon (Thunder Dragoon 2)
//          266=Red Dragon (Thunder Dragoon 3)
//          267=Green Dragon (Thunder Dragoon 4)
//          268=Gray Dragon (Thunder Dragoon 5)
//          269=Blue Dragon (Thunder Dragoon 6)
//          270=Abf911 (Abflug SRT Leader)
//          271=Dandy (Abflug SRT 1)
//          272=Superman (Abflug SRT 2)
//          273=Teru (Abflug SRT 3)
//          274=Horse Head (Abflug SRT 4)
//          275=Speed Runner (Commander Leader)
//          276=Mr. Japan (Commander 1)
//          277=Shoe Keeper (Commander 2)
//          278=Weak Arm (Commander 3)
//          279=Girl Hunter (Commander 4)
//          280=Pickle (Commander 5)
//          281=Rainbow Traveler (Commander 6)
//          282=Swimmer (Commander 7)
//          283=Yellow Voltage (Double Mind Leader)
//          284=Dark Labyrinth (Double Mind 1)
//          285=Blood (Double Mind 2)
//          286=Gray Giant (Double Mind 3)
//          287=Brown Giant (Double Mind 4)
//          288=White Angel (Double Mind 5)
//          289=Gray Fairy (Double Mind 6)
//          290=Jamz (APS Leader)
//          291=Blocky Rider (APS 1)
//          292=King (APS 2)
//          293=Revived Wizard (APS 3)
//          294=Shyxgirl (APS 4)
//          295=Double Booking (APS 5)
//          296=New Wind (APS 6)
//          297=Burning Leader (Fanatic Future Leader)
//          298=Cool Looking (Fanatic Future 1)
//          299=Mysterious Driver (Fanatic Future 2)
//          300=Burning General (Fanatic Future 3)
//          301=Intelligent Teacher (Fanatic Future 4)
//          302=Larger than Life (Fanatic Future 5)
//          303=Love Knuckle (Fanatic Future 6)
//          304=Iceman (Speed Master Leader)
//          305=Crazy Moon (Speed Master 1)
//          306=Visual Tail (Speed Master 2)
//          307=Sunset Rider (Speed Master 3)
//          308=White Witch (Speed Master 4)
//          309=Pearl Kiss (Speed Master 5)
//          310=Maniac Player (Speed Master 6)
//          311=Black Angel (Speed Master 7)
//          312=Unknown Hero (Speed Master 8)
//          313=Fast Beat (Speed Master 9)
//          314=Lightning (Wanderers Leader)
//          315=White Panther (Wanderers 1)
//          316=Garage Door (Wanderers 2)
//          317=Speed Drinker (Wanderers 3)
//          318=Lonely Wolf (Wanderers 4)
//          319=Steam Storm (Wanderers 5)
//          320=Invincible Artist (Wanderers 6)
//          321=Lost Freak (Wanderers 7)
//          322=Bloody Mary (Wanderers 8)
//          323=Illusion B (Wanderers 9)
//          324=Caffeine Addict (Wanderers 10)
//          325=Magazine Freak (Wanderers 11)
//          326=Machine of Inferno (Wanderers 12)
//          327=Anguish Barbarian (Wanderers 13)
//          328=Waist Master (Wanderers 14)
//          329=Master Position (Wanderers 15)
//          330=Pretty Affair (Wanderers 16)
//          331=Devil Driver (Wanderers 17)
//          332=Street Gambler (Wanderers 18)
//          333=Green Wild (Wanderers 19)
//          334=Dark Desperado (Wanderers 20)
//          335=Eternity (Wanderers 21)
//          336=Mosquito Lemon (Wanderers 22)
//          337=Fearful Princess (Wanderers 23)
//          338=Dumb yet Smart (Wanderers 24)
//          339=Wild Heart (Wanderers 25)
//          340=Road Master (Wanderers 26)
//          341=Glamour Girl (Wanderers 27)
//          342=God Year (Wanderers 28)
//          343=Raspberry Kiss (Wanderers 29)
//          344=Craft Man (Wanderers 30)
//          345=Cutie Pie (Wanderers 31)
//          346=Storm Screamer (Wanderers 32)
//          347=Uncrushable Alexander (Wanderers 33)
//          348=Silver Ruler (Wanderers 34)
//          349=Night Wolf (Wanderers 35)
//          350=Max Energy (Wanderers 36)
//          351=Jet Skater (Wanderers 37)
//          352=Crying Baby (Wanderers 38)
//          353=Tomorrow Again (Wanderers 39)
//          354=Healthy Hero (Wanderers 40)
//          355=Late Night Cinderella (Wanderers 41)
//          356=Unbalanced Heart (Wanderers 42)
//          357=Toll Free (Wanderers 43)
//          358=Madness (Wanderers 44)
//          359=Technician Guy (Wanderers 45)
//          360=Fast Phobe (Wanderers 46)
//          361=ZERO (Wanderers 47)
//          362=SPEED BOX (Wanderers 48)
//          363=Mask (Wanderers 49)
//          364=Windy Fanfare (Wanderers 50)
//          365=Start Dash (Wanderers 51)
//          366=Golden License (Wanderers 52)
//          367=Iron Racer (Wanderers 53)
//          368=Exotic Butterfly (Wanderers 54)
//          369=King of Eden (Wanderers 55)
//          370=Loyal Knight (Wanderers 56)
//          371=Gentle Rain (Wanderers 57)
//          372=Last Flight (Wanderers 58)
//          373=Silent Barbarian (Wanderers 59)
//          374=Traitor Jack knife  Traitor Jack Knife (13 Devils Leader)
//          375=True Slide True Slide (13 Devils 1)
//          376=Unhappy Angel  Dejected angel (13 Devils 2)
//          377=Hard Weapon Hard Weapon (13 Devils 3)
//          378=Fallen Blade Fallen Blade (13 Devils 4)
//          379=Blood Hound Blood Hound (13 Devils 5)
//          380=Dark Producer  Dark Producer (13 Devils 6)
//          381=Mr. Sitar  Mr. Sitar (13 Devils 7)
//          382=Iron Heart  Iron Heart (13 Devils 8)
//          383=Dying Star Dying Star-0 (13 Devils 9)
//          384=Dreamy Ghost Dreamy Ghost (13 Devils 10)
//          385=Tail Gunner  Tail Gunner (13 Devils 11)
//          386=Shadow Eyes Shadow eyes icon (13 Devils 12)
//          387=Speed King - [S1]  Tim2out571571 (13 Devils 13)
//          388=Midnight Rose Midnight rose icon (The Zodiac Leader)
//          389=Golden Wind  Golden wind icon (The Zodiac 1)
//          390=Dark Ringleader  Dark ringleader icon (The Zodiac 2)
//          391=Hard Lift  Hard lift icon (The Zodiac 3)
//          392=Blue Pressure Blue pressure icon (The Zodiac 4)
//          393=No-Crown King  Nocrown king icon (The Zodiac 5)
//          394=Crying Pluto  Crying pluto icon (The Zodiac 6)
//          395=Red Devil  Red devil icon (The Zodiac 7)
//          396=Queen's Knight Queens knight icon (The Zodiac 8)
//          397=Purple Meteor Purple meteor icon (The Zodiac 9)
//          398=Exotic Eve  Exotic eve (The Zodiac 10)
//          399=White Charisma [S2]  White charisma icon (The Zodiac 11)
//          400=Unknown - [U]  Devilz icon (Final Boss Leader)
function lossesInfoOffByOne() => byte(0x37DCA5)

// $37DCA6: (8-bit) Location for marking losses against character
//          
//          Check 0x0037dca5 for more info
//          
//          Bit 0 Rolling Guy 1 (Rolling Guy Leader)
//          Bit 1 Rolling Guy 2 (Rolling Guy 1)
//          Bit 2 Rolling Guy 3 (Rolling Guy 2)
//          Bit 3 Rolling Guy 4 (Rolling Guy 3)
//          Bit 4 Rolling Guy 5 (Rolling Guy 4)
//          Bit 5 Rolling Guy 6 (Rolling Guy 5)
//          Bit 6 Happy Run (Little Gang Leader)
//          Bit 7 Kiss My Bumper (Little Gang 1)
function lossesStart() => byte(0x37DCA6)

// $37DCE5: [408-bit]  Off by 1 array note.  List of all Rival who has the player has beaten.
//          
//          Values (NOTE This is 1-index, due to how it is in game, it maybe be 0-index in game.
//          1=Rolling Guy 1 (Rolling Guy Leader)
//          2=Rolling Guy 2 (Rolling Guy 1)
//          3=Rolling Guy 3 (Rolling Guy 2)
//          4=Rolling Guy 4 (Rolling Guy 3)
//          5=Rolling Guy 5 (Rolling Guy 4)
//          6=Rolling Guy 6 (Rolling Guy 5)
//          7=Happy Run (Little Gang Leader)
//          8=Kiss My Bumper (Little Gang 1)
//          9=Talking Head (Little Gang 2)
//          10=Mr. Thanks (Little Gang 3)
//          11=Spring Bird (Little Gang 4)
//          12=Lazy Butt (Little Gang 5)
//          13=Old Star (SS Limited Leader)
//          14=Heaven's Door (SS Limited 1)
//          15=Black Rain (SS Limited 2)
//          16=Red Thunder (SS Limited 3)
//          17=Sports Killer (SS Limited 4)
//          18=New Star (SS Limited 5)
//          19=Chemistry (SS Limited 6)
//          20=Excite Carmine (SS Limited 7)
//          21=Invincible Dinner (Knife and Forks Leader)
//          22=Table Manner (Knife and Forks 1)
//          23=Street Wine (Knife and Forks 2)
//          24=Golden Cream Soup (Knife and Forks 3)
//          25=Midnight � la Mode (Knife and Forks 4)
//          26=4 Star Driver (Knife and Forks 5)
//          27=Red Table Cloth (Knife and Forks 6)
//          28=Sword of Dragon (Black Knights Leader)
//          29=Dark Varlet (Black Knights 1)
//          30=Dark Killer (Black Knights 2)
//          31=Dark Eyes (Black Knights 3)
//          32=Dark Crow (Black Knights 4)
//          33=Dark Cloud (Black Knights 5)
//          34=Dark Miracle (Black Knights 6)
//          35=Red Meteor (Fine Drive Leader)
//          36=Sylvester (Fine Drive 1)
//          37=Hell's Drifter (Fine Drive 2)
//          38=King of 2000cc (Fine Drive 3)
//          39=Drift King (Fine Drive 4)
//          40=Funky Monkey (Fine Drive 5)
//          41=Natural Soldier (Fine Drive 6)
//          42=Fire Bird (Fine Drive 7)
//          43=Flying Sasuke (RATT Leader)
//          44=Red Shadow (RATT 1)
//          45=Thunder Bird (RATT 2)
//          46=Rental Driver (RATT 3)
//          47=Gamer Racer (RATT 4)
//          48=Drift Queen (RATT 5)
//          49=Shocking Joe (Queen's Paradise Leader)
//          50=Sunday Driver (Queen's Paradise 1)
//          51=Balalaika Man (Queen's Paradise 2)
//          52=Chopper (Queen's Paradise 3)
//          53=Lucky Guy (Queen's Paradise 4)
//          54=Ballad (Queen's Paradise 5)
//          55=Mr. Mystery (Queen's Paradise 6)
//          56=Lonely Jackal (RINGS Leader)
//          57=Shocking Slide Tail (RINGS 1)
//          58=Meteor (RINGS 2)
//          59=Tune Up Junky (RINGS 3)
//          60=Silver Angel (RINGS 4)
//          61=White Devil (RINGS 5)
//          62=Flume (RINGS 6)
//          63=Myna Bird (RINGS 7)
//          64=Highway Prince (Curving Edge Leader)
//          65=Mr. Fire (Curving Edge 1)
//          66=Wind of Night (Curving Edge 2)
//          67=Professor Robledo (Curving Edge 3)
//          68=Thunder Flare (Curving Edge 4)
//          69=Road Killer (Curving Edge 5)
//          70=Mr. Firm (Galaxy Racers Leader)
//          71=Broken Arrow (Galaxy Racers 1)
//          72=Lovely Erotica (Galaxy Racers 2)
//          73=Mr. Othello (Galaxy Racers 3)
//          74=Sweet Honey (Galaxy Racers 4)
//          75=Sabrina (Galaxy Racers 5)
//          76=Bloody Rose (Max Racing Leader)
//          77=Golden Beast (Max Racing 1)
//          78=Crazy Hooligan (Max Racing 2)
//          79=Blue Shadow (Max Racing 3)
//          80=Dark Panther (Max Racing 4)
//          81=High Speed Blue Thunder (Max Racing 5)
//          82=High Speed White Blade (Max Racing 6)
//          83=High Speed Blood Rain (Max Racing 7)
//          84=300 Mile Red Ruby (Elegant Wild Leader)
//          85=Deep Green (Elegant Wild 1)
//          86=White Revolution (Elegant Wild 2)
//          87=Hostman Hut (Elegant Wild 3)
//          88=Black Cinderella (Elegant Wild 4)
//          89=Unfinish Yellow (Elegant Wild 5)
//          90=Happy Chappy (Departures Leader)
//          91=Night Killer (Departures 1)
//          92=Sweet Surrender (Departures 2)
//          93=Cool Sight (Departures 3)
//          94=Great Finance (Departures 4)
//          95=Up Beat (Departures 5)
//          96=Crystal Prince (Departures 6)
//          97=Burning Mirage (Twister Leader)
//          98=Smile (Twister 1)
//          99=Sweet Blues (Twister 2)
//          100=Blue Writer (Twister 3)
//          101=Shooting Star (Twister 4)
//          102=Baron (Twister 5)
//          103=Rainy Day (Twister 6)
//          104=Fire Revenge (Catz Leader)
//          105=Dark Mist (Catz 1)
//          106=Highway Wall (Catz 2)
//          107=Wine Chase (Catz 3)
//          108=Firefighter (Catz 4)
//          109=Fire Driver (Catz 5)
//          110=Unlucky Duke (Catz 6)
//          111=Hearing Master (The Road of Justice Leader)
//          112=Highway Magician (The Road of Justice 1)
//          113=Fighting Master (The Road of Justice 2)
//          114=Wall Street (The Road of Justice 3)
//          115=Flame Canon (The Road of Justice 4)
//          116=Shining (The Road of Justice 5)
//          117=Happy Camper (The Road of Justice 6)
//          118=Thunder Shift (Diamond Image Leader)
//          119=Lone Wolf (Diamond Image 1)
//          120=Spring Rain (Diamond Image 2)
//          121=Silver Bullet (Diamond Image 3)
//          122=Troubleshooter (Diamond Image 4)
//          123=Yellow Angel (Diamond Image 5)
//          124=Hip Hop Red (Rhythm Box Leader)
//          125=Jazz Green (Rhythm Box 1)
//          126=Classical Blue (Rhythm Box 2)
//          127=Stormy Calligrapher (Rhythm Box 3)
//          128=Pink Groove (Rhythm Box 4)
//          129=Midnight Blue (Rhythm Box 5)
//          130=Requiem (Wind Stars Leader)
//          131=R Magic (Wind Stars 1)
//          132=Diamond Dust (Wind Stars 2)
//          133=Yellow Flare (Wind Stars 3)
//          134=Mad Train (Wind Stars 4)
//          135=Speedy Valkyrie (Wind Stars 5)
//          136=Blue Star (Wind Stars 6)
//          137=Moody Queen (Wind Stars 7)
//          138=Visual Driver (Harmonize Leader)
//          139=Curve Block (Harmonize 1)
//          140=Highway Silver Arrow (Harmonize 2)
//          141=Aero Star (Harmonize 3)
//          142=Water Drift (Harmonize 4)
//          143=Brand New Thunder (Harmonize 5)
//          144=Dream Light (Harmonize 6)
//          145=Revolution (Super Speed Wagon Leader)
//          146=Magical (Super Speed Wagon 1)
//          147=Belly-ache (Super Speed Wagon 2)
//          148=Fruit Basket (Super Speed Wagon 3)
//          149=Jumping (Super Speed Wagon 4)
//          150=Shuffle (Super Speed Wagon 5)
//          151=Blue Speed (Another Star Leader)
//          152=Silver Speed (Another Star 1)
//          153=Lightning Bird (Another Star 2)
//          154=Red Shut (Another Star 3)
//          155=Battle Scratch (Another Star 4)
//          156=Lightning Eyes (Another Star 5)
//          157=U Violet (Another Star 6)
//          158=Time is Money (Gesellschaft Leader)
//          159=Lost Kid (Gesellschaft 1)
//          160=Lone Survivor (Gesellschaft 2)
//          161=Cool Guy (Gesellschaft 3)
//          162=Happy Extreme (Gesellschaft 4)
//          163=Angry Princess (Gesellschaft 5)
//          164=Wind Blade (Explosion Leader)
//          165=Golden Fang (Explosion 1)
//          166=Trouble Maker (Explosion 2)
//          167=Silent Sense (Explosion 3)
//          168=Blue Phoenix (Explosion 4)
//          169=Through Dog (Explosion 5)
//          170=Spirit Crasher (Highway Outlaw Leader)
//          171=Pride Killer (Highway Outlaw 1)
//          172=Cold Prince (Highway Outlaw 2)
//          173=Mad Driver (Highway Outlaw 3)
//          174=Driving Sir (Highway Outlaw 4)
//          175=Totem Pole (Highway Outlaw 5)
//          176=Spiral (Highway Outlaw 6)
//          177=Drift Dancer (R.Gangs Leader)
//          178=Street Dancer (R.Gangs 1)
//          179=Hell's Bartender (R.Gangs 2)
//          180=Professor Speedy (R.Gangs 3)
//          181=Wind Impala (R.Gangs 4)
//          182=Black Mirage (R.Gangs 5)
//          183=Rain Drop (R.Gangs 6)
//          184=Sonic Runner (Cupid Arrows Leader)
//          185=Mysterious Nymph (Cupid Arrows 1)
//          186=Moon Light Child (Cupid Arrows 2)
//          187=Cowboy Girl (Cupid Arrows 3)
//          188=Silver Impact (Cupid Arrows 4)
//          189=246 Heart Breaker (Cupid Arrows 5)
//          190=Ion (Tokio Jungle Leader)
//          191=MJ6feet6 (Tokio Jungle 1)
//          192=Black Wind (Tokio Jungle 2)
//          193=White Fox (Tokio Jungle 3)
//          194=Salty Dog (Tokio Jungle 4)
//          195=Slide Freek (Tokio Jungle 5)
//          196=Driving Blue Wave (Tokio Jungle 6)
//          197=Unstoppable Dream (TR Racing Leader)
//          198=Lovely Girl (TR Racing 1)
//          199=Rule Breaker (TR Racing 2)
//          200=180 Master (TR Racing 3)
//          201=Dawn Shaker (TR Racing 4)
//          202=Night Worker (TR Racing 5)
//          203=Dancing Chaser (TR Racing 6)
//          204=Car Maniac (Top Level Leader)
//          205=Mystery Girl (Top Level 1)
//          206=Red Tears (Top Level 2)
//          207=Sir General (Top Level 3)
//          208=Legendary Digger (Top Level 4)
//          209=Midnight Through (Top Level 5)
//          210=Russian Blue (Top Level 6)
//          211=Blue Meteor (Free Way Leader)
//          212=Orange Head (Free Way 1)
//          213=Silver Fox (Free Way 2)
//          214=Nightmare (Free Way 3)
//          215=Silent Reviver (Free Way 4)
//          216=Ultimate Killer (Free Way 5)
//          217=Crystal Knight (Free Way 6)
//          218=Speed Junky (Free Way 7)
//          219=Highway Bomber (Free Way 8)
//          220=Tobby (Dry Cruise Leader)
//          221=Midnight Owl (Dry Cruise 1)
//          222=Entrepreneur (Dry Cruise 2)
//          223=Rain Master (Dry Cruise 3)
//          224=Mr. Max (Dry Cruise 4)
//          225=Mr. Muscle (Dry Cruise 5)
//          226=Angel Smile (Dry Cruise 6)
//          227=Mr. Terminate (E.R.O. Leader)
//          228=Non Stop Emotion (E.R.O. 1)
//          229=Brand New Morning (E.R.O. 2)
//          230=Cool B (E.R.O. 3)
//          231=Star Holder (E.R.O. 4)
//          232=Sentimental Flame (E.R.O. 5)
//          233=Strange Devil (E.R.O. 6)
//          234=Texas' White Wolf (Team Alpha Leader)
//          235=Gattling Gun (Team Alpha 1)
//          236=Mike the Horseman (Team Alpha 2)
//          237=Smiling Shadow (Team Alpha 3)
//          238=Rock Spider (Team Alpha 4)
//          239=Code F (Team Alpha 5)
//          240=A+ Driver (True Ride Leader)
//          241=Large Impact (True Ride 1)
//          242=Iron Blocker (True Ride 2)
//          243=Genius Rookie (True Ride 3)
//          244=Wolter Wolf (True Ride 4)
//          245=Pink Lily (True Ride 5)
//          246=Strike Star (True Ride 6)
//          247=Sunny Dragon (True Ride 7)
//          248=Killing Machine (Unlimited Leader)
//          249=Lone MONSTER (Unlimited 1)
//          250=Scotch (Unlimited 2)
//          251=Yesman (Unlimited 3)
//          252=Daimajin (Unlimited 4)
//          253=Spider (Unlimited 5)
//          254=Sleepy Driver (Unlimited 6)
//          255=Silver Prince (R.R. Leader)
//          256=Turning Artist (R.R. 1)
//          257=Asphalt's Cry (R.R. 2)
//          258=HIROSHI (R.R. 3)
//          259=Dark Memory (R.R. 4)
//          260=Risky Cat (R.R. 5)
//          261=Black Bird (R.R. 6)
//          262=High Speed Star (R.R. 7)
//          263=Black Dragon (Thunder Dragoon Leader)
//          264=White Dragon (Thunder Dragoon 1)
//          265=Yellow Dragon (Thunder Dragoon 2)
//          266=Red Dragon (Thunder Dragoon 3)
//          267=Green Dragon (Thunder Dragoon 4)
//          268=Gray Dragon (Thunder Dragoon 5)
//          269=Blue Dragon (Thunder Dragoon 6)
//          270=Abf911 (Abflug SRT Leader)
//          271=Dandy (Abflug SRT 1)
//          272=Superman (Abflug SRT 2)
//          273=Teru (Abflug SRT 3)
//          274=Horse Head (Abflug SRT 4)
//          275=Speed Runner (Commander Leader)
//          276=Mr. Japan (Commander 1)
//          277=Shoe Keeper (Commander 2)
//          278=Weak Arm (Commander 3)
//          279=Girl Hunter (Commander 4)
//          280=Pickle (Commander 5)
//          281=Rainbow Traveler (Commander 6)
//          282=Swimmer (Commander 7)
//          283=Yellow Voltage (Double Mind Leader)
//          284=Dark Labyrinth (Double Mind 1)
//          285=Blood (Double Mind 2)
//          286=Gray Giant (Double Mind 3)
//          287=Brown Giant (Double Mind 4)
//          288=White Angel (Double Mind 5)
//          289=Gray Fairy (Double Mind 6)
//          290=Jamz (APS Leader)
//          291=Blocky Rider (APS 1)
//          292=King (APS 2)
//          293=Revived Wizard (APS 3)
//          294=Shyxgirl (APS 4)
//          295=Double Booking (APS 5)
//          296=New Wind (APS 6)
//          297=Burning Leader (Fanatic Future Leader)
//          298=Cool Looking (Fanatic Future 1)
//          299=Mysterious Driver (Fanatic Future 2)
//          300=Burning General (Fanatic Future 3)
//          301=Intelligent Teacher (Fanatic Future 4)
//          302=Larger than Life (Fanatic Future 5)
//          303=Love Knuckle (Fanatic Future 6)
//          304=Iceman (Speed Master Leader)
//          305=Crazy Moon (Speed Master 1)
//          306=Visual Tail (Speed Master 2)
//          307=Sunset Rider (Speed Master 3)
//          308=White Witch (Speed Master 4)
//          309=Pearl Kiss (Speed Master 5)
//          310=Maniac Player (Speed Master 6)
//          311=Black Angel (Speed Master 7)
//          312=Unknown Hero (Speed Master 8)
//          313=Fast Beat (Speed Master 9)
//          314=Lightning (Wanderers Leader)
//          315=White Panther (Wanderers 1)
//          316=Garage Door (Wanderers 2)
//          317=Speed Drinker (Wanderers 3)
//          318=Lonely Wolf (Wanderers 4)
//          319=Steam Storm (Wanderers 5)
//          320=Invincible Artist (Wanderers 6)
//          321=Lost Freak (Wanderers 7)
//          322=Bloody Mary (Wanderers 8)
//          323=Illusion B (Wanderers 9)
//          324=Caffeine Addict (Wanderers 10)
//          325=Magazine Freak (Wanderers 11)
//          326=Machine of Inferno (Wanderers 12)
//          327=Anguish Barbarian (Wanderers 13)
//          328=Waist Master (Wanderers 14)
//          329=Master Position (Wanderers 15)
//          330=Pretty Affair (Wanderers 16)
//          331=Devil Driver (Wanderers 17)
//          332=Street Gambler (Wanderers 18)
//          333=Green Wild (Wanderers 19)
//          334=Dark Desperado (Wanderers 20)
//          335=Eternity (Wanderers 21)
//          336=Mosquito Lemon (Wanderers 22)
//          337=Fearful Princess (Wanderers 23)
//          338=Dumb yet Smart (Wanderers 24)
//          339=Wild Heart (Wanderers 25)
//          340=Road Master (Wanderers 26)
//          341=Glamour Girl (Wanderers 27)
//          342=God Year (Wanderers 28)
//          343=Raspberry Kiss (Wanderers 29)
//          344=Craft Man (Wanderers 30)
//          345=Cutie Pie (Wanderers 31)
//          346=Storm Screamer (Wanderers 32)
//          347=Uncrushable Alexander (Wanderers 33)
//          348=Silver Ruler (Wanderers 34)
//          349=Night Wolf (Wanderers 35)
//          350=Max Energy (Wanderers 36)
//          351=Jet Skater (Wanderers 37)
//          352=Crying Baby (Wanderers 38)
//          353=Tomorrow Again (Wanderers 39)
//          354=Healthy Hero (Wanderers 40)
//          355=Late Night Cinderella (Wanderers 41)
//          356=Unbalanced Heart (Wanderers 42)
//          357=Toll Free (Wanderers 43)
//          358=Madness (Wanderers 44)
//          359=Technician Guy (Wanderers 45)
//          360=Fast Phobe (Wanderers 46)
//          361=ZERO (Wanderers 47)
//          362=SPEED BOX (Wanderers 48)
//          363=Mask (Wanderers 49)
//          364=Windy Fanfare (Wanderers 50)
//          365=Start Dash (Wanderers 51)
//          366=Golden License (Wanderers 52)
//          367=Iron Racer (Wanderers 53)
//          368=Exotic Butterfly (Wanderers 54)
//          369=King of Eden (Wanderers 55)
//          370=Loyal Knight (Wanderers 56)
//          371=Gentle Rain (Wanderers 57)
//          372=Last Flight (Wanderers 58)
//          373=Silent Barbarian (Wanderers 59)
//          374=Traitor Jack knife  Traitor Jack Knife (13 Devils Leader)
//          375=True Slide True Slide (13 Devils 1)
//          376=Unhappy Angel  Dejected angel (13 Devils 2)
//          377=Hard Weapon Hard Weapon (13 Devils 3)
//          378=Fallen Blade Fallen Blade (13 Devils 4)
//          379=Blood Hound Blood Hound (13 Devils 5)
//          380=Dark Producer  Dark Producer (13 Devils 6)
//          381=Mr. Sitar  Mr. Sitar (13 Devils 7)
//          382=Iron Heart  Iron Heart (13 Devils 8)
//          383=Dying Star Dying Star-0 (13 Devils 9)
//          384=Dreamy Ghost Dreamy Ghost (13 Devils 10)
//          385=Tail Gunner  Tail Gunner (13 Devils 11)
//          386=Shadow Eyes Shadow eyes icon (13 Devils 12)
//          387=Speed King - [S1]  Tim2out571571 (13 Devils 13)
//          388=Midnight Rose Midnight rose icon (The Zodiac Leader)
//          389=Golden Wind  Golden wind icon (The Zodiac 1)
//          390=Dark Ringleader  Dark ringleader icon (The Zodiac 2)
//          391=Hard Lift  Hard lift icon (The Zodiac 3)
//          392=Blue Pressure Blue pressure icon (The Zodiac 4)
//          393=No-Crown King  Nocrown king icon (The Zodiac 5)
//          394=Crying Pluto  Crying pluto icon (The Zodiac 6)
//          395=Red Devil  Red devil icon (The Zodiac 7)
//          396=Queen's Knight Queens knight icon (The Zodiac 8)
//          397=Purple Meteor Purple meteor icon (The Zodiac 9)
//          398=Exotic Eve  Exotic eve (The Zodiac 10)
//          399=White Charisma [S2]  White charisma icon (The Zodiac 11)
//          400=Unknown - [U]  Devilz icon (Final Boss Leader)
function winsInfo() => byte(0x37DCE5)

// $37DCE6: (8-bit) Location for marking wins against Rivals
//          
//          Bit 0 Rolling Guy 1 (Rolling Guy Leader)
//          Bit 1 Rolling Guy 2 (Rolling Guy 1)
//          Bit 2 Rolling Guy 3 (Rolling Guy 2)
//          Bit 3 Rolling Guy 4 (Rolling Guy 3)
//          Bit 4 Rolling Guy 5 (Rolling Guy 4)
//          Bit 5 Rolling Guy 6 (Rolling Guy 5)
//          Bit 6 Happy Run (Little Gang Leader)
//          Bit 7 Kiss My Bumper (Little Gang 1)
function winsStart() => byte(0x37DCE6)

// $37DD66: (165-bit) Car Unlock array.
//          
//          Cars will unlock from this list, by setting the bit to true.  Some cars are available from the start, others will unlock as you beat their model in races.
//          
//          Yes this size is not a multiple of 8, because it's really a bit field.
//          
//          Hex (Bit number) values are as follows.
//          0x00 = AE86L3
//          0x01 = AE86T3
//          0x02 = AE86L2
//          0x03 = AE86T2
//          0x04 = SW20GT
//          0x05 = SW20G
//          0x06 = A80RZ
//          0x07 = A80SZ
//          0x08 = A80RZM
//          0x09 = A80SZM
//          0x0a = XE10RS
//          0x0b = XE10AS
//          0x0c = 100TV
//          0x0d = 100TVM
//          0x0e = 100MV
//          0x0f = 100MVM
//          0x10 = S13K
//          0x11 = S13Q
//          0x12 = PS13K
//          0x13 = PS13Q
//          0x14 = PS13KK
//          0x15 = S14K
//          0x16 = S14Q
//          0x17 = S14KM
//          0x18 = S14QM
//          0x19 = S15R
//          0x1a = S15S
//          0x1b = RPS13X
//          0x1c = RPS133
//          0x1d = R32RV2
//          0x1e = R32RN
//          0x1f = R32GTM
//          0x20 = R33RV
//          0x21 = R33RVM
//          0x22 = R34RV
//          0x23 = R34RVM
//          0x24 = R34GT
//          0x25 = R34GTM
//          0x26 = Z32VS
//          0x27 = Z32ZX
//          0x28 = Y33CV
//          0x29 = Y33GTU
//          0x2a = QX7
//          0x2b = QX7A
//          0x2c = QW
//          0x2d = MH5
//          0x2e = MH8
//          0x2f = ML3
//          0x30 = ML5
//          0x31 = RPT6
//          0x32 = RPT7
//          0x33 = CE9A
//          0x34 = CN9A
//          0x35 = CP9A5
//          0x36 = CP9A6
//          0x37 = CP9A6M
//          0x38 = FC3E3
//          0x39 = FC3X
//          0x3a = FD3RS
//          0x3b = FD3RZ
//          0x3c = GC8K
//          0x3d = GC8S4
//          0x3e = GC8C4
//          0x3f = GC8S5
//          0x40 = GC8C5
//          0x41 = GC8S6
//          0x42 = GC8C6
//          0x43 = GF8W4
//          0x44 = GF8W5
//          0x45 = GF8W6
//          0x46 = JS4
//          0x47 = JS4L
//          0x48 = 964T
//          0x49 = 964C2
//          0x4a = S30Z
//          0x4b = S30Z6
//          0x4c = AE111RL
//          0x4d = AE111RT
//          0x4e = UZZ30
//          0x4f = JZZ30
//          0x50 = NB8RS
//          0x51 = NB8RSM
//          0x52 = QW3
//          0x53 = ST205
//          0x54 = ST202
//          0x55 = Z15AM
//          0x56 = Z15A
//          0x57 = Z16A
//          0x58 = DE3A
//          0x59 = N15N1
//          0x5a = BE5
//          0x5b = BH5B
//          0x5c = T231
//          0x5d = W30
//          0x5e = Y34CV
//          0x5f = Y34GU
//          0x60 = E36
//          0x61 = N5S16M
//          0x62 = N5S16
//          0x63 = C34M
//          0x64 = C34
//          0x65 = S161V
//          0x66 = S161VM
//          0x67 = ML11
//          0x68 = ML11C
//          0x69 = 4K1
//          0x6a = 4E1
//          0x6b = YT1
//          0x6c = PG6SA
//          0x6d = EA11R
//          0x6e = EA21R
//          0x6f = JCESE
//          0x70 = A31C
//          0x71 = RF2
//          0x72 = A187
//          0x73 = RX3
//          0x74 = KPGC10
//          0x75 = R30M
//          0x76 = R30
//          0x77 = SAGTX
//          0x78 = VGTS
//          0x79 = S30ZX
//          0x7a = 4BV
//          0x7b = 4BU
//          0x7c = D32AGS
//          0x7d = ECGT
//          0x7e = 089G
//          0x7f = NCP35
//          0x80 = UCF308
//          0x81 = A70GTA
//          0x82 = A70TTR
//          0x83 = CT9A
//          0x84 = TAGDA
//          0x85 = TASTI
//          0x86 = CBAEP
//          0x87 = 100TVK
//          0x88 = JS4X
//          0x89 = JZZ30K
//          0x8a = Z15AMK
//          0x8b = RPT7B
//          0x8c = A70GTK
//          0x8d = R34RKK
//          0x8e = Y34GUK
//          0x8f = UZZ30K
//          0x90 = R34RK
//          0x91 = Z32VSK
//          0x92 = A80RZK
//          0x93 = FD3RK
//          0x94 = NCP35K
//          0x95 = S15RK
//          0x96 = R33RK
//          0x97 = FD3RKK
//          0x98 = S13KKK
//          0x99 = Z32ZXK
//          0x9a = S14KMK
//          0x9b = Y33CVK
//          0x9c = S161VK
//          0x9d = A80RK
//          0x9e = FC3E3K
//          0x9f = Z16AK
//          0xa0 = RPT6B
//          0xa1 = PS13XK
//          0xa2 = S15RKK
//          0xa3 = JCESEK
//          0xa4 = R32RNK
function carUnlockArray() => byte(0x37DD66)

// $37DD87: (8-bit signed) Current day of the Quest mode.
function currentDayOffByOne)() => byte(0x37DD87)

// $37DD88: (32-bit signed) Total money in Quest mode divided by 10s.
//          
//          0x1 = 10 dollars, 0x10 = 160 dollars
//          
//          This has 32 bits, however the in game display shows up to 9,999,9990.  Unknown if the game stores extra money.
//          
//          (Cash, just because I like to search the word cash)
function totalMoneyQuestMode() => dword(0x37DD88)

// $37DD90: (32-bit signed) Total Races won in quest mode
//          
//          Previous Wins is located at 0x003115a4
function totalRacesWonQuestMode() => dword(0x37DD90)

// $37DD94: (32-bit signed) Total Races lost in quest mode
//          
//          Previous Losses is located at 0x003115a8
function totalRacesLostQuestMode() => dword(0x37DD94)

// $37DD98: (32-bit signed) Total Races ending in a draw in quest mode
//          
//          Previous Draws is located at 0x003115aC
function totalRacesDrawnQuestMode() => dword(0x37DD98)

// $73FBBC: (8-bit) Movie playing in DVD Extras
//          
//          When 0x0073fbbf is set to 06
//          
//          0x01 = The Fast and furious
//          0x02 = Tokyo Hardcore: Night Warriors
function whichMoviePlaying() => byte(0x73FBBC)

// $73FBBE: (8-bit) Movie playing
//          
//          If set to 1 the game will play a movie rather than enter the game.
//          
//          Not too reliable, but interesting for sure.
function isMoviePlaying() => byte(0x73FBBE)

// $73FBBF: (8-bit) Mode of game/Main Menu Selection
//          
//          Changes based on game mode, doesn't appear to change after selecting from the main menu.
//          
//          Will change the "Exit X" inside the mode, and changes the options highlighted when returning to the main menu.
//          
//          0x00= Quest
//          0x01= Quick Race
//          0x02= Time Attack
//          0x03= Free Run
//          0x04= Versus
//          0x05= System (Options)
//          0x06= DVD Extras
function currentGameMode() => byte(0x73FBBF)

// $73FBF0: (8-bit) On front End indicator.
//          
//          0x00 = In Front end.
//          0x00 = Driving or loading into the game.   Note this should not be used purely for "Driving"
//          
//          Note: there's about 22766 values I found for this that are boolean (0x00 and 0x01) So if this proves wrong, start from scratch and try to find something better.  Only chose this one due to closeness to 0x0073fbbf
function frontEndIndicator() => byte(0x73FBF0)

// $73FC48: (8-bit) Quest Menu Return option
//          
//          When choosing an option on the quest menu, this tells the system which option to highlight when returning.
//          
//          0xff = On Main Menu or no option selected.
//          0x00 = Start
//          0x01 = Car Change
//          0x02 = Settings
//          0x03 = Part Shop
//          0x04 = Car Shop
//          0x05 = Rivals
//          0x06= System
//          0x07 Quit
//          
//          Note this value changes when entering a mode.  But can tell you which submode the player is in (or last visited.
function questModeSubmenu() => byte(0x73FC48)

// $742B68: (32-bit) Trip odometer in game.
//          
//          Every 0xa2 (162) increases the distance by .1  (note the game doesn't show a . but it is 1/10th of a mile due to time.
//          
//          Does not affect Odometer
function inGameTripOdometer() => dword(0x742B68)

// $74AF6C: (8-bit) Driving in Game
//          
//          0x00 = In Front end. or Loading.
//          0x00 = Actually driving or paused while in game.
function inGameIndicator() => byte(0x74AF6C)

// $7508F8: (32-bit) Player's Health in battle
//          
//          0x00 = death
//          0x4c4b40 = 	max?
function playersHealth() => dword(0x7508F8)

// $7508FC: (32-bit) Enemy's Health in battle
//          
//          0x00 = death
function Enemy's Health() => dword(0x7508FC)

// $750900: (32-bit) Time in battle  (Frame amount)
//          
//          Each value is 16 miliseconds. Seems based on 60 fps.
//          Value appears to go over 59:59:999, but that is the highest displayed.  None of those values will ever appear though.
//          
//          Idea for achievement?  MOST time?
//          
//          Note: Freezing at a low value may freeze the players life as well.  Interesting.
function timeInBattle() => dword(0x750900)

// $750A80: (8-bit) Shows what post game screen is being displayed in Time Trial.
//          
//          This is not a control value, but will work for detecting when the time trial is over, so 0x00750900 and similar may be polled.
//          
//          0x00 = No screen.
//          0x01 = Time Trial timing or Quest mode money earned  post race screen.
//          0x02 = "continue"(retry) Replay, replay save, Return to Garage post race screen
//          0x03 = Pause menu
function postRaceScreen() => byte(0x750A80)

// $750B18: (8-bit) Ranking of Time Trial Course
//          
//          0x00 is first.
//          0xff is unranked.
function timeTrialCourseRanking() => byte(0x750B18)

// $750B20: (32-bit) Time in Time Trials in Milliseconds
//          
//          0x010000 for instance is 1048576 which is 17 minutes, 28 seconds 576 miliseconds
function timeTrialTime() => dword(0x750B20)

// $750B32: (8-bit) Course Number for Time Trial
//          
//          0x0A = 0-400m on Oval
//          0x0B = Oval
function timetrialCourseIndex() => byte(0x750B32)

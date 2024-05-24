// Initial D: Special Stage
// #ID = 24419

// $2F3951: (32 array of 8-bit values) Iketani Car Guide
//          
//          Each byte is either 0x00 or 0x01
//          
//          0x00 = Unowned
//          0x01 = Owned.  when all 20 bytes are 0x01, you can hear Iggy talk about any car.   But why would you?
function iketaniCarGuide() => byte(0x2F3951)

// $2F3972: (31 array of 8-bit) Song Unlocks
//          
//          0x0 = Locked
//          0x1 = Unlocked
//          
//          Starts with 11 songs unlocked.
function songUnlock() => byte(0x2F3972)

// $3172E0: (8-bit) Story mode Progression
//          
//          How many Stages are complete
//          
//          0x01 = Stage 1 Complete
//          0x02 = Stage 2 Complete
function storyModeProgress() => byte(0x3172E0)

// $3172F0: (Array of 31 8-bit Values)  Story Mode Stage Grade
//          
//          This is Stage 1
//          
//          0x00 = Rank D
//          0x01 = Rank C
//          0x02 = Rank B
//          0x03 = Rank A
//          0x04 = Rank S
function storyModeStageGrade() => byte(0x3172F0)

// $32791E: (8-bit) Main Menu Chosen.
//          
//          0x00 = Arcade mode.
//          0x01 = Story Mode
//          0x02 = Time Attack
function modechoice() => byte(0x32791E)

// $327950: (Array of 44 8-bit numbers).  Win Loss of CURRENT car in Arcade
//          
//          0x00 = Unbeaten
//          0x01 = Beaten in Dry.
//          Any number is Beaten in Rain, continues to increments.
//          
//          - Myogi Start
//          0x00=Itsuki Takeuchi
//          0x02=Takumi Fujiwara
//          0x04=Shingo Shouji
//          0x06=Takeshi Nakazato
//          - Usui Start
//          0x08=Two People From Tokyo
//          0x0a=Nobuhiko Akiyama
//          0x0c=Mako Satou & Sayuki
//          0x0e=Tsukamoto
//          - Akagi Start
//          0x10=Kyouko Iwase
//          0x12=Kenta Nakamura
//          0x14=Keisuke Takahashi
//          0x16=Ryosuke Takahashi
//          - Akina Start
//          0x18=Kenji
//          0x1a=Iketani Kouichirou
//          0x1c=Wataru Akiyama
//          0x1e=Takumi Fujiwara
//          - Happougahara Start
//          0x20=Tooru Suetsugu
//          0x22=Daiki Ninomiya
//          0x24=Sakai
//          0x26=Tomoyuki Tachi
//          - Irouhazaka Start
//          0x28=Seiji Iwaki
//          0x2a=Kyouichi Sudou
//          0x2c=Kai Kogashiwa
//          0x2e=Keisuke Takahashi
//          0x30=Takumi Fujiwara Final
//          0x32=Bunta Akina (Out of line)
//          - Real Myogi Start
//          0x34=Shingo
//          0x36=Nakazato
//          - Real Usui Start
//          0x38=Mako Satou & Sayuki
//          - Shomaru Start
//          0x3a=Wataru
//          - Momiji Line Start
//          0x3c=Toru
//          0x3e=Atsure
//          - Enna Skyline Start
//          0x40=Daiki
//          0x42=Smiley Sakai
function arcadeWinsLocation() => byte(0x327950)

// $19ECA18: (8-bit) Gameplay Indicator
//           
//           0x00 = Gameplay
//           0x01 = Front End
//           
//           Not this goes to 0 on reboot.
function gameplayIndicator() => byte(0x19ECA18)

achievement(
    title = "Speedy Speed Boy", points = 2,
    description = "Win your first Arcade Race",
    trigger = gameplayIndicator() == 0 &&
              (1 + prev(arcadeWinsLocation())) == arcadeWinsLocation()) || (1 + prev(byte(0x327952))) == byte(0x327952 ||
                  (1 + prev(byte(0x327954))) == byte(0x327954 || (1 + prev(byte(0x327956))) == byte(0x327956) ||
                  (1 + prev(byte(0x327958))) == byte(0x327958) || (1 + prev(byte(0x32795A))) == byte(0x32795A) ||
                  (1 + prev(byte(0x32795C))) == byte(0x32795C) || (1 + prev(byte(0x32795E))) == byte(0x32795E) ||
                  (1 + prev(byte(0x327960))) == byte(0x327960) || (1 + prev(byte(0x327962))) == byte(0x327962) ||
                  (1 + prev(byte(0x327964))) == byte(0x327964) || (1 + prev(byte(0x327966))) == byte(0x327966) ||
                  (1 + prev(byte(0x327968))) == byte(0x327968) || (1 + prev(byte(0x32796A))) == byte(0x32796A) ||
                  (1 + prev(byte(0x32796C))) == byte(0x32796C) || (1 + prev(byte(0x32796E))) == byte(0x32796E) ||
                  (1 + prev(byte(0x327970))) == byte(0x327970) || (1 + prev(byte(0x327972))) == byte(0x327972) ||
                  (1 + prev(byte(0x327974))) == byte(0x327974) || (1 + prev(byte(0x327976))) == byte(0x327976) ||
                  (1 + prev(byte(0x327978))) == byte(0x327978) || (1 + prev(byte(0x32797A))) == byte(0x32797A) ||
                  (1 + prev(byte(0x32797C))) == byte(0x32797C) || (1 + prev(byte(0x32797E))) == byte(0x32797E) ||
                  (1 + prev(byte(0x327980))) == byte(0x327980) || (1 + prev(byte(0x327982))) == byte(0x327982) ||
                  (1 + prev(byte(0x327984))) == byte(0x327984) || (1 + prev(byte(0x327986))) == byte(0x327986) ||
                  (1 + prev(byte(0x327988))) == byte(0x327988) || (1 + prev(byte(0x32798A))) == byte(0x32798A) ||
                  (1 + prev(byte(0x32798C))) == byte(0x32798C) || (1 + prev(byte(0x32798E))) == byte(0x32798E) ||
                  (1 + prev(byte(0x327990))) == byte(0x327990) || (1 + prev(byte(0x327992))) == byte(0x327992) ||
                  (1 + prev(byte(0x327994))) == byte(0x327994) || (1 + prev(byte(0x327996))) == byte(0x327996) ||
                  (1 + prev(byte(0x327998))) == byte(0x327998) || (1 + prev(byte(0x32799A))) == byte(0x32799A) ||
                  (1 + prev(byte(0x32799C))) == byte(0x32799C) || (1 + prev(byte(0x32799E))) == byte(0x32799E) ||
                  (1 + prev(byte(0x3279A0))) == byte(0x3279A0) || (1 + prev(byte(0x3279A2))) == byte(0x3279A2) ||
                  (1 + prev(byte(0x3279A4))) == byte(0x3279A4) || (1 + prev(byte(0x3279A6))) == byte(0x3279A6)
              )
)

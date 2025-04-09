// Tokyo Xtreme Racer Advance
// #ID = 5119

// $01BC: 01=Rival Spotted
//        24=Race Start
//        04=Race
function rival_spotted() => byte(0x0001BC)

// $01CC: Current Menu
//        07=Race Mode
//        2d=Load File
//        27-29=Sell Car
//        2a-2c=Change Car
//        34=Quick Race
//        4e=Time Attack
//        68=Free Run
function current_menu() => byte(0x0001CC)

// $01E0: Unlock Flag - Tokyo 1
function unlock_flag_tokyo_1() => byte(0x0001E0)

// $01E2: Unlock Flag - Tokyo 2
function unlock_flag_tokyo_2() => byte(0x0001E2)

// $01E4: Unlock Flag - Los Angeles 1
function unlock_flag_los_angeles_1() => byte(0x0001E4)

// $01E6: Unlock Flag - Los Angeles 2
function unlock_flag_los_angeles_2() => byte(0x0001E6)

// $01E8: Unlock Flag - London 1
function unlock_flag_london_1() => byte(0x0001E8)

// $01EA: Unlock Flag - London 2
function unlock_flag_london_2() => byte(0x0001EA)

// $0B59: Current Car - Body Tune Own Flags
function current_car_body_tune_own_flags() => byte(0x000B59)

// $0B60: Current Car Owned
function current_car_owned() => byte(0x000B60)

// $0B62: Current Car - ID
function current_car_id() => byte(0x000B62)


// $0B6E: Current Car - Engine
function current_car_engine() => byte(0x000B6E)

// $0B6F: Current Car - Muffler
function current_car_muffler() => byte(0x000B6F)

// $0B70: Current Car - Transmission
function current_car_transmission() => byte(0x000B70)

// $0B71: Current Car - Clutch
function current_car_clutch() => byte(0x000B71)

// $0B72: Current Car - Suspension
function current_car_suspension() => byte(0x000B72)

// $0B73: Current Car - Tires + Wheels
function current_car_tires_wheels() => byte(0x000B73)

// $0B74: Current Car - Body Tune
function current_car_body_tune() => byte(0x000B74)

// $0B75: Current Car - F. Bumper
function current_car_f_bumper() => byte(0x000B75)

// $0B76: Current Car - R. Bumper
function current_car_r_bumper() => byte(0x000B76)

// $0B77: Current Car - Spoiler
function current_car_spoiler() => byte(0x000B77)

// $0B78: Current Car - Side Skirt
function current_car_side_skirt() => byte(0x000B78)

// $0B79: Current Car - Paint
function current_car_paint() => byte(0x000B79)

// $0B80: Car 2 Owned
function car_2_owned() => byte(0x000B80)

// $0BA0: Car 3 Owned
function car_3_owned() => byte(0x000BA0)

// $0BC0: Car 4 Owned
function car_4_owned() => byte(0x000BC0)

// $0DE8: Player Name
//        0x20=
//        0x21=!
//        0x2c=,
//        0x2e=.
//        0x30=0
//        0x31=1
//        0x32=2
//        0x33=3
//        0x34=4
//        0x35=5
//        0x36=6
//        0x37=7
//        0x38=8
//        0x39=9
//        0x3a=:
//        0x41=A
//        0x42=B
//        0x43=C
//        0x44=D
//        0x45=E
//        0x46=F
//        0x47=G
//        0x48=H
//        0x49=I
//        0x4a=J
//        0x4b=K
//        0x4c=L
//        0x4d=M
//        0x4e=N
//        0x4f=O
//        0x50=P
//        0x51=Q
//        0x52=R
//        0x53=S
//        0x54=T
//        0x55=U
//        0x56=V
//        0x57=W
//        0x58=X
//        0x59=Y
//        0x5a=Z
function player_name() => byte(0x000DE8)

// $14A4: Money
function money() => byte(0x0014A4)

// $1B14: Current Gamemode
//        00=Quest
//        01=Quick Race
//        02=Time Attack
//        03=Free Run
function current_gamemode() => byte(0x001B14)

// $1E50: Current Track
//        00=Tokyo 1
//        01=Tokyo 2
//        02=Los Angeles 1
//        03=Los Angeles 2
//        04=London 1
//        05=London 2
function current_track() => byte(0x001E50)

// $1E64: Player X
function player_x() => byte(0x001E64)

// $1E68: Player Y
function player_y() => byte(0x001E68)

// $1E6C: Player Z
function player_z() => byte(0x001E6C)

// $1E88: Current Speed
function current_speed() => byte(0x001E88)

// $21D4: [Options]
//        Current Camera
//        00=Bumper View
//        01=Behind Car View
function options() => byte(0x0021D4)

// $21D8: Current Language
//        00=English
//        01=French
//        02=Italian
//        03=German
//        04=Spanish
function current_language() => byte(0x0021D8)

// $2A1C: [Options]
//        Current Transmission
//        00=Automatic
//        01=Manual
function options() => byte(0x002A1C)

// $4DD4: Rival Meter
function rival_meter() => byte(0x004DD4)

// $5680: 01 - Street Sharks - White Shark
function street_sharks_white_shark() => byte(0x005680)

// $5681: What Track the Current Racer is on
//        00=Tokyo 1
//        01=Tokyo 2
//        02=Los Angeles 1
//        03=Los Angeles 2
//        04=London 1
//        05=London 2
function what_track_the_current_racer_is_on() => byte(0x005681)

// $5682: 02 - Street Sharks - Tiger Shark
function street_sharks_tiger_shark() => byte(0x005682)

// $5684: 03 - Street Sharks - Basking Shark
function street_sharks_basking_shark() => byte(0x005684)

// $5686: 04 - Street Sharks - Whale Shark
function street_sharks_whale_shark() => byte(0x005686)

// $5688: 05 - Street Sharks - Hammerhead Shark
function street_sharks_hammerhead_shark() => byte(0x005688)

// $568A: 06 - Street Sharks - Bull Shark
function street_sharks_bull_shark() => byte(0x00568A)

// $568C: 07 - Ace of Clubz - Dream Driver
function ace_of_clubz_dream_driver() => byte(0x00568C)

// $568E: 08 - Ace of Clubz - Keep It Simple
function ace_of_clubz_keep_it_simple() => byte(0x00568E)

// $5690: 09 - Ace of Clubz - Speed Limit
function ace_of_clubz_speed_limit() => byte(0x005690)

// $5692: 10 - Ace of Clubz - Madd Hatter
function ace_of_clubz_madd_hatter() => byte(0x005692)

// $5694: 11 - Ace of Clubz - Rising Son
function ace_of_clubz_rising_son() => byte(0x005694)

// $5696: 12 - Ace of Clubz - Slow Rider
function ace_of_clubz_slow_rider() => byte(0x005696)

// $5698: 13 - Knights - White Knight
function knights_white_knight() => byte(0x005698)

// $569A: 14 - Knights - Green Knight
function knights_green_knight() => byte(0x00569A)

// $569C: 15 - Knights - Blue Knight
function knights_blue_knight() => byte(0x00569C)

// $569E: 13 - Knights - Red Knight
function knights_red_knight() => byte(0x00569E)

// $56A0: 17 - Knights - Black Knight
function knights_black_knight() => byte(0x0056A0)

// $56A2: 18 - Knights - Purple Knight
function knights_purple_knight() => byte(0x0056A2)

// $56A4: 19 - Interplanetary - Spaced Out
function interplanetary_spaced_out() => byte(0x0056A4)

// $56A6: 20 - Interplanetary - Starlight
function interplanetary_starlight() => byte(0x0056A6)

// $56A8: 21 - Interplanetary - Space Probe
function interplanetary_space_probe() => byte(0x0056A8)

// $56AA: 22 - Interplanetary - Satellite Seeker
function interplanetary_satellite_seeker() => byte(0x0056AA)

// $56AC: 23 - Interplanetary - Moondust
function interplanetary_moondust() => byte(0x0056AC)

// $56AE: 24 - Interplanetary - Blast Off
function interplanetary_blast_off() => byte(0x0056AE)

// $56B0: 25 - Jesters - Silent Death
function jesters_silent_death() => byte(0x0056B0)

// $56B2: 26 - Jesters - Stealthy Lord
function jesters_stealthy_lord() => byte(0x0056B2)

// $56B4: 27 - Jesters - Quick Death
function jesters_quick_death() => byte(0x0056B4)

// $56B6: 28 - Jesters - Long Night
function jesters_long_night() => byte(0x0056B6)

// $56B8: 29 - Jesters - Marauder
function jesters_marauder() => byte(0x0056B8)

// $56BA: 30 - Jesters - Thunder
function jesters_thunder() => byte(0x0056BA)

// $56BC: 31 - Sunny Daze - Daze Dreamer
function sunny_daze_daze_dreamer() => byte(0x0056BC)

// $56BE: 32 - Sunny Daze - Rainy Daze
function sunny_daze_rainy_daze() => byte(0x0056BE)

// $56C0: 33 - Sunny Daze - Skool Daze
function sunny_daze_skool_daze() => byte(0x0056C0)

// $56C2: 34 - Sunny Daze - Summer Daze
function sunny_daze_summer_daze() => byte(0x0056C2)

// $56C4: 35 - Sunny Daze - Dogg Daze
function sunny_daze_dogg_daze() => byte(0x0056C4)

// $56C6: 36 - Sunny Daze - Special Daze
function sunny_daze_special_daze() => byte(0x0056C6)

// $56C8: 37 - Blades - Scimitar
function blades_scimitar() => byte(0x0056C8)

// $56CA: 38 - Blades - Rapier
function blades_rapier() => byte(0x0056CA)

// $56CC: 39 - Blades - Dagger
function blades_dagger() => byte(0x0056CC)

// $56CE: 40 - Blades - Broadsword
function blades_broadsword() => byte(0x0056CE)

// $56D0: 41 - Blades - Claymore
function blades_claymore() => byte(0x0056D0)

// $56D2: 42 - Blades - Cutlass
function blades_cutlass() => byte(0x0056D2)

// $56D4: 43 - Free Spirits - Wylde and Free
function free_spirits_wylde_and_free() => byte(0x0056D4)

// $56D6: 44 - Free Spirits - Deep Thought
function free_spirits_deep_thought() => byte(0x0056D6)

// $56D8: 45 - Free Spirits - Restless Soul
function free_spirits_restless_soul() => byte(0x0056D8)

// $56DA: 46 - Free Spirits - Oriental Host
function free_spirits_oriental_host() => byte(0x0056DA)

// $56DC: 47 - Free Spirits - Auburn Beauty
function free_spirits_auburn_beauty() => byte(0x0056DC)

// $56DE: 48 - Free Spirits - Lowrider
function free_spirits_lowrider() => byte(0x0056DE)

// $56E0: 49 - Perfect Form - Lean n' Mean
function perfect_form_lean_n_mean() => byte(0x0056E0)

// $56E2: 50 - Perfect Form - Mr. Physique
function perfect_form_mr_physique() => byte(0x0056E2)

// $56E4: 51 - Perfect Form - White Line Cowboy
function perfect_form_white_line_cowboy() => byte(0x0056E4)

// $56E6: 52 - Perfect Form - Major Feat
function perfect_form_major_feat() => byte(0x0056E6)

// $56E8: 53 - Perfect Form - New Approach
function perfect_form_new_approach() => byte(0x0056E8)

// $56EA: 54 - Perfect Form - Skater Gurl
function perfect_form_skater_gurl() => byte(0x0056EA)

// $56EC: 55 - Scorpio - Random Attitude
function scorpio_random_attitude() => byte(0x0056EC)

// $56EE: 56 - Scorpio - Rebel Red
function scorpio_rebel_red() => byte(0x0056EE)

// $56F0: 57 - Scorpio - Highlander
function scorpio_highlander() => byte(0x0056F0)

// $56F2: 58 - Scorpio - True Identity
function scorpio_true_identity() => byte(0x0056F2)

// $56F4: 59 - Scorpio - D.O.A
function scorpio_d_o_a() => byte(0x0056F4)

// $56F6: 60 - Scorpio - Dirty Work
function scorpio_dirty_work() => byte(0x0056F6)

// $56F8: 61 - Global Racers - So Near So Far
function global_racers_so_near_so_far() => byte(0x0056F8)

// $56FA: 62 - Global Racers - Polar Night
function global_racers_polar_night() => byte(0x0056FA)

// $56FC: 63 - Global Racers - Outback Ollie
function global_racers_outback_ollie() => byte(0x0056FC)

// $56FE: 64 - Global Racers - Rap Artist
function global_racers_rap_artist() => byte(0x0056FE)

// $5700: 65 - Global Racers - Driving Ambition
function global_racers_driving_ambition() => byte(0x005700)

// $5702: 66 - Global Racers - Aim2Please
function global_racers_aim2please() => byte(0x005702)

// $5704: 67 - Poisoned Heart - Wrecker Ray
function poisoned_heart_wrecker_ray() => byte(0x005704)

// $5706: 68 - Poisoned Heart - Strange Adventurer
function poisoned_heart_strange_adventurer() => byte(0x005706)

// $5708: 69 - Poisoned Heart - Grey Lady
function poisoned_heart_grey_lady() => byte(0x005708)

// $570A: 70 - Poisoned Heart - Fate on Four Wheels
function poisoned_heart_fate_on_four_wheels() => byte(0x00570A)

// $570C: 71 - Poisoned Heart - Killa Ladee
function poisoned_heart_killa_ladee() => byte(0x00570C)

// $570E: 72 - Poisoned Heart - Flirt In a Skirt
function poisoned_heart_flirt_in_a_skirt() => byte(0x00570E)

// $5710: 73 - Dragons - Big n' Ugly
function dragons_big_n_ugly() => byte(0x005710)

// $5712: 74 - Dragons - Musclebound
function dragons_musclebound() => byte(0x005712)

// $5714: 75 - Dragons - Big Dave
function dragons_big_dave() => byte(0x005714)

// $5716: 76 - Dragons - Pumpin' Iron
function dragons_pumpin_iron() => byte(0x005716)

// $5718: 77 - Dragons - Punchdrunk
function dragons_punchdrunk() => byte(0x005718)

// $571A: 78 - Dragons - 200 Pound Weight
function dragons_200_pound_weight() => byte(0x00571A)

// $571C: 79 - Wingz - Thermal Glider
function wingz_thermal_glider() => byte(0x00571C)

// $571E: 80 - Wingz - Sailplane Sal
function wingz_sailplane_sal() => byte(0x00571E)

// $5720: 81 - Wingz - Hi-Flyte
function wingz_hi_flyte() => byte(0x005720)

// $5722: 82 - Wingz - Last of The Breed
function wingz_last_of_the_breed() => byte(0x005722)

// $5724: 83 - Wingz - Landing Zone
function wingz_landing_zone() => byte(0x005724)

// $5726: 84 - Wingz - Cloud Rider
function wingz_cloud_rider() => byte(0x005726)

// $5728: 85 - Roadkill - Suicide Bio
function roadkill_suicide_bio() => byte(0x005728)

// $572A: 86 - Roadkill - Hangin High
function roadkill_hangin_high() => byte(0x00572A)

// $572C: 87 - Roadkill - Mike The Knife
function roadkill_mike_the_knife() => byte(0x00572C)

// $572E: 88 - Roadkill - Grimm Reepa
function roadkill_grimm_reepa() => byte(0x00572E)

// $5730: 89 - Roadkill - Sy An Ide
function roadkill_sy_an_ide() => byte(0x005730)

// $5732: 90 - Roadkill - Heart Attack
function roadkill_heart_attack() => byte(0x005732)

// $5734: 91 - Burnin Rubba - Flyin Fish
function burnin_rubba_flyin_fish() => byte(0x005734)

// $5736: 92 - Burnin Rubba - Speed Addict
function burnin_rubba_speed_addict() => byte(0x005736)

// $5738: 93 - Burnin Rubba - Virtual Reality
function burnin_rubba_virtual_reality() => byte(0x005738)

// $573A: 94 - Burnin Rubba - Duck Blind
function burnin_rubba_duck_blind() => byte(0x00573A)

// $573C: 95 - Burnin Rubba - Bend n' Burn
function burnin_rubba_bend_n_burn() => byte(0x00573C)

// $573E: 96 - Burnin Rubba - Peek-a-Boo
function burnin_rubba_peek_a_boo() => byte(0x00573E)

// $5740: 97 - Wanderer - Ultimate Dream
function wanderer_ultimate_dream() => byte(0x005740)

// $5742: 98 - Wanderer - Velvet Smooth
function wanderer_velvet_smooth() => byte(0x005742)

// $5744: 99 - Wanderer - Roobik Lube
function wanderer_roobik_lube() => byte(0x005744)

// $5746: 100 - Wanderer - Demon Weird
function wanderer_demon_weird() => byte(0x005746)

// $5748: 101 - Wanderer - Rainman
function wanderer_rainman() => byte(0x005748)

// $574A: 102 - Wanderer - Steamy Windoze
function wanderer_steamy_windoze() => byte(0x00574A)

// $574C: 103 - Wanderer - Undertaker
function wanderer_undertaker() => byte(0x00574C)

// $574E: 104 - Wanderer - Coffee n' Cream
function wanderer_coffee_n_cream() => byte(0x00574E)

// $5750: 105 - Wanderer - Castaway
function wanderer_castaway() => byte(0x005750)

// $5752: 106 - Wanderer - Manic Drummer
function wanderer_manic_drummer() => byte(0x005752)

// $5754: 107 - Wanderer - Freedom Gunner
function wanderer_freedom_gunner() => byte(0x005754)

// $5756: 108 - Wanderer - Master Blaster
function wanderer_master_blaster() => byte(0x005756)

// $5758: 109 - Wanderer - Devil's Due
function wanderer_devil_s_due() => byte(0x005758)

// $575A: 110 - Wanderer - Street Genius
function wanderer_street_genius() => byte(0x00575A)

// $575C: 111 - Wanderer - Dark n' Moody
function wanderer_dark_n_moody() => byte(0x00575C)

// $575E: 112 - Wanderer - Eternal Flame
function wanderer_eternal_flame() => byte(0x00575E)

// $5760: 113 - Wanderer - Lady Luck
function wanderer_lady_luck() => byte(0x005760)

// $5762: 114 - Wanderer - Smartie
function wanderer_smartie() => byte(0x005762)

// $5764: 115 - Wanderer - Road Rage
function wanderer_road_rage() => byte(0x005764)

// $5766: 116 - Wanderer - Half A Hero
function wanderer_half_a_hero() => byte(0x005766)

// $5768: 117 - Wanderer - Grooving Down
function wanderer_grooving_down() => byte(0x005768)

// $576A: 118 - Wanderer - Grifter
function wanderer_grifter() => byte(0x00576A)

// $576C: 119 - Wanderer - Perfectionist
function wanderer_perfectionist() => byte(0x00576C)

// $576E: 120 - Wanderer - Uncle Carbunkle
function wanderer_uncle_carbunkle() => byte(0x00576E)

// $5770: 121 - Wanderer - Windbreak
function wanderer_windbreak() => byte(0x005770)

// $5772: 122 - Wanderer - Burnt Toast
function wanderer_burnt_toast() => byte(0x005772)

// $5774: 123 - Wanderer - Pickpocket
function wanderer_pickpocket() => byte(0x005774)

// $5776: 124 - Wanderer - Jackhammer
function wanderer_jackhammer() => byte(0x005776)

// $5778: 125 - Wanderer - Fried Dust
function wanderer_fried_dust() => byte(0x005778)

// $577A: 126 - Wanderer - Quartz Alarm
function wanderer_quartz_alarm() => byte(0x00577A)

// $577C: 127 - Wanderer - Peanut Butter Sandwich
function wanderer_peanut_butter_sandwich() => byte(0x00577C)

// $577E: 128 - Wanderer - Library Card
function wanderer_library_card() => byte(0x00577E)

// $5788: Fadeout Timer
function fadeout_timer() => byte(0x005788)

// $5790: Time Attack - x0.00.0
function time_attack_x0_00_0() => byte(0x005790)

// $5791: Time Attack - 0x.00.0
function time_attack_0x_00_0() => byte(0x005791)

// $5792: Time Attack - 00.x0.0
function time_attack_00_x0_0() => byte(0x005792)

// $5793: Time Attack - 00.0x.0
function time_attack_00_0x_0() => byte(0x005793)

// $5794: Time Attack - 00.00.x
function time_attack_00_00_x() => byte(0x005794)

// $5F50: Current Progress in Track
function current_progress_in_track() => dword(0x005F50)

// $5F7C: Player Meter
//        0x36=Win
function player_meter() => byte(0x005F7C)

// $66D0: Current Stage in Quick Race
function current_stage_in_quick_race() => dword(0x0066D0)

// $6870: [Options]
//        Music On/Off
function options() => byte(0x006870)

// $6894: SFX Is Playing
function sfx_is_playing() => byte(0x006894)

function TimeToValue(tenMinutes, oneMinutes, tenSeconds, oneSeconds, tenthSecond) =>
    tenMinutes * 60000 + oneMinutes * 6000 + tenSeconds * 1000 +
                 oneSeconds * 100 + tenthSecond * 10

function compareAgainstTime(tenMinutes, oneMinutes, tenSeconds, oneSeconds, tenthSecond) =>
    TimeToValue(time_attack_x0_00_0(), time_attack_0x_00_0(), time_attack_00_x0_0(), time_attack_00_0x_0(), time_attack_00_00_x()) <= 
        TimeToValue(tenMinutes, oneMinutes, tenSeconds, oneSeconds, tenthSecond)

achievement(
    title = "Time Attack - Tokyo 1", points = 10,
    description = "Complete Tokyo 1 Time Attack in 09.20.0 or less.",
    id = 201001, badge = "223275", published = "3/1/2022 11:03:19 PM", modified = "3/1/2022 11:03:19 PM",
    trigger = never(current_track() != 0) && never(current_menu() != 78) &&
                  (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 1536) && current_progress_in_track() == 1792) &&
                  current_progress_in_track() == 2048) && current_progress_in_track() == 2559) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(0, 9, 2, 0, 0))
)

achievement(
    title = "Time Attack - Tokyo 2", points = 10,
    description = "Complete Tokyo 2 Time Attack in 15.10.0 or less.",
    id = 201002, badge = "223276", published = "3/1/2022 11:03:19 PM", modified = "3/1/2022 11:03:19 PM",
    trigger = never(current_track() != 1) && never(current_menu() != 78) &&
              (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3072) && current_progress_in_track() == 3328) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 4032) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(1, 5, 1, 0, 0))
)

achievement(
    title = "Time Attack - Los Angeles 1", points = 10,
    description = "Complete Los Angeles 1 Time Attack in 16.10.0 or less.",
    id = 201003, badge = "223277", published = "3/1/2022 11:03:19 PM", modified = "3/1/2022 11:03:19 PM",
    trigger = never(current_track() != 2) && never(current_menu() != 78) &&
              (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 3840) &&
                  current_progress_in_track() == 4096) && current_progress_in_track() == 4380) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(1, 6, 1, 0, 0))
)

achievement(
    title = "Time Attack - Los Angeles 2", points = 10,
    description = "Complete Los Angeles 2 Time Attack in 23.40.0 or less.",
    id = 201004, badge = "223278", published = "3/1/2022 11:03:20 PM", modified = "3/1/2022 11:03:20 PM",
    trigger = never(current_track() != 3) && never(current_menu() != 78) &&
              (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 3584) && current_progress_in_track() == 3840) &&
                  current_progress_in_track() == 4096) && current_progress_in_track() == 6564) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(2, 3, 4, 0, 0))
)

achievement(
    title = "Time Attack - London 1", points = 10,
    description = "Complete London 1 Time Attack in 11.50.0 or less.",
    id = 201005, badge = "223279", published = "3/1/2022 11:03:20 PM", modified = "3/1/2022 11:03:20 PM",
    trigger = never(current_track() != 4) && never(current_menu() != 78) &&
              (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 2304) && current_progress_in_track() == 2560) &&
                  current_progress_in_track() == 2816) && current_progress_in_track() == 3190) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(1, 1, 5, 0, 0))
)

achievement(
    title = "Time Attack - London 2", points = 10,
    description = "Complete London 2 Time Attack in 13.30.0 or less.",
    id = 201006, badge = "223280", published = "3/1/2022 11:03:20 PM", modified = "3/1/2022 11:03:20 PM",
    trigger = never(current_track() != 5) && never(current_menu() != 78) &&
              (once(once(once(once(once(once(once(once(once(current_progress_in_track() == 256) &&
                  current_progress_in_track() == 512) && current_progress_in_track() == 768) &&
                  current_progress_in_track() == 1024) && current_progress_in_track() == 1280) &&
                  current_progress_in_track() == 2304) && current_progress_in_track() == 2560) &&
                  current_progress_in_track() == 2816) && current_progress_in_track() == 3623) &&
                  prev(current_progress_in_track()) == 0 && current_progress_in_track() == 1
              ) &&
              (compareAgainstTime(1, 3, 3, 0, 0))
)
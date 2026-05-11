# Walk It Out Achievement Plan

Working notes for turning `Musings.txt` into RAScript achievements. Keep this file as the checklist we refine while memory addresses are confirmed.

## Global Rules

- Ignore the date-specific achievements. The March 11th comments are still useful for daily medal thresholds.
- "Buy 1 Purchase" should use `TownbuildEventsPurchasesThisSession()` and can be session-only.
- Every purchase milestone after "Buy 1 Purchase" must use `saved/previous total + current-session total`.
- The current-session purchase counters increment immediately during play. The saved/previous totals only update after saving, so using only one side will miss cases.
- Songs, magic clocks, and zodiacs are partial-credit categories, so we need to decide whether thresholds count raw purchase units, unique unlocks, or grouped objects.

## Achievement Groups

### Town-Build Purchases

- Buy 1 purchase.
- Buy 1/4 of purchases.
- Buy 1/2 of purchases.
- Buy 3/4 of purchases.
- Buy all purchases.

Known data:

- `TownbuildEventsPurchasesThisSession()` exists.
- Comment says max is 3346.

Needs:

- Saved/previous town-build purchase total accessor for the fraction/all milestones.

### Songs

- Buy 1/4 of songs.
- Buy 1/2 of songs.
- Buy 3/4 of songs.
- Buy all songs.

Known data:

- `SongPurchasesThisSession()` exists.

Needs:

- Saved/previous song purchase total accessor.
- Total song count or max purchase-credit value.
- Decide partial-credit behavior.

### Routes

- Buy 1/3 of all routes.
- Buy 2/3 of all routes.
- Buy all routes.

Known data:

- `RoutespurchasesThisSession()` exists.

Needs:

- Saved/previous route purchase total accessor.
- Total route count or max purchase-credit value.

### Magic Clocks

- Buy half of magical clocks.
- Buy all magical clocks.

Known data:

- `MagicClocksPurchasesThisSession()` exists.

Needs:

- Saved/previous magic clock purchase total accessor.
- Total clock count or max purchase-credit value.
- Decide partial-credit behavior.

### Zodiacs

- Buy 1 zodiac.
- Buy half of zodiacs.
- Buy all zodiacs.

Known data:

- `ZodiacPurchasesThisSession()` exists.

Needs:

- Saved/previous zodiac purchase total accessor.
- Total zodiac count or max purchase-credit value.
- Decide partial-credit behavior.

### Rainbows

- Buy 1 rainbow.
- Buy 7 rainbows.

Known data:

- `March11thRainbowsCollected()` exists but is marked as a guess and is date-record data.

Needs:

- Confirm the active/saved rainbow purchase or collection address.
- Confirm whether 7 is a total cap, a milestone, or a session count.

### Daily Diamonds

- Earn diamond status in all 4 daily categories in a session.

Known data:

- Steps this session: `StepsThisSession()`.
- Calories this session: `CaloriesBurntThisSession()`.
- Distance this session: `CurrentSessionDistance()`.
- Perfects this session: `CurrentSessionsPerfects()`.
- Date-record comments give likely gold/diamond thresholds.

Needs:

- Confirm current-session endianness and thresholds:
  - Steps diamond: 10000.
  - Calories diamond: 500000 small calories.
  - Distance diamond: 5000 meters.
  - Perfects diamond: 1000.
- Decide whether the achievement should trigger immediately on reaching all four or only once the game awards/display confirms them.

### Whack-A-Slack

- Earn 1 medal, any level.
- Earn one diamond.

Known data:

- Not visible in current RAScript.

Needs:

- Medal table/progress address.
- Medal value mapping for any medal/gold/diamond.

### Gold Medals

- Earn 1/4 of all gold medals.
- Earn 1/2 of all gold medals.
- Earn 3/4 of all gold medals.
- Earn all gold medals.

Known data:

- Not visible in current RAScript.

Needs:

- Define whether "all gold medals" includes minigames only, daily categories, or both.
- Medal table address and total medal count.

### Psycho Colo

- Beat 1 stage.
- Beat 1/4 of stages.
- Beat 1/2 of stages.
- Beat 3/4 of stages.
- Beat all stages.

Known data:

- Not visible in current RAScript.

Needs:

- Stage completion table/address.
- Total stage count.

### Smash & Run

- Beat level 10.

Known data:

- Not visible in current RAScript.

Needs:

- Level completion or best-level address.
- Confirm if level 10 means clear level 10 specifically or reach/unlock level 10.

## Deferred / Probably Ignore

- First full clock.
- Morning clocks.
- Evening clocks.
- Map unlocked.
- One daily gold / four daily golds.
- Date-specific record achievements.

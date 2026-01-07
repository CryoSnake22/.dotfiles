# file-GroundedState-cs

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Player/States/GroundedState.cs`

## Notes

I'm having some trouble applying ground friction. Beforehand I used to override the movement with `rb.linearVelocity = new Vector2(movespeed* ..., rb.linearVelocityY)` but now I've realized this made it so the carryover velocity from the dash was not staying and momentum was lost which is bad if you want a nice responsive dash but I guess okay if you just want a quick dash with no momentum preservation.

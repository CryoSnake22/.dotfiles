# Dealing with Cooldowns in Games

**File:** `/Users/charlo/.config/memo/_posts/file-PlayerStateMachine-cs.md`

## Notes

When dealing with cooldowns in games and other systems, one will most likely fall into the early trap of manually initializing a timer and ticking it down with some condition check. Some thing like this:

```cs
private float timer = 3.0f;
public void Update(){
  timer -= Time.deltaTime;
  if (timer <= 0.0f){
    Debug.Log("Timer Done!")
  }
}
```

This may work for 1,5 or even 10 cooldowns, but let's say you wanted to keep 100 concurent cooldowns and manage all of them efficiently. This approach quickly becomes unfeasible not because of performance but because of sunk development time.

We solve this issue by introducing a `CooldownManager` class. We begin by defining an enum which holds the id's of each item we want to keep track of.

```cs
public enum CooldownId
{
  Dash,
  WallJump,
  Roll,
  Attack,
  Spell,
  Ultimate
}
```

Then we can define our `CooldownManager`

```cs
using System.Collections.Generic;

public class CooldownManager
{
    private Dictionary<CooldownId, float> cooldowns = new();

    public void StartCooldown(CooldownId id, float duration)
    {
        cooldowns[id] = duration;
    }

    public bool IsReady(CooldownId id)
    {
        return !cooldowns.ContainsKey(id);
    }

    public float TimeRemaining(CooldownId id)
    {
        if (IsReady(id))
        {
            return cooldowns[id];
        }
        else
        {
            return 0.0f;
        }
    }

    public void Tick(float dt)
    {
        var keys = new List<CooldownId>(cooldowns.Keys);

        foreach (var key in keys)
        {
            cooldowns[key] -= dt;
            if (cooldowns[key] <= 0f)
            {
                cooldowns.Remove(key);
            }
        }
    }
}
```

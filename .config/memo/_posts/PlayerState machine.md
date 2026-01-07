# PlayerState machine

**File:** `/Users/charlo/.dotfiles/.config/memo/_posts/Christmas Project (Unity Platformer).md`

## Notes

The concept of a PlayerState machine essentially comes down to the fact that we typically want our player to be in a single state at a time. States can be

- Idle
- Running
- Jumping
- Dashing
  etc...
  And without a state machine you end up with statements like

```csharp
if (isGrounded && jumpPressed && isDashing && !isDead && !isStunned){
  // piece of logic
}
```

Which is not what you want. So instead we define a state machine where each state holds the allowed inputs,

### Solution and Thoughts

It would be nice if we were able to separate

Input -> Intent -> Motor commands

### PlayerMotor:

The `PlayerMotor` class handles all interactions with the environment. It does not know about states or about any logic regarding when to jump, get hurt etc. all it has is

A set of hyperparameters dictating speed, feel etc.

```cs
[Header("References")]
[SerializeField] private Rigidbody2D rb;
[SerializeField] private Collider2D col;

[Header("Movement")]
[SerializeField] float moveSpeed = 8f;
[SerializeField] float airControlMultiplier = 0.6f; // How much control should players have when airborne

[Header("Jump")]
[SerializeField] float jumpVelocity = 12f;

[Header("Gravity")]
[SerializeField] float fallMultiplier = 2.5f;
[SerializeField] float lowJumpMultiplier = 2f;

[Header("Grounding")]
[SerializeField] LayerMask groundLayer;
[SerializeField] float groundCheckDistance = 0.1f;
[SerializeField] float coyoteTime = 0.15f;
```

Facts about the environment

```cs
public bool isGrounded { get; private set; }
public float coyoteCounter { get; private set; }
public float VelocityY => rb.linearVelocityY;
public float VelocityX => rb.linearVelocityX;
public bool isFalling => rb.linearVelocityY < 0f;
```

And a set of physical actions.

```cs
public void Move(Vector2 moveInput)
{
    rb.linearVelocity = new Vector2(moveInput.x * moveSpeed, rb.linearVelocityY);
}
public void Jump()
{

}
public void CutJump()
{

}
public void SetVelocity(Vector2 velocity)
{

}
public void ApplyImpulse(Vector2 impulse)
{

}
```

The motor essentially acts as an interface which can be called with `sm.motor.Jump()` In each state.

# file-PlayerController-cs

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Scripts/PlayerController.cs`

## Notes

We want the script to initialize the input actions as soon as it is awoken so we need

```csharp
void Awake()
{
    inputActions = new PlayerInputAction();
}
```

Then we need to tell the program what to do when enabling and disabling

```csharp
void OnEnable()
{
    inputActions.Enable();

    inputActions.Player.Jump.performed += OnJump;
    inputActions.Player.Move.performed += OnMove;
}
void OnDisable()
{
    inputActions.Disable();

    inputActions.Player.Jump.performed -= OnJump;
    inputActions.Player.Move.performed -= OnMove;
}
```

These subscribe and unsubscribe the performed actions to functions.

### Grounded

We add a child object `GroundCheck` and position it at the feet of our player object. Then we can check whether a circle around that position touches the ground layer and get a `bool` telling us whether we're grounded or not.

```csharp
void CheckGround()
{
    isGrounded = Physics2D.OverlapCircle(groundCheck.position, groundCheckRadius, groundLayer);
}
```

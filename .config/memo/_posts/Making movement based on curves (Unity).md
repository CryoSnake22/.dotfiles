# Making movement based on curves (Unity)

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Scripts/PlayerController.cs`

## Notes

We want to track a few things, the easiest way to accomplish curve based movement is with `AnimationCurve`

```cs
[Header("Jump Curve")]
[SerializeField] private AnimationCurve jumpCurve;
[SerializeField] private float jumpDuration = 0.5f;
[SerializeField] private float jumpHeight = 5f;

private float jumpTimer;
private bool isJumping;

void OnJump(InputAction.CallbackContext context)
{
    if (isGrounded)
    {
        isJumping = true;
        jumpTimer = 0f;
    }
}

void FixedUpdate()
{
  if (isJumping)
  {
      jumpTimer += Time.fixedDeltaTime;
      float progress = jumpTimer / jumpDuration;

      if (progress < 1f)
      {
          float curveValue = jumpCurve.Evaluate(progress);
          rb.linearVelocity = new Vector2(rb.linearVelocityX, curveValue * jumpHeight); // Since curveCalue is between 0 and 1
      }
      else
      {
          isJumping = false;
      }
  }
  rb.linearVelocity = new Vector2(moveInput.x * moveSpeed, rb.linearVelocityY);
}
```

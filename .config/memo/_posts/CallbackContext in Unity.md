# CallbackContext in Unity

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Player/PlayerInputReader.cs`

## Notes

Under the new input system every action goes through the states

Waiting -> Started -> Performed -> Cancelled

Which leads to the following fields

```cs
context.started // Fires only on the frame the action is initiated

context.performed // Fires every frame the button is "held"

context.cancelled // Fires only on the frame the action is stopped
```

Whilst it may seem like this is all we would need to manage states, turns out `started` is guaranteed to fire only once but `performed` is a bit more of a wild card. So to get a proper reading of wether a button is held we can use

```cs
context.ReadValueAsButton();
```

## Reading values

You can read values with

```cs
Move = context.ReadValue<Vector2>();
```

`ReadValue` is a template

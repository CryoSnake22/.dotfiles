# SerializeField

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Player/Core/PlayerStateMachine.cs`

## Notes

What's the point of `[SerializeField]` if you can just expose a public field and have it serialized ? Well we use `[SerializeField]` When we want to tell unity: "hey, you know this thing C# says is supposed to be private, yeah serialize it anyways and put it in the editor".

"I want other code to be able to use this" -> Use `public`

"I want to see this in the editor" -> use `[SerializeField] private`

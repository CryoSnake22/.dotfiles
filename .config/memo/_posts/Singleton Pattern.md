# Singleton Pattern

**File:** `/Users/charlo/Home/Unity/Playground/Assets/Player/Core/PlayerStateMachine.cs`

## Notes

Let's say we want to have a class which is only one of its own and persistent we can use the Singleton Pattern as such:

```cs
public class GameManager : MonoBehaviour {
  public static GameManager Instance {get; private set};

  void Awake(){

    if (Instance != null && Instane != this){
      Destroy(gameObject);
      return;
    }
    // If you create another object with this class and the instance already exists, just destroy it and return because you can only have one.

    Instance = this;
    DontDestroyOnLoad(gameObject) // Makes sure it survives scene switches.

  }

}
```

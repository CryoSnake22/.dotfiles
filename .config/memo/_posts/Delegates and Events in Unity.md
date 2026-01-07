# Delegates and Events in Unity

**File:**

## Notes

Let us first discuss actions in Unity

```cs

public class SomeClass{
  public static event Action action;
}

```

Declares an action we can subscribe to with

```cs
SomeClass.action += someFunction;
```

Actions are a specific version of `delegates` where the function takes in void and returns void. If we wanted our action to take in some arguments we would do

```cs
public class SomeClass{
  public static event Action<int, int> action;
}
```

And now we would need to provide some arguments to invoke the function with

```cs
SomeClass.action += someFunction; // somFunction(int, int);
SomeClass.action?.Invoke(int a, int b) // Need to pass in some arguments
```

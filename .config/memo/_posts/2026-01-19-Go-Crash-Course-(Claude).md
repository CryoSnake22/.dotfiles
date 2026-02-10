# Go Programming Crash Course & Concurrent Programming

## Part 1: Go Crash Course

### Setup and Hello World

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Go!")
}
```

Every Go program starts with a `package` declaration. The `main` package is special - it defines an executable program.

### Variables and Types

```go
package main

import "fmt"

func main() {
    // Explicit type declaration
    var name string = "Alice"
    var age int = 30

    // Type inference
    var city = "New York"

    // Short declaration (only inside functions)
    country := "USA"

    // Multiple variables
    var (
        firstName = "Bob"
        lastName  = "Smith"
        height    = 180
    )

    fmt.Println(name, age, city, country, firstName, lastName, height)
}
```

**Basic Types:**

- `bool`
- `string`
- `int`, `int8`, `int16`, `int32`, `int64`
- `uint`, `uint8`, `uint16`, `uint32`, `uint64`
- `float32`, `float64`
- `complex64`, `complex128`
- `byte` (alias for uint8)
- `rune` (alias for int32, represents a Unicode code point)

### Functions

```go
package main

import "fmt"

// Simple function
func greet(name string) {
    fmt.Println("Hello,", name)
}

// Function with return value
func add(a, b int) int {
    return a + b
}

// Multiple return values
func divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, fmt.Errorf("cannot divide by zero")
    }
    return a / b, nil
}

// Named return values
func swap(x, y string) (first, second string) {
    first = y
    second = x
    return // naked return
}

func main() {
    greet("Alice")
    sum := add(5, 3)
    fmt.Println("Sum:", sum)

    result, err := divide(10, 2)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Result:", result)
    }

    a, b := swap("hello", "world")
    fmt.Println(a, b)
}
```

### Control Structures

```go
package main

import "fmt"

func main() {
    // If-else
    x := 10
    if x > 5 {
        fmt.Println("x is greater than 5")
    } else if x == 5 {
        fmt.Println("x equals 5")
    } else {
        fmt.Println("x is less than 5")
    }

    // If with initialization
    if y := x * 2; y > 15 {
        fmt.Println("y is greater than 15")
    }

    // For loop (Go's only loop construct)
    for i := 0; i < 5; i++ {
        fmt.Println(i)
    }

    // While-style loop
    count := 0
    for count < 3 {
        fmt.Println("Count:", count)
        count++
    }

    // Infinite loop
    // for {
    //     // breaks out when condition is met
    // }

    // Switch
    day := "Monday"
    switch day {
    case "Monday":
        fmt.Println("Start of the week")
    case "Friday":
        fmt.Println("Almost weekend")
    case "Saturday", "Sunday":
        fmt.Println("Weekend!")
    default:
        fmt.Println("Midweek")
    }

    // Switch without expression (like if-else chain)
    age := 25
    switch {
    case age < 13:
        fmt.Println("Child")
    case age < 20:
        fmt.Println("Teenager")
    default:
        fmt.Println("Adult")
    }
}
```

### Arrays and Slices

```go
package main

import "fmt"

func main() {
    // Arrays (fixed size)
    var arr [3]int
    arr[0] = 1
    arr[1] = 2
    arr[2] = 3

    arr2 := [3]string{"a", "b", "c"}
    fmt.Println(arr, arr2)

    // Slices (dynamic size)
    slice := []int{1, 2, 3, 4, 5}
    fmt.Println(slice)

    // Slice operations
    fmt.Println(slice[1:3])  // [2 3]
    fmt.Println(slice[:2])   // [1 2]
    fmt.Println(slice[2:])   // [3 4 5]

    // Append to slice
    slice = append(slice, 6, 7)
    fmt.Println(slice)

    // Make slice with capacity
    s := make([]int, 5)      // length 5, initialized to zeros
    s2 := make([]int, 0, 10) // length 0, capacity 10
    fmt.Println(s, len(s), cap(s))
    fmt.Println(s2, len(s2), cap(s2))
}
```

### Maps

```go
package main

import "fmt"

func main() {
    // Create map
    ages := make(map[string]int)
    ages["Alice"] = 30
    ages["Bob"] = 25

    // Map literal
    scores := map[string]int{
        "Alice": 95,
        "Bob":   87,
        "Carol": 92,
    }

    fmt.Println(scores)
    fmt.Println(scores["Alice"])

    // Check if key exists
    score, exists := scores["David"]
    if exists {
        fmt.Println("David's score:", score)
    } else {
        fmt.Println("David not found")
    }

    // Delete key
    delete(scores, "Bob")

    // Iterate over map
    for name, score := range scores {
        fmt.Printf("%s: %d\n", name, score)
    }
}
```

### Structs

```go
package main

import "fmt"

// Define a struct
type Person struct {
    FirstName string
    LastName  string
    Age       int
}

// Method on struct
func (p Person) FullName() string {
    return p.FirstName + " " + p.LastName
}

// Method with pointer receiver (can modify the struct)
func (p *Person) Birthday() {
    p.Age++
}

func main() {
    // Create struct
    p1 := Person{
        FirstName: "Alice",
        LastName:  "Smith",
        Age:       30,
    }

    // Short form
    p2 := Person{"Bob", "Jones", 25}

    // Accessing fields
    fmt.Println(p1.FirstName, p1.Age)

    // Calling methods
    fmt.Println(p1.FullName())

    p1.Birthday()
    fmt.Println(p1.Age) // 31
}
```

### Pointers

```go
package main

import "fmt"

func main() {
    x := 10
    p := &x  // p is a pointer to x

    fmt.Println("Value of x:", x)
    fmt.Println("Address of x:", p)
    fmt.Println("Value at address:", *p)

    *p = 20  // Modify x through pointer
    fmt.Println("New value of x:", x)
}

func modifyValue(x int) {
    x = 100
}

func modifyValueWithPointer(x *int) {
    *x = 100
}

func example() {
    val := 50
    modifyValue(val)
    fmt.Println(val) // Still 50

    modifyValueWithPointer(&val)
    fmt.Println(val) // Now 100
}
```

### Interfaces

```go
package main

import (
    "fmt"
    "math"
)

// Define interface
type Shape interface {
    Area() float64
    Perimeter() float64
}

// Rectangle implements Shape
type Rectangle struct {
    Width, Height float64
}

func (r Rectangle) Area() float64 {
    return r.Width * r.Height
}

func (r Rectangle) Perimeter() float64 {
    return 2 * (r.Width + r.Height)
}

// Circle implements Shape
type Circle struct {
    Radius float64
}

func (c Circle) Area() float64 {
    return math.Pi * c.Radius * c.Radius
}

func (c Circle) Perimeter() float64 {
    return 2 * math.Pi * c.Radius
}

// Function that accepts any Shape
func printShapeInfo(s Shape) {
    fmt.Printf("Area: %.2f, Perimeter: %.2f\n", s.Area(), s.Perimeter())
}

func main() {
    r := Rectangle{Width: 5, Height: 3}
    c := Circle{Radius: 4}

    printShapeInfo(r)
    printShapeInfo(c)
}
```

### Error Handling

```go
package main

import (
    "errors"
    "fmt"
)

func divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, errors.New("division by zero")
    }
    return a / b, nil
}

// Custom error type
type ValidationError struct {
    Field   string
    Message string
}

func (e *ValidationError) Error() string {
    return fmt.Sprintf("validation error on field '%s': %s", e.Field, e.Message)
}

func validateAge(age int) error {
    if age < 0 {
        return &ValidationError{
            Field:   "age",
            Message: "age cannot be negative",
        }
    }
    return nil
}

func main() {
    result, err := divide(10, 0)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Println("Result:", result)
    }

    if err := validateAge(-5); err != nil {
        fmt.Println(err)
    }
}
```

---

## Part 2: Concurrent Programming in Go

Go's concurrency model is built on **goroutines** and **channels**, based on CSP (Communicating Sequential Processes).

### Goroutines

A goroutine is a lightweight thread managed by the Go runtime.

```go
package main

import (
    "fmt"
    "time"
)

func say(s string) {
    for i := 0; i < 3; i++ {
        fmt.Println(s)
        time.Sleep(100 * time.Millisecond)
    }
}

func main() {
    // Start goroutine
    go say("hello")
    say("world")

    // Without this, main might exit before goroutine completes
    time.Sleep(1 * time.Second)
}
```

### Channels

Channels are typed conduits for communication between goroutines.

```go
package main

import "fmt"

func main() {
    // Create a channel
    ch := make(chan int)

    // Send value to channel in goroutine
    go func() {
        ch <- 42  // Send 42 to channel
    }()

    // Receive value from channel
    value := <-ch
    fmt.Println("Received:", value)
}
```

**Buffered Channels:**

```go
package main

import "fmt"

func main() {
    // Buffered channel with capacity 2
    ch := make(chan string, 2)

    // Can send without blocking
    ch <- "first"
    ch <- "second"

    // Would block if we tried to send a third without receiving

    fmt.Println(<-ch)
    fmt.Println(<-ch)
}
```

### Channel Directions

```go
package main

import "fmt"

// Channel that can only receive
func receiver(ch <-chan int) {
    for val := range ch {
        fmt.Println("Received:", val)
    }
}

// Channel that can only send
func sender(ch chan<- int) {
    for i := 0; i < 5; i++ {
        ch <- i
    }
    close(ch)
}

func main() {
    ch := make(chan int)

    go sender(ch)
    receiver(ch)
}
```

### Select Statement

The `select` statement lets a goroutine wait on multiple channel operations.

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch1 := make(chan string)
    ch2 := make(chan string)

    go func() {
        time.Sleep(1 * time.Second)
        ch1 <- "from channel 1"
    }()

    go func() {
        time.Sleep(2 * time.Second)
        ch2 <- "from channel 2"
    }()

    // Select waits for whichever channel is ready first
    for i := 0; i < 2; i++ {
        select {
        case msg1 := <-ch1:
            fmt.Println(msg1)
        case msg2 := <-ch2:
            fmt.Println(msg2)
        }
    }
}
```

**Select with Default:**

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch := make(chan int, 1)

    select {
    case val := <-ch:
        fmt.Println("Received:", val)
    default:
        fmt.Println("No value ready, doing something else")
    }

    ch <- 42

    select {
    case val := <-ch:
        fmt.Println("Received:", val)
    default:
        fmt.Println("No value ready")
    }
}
```

### WaitGroup

Used to wait for a collection of goroutines to finish.

```go
package main

import (
    "fmt"
    "sync"
    "time"
)

func worker(id int, wg *sync.WaitGroup) {
    defer wg.Done()  // Decrement counter when done

    fmt.Printf("Worker %d starting\n", id)
    time.Sleep(time.Second)
    fmt.Printf("Worker %d done\n", id)
}

func main() {
    var wg sync.WaitGroup

    for i := 1; i <= 5; i++ {
        wg.Add(1)  // Increment counter
        go worker(i, &wg)
    }

    wg.Wait()  // Block until counter is zero
    fmt.Println("All workers done")
}
```

### Mutex (Mutual Exclusion)

Used to protect shared data from race conditions.

```go
package main

import (
    "fmt"
    "sync"
)

type SafeCounter struct {
    mu    sync.Mutex
    count int
}

func (c *SafeCounter) Increment() {
    c.mu.Lock()
    c.count++
    c.mu.Unlock()
}

func (c *SafeCounter) Value() int {
    c.mu.Lock()
    defer c.mu.Unlock()
    return c.count
}

func main() {
    counter := SafeCounter{}
    var wg sync.WaitGroup

    for i := 0; i < 1000; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            counter.Increment()
        }()
    }

    wg.Wait()
    fmt.Println("Final count:", counter.Value())
}
```

### Common Concurrency Patterns

#### 1. Worker Pool

```go
package main

import (
    "fmt"
    "sync"
    "time"
)

func worker(id int, jobs <-chan int, results chan<- int) {
    for j := range jobs {
        fmt.Printf("Worker %d processing job %d\n", id, j)
        time.Sleep(time.Second)
        results <- j * 2
    }
}

func main() {
    const numJobs = 5
    const numWorkers = 3

    jobs := make(chan int, numJobs)
    results := make(chan int, numJobs)

    // Start workers
    for w := 1; w <= numWorkers; w++ {
        go worker(w, jobs, results)
    }

    // Send jobs
    for j := 1; j <= numJobs; j++ {
        jobs <- j
    }
    close(jobs)

    // Collect results
    for a := 1; a <= numJobs; a++ {
        fmt.Println("Result:", <-results)
    }
}
```

#### 2. Fan-Out, Fan-In

```go
package main

import (
    "fmt"
    "sync"
)

func producer(nums ...int) <-chan int {
    out := make(chan int)
    go func() {
        for _, n := range nums {
            out <- n
        }
        close(out)
    }()
    return out
}

func square(in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in {
            out <- n * n
        }
        close(out)
    }()
    return out
}

func merge(cs ...<-chan int) <-chan int {
    var wg sync.WaitGroup
    out := make(chan int)

    // Start an output goroutine for each input channel
    output := func(c <-chan int) {
        defer wg.Done()
        for n := range c {
            out <- n
        }
    }

    wg.Add(len(cs))
    for _, c := range cs {
        go output(c)
    }

    // Close out when all output goroutines are done
    go func() {
        wg.Wait()
        close(out)
    }()

    return out
}

func main() {
    in := producer(1, 2, 3, 4, 5)

    // Fan-out: multiple workers processing same input
    c1 := square(in)
    c2 := square(in)

    // Fan-in: merge results
    for n := range merge(c1, c2) {
        fmt.Println(n)
    }
}
```

#### 3. Pipeline

```go
package main

import "fmt"

func generator(nums ...int) <-chan int {
    out := make(chan int)
    go func() {
        for _, n := range nums {
            out <- n
        }
        close(out)
    }()
    return out
}

func square(in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in {
            out <- n * n
        }
        close(out)
    }()
    return out
}

func main() {
    // Set up pipeline
    c := generator(2, 3, 4, 5)
    out := square(c)

    // Consume output
    for result := range out {
        fmt.Println(result)
    }
}
```

#### 4. Timeout and Cancellation

```go
package main

import (
    "context"
    "fmt"
    "time"
)

func longRunningTask(ctx context.Context) {
    for {
        select {
        case <-ctx.Done():
            fmt.Println("Task cancelled:", ctx.Err())
            return
        default:
            fmt.Println("Working...")
            time.Sleep(500 * time.Millisecond)
        }
    }
}

func main() {
    // With timeout
    ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
    defer cancel()

    go longRunningTask(ctx)

    time.Sleep(3 * time.Second)
    fmt.Println("Main done")
}
```

### Race Detector

Go has a built-in race detector. Run your program with:

```bash
go run -race yourprogram.go
```

### Best Practices

1. **Don't communicate by sharing memory; share memory by communicating** - Use channels instead of shared variables when possible

2. **Always close channels** - But only from the sender side

3. **Use buffered channels when you know the capacity** - Reduces blocking

4. **Avoid goroutine leaks** - Make sure goroutines can exit

5. **Use context for cancellation** - Especially for long-running operations

6. **Keep critical sections small** - Minimize time holding locks

7. **Default to unbuffered channels** - Buffer only when you have a good reason

### Common Pitfalls

```go
// WRONG: Closing from wrong goroutine
go func() {
    for val := range ch {
        process(val)
    }
}()
close(ch)  // Don't close here!

// WRONG: Loop variable capture
for i := 0; i < 5; i++ {
    go func() {
        fmt.Println(i)  // Will print 5 five times!
    }()
}

// CORRECT: Pass value to goroutine
for i := 0; i < 5; i++ {
    go func(i int) {
        fmt.Println(i)
    }(i)
}
```

This covers the fundamentals of Go and concurrent programming! The key to mastering Go's concurrency is practice and understanding the patterns.

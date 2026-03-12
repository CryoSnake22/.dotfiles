# Go Midterm Prep

## Receiving data

```go
v := <-ch // Value only

v, ok := <-ch // Value and Status

// Await values until ok == false
for v := range ch{
  // do something
}
```

The flow of data in go should go `sender -> channel -> receiver` since closing a channel tells the receiver no more data will come into this channel, only the sender should close the channel

# Waitgroup:

```go
var wg sync.WaitGroup
wg.Add(N) // adds N routines

go func(){
  defer wg.Done // decrements the waitgroup counter
  return
}()

wg.Wait()

```

# To put in Cheatsheet:

```go
var wg sync.WaitGroup
wg.Add(N) // adds N routines

go func(){
  defer wg.Done() // decrements the waitgroup counter
  return
}()

wg.Wait()

// Signature:

func worker(wg *sync.WaitGroup){
  defer wg.Done()
}

```

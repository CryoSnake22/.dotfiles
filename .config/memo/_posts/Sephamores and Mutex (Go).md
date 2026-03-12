# Sephamores and Mutex (Go)

**File:** `/Users/charlo/.dotfiles/.config/memo/_posts/Scratch.md`

## Sephamores

A sephamore tells the program how many routines can access a ressource at a given time, in go it is implemented as a boolean channel with a capacity

```go
seph := make(chan bool, N) // Where N is the number of routines which can access the ressource

func foo(){
  seph <- true // aquire ressource
  // so stuff with ressource...
  <- seph // release ressource
}
```

## Mutex

Whilst Mutex has its own implementation in go through `sync.Mutex` a Mutex is really just a specific case of a sephamore where the capacity is `1` meaning that only one routine can access the ressource at a time signifying some sense of ownership of the ressource.

```go
mutex := sync.Mutex

func foo(){
  mutex.Lock() // aquire ressource
  // so stuff with ressource...
  mutex.Unlock() // release ressource
}
```

```

```

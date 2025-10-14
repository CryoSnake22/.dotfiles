# Final Review

## Formal Languages

## Computer Architecture:

### Data Representations:

```
MISSING:
- Proper Understanding of each Instruction and what it does.
- Micro Instructions and transfer timing
- Floating point mantissa breakdown
-
-
-
-


bin(0xFEED)
= 0b 1111 1110 1110 1101

bin(0x1234)
= 0b 0001 0010 0011 0100
```

- [ ] KB MB meaning where 1KB = 1048 B because 2^10 with the 10 meaning Kilo
- Floating Point
- Fixed Point
- Hexadecimal etc.

Circular shift wraps around like this: `1001 -> 1100 -> 0110 -> 0011 (Circular Shift Right)`

Arithmetic shift keeps the sign bit so shift left doesnt do anything so we have:
`1001 -> 0010 -> 0100 -> 1000 -> 0000 (ASHIFT left)`
But in the case of arithmetic shift right we have:
`1000 -> 1100 -> 1110 -> 1111 (ASHIFT right)` Where the sign bit is preserved,

### ALU

- Instruction format:
  `[I (1 bit)][opcode (7bit)][Register (6 bit)][Address (18bit)]`
-

### CPU

## Data Structures:

-

## Software Engineering:

- The slides for chapter 9: architecting and designing software, are from the MC questions on the exam
- 11 design principles +++
- Architectures know at high level
- Black Box testing
- Glass Box testing

### Chapter 9:

Designs:

- Top-down design (Make sure system has good structure):
  - Make high level decisions then dig into the details
- Bottom-up design (Make sure components are reusable):
  - Make low level decisions about granular details then work on putting them together in the higher level

OKAY NOW FOR REAL

1. Divide and Conquer
2. Increasing cohesion

- Functional Cohesion:
  - All the code for a given computation is in the same place and has no side effects. There is nothing else in the bucket for that function
- Layer Cohesion
  - Lower layers don't access services from higher layers, higher layers can access lower layers.
- Communication Cohesion
  - Make sure all the code to access a single data is in the same class.
- Sequential cohesion:
  - If you've got procedures where input -> output -> input2 -> output2, they should be in sequence , not disjoint
- Temporal Cohesion:
  - Operations performed during the same "phase" of execution is kept together.
- Utilities stick together

3. Reduce Coupling as much as possible

- Declare stuff private (Content Coupling)
- Control Coupling
  - use a look up table or use polymorphism.
- Stamp coupling:

```java
Class1 method()
```

makes it so you're dependent on class 1 but if you had:

```java
Class1 implements interface1

interface1 method()
```

Then you're not dependent on the class anymore, just the interface so it's easier to change the code later

But you don't want to have the oposite scenario either, which would be called

- Data Coupling
  Where you have tons of primitive and arguments in every call which would create a mess of:

```java
interface1 methods(String a,String b, String c, String d, String, e)
```

4. Increase abstraction:
   Don't make things too granular for no reason
5. Increase Reusability
   Generalize design as much as possible, make it contain hooks and simplify
6. reuse
   actively reuse bits of code that are general to behaviour across components
7. Design for Flexibility
   Anticipate future changes and prepare for them by:

- Creating abstractions
- Not hard coding
- Leaving options open

8. Anticipate Obsolescence
   Plan for changes in technology etc.
9. Design for portability
   Have it run on as many platforms as possible
10. Design for testability
    Make a program that automatically tests the software (Junit, main method to test.)
11. Design defensively.

    Anticipate missuse of methods dont trust others to use your code properl11. Design defensively.
    You can desing **By Contract** by making sure each method has a contract aka its _preconditions_ to be executed
    `preconditions, postconditions and invariants the method agrees not to touch`

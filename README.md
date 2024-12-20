# Lua Learning Path

![](https://www.lua.org/images/logo.gif) 

## Types and Values

Lua is a dynamically-typed language. There are no type definitions in the language; each value carries its own type.
There are eight basic types in Lua: nil, Boolean, number, string, userdata, function, thread, and table. The function type gives the type name of any given value:

```lua 
> type(nil) --> nil  
> type(true) --> boolean  
> type(10.4 * 3) --> number  
> type("Hello world") --> string  
> type(io.stdin) --> userdata  
> type(print) --> function  
> type(type) --> function  
> type({}) --> table  
> type(type(X)) --> string
```

The userdata type allows arbitrary C data to be stored in Lua variables. It has no predefined operations in Lua, except assignment and equality test. Userdata are used to represent new types created by an application program or a library written in C; for instance, the standard I/O library uses them to represent open files.

### Nil

Nil is a type with a single value, nil, whose main property is to be different from any other value. Lua uses nil as a kind of non-value, to represent the absence of a useful value. As we have seen, a global variable has a nil value by default, before its first assignment, and we can assign nil to a global variable to delete it.

### Booleans 

The Boolean type has two values, `@false{}` and `@true{}`, which represent the traditional Boolean values.
However, Booleans do not hold a monopoly of condition values: in Lua, any value can represent a condition. Conditional tests (e.g., conditions in control structures) consider both the Boolean false and nil as false and anything else as true. In particular, Lua considers both zero and the empty string as true in conditional tests.

### Operators 

#### Logical Operators

Lua supports a conventional set of logical operators: `and`, `or`, and `not`. Like control structures, all logical operators consider both the Boolean false and nil as false, and anything else as true. The result of the and operator is its first operand if that operand is false; otherwise, the result is its second operand. The result of the or operator is its first operand if it is not false; otherwise, the result is its second operand.

```lua

> 4 and 5 --> 5  
> nil and 13 --> nil  
> false and 13 --> false  
> 0 or 5 --> 0  
> false or "hi" --> "hi"  
> nil or false --> false
```

Both and and or use short-circuit evaluation, that is, they evaluate their second operand only when nec-essary. Short-circuit evaluation ensures that expressions like (i ~= 0 and a/i > b) do not cause run-time errors: Lua will not try to evaluate a / i when i is zero.

The `not` operator always gives a Boolean value. 


#### Aritmethic Operators

Lua presents the usual set of arithmetic operators: addition, subtraction, multiplication, division, and negation (unary minus). It also supports floor division, modulo, and exponentiation.

For integer division, floor division and denoted by `//`. As its name implies, floor division always rounds the quotient towards minus infinity, ensuring an integral result for all operands. With this definition, this operation can follow the same rule of the other arithmetic operators: if both operands are integers, the result is an integer; otherwise, the result is a float (with an integral value)

The following equation defines the modulo operator:
 `a % b == a - ((a // b) * b)`

For real operands, modulo has some unexpected uses. For instance, x - x % 0.01 is x with exactly two decimal digits, and x - x % 0.001 is x with exactly three decimal digits:

```lua
 > x = math.pi  
 > x - x%0.01 --> 3.14  
 > x - x%0.001 --> 3.141
```

Lua also offers an exponentiation operator, denoted by a caret (^). Like division, it always operates on floats. (Integers are not closed under exponentiation; for instance, $2^2$ is not an integer.) We can write `x^0.5` to compute the square root of `x` and `x^(1/3)` to compute its cubic root.

#### Relational Operators

`< > <= >= == ~= `

All these operators always produce a Boolean value. 

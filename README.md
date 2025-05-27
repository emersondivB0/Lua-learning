# Lua Learning Path

![](https://www.lua.org/images/logo.gif)

## Table of Content
<!-- mtoc-start -->

* [Types and Values](#types-and-values)
  * [Nil](#nil)
  * [Booleans](#booleans)
  * [Operators](#operators)
    * [Logical Operators](#logical-operators)
    * [Aritmethic Operators](#aritmethic-operators)
    * [Relational Operators](#relational-operators)
  * [Precedence](#precedence)
* [The Mathematical Library](#the-mathematical-library)
  * [Random-number generator](#random-number-generator)
  * [Rounding Functions](#rounding-functions)
  * [Conversions](#conversions)
* [Strings](#strings--)
  * [Literal Strings](#literal-strings--)
  * [Long Strings](#long-strings--)
  * [String Library](#string-library)

<!-- mtoc-end -->

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

`< > <= >= == ~=`

All these operators always produce a Boolean value.

### Precedence

Operator precedence in Lua follows the table below, from the higher to the lower priority:

| Operators |
| ------------- |
| ^  |
| unary operators (- # ~ not)  |
| * / // %  |
| + - |
| .. (concatentation)  |
| << >> (bitwise shifts)  |
| & (bitwise AND)  |
| ~ (bitwise exclusive OR)  |
| \| (bitwise OR)  |
| < > <= >= ~= ==  |
| and  |
| or |

## The Mathematical Library

Lua provides a standard math library with a set of mathematical functions, including trigonometric func-tions (sin, cos, tan, asin, etc.), logarithms, rounding functions, max and min, a function for gen-erating pseudo-random numbers (random), plus the constants pi and huge (the largest representable number, which is the special value inf on most platforms.)  

```lua
> math.sin(math.pi / 2) --> 1.0  
> math.max(10.4, 7, -3, 20) --> 20  
> math.huge --> inf 
```

All trigonometric functions work in radians. We can use the functions deg and rad to convert between degrees and radians.

### Random-number generator

We can call the `math.random()` function in three ways. When we call it without arguments, it returns a pseudo-random real number with uniform distribution in the interval [0,1). When we call it with only one argument, an integer n, it returns a pseudo-random integer in the interval [1,n]. For instance, we can simulate the result of tossing a die with the call `random(6)`. Finally, we can call random with two integer arguments, l and u, to get a pseudo-random integer in the interval [l,u].

### Rounding Functions

The math library offers three rounding functions: `floor`, `ceil`, and `modf`. Floor rounds towards minus infinite, `ceil` rounds towards plus infinite, and `modf` rounds towards zero. They return an integer result if it fits in an integer; otherwise, they return a float (with an integral value, of course). The function `modf`, besides the rounded value, also returns the fractional part of the number as a second result.

### Conversions

Any integer can be converted to double just adding 0.0 to it.

Yo convert any float to an integer, just make it `OR` to 0:

```lua
9.08 | 0 --> 9
```

Another way to force a number into an integer is to use `math.tointeger`, which returns nil when the number cannot be converted:

```lua
> math.tointeger(-258.0) --> -258  
> math.tointeger(2^30) --> 1073741824  
> math.tointeger(5.01) --> nil (not an integral value)  
> math.tointeger(2^64) --> nil (out of range)
```

## Strings  

Strings in Lua are immutable values. We cannot change a character inside a string, as we can in C; instead, we create a new string with the desired modifications.

```lua  
a = "one string"  
b = string.gsub(a, "one", "another") -- change string parts  
print(a) --> one string  
print(b) --> another string
```

Strings in Lua are subject to automatic memory management, like all other Lua objects (tables, functions, etc.). This means that we do not have to worry about allocation and deallocation of strings; Lua handles it for us.

We can get the length of a string using the length operator (denoted by #).

This operator always counts the length in bytes, which is not the same as characters in some encodings.

We can concatenate two strings with the concatenation operator .. (two dots). If any operand is a number, Lua converts this number to a string

### Literal Strings  

We can delimit literal strings by single or double matching quotes.

They are equivalent; the only difference is that inside each kind of quote we can use the other quote without escapes.

Strings in Lua can contain the following C-like escape sequences:

|Sequence| Value|
|--------|------|
|\a| bell|
|\b| back space|
|\f| form feed|
|\n|newline |
|\r| carriage return |
|\t| horizontal tab |
|\v| vertical tab |
|\\|backslash |
|\"| double quote |
|\'| single quote|

The following examples illustrate their use:

```lua  
> print("one line\nnext line\n\"in quotes\", 'in quotes'")  
--> one line  
--> next line  
--> "in quotes", 'in quotes'  
> print('a backslash inside quotes: \'\\\'')  
--> a backslash inside quotes: '\'  
> print("a simpler way: '\\'")  
--> a simpler way: '\'
```

### Long Strings  

The long string in Lua is a way to define strings than span multiple lines without the need for escape characters. To create a long string, we can use double square brackets [[ and ]] to delimit the string. The content of the string can include line breaks and any other characters without the need for escaping.

### String Library

The string library assumes one-byte characters.
Some functions in the string library are quite simple: the call `string.len(s)` returns the length of a string `s`; it is equivalent to `#s`. The call `string.rep(s, n)` returns the string `s` repeated n times; we can create a string of 1 MB (e.g., for tests) with `string.rep("a", 2^20)`. The function `string.reverse` reverses a string. The call `string.lower(s)` returns a copy of `s` with the up-per-case letters converted to lower case; all other characters in the string are unchanged. The function `string.upper` converts to upper case.

```lua
> string.rep("abc", 3) --> abcabcabc  
> string.reverse("A Long Line!") --> !eniL gnoL A  
> string.lower("A Long Line!") --> a long line!
> string.upper("A Long Line!") --> A LONG LINE!
```

The call `string.sub(s, i, j)` extracts a piece of the string `s`, from the `i`-th to the `j`-th character inclusive. (The first character of a string has index 1.) We can also use negative indices, which count from the end of the string: index -1 refers to the last character, -2 to the previous one, and so on. Therefore, the call `string.sub(s, 1, j)` gets a prefix of the string `s` with length `j`; `string.sub(s, j, -1)` gets a suffix of the string, starting at the `j`-th character; and `string.sub(s, 2, -2)` returns a copy of the string `s` with the first and last characters removed:

```lua
> s = "[in brackets]"  
> string.sub(s, 2, -2) --> in brackets  
> string.sub(s, 1, 1) --> [  
> string.sub(s, -1, -1) --> ]
```

Strings in Lua are immutable. Like any other function in Lua, `string.sub` does not change the value of a string, but returns a new string. A common mistake is to write something like `string.sub(s, 2, -2)` and assume that it will modify the value of `s`. If we want to modify the value of a variable, we must assign the new value to it:

```lua
s = string.sub(s, 2, -2)
```

The functions `string.char` and `string.byte` convert between characters and their internal numeric representations. The function `string.char` gets zero or more integers, converts each one to a character, and returns a string concatenating all these characters. The call `string.byte(s, i)` returns the internal numeric representation of the `i`-th character of the string `s`; the second argument is optional; the call `string.byte(s)` returns the internal numeric representation of the first (or single) character of `s`.
The following examples assume the ASCII encoding for characters:

```lua
print(string.char(97)) --> a  
i = 99; print(string.char(i, i+1, i+2)) --> cde 
print(string.byte("abc")) --> 97  
print(string.byte("abc", 2)) --> 98  
print(string.byte("abc", -1)) --> 99
```

A call like `string.byte(s, i, j)` returns multiple values with the numeric representation of all characters between indices `i` and `j` (inclusive):

```lua
print(string.byte("abc", 1, 2)) --> 97 98
```

A nice idiom is {`string.byte(s, 1, -1)`}, which creates a list with the codes of all characters in `s`. (This idiom only works for strings somewhat shorter than 1 MB. Lua limits its stack size, which in turn limits the maximum number of returns from a function. The default stack limit is one million entries.)

The function `string.format` is a powerful tool for formatting strings and converting numbers to strings. It returns a copy of its first argument, the so-called format string, with each directive in that string replaced by a formatted version of its correspondent argument. The directives in the format string have rules similar to those of the C function printf. A directive is a percent sign plus a letter that tells how to format the argument: `d` for a decimal integer, `x` for hexadecimal, `f` for a floating-point number, `s` for strings, plus several others.

```lua
> string.format("x = %d y = %d", 10, 20) --> x = 10 y = 20  
> string.format("x = %x", 200) --> x = c8  
> string.format("x = 0x%X", 200) --> x = 0xC8  
> string.format("x = %f", 200) --> x = 200.000000  
> tag, title = "h1", "a title"  
> string.format("<%s>%s</%s>", tag, title, tag)  --> <h1>a title</h1>
```

Between the percent sign and the letter, a directive can include other options that control the details of the formatting, such as the number of decimal digits of a floating-point number:

```lua
print(string.format("pi = %.4f", math.pi)) --> pi = 3.1416  
d = 5; m = 11; y = 1990  
print(string.format("%02d/%02d/%04d", d, m, y)) --> 05/11/1990
```

We can call all functions from the string library as methods on strings, using the colon operator. For in-stance, we can rewrite the call `string.sub(s, i, j)` as `s:sub(i, j)`; `string.upper(s)` becomes `s:upper()`.

The string library includes also several functions based on pattern matching. The function `string.find` searches for a pattern in a given string:

```lua
> string.find("hello world", "wor") --> 7 9  
> string.find("hello world", "war") --> nil
```

It returns the initial and final positions of the pattern in the string, or `nil` if it cannot find the pattern.
The function `string.gsub` (Global SUBstitution) replaces all occurrences of a pattern in a string with another string:

```lua
> string.gsub("hello world", "l", ".") --> he..o wor.d 3  
> string.gsub("hello world", "ll", "..") --> he..o world 1  
> string.gsub("hello world", "a", ".") --> hello world 0
```

It also returns, as a second result, the number of replacements it made.

# Lua Learning Path

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

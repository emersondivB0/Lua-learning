x = 3
y = 5

if 3 < 5 then
	print("X es mayor que Y")
else
	print("Intenta de nuevo")
end

-- defines a factorial function  
function fact (n)  
  if n == 0 then  
    return 1  
  else  
    return n * fact(n - 1)  
  end  
end   
print("enter a number:")  
a = io.read("*n") -- reads a number  
print(fact(a))

print("-----------------------------")

print("sin pi/2 = ", math.sin(math.pi / 2))
print("Random function")
print("Without arguments: ", math.random())
print("One argument (6): ", math.random(6))
print("Two arguments (4,25): ", math.random(4, 25))

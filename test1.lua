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

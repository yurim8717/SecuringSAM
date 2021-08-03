#check if input number is a prime number
  
num = input("Enter a number to check: ")
num = int(num)
  
# If number is bigger than 1
if num > 1:
  
    # create loop with range
    for i in range(2, int(num/2)+1):
  
        
        #if you can divide number by 2 shows remainder is zero, it is not prime
        if (num % i) == 0:
            print(num, "is not a prime number, thank you and goodbye")
            break
    else:
        print(num, "is a prime number, thank you and goodbye")
  
else:
    print(num, "is not a prime number, thank you and goodbye")
quit()

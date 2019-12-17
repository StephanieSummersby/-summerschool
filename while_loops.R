x <- 0

#start while loop
while (x <= 1000) {
  x <- x + 179 #assign to new value of x 
}

print(x) #can press stop if you get in an infinite loop 

x <- 500
 print (x) #prints 500
 
 #start while loop
while (x > 0) {
  x <- x - 20
  print(x)
}
 
 #for loop
for (value in 1:10) {
  answer <- 137*value
  print(answer)
}

 words <- c("farewell", "cruel", "world!")
 
 for (w in words) {
   nLetters <- nchar(w)
   blockWord <- toupper(w)
   cat(blockWord, "has", nLetters, "letters\n")
 }
 
 #exercise 1

 total <- 500/20 + 1
 
 x <- 500
 
 for (i in 1:total) {
   x <- x - 20
   print(x)
 }
 
 print(total)
 
 #exercise 2
 
family <- c("Jacqueline", "Michael", "Victoria")
age <- c(44, 47, 25)
 
df <- data.frame(family, age)
 
n <- nrow(df) #number of rows in data frame
 
 for (r in 1:n) { #for 1 to the number of rows in the data frame
   print(paste0(df$family[r], " is ", df$age[r], " years old"))
}
 
#branches

myname <- "Stephanie"

answer <- readline("What is your name? ")

if(answer == myname) {
  print("Yay you have an amazing name!")
  } else {
  print("Sorry, your name is inferior")
}
 
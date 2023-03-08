# Initial Start from: Example program to display a string and an integer.
# Calculates a mathematical operation on some two ingers given by user.
# -----------------------------------------------------
# Data Declarations
.data
prompt1: .asciiz "Enter the first number\n"
prompt2: .asciiz "Enter the second number\n"
prompt3: .asciiz "Enter the opertaion type\n"

resultPrompt: .asciiz "The result is\n"
newLine: .asciiz "\n"
# -----------------------------------------------------
# text/code section
.text
.globl main
.ent main
main:
# $s0 will represent number 1
# $s1 will represent number 2
# $s2 will catch the user's requested operation
# $s3 will store the result of the operation
# -----------------------------------------------------
la $a0, prompt1 # Load prompt 1 into the argument list for syscall

li $v0, 4       # Load call code for printing a string to the console
syscall         # Run the operation specified at v0 with arguments in a0

li $v0, 5       # Load call code for reading integer input from user
syscall

move $s0, $v0   # Move the value taken by user to Register s0
# -----------------------------------------------------
la $a0, prompt2 # Load prompt 2 into argument list for syscall

li $v0, 4       # Load call code for printing a string to the console
syscall         

li $v0, 5       # Load call code for reading integer input from user
syscall

move $s1, $v0   # Move the value taken by user to Register s1
# -----------------------------------------------------
invalidInput:
la $a0, prompt3 # Load prompt 3 into argument list for syscall

li $v0, 4       # Load call code for printing a string to the console
syscall         

li $v0, 5       # Load call code for reading integer input from user
syscall

move $s2, $v0   # Move the value taken by user to Register s2
# -----------------------------------------------------
beq $s2, 3, exit # Exit program if user enters 3
beq $s2, 0, addVals # Add the two numbers if user enters 0
beq $s2, 1, subVals # Subtract the two numbers if user enters 1
beq $s2, 2, mulVals # Multiply the two numbers if user enters 2
j invalidInput # Attempt to take input from user again of none of the 4 options were selected

addVals:
add $s3, $s0, $s1
j doneComputing # Print the result once complete

subVals:
sub $s3, $s0, $s1
j doneComputing # Print the result once complete

mulVals:
mulo $s3, $s0, $s1
j doneComputing # Print the result once complete
# -----------------------------------------------------
doneComputing:
la $a0, resultPrompt # Load the result prompt into argument list

li $v0, 4       # Load call code for printing a string to the console
syscall       

move $a0, $s3   # Load the result of the operation to be printed
li $v0, 1       # Load call code for printing an integer to the console
syscall  

la $a0, newLine # Load the new line string
li $v0, 4       # Load call code for printing a string to the console
syscall

j main          # Jump back to main once completed
# -----
exit:       # Done, terminate program.
li $v0, 10  # Load call code for terminating a program
syscall     # Run operation specified at v0
.end main
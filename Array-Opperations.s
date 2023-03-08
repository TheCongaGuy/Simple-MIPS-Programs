# -----------------------------------------------------
# Data Declarations
.data
maxMessage: .asciiz "The maximum is "
minMessage: .asciiz "The minimum is "
sumMessage: .asciiz "The summation is "
newLine: .asciiz "\n"

array:  .word 11, 12, -10, 13, 9
        .word 12, 14, 15, -20, 0
length: .word 10
# -----------------------------------------------------
# Main Setup
.text
.globl main
.ent main
# -----------------------------------------------------
# Main Method
main:
# $s0 will hold the address of the array itself
# $s1 will hold the max value of the array
# $s2 will hold the min value of the array
# $s3 will hold the sum of all values in the array
# $s4 will store the length of the array
la $s0, array
lw $s1, ($s0)           # Store the first element of the array in the max value
lw $s2, ($s0)           # Store the first element of the array in the min value
li $s3, 0
lw $s4, length

# ------------------------------------------------
# for (int i = 0; i < 10; i++)
li $t0, 0               # $t0 will be our for loop iterator
forLoop:                

lw $t2, ($s0)           # $t2 will be the value we are currently working on {array[i]}

addi $s0, $s0, 4        # Move one word further into the array

add $s3, $s3, $t2       # Add our current value to the sum {sum += array[i]}

# ---------------------------------
# (array[i] > max) ? max = array[i]
# (array[i] < min) ? min = array[i]
ble $t2, $s1, skipMax   # Save the new max only if the current value is greater
move $s1, $t2           # Set max value
skipMax:

bge $t2, $s2, skipMin    # Save the new min only if our current value is lesser
move $s2, $t2            # Set min value
skipMin:
# ---------------------------------

addi $t0, $t0, 1        # Increment our i value
blt $t0, $s4, forLoop   # Loop if i < the length of the array
# ------------------------------------------------

li $v0, 4               # Set call code for printing a string
la $a0, maxMessage      # Set the argument to "The maximum is "
syscall

li $v0, 1               # Set call code for printing an int
move $a0, $s1           # Copy the max value to the argument
syscall

li $v0, 4               # Set call code back to string
la $a0, newLine         # Set the argument to a new line character
syscall

la $a0, minMessage      # Set the argument to "The minimum is "
syscall

li $v0, 1               # Set call code for printing an int
move $a0, $s2           # Copy the min value to the argument
syscall

li $v0, 4               # Set call code back to string
la $a0, newLine         # Set the argument to a new line character
syscall

la $a0, sumMessage      # Set the argument to "The summation is "
syscall

li $v0, 1               # Set call code for printing an int
move $a0, $s3           # Copy the sum value to the argument
syscall

li $v0, 4               # Set call code back to string
la $a0, newLine         # Set the argument to a new line character
syscall
# -----------------------------------------------------
# Terminate Program
li $v0, 10
syscall
.end main
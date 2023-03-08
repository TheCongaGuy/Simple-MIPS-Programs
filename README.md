# Simple-MIPS-Programs
These are two little programs written in MIPS assembly to get a feel for what it is like programming in that environment. You can run these by downloading each .s file, opening an emulator like [QtSpim](https://sourceforge.net/projects/spimsimulator/files/) and running it that way. I used QtSpim_9.1.20_Windows.msi to test this code through its Reinitialize and Load File option.

## Simple-Calculator.s ##
As the name implies, this is an extremely simple calculator application that takes two word sized integers, and a third word integer to represent the math operation to be preformed. Entering 0 will add the two previously entered numbers, 1 will subtract, and 2 will multiply. This program will loop until the user enters 3 to exit. There is no support for division in this calculator.

## Array-Opperations.s ##
This program does not take any user input. Instead, this program takes an array stored in memory and finds 1) the maximum value in the array, 2) the minimum value in the array, and 3) the sum of all elements in the array. The array is hardcoded with set values and a set size so the results will always be the same. However, if someone wanted to edit the array they would only need to allocate space for more word integers, and change the size variable of the array.

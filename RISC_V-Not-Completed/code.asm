main: 
	addi a7,a7,1

	addi a0,a0,11

	addi a1,a1,8

	addi a2,a2,9

	addi a3,a3,0

	addi a4,a4,32

for loop:

	sub a6,a4,a7

	slli a3,a3,1

	blt a3,a0,br1

	sub a3,a3,a0
br1:

	srl a5,a2,a6

	andi a5,a5,1

	bne a5,a7,br2

	add a3,a3,a1
	blt a3,a0,br2
	
	sub a3,a3,a0

br2:
	sub a4,a4,a7

	bne a4,zero,forloop
.text
	mov r0, #10 @ stores a
	mov r1, #5 @ stores b
	b gcd
gcd:
	cmp r0, r1
	beq exit
	bgt sub_a
	blt sub_b
sub_a:
	sub r0, r0, r1
	b gcd
sub_b:
	sub r1, r1, r0
	b gcd
exit:
	swi 0x011
.end

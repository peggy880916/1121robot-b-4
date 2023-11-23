Integer Tokens
Integer Blocks
Integer number
Double TokenHeight
Double BlockHeight
Function Stack_up

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

number = 1
Tokens = 3
Blocks = 3
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safe

For TokenID = Tokens To 1 Step -1

	Pick_Infeed_Token_2()
	Pick_Infeed_Block_2()
Next TokenID

Go Retract_Safe

Fend
Function Pick_Infeed_Token_2
	'Pick Token from Infeed 將feeder那的圓形吸起來
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go point2 +X(-23) +Y(-15) +Z(50 + (Tokens * TokenHeight)) CP
	Move point2 +X(-23) +Y(-15) +Z(Tokens * TokenHeight - 3)
	On 8
	Wait .5
    Move point2 +X(-23) +Y(-15) +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
	Tokens = Tokens - 1
	
	Go point3 +X(-25) +Y(-25) +Z(50) CP
	Move point3 +X(-25) +Y(-25) +Z(6 * number + 0.1)
	Off 8
	Move point3 +X(-25) +Y(-25) +Z(50) CP
	number = number + 1
Fend

Function Pick_Infeed_Block_2
	'Pick Token from Infeed 將feeder那的圓形吸起來
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go point2 +X(-20) +Y(-38) +Z(48 + (Blocks * TokenHeight)) CP
	Move point2 +X(-20) +Y(-38) +Z(Blocks * TokenHeight - 3)
	On 8
	Wait .5
    Move point2 +X(-20) +Y(-38) +X(-1) +Z(48 + (Blocks * TokenHeight)) CP
	Blocks = Blocks - 1
	
	Go point3 +X(-25) +Y(-25) +Z(50) CP
	Move point3 +X(-25) +Y(-25) +Z(6 * number + 0.1)
	Off 8
	Move point3 +X(-25) +Y(-25) +Z(50) CP
	number = number + 1
Fend



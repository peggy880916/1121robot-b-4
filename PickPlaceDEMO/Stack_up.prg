Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
Function main

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

Tokens = 3
Blocks = 3
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safe

For BlockID = Blocks To 1 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	Pick_Infeed_Block()
	Alignment_Block()
Next BlockID

	
Next TokenID

Go Retract_Safe

Fend
Function Pick_Infeed_Token
	'Pick Token from Infeed 
	
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go X(30) +Y(45) +Z(50 + (Tokens * TokenHeight)) /4 CP
	Move X(30) +Y(45) +Z(Tokens * TokenHeight) /4
	On 8
	Wait .5
    Move X(30) +Y(45) +X(-1) +Z(50 + (Tokens * TokenHeight)) /4 CP
	'Tokens = Tokens - 1
Fend

Function Pick_Infeed_Block
	'Pick Block from Infeed 將feeder那的長方形吸起來
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go X(20) +Y(25) +Z(50 + (Blocks * BlockHeight)) /4 CP
	Move X(20) +Y(25) +Z(Blocks * BlockHeight) /4
	On 8
	Wait .5
	Move X(20) +Y(25) +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) /4 CP
	'Blocks = Blocks - 1
Fend

Function Alignment_Token
	'Alignment Token 將圓形的放到fixture
	Print "Aligning Token. Token ID = ", Tokens
	Go X(25) +Y(22) +Z(20) /6 CP
	Move X(25) +Y(22) /6
	Off 8
Fend
Function Alignment_Block
	'Alignment Block 將長方形的放到fixture
	Print "Aligning Block. Block ID = ", Blocks
	Go X(25) +Y(22) +Z(20) /6 CP
	Move X(25) +Y(22) /6
	Off 8
Fend

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

For TokenID = Tokens To 1 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	Place_Tray_Token()
Next TokenID

For BlockID = Blocks To 1 Step -1
	Pick_Infeed_Block()
	Alignment_Block()
	Place_Tray_Block()
Next BlockID

Go Retract_Safe

Fend

Function Pick_Infeed_Token
	'Pick Token from Infeed �Nfeeder������Χl�_��
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go X(19.16) +Y(24.84) +Z(50 + (Tokens * TokenHeight)) /4 CP
	Move X(19.16) +Y(24.84) +Z(Tokens * TokenHeight) /4
	On 8
	Wait .5
    Move X(19.16) +Y(24.84) +X(-1) +Z(50 + (Tokens * TokenHeight)) /4 CP
	'Tokens = Tokens - 1
Fend

Function Pick_Infeed_Block
	'Pick Block from Infeed �Nfeeder��������Χl�_��
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go X(49.5) +Y(24.5) +Z(50 + (Blocks * BlockHeight)) /4 CP
	Move X(49.5) +Y(24.5) +Z(Blocks * BlockHeight) /4
	On 8
	Wait .5
	Move X(49.5) +Y(24.5) +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) /4 CP
	'Blocks = Blocks - 1
Fend

Function Alignment_Token
	'Alignment Token �N��Ϊ����fixture
	Print "Aligning Token. Token ID = ", Tokens
	Go X(19.16) +Y(24.84) +Z(20) /6 CP
	Move X(25) +Y(22) /6
	Off 8
	'��}��i��վ�
	Move X(25) +Y(22) +X(5) /6
	Move X(25) +Y(22) +X(5) +Z(5) /6 CP
	Go X(25) +Y(22) +Z(5) /6 CP
	Move X(25) +Y(22) /6
	'�l�_��
	On 8
	Wait .5
	Move X(25) +Y(22) +Z(20) /6 CP
Fend

Function Alignment_Block
	'Alignment Block �N����Ϊ����fixture
	Print "Aligning Block. Block ID = ", Blocks
	Go X(40) +Y(25) +Z(20) /6 CP
	Move X(40) +Y(25) /6
	Off 8
	'��}��i��վ�
	Move X(40) +Y(25) +Y(-5) /6
	Move X(40) +Y(25) +X(5) +Y(-6) /6 CP
	Move X(40) +Y(25) +X(5) +Y(-6) +Z(5) /6 CP
	Go X(40) +Y(25) +Z(5) /6 CP
	Move X(40) +Y(25) /6
	'�l�_��
	On 8
	Wait .5
	Move X(40) +Y(25) +Z(20) /6 CP
Fend

Function Place_Tray_Token
	'Tray Token �N��Ϊ����tray
	Print "Placing Token in Tray. Tray Position ID = ", Tokens
	Go X(25) +Y(15) +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(20) /5 CP
	Move X(25) +Y(15) +X(-.05 * Tokens) +Y(-30. * Tokens) /5
	Off 8
	Wait .5
	Move X(25) +Y(15) +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(50) /5 CP
	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	'Tray Block �N����Ϊ����tray
	Print "Placing Block in Tray. Block Position ID = ", Blocks
	Go X(25) +Y(45) +X(-.05 * Blocks) +Y(-30. * Blocks) +Z(20) /5 CP
	Move X(25) +Y(45) +X(-.05 * Blocks) +Y(-30. * Blocks) /5
	Off 8
	Wait .5
	Move X(25) +Y(45) +X(-.05 * Blocks) +Y(-30. * Blocks) +Z(50) /5 CP
	Blocks = Blocks - 1
Fend

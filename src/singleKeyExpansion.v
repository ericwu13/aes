/*
*
*   Author: Ahmad Hegazy <https://github.com/ahegazy>
*	Date: September 2018
*   Formal verification: May 2020 
*
* Description: Expand only a single key in AES encryption/Decryption.
* Language: Verilog
*
*/
module singleKeyExpansion( 
	input  [127:0] keyInput ,
	input [3:0] keyNum,
	output  [127:0] keyOutput
);
	wire [31:0] stp1 ;
	wire [31:0] stp2 ;
	wire [31:0]Rcon ;
    

 	rcon uut1 (
		.r(keyNum),
		.rcon(Rcon)
	);

	subByte uut2 (
		.state(stp1), 
		.state_out(stp2)
	);
	 
    assign stp1 = { keyInput[23:0], keyInput[31:24] }; 
	assign keyOutput[127:96] = keyInput[127:96] ^ stp2 ^ Rcon;
	assign keyOutput[95:64] = keyInput[95:64] ^ keyOutput[127:96];
	assign keyOutput[63:32] = keyInput[63:32] ^ keyOutput[95:64];
	assign keyOutput[31:0] = keyInput[31:0] ^ keyOutput[63:32];

endmodule

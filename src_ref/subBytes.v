/*
*
*
*	Date: September 2018
* 
* Description: substitue a single byte using the s_box step in AES encryption/Decryption.
* Language: Verilog
*
*/

module subByte
	(
	input wire [31:0] state,
	output wire  [31:0]state_out
	);



////////////////////////////////////////////////


/* cannot instantiate instances inisde initial block. */

genvar itr;
genvar jtr;
generate
		for (itr = 0 ; itr <= 31; itr = itr+8)
					s_box sbox (state[itr +:8] , state_out[itr +:8]);
endgenerate


////////////////////////////////////////////////



endmodule



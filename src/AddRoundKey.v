/*
*
* Author: Ahmad Hegazy <https://github.com/ahegazy>
* Date: September 2018
* Modified : October 2018
* Formal verification : May 2020
*
* Description: AddRoundKey step in AES encryption/Decryption.
* Language: Verilog
*
*/

module addRoundKey (
	input wire [127:0] key ,
	input wire [127:0] state,
	output [127:0]state_out
);
    wire [127:0] state_out_comb; 
    genvar i;
    for (i=0 ;i<=15; i=i+1)
        assign state_out_comb[i*8 +: 8] = key[i*8  +:  8] ^ state[i*8  +:  8];
	assign state_out = state_out_comb;

endmodule

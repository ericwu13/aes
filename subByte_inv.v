module subByte_inv
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
					s_box_inv sboxInv (state[itr +:8] , state_out[itr +:8]);
endgenerate


////////////////////////////////////////////////



endmodule




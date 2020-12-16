/*
*
*	Author : Ahmad Hegazy <https://github.com/ahegazy>
*	Date: October 2018
*   Formal : May 2020
*
* Description: ShiftRows step in AES encryption/Decryption.
* Language: Verilog
*
*/
module shiftRows (
	input  wire  [0:127] Data,
	output [0:127] Shifted_Data
);
	

/* Separate comb from seq*/

	wire  [0:127] Shifted_Data_comb;
    
	/* in the DATA .. the arranging is columns filled 1st  ._. */
    /* column 0 no change */
    assign Shifted_Data_comb[0+:8] = Data[0+:8];
    assign Shifted_Data_comb[32+:8] = Data[32+:8];
    assign Shifted_Data_comb[64+:8] = Data[64+:8];
    assign Shifted_Data_comb[96+:8] = Data[96+:8];

    /*2nd column , column 1 , 1 shift down */
    assign Shifted_Data_comb [8+:8] = Data[40+:8];
    assign Shifted_Data_comb [40+:8] = Data[72+:8];
    assign Shifted_Data_comb [72+:8] = Data[104+:8];
    assign Shifted_Data_comb [104+:8] = Data[8+:8];

    /*3rd column , column 2 , 2 shifts down */
    assign Shifted_Data_comb [16+:8] = Data[80+:8];
    assign Shifted_Data_comb [48+:8] = Data[112+:8];
    assign Shifted_Data_comb [80+:8] = Data[16+:8];
    assign Shifted_Data_comb [112+:8] = Data[48+:8];


    /*4th column , column 3 , 3 shifts down */
    assign Shifted_Data_comb [24+:8] = Data[120+:8];
    assign Shifted_Data_comb [56+:8] = Data[24+:8];
    assign Shifted_Data_comb [88+:8] = Data[56+:8];
    assign Shifted_Data_comb [120+:8] = Data[88+:8];

    /*
     //	row 0 no change 
    assign Shifted_Data_comb[0+:32] = Data[0+:32];
     //	2nd row , row 1 , 1 shift left 
    assign Shifted_Data_comb [32+:24] = Data[40+:24];
    assign Shifted_Data_comb [56+:8] = Data[32+:8];
     //3rd row , row 2 , 2 shifts left 
    assign Shifted_Data_comb [64+:16] = Data[80+:16];
    assign Shifted_Data_comb [80+:16] = Data[64+:16];
     //4th row , row 3 , 3 shifts left 
    assign Shifted_Data_comb [96+:8] = Data[120+:8];
    assign Shifted_Data_comb [104+:24] = Data[96+:24];
*/
	assign Shifted_Data = Shifted_Data_comb;


endmodule


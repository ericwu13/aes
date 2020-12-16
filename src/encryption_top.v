/*
*
*   Author: Ahmad Hegazy <https://github.com/ahegazy>
*	Date: September 2018
*   FORMAL: MAY 2020
*
* Description: AES Encryption Top module using FSM to move around the processes' steps.
* Language: Verilog
*
*/
module AES_encryption(
	input [7:0] key_byte, 
	input [7:0] state_byte,
	input clk,
	input reset,
	input enable,
	output reg [7:0] state_out_byte,
	output reg load,
	output reg ready
);

	integer i,j;
	reg [2:0] encState;
	reg [1:0] dataioFSM;
	reg  finish;
	reg [127:0] modulesStateIn, stateOutput;
	reg [127:0] modulesKeyIn;
	wire [127:0] keyExpansionOut, roundKeyStateOut, subByteStateOut, shiftRowsStateOut, mixColumnsStateOut;
	reg [3:0] keyNum;
	reg loadFinish;

	addRoundKey addRoundKeyInst (
		.key(modulesKeyIn),
		.state(modulesStateIn), 
		.state_out(roundKeyStateOut)
	);
	genvar itr;
	generate
		for (itr = 0 ; itr <= 127; itr = itr+32)
			subByte subByteInst (
				.state(modulesStateIn[itr +:32]) , 
				.state_out(subByteStateOut[itr +:32])
			);
	endgenerate
	
	shiftRows shiftRowsInst (
		.Data(subByteStateOut),
		.Shifted_Data(shiftRowsStateOut)
	);

	mixColumns mixColumnsInst (
		.state(modulesStateIn),
		.state_out(mixColumnsStateOut)
	);

	singleKeyExpansion singleKeyExpansionInst ( 
		.keyInput(modulesKeyIn),
		.keyNum (keyNum),
		.keyOutput(keyExpansionOut)
	);


    initial load <= 1'b0;
    initial ready <= 1'b0;
    initial state_out_byte <= 8'h00;


    // 1st FSM (dataioFSM) for 
    // state 0 : wait for the enable signal 
    // state 1 : recieving the data,key byte by byte and store them in a 128 bit registers 
    // state 2 : send the ready signal when finish
    // state 3 : send the data out byte by byte
	always @(posedge clk) begin 
		if (reset) begin
			loadFinish <= 0;
			load<=1'd0;
			ready<=1'd0;
			i <= 128;
			j <= 128; 
			state_out_byte <= 8'h00;
			dataioFSM <= 0 ;
			modulesStateIn <= 0;
			modulesKeyIn <= 0;
		end else if (enable) begin
			case(dataioFSM)
				0: begin 
					/* state zero, the enable signal arrived, begin recieving data */
					dataioFSM <= 1;
					i <= 128;
					loadFinish <= 0;
				end 
				1: begin 
					/* receivng data 1 byte at a cycle */
					if (i>0) begin				
						load<=1'd1; /* send the load signal then begin loading next cycle*/
						loadFinish <= 0;
						modulesKeyIn[i-1 -: 8] <= key_byte;
						modulesStateIn[i-1 -: 8] <= state_byte;
						i<=i-8;				
					end 
					else begin 
						/* loading data finished go to state 2, processing */
						load<=1'd0;
						loadFinish <= 1;
						dataioFSM <= 2; 
					end
				end
				2: begin 
					/* processing data, wait for finish signal */
					if(finish) begin
						/* send ready signal, then go to state three sending output bytes */
						j <= 128;
						ready <= 1;
						dataioFSM <= 3;
						loadFinish <= 0;
					end else begin
						ready <= 0;
						dataioFSM <= 2; 
					end
				end 
				3: begin
					/* state 3 send encrypted data byte by byte .. */
					if ( j > 0) begin
						ready <= 1; 
						state_out_byte <= stateOutput [j-1 -: 8]; 
						j <= j - 8;
					end else begin 
						/* encryption finished, go to state 0 */
						ready <= 0;
						dataioFSM <= 0;
					end 
					loadFinish <= 0;
				end 
			endcase
		end else dataioFSM <= 0; /* end if enable */
	end 

    // 2nd FSM (encryptionCycleFSM) for running the encryption 10 cycles (provide inputs and enable signals to the modules )  
    // state 0 : wait for the load finish signal to come then run the 1st AddroundKey key 0 
    // state 1 : run shift rows 
    // state 2 : run mix columns 
    // state 3 : run AddRoundKey for the rest of the steps

    // I store a counter of the key number calculated in keyNum register
    // When it reaches 11, then we finished all the steps
    // produce the output
	parameter ADDKEY = 3'd0, SHIFT = 3'd1, MIX = 3'd2, DONE = 3'd3;

    initial begin 
		keyNum <= 1;
		encState <= 0;
		stateOutput <= 0;
		finish <= 0;
	end
	always @(posedge clk) begin 
		if (reset) begin 
			keyNum <= 1;
			encState <= ADDKEY;
			stateOutput <= 0;
			finish <= 0;
		end	else if( (enable == 1 ) && (loadFinish == 1)) begin 
			case (encState)
				ADDKEY: begin 
					/* round 0 AddroundKey only .. */
					modulesStateIn <= roundKeyStateOut;
					encState <= SHIFT;
					if(keyNum == 11) begin
						finish <= 1;
						stateOutput <= roundKeyStateOut;
						encState <= DONE;
					end
				end 
				SHIFT: begin 
					/* round 1 shiftrows */
					modulesStateIn <= shiftRowsStateOut;
					modulesKeyIn <= keyExpansionOut;
					if (keyNum < 10) begin
						encState <= MIX; // if we reached the last cycle don't mix columns
					end else begin 
						keyNum <= keyNum + 1;
						encState <= ADDKEY; // go to addRoundKey directly 
					end
				end 
				MIX: begin
					/* round 1 MixColumns */
					keyNum <= keyNum + 1;
					modulesStateIn <= mixColumnsStateOut;
					encState <= ADDKEY;
				end 
				DONE: begin 
				end 
			endcase 		
		end else begin
			keyNum <= 1;
			encState <= 0;
			finish <= 0;
		end
	end 
endmodule

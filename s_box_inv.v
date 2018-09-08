module s_box_inv(input [7:0] i,output reg [7:0] g);

/* s_box_inverse */
  always @ ( i )
    case (i)
     8'h63 : g= 8'h00;
	   8'h01 : g= 8'h01;
	   8'h77 : g= 8'h02;
	   8'h7b : g= 8'h03;
	   8'hf2 : g= 8'h04;
	   8'h6b : g= 8'h05;
	   8'h6f : g= 8'h06;
	   8'hc5 : g= 8'h07;
	   8'h30 : g= 8'h08;
	   8'h01 : g= 8'h09;
	   8'h67 : g= 8'h0a;
	   8'h2b : g= 8'h0b;
	   8'hfe : g= 8'h0c;
	   8'hd7 : g= 8'h0d;
	   8'hab : g= 8'h0e;
	   8'h76 : g= 8'h0f;
	   8'hca : g= 8'h10;
	   8'h82 : g= 8'h11;
	   8'hc9 : g= 8'h12;
	   8'h7d : g= 8'h13;
	   8'hfa : g= 8'h14;
	   8'h59 : g= 8'h15;
	   8'h47 : g= 8'h16;
	   8'hf0 : g= 8'h17;
	   8'had : g= 8'h18;
	   8'hd4 : g= 8'h19;
	   8'ha2 : g= 8'h1a;
	   8'haf : g= 8'h1b;
	   8'h9c : g= 8'h1c;
	   8'ha4 : g= 8'h1d;
	   8'h72 : g= 8'h1e;
	   8'hc0 : g= 8'h1f;
	   8'hb7 : g= 8'h20;
	   8'hfd : g= 8'h21;
	   8'h93 : g= 8'h22;
	   8'h26 : g= 8'h23;
	   8'h36 : g= 8'h24;
	   8'h3f : g= 8'h25;
	   8'hf7 : g= 8'h26;
	   8'hcc : g= 8'h27;
	   8'h34 : g= 8'h28;
	   8'ha5 : g= 8'h29;
	   8'he5 : g= 8'h2a;
	   8'hf1 : g= 8'h2b;
	   8'h71 : g= 8'h2c;
	   8'hd8 : g= 8'h2d;
	   8'h31 : g= 8'h2e;
	   8'h15 : g= 8'h2f;
	   8'h04 : g= 8'h30;
	   8'hc7 : g= 8'h31;
	   8'h23 : g= 8'h32;
	   8'hc3 : g= 8'h33;
	   8'h18 : g= 8'h34;
	   8'h96 : g= 8'h35;
	   8'h05 : g= 8'h36;
	   8'h9a : g= 8'h37;
	   8'h07 : g= 8'h38;
	   8'h12 : g= 8'h39;
	   8'h80 : g= 8'h3a;
	   8'he2 : g= 8'h3b;
	   8'heb : g= 8'h3c;
	   8'h27 : g= 8'h3d;
	   8'hb2 : g= 8'h3e;
	   8'h75 : g= 8'h3f;
	   8'h09 : g= 8'h40;
	   8'h83 : g= 8'h41;
	   8'h2c : g= 8'h42;
	   8'h1a : g= 8'h43;
	   8'h1b : g= 8'h44;
	   8'h6e : g= 8'h45;
	   8'h5a : g= 8'h46;
	   8'ha0 : g= 8'h47;
	   8'h52 : g= 8'h48;
	   8'h3b : g= 8'h49;
	   8'hd6 : g= 8'h4a; 
	   8'hb3 : g= 8'h4b;
	   8'h29 : g= 8'h4c;
	   8'he3 : g= 8'h4d;
	   8'h2f : g= 8'h4e;
	   8'h84 : g= 8'h4f;
	   8'h53 : g= 8'h50;
	   8'hd1 : g= 8'h51;
	   8'h00 : g= 8'h52;
	   8'hed : g= 8'h53;
	   8'h20 : g= 8'h54;
	   8'hfc : g= 8'h55;
	   8'hb1 : g= 8'h56;
	   8'h5b : g= 8'h57;
	   8'h6a : g= 8'h58;
	   8'hcb : g= 8'h59;
	   8'hbe : g= 8'h5a;
	   8'h39 : g= 8'h5b;
	   8'h4a : g= 8'h5c;
	   8'h4c : g= 8'h5d;
	   8'h58 : g= 8'h5e;
	   8'hcf : g= 8'h5f;
	   8'hd0 : g= 8'h60;
	   8'hef : g= 8'h61;
	   8'haa : g= 8'h62;
	   8'hfb : g= 8'h63;
	   8'h43 : g= 8'h64;
	   8'h4d : g= 8'h65;
	   8'h33 : g= 8'h66;
	   8'h85 : g= 8'h67;
	   8'h45 : g= 8'h68;
	   8'hf9 : g= 8'h69;
	   8'h02 : g= 8'h6a;
	   8'h7f : g= 8'h6b;
	   8'h50 : g= 8'h6c;
	   8'h3c : g= 8'h6d;
	   8'h9f : g= 8'h6e;
	   8'ha8 : g= 8'h6f;
	   8'h51 : g= 8'h70;
	   8'ha3 : g= 8'h71;
	   8'h40 : g= 8'h72;
	   8'h8f : g= 8'h73;
	   8'h92 : g= 8'h74;
	   8'h9d : g= 8'h75;
	   8'h38 : g= 8'h76;
	   8'hf5 : g= 8'h77;
	   8'hbc : g= 8'h78;
	   8'hb6 : g= 8'h79;
	   8'hda : g= 8'h7a;
	   8'h21 : g= 8'h7b;
	   8'h10 : g= 8'h7c;
	   8'hff : g= 8'h7d;
	   8'hf3 : g= 8'h7e;
	   8'hd2 : g= 8'h7f;
	   8'hcd : g= 8'h80;
	   8'h0c : g= 8'h81;
	   8'h13 : g= 8'h82;
	   8'hec : g= 8'h83;
	   8'h5f : g= 8'h84;
	   8'h97 : g= 8'h85;
	   8'h44 : g= 8'h86;
	   8'h17 : g= 8'h87;
	   8'hc4 : g= 8'h88;
	   8'ha7 : g= 8'h89;
	   8'h7e : g= 8'h8a;
	   8'h3d : g= 8'h8b;
	   8'h64 : g= 8'h8c;
	   8'h5d : g= 8'h8d;
	   8'h19 : g= 8'h8e;
	   8'h73 : g= 8'h8f;
	   8'h60 : g= 8'h90;
	   8'h81 : g= 8'h91;
	   8'h4f : g= 8'h92;
	   8'hdc : g= 8'h93;
	   8'h22 : g= 8'h94;
	   8'h2a : g= 8'h95;
	   8'h90 : g= 8'h96;
	   8'h88 : g= 8'h97;
	   8'h46 : g= 8'h98;
	   8'hee : g= 8'h99;
	   8'hb8 : g= 8'h9a;
	   8'h14 : g= 8'h9b;
	   8'hde : g= 8'h9c;
	   8'h5e : g= 8'h9d;
	   8'h0b : g= 8'h9e;
	   8'hdb : g= 8'h9f;
	   8'he0 : g= 8'ha0;
	   8'h32 : g= 8'ha1;
	   8'h3a : g= 8'ha2;
	   8'h0a : g= 8'ha3;
	   8'h49 : g= 8'ha4;
	   8'h06 : g= 8'ha5;
	   8'h24 : g= 8'ha6;
	   8'h5c : g= 8'ha7;
	   8'hc2 : g= 8'ha8;
	   8'hd3 : g= 8'ha9;
	   8'hac : g= 8'haa;
	   8'h62 : g= 8'hab;
	   8'h91 : g= 8'hac;
	   8'h95 : g= 8'had;
	   8'he4 : g= 8'hae;
	   8'h79 : g= 8'haf;
	   8'he7 : g= 8'hb0;
	   8'hc8 : g= 8'hb1;
	   8'h37 : g= 8'hb2;
	   8'h6d : g= 8'hb3;
	   8'h8d : g= 8'hb4;
	   8'hd5 : g= 8'hb5;
	   8'h4e : g= 8'hb6;
	   8'ha9 : g= 8'hb7;
	   8'h6c : g= 8'hb8;
	   8'h56 : g= 8'hb9;
	   8'hf4 : g= 8'hba;
	   8'hea : g= 8'hbb;
	   8'h65 : g= 8'hbc;
	   8'h7a : g= 8'hbd;
	   8'hae : g= 8'hbe;
	   8'h08 : g= 8'hbf;
	   8'hba : g= 8'hc0;
	   8'h78 : g= 8'hc1;
	   8'h25 : g= 8'hc2;
	   8'h2e : g= 8'hc3;
	   8'h1c : g= 8'hc4;
	   8'ha6 : g= 8'hc5;
	   8'hb4 : g= 8'hc6;
	   8'hc6 : g= 8'hc7;
	   8'he8 : g= 8'hc8;
	   8'hdd : g= 8'hc9;
	   8'h74 : g= 8'hca;
	   8'h1f : g= 8'hcb;
	   8'h4b : g= 8'hcc;
	   8'hbd : g= 8'hcd;
	   8'h8b : g= 8'hce;
	   8'h8a : g= 8'hcf;
	   8'h70 : g= 8'hd0;
	   8'h3e : g= 8'hd1;
	   8'hb5 : g= 8'hd2;
	   8'h66 : g= 8'hd3;
	   8'h48 : g= 8'hd4;
	   8'h03 : g= 8'hd5;
	   8'hf6 : g= 8'hd6;
	   8'h0e : g= 8'hd7;
	   8'h61 : g= 8'hd8;
	   8'h35 : g= 8'hd9;
	   8'h57 : g= 8'hda;
	   8'hb9 : g= 8'hdb;
	   8'h86 : g= 8'hdc;
	   8'hc1 : g= 8'hdd;
	   8'h1d : g= 8'hde;
	   8'h9e : g= 8'hdf;
	   8'he1 : g= 8'he0;
	   8'hf8 : g= 8'he1;
	   8'h98 : g= 8'he2;
	   8'h11 : g= 8'he3;
	   8'h69 : g= 8'he4;
	   8'hd9 : g= 8'he5;
	   8'h8e : g= 8'he6;
	   8'h94 : g= 8'he7;
	   8'h9b : g= 8'he8;
	   8'h1e : g= 8'he9;
	   8'h87 : g= 8'hea;
	   8'he9 : g= 8'heb;
	   8'hce : g= 8'hec;
	   8'h55 : g= 8'hed;
	   8'h28 : g= 8'hee;
	   8'hdf : g= 8'hef;
	   8'h8c : g= 8'hf0;
	   8'ha1 : g= 8'hf1;
	   8'h89 : g= 8'hf2;
	   8'h0d : g= 8'hf3;
	   8'hbf : g= 8'hf4;
	   8'he6 : g= 8'hf5;
	   8'h42 : g= 8'hf6;
	   8'h68 : g= 8'hf7;
	   8'h41 : g= 8'hf8;
	   8'h99 : g= 8'hf9;
	   8'h2d : g= 8'hfa;
	   8'h0f : g= 8'hfb;
	   8'hb0 : g= 8'hfc;
	   8'h54 : g= 8'hfd;
	   8'hbb : g= 8'hfe;
	   8'h16 : g= 8'hff;
	endcase
endmodule

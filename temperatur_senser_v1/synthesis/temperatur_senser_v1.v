// temperatur_senser_v1.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module temperatur_senser_v1 (
		input  wire       clk,        //        clk.clk
		input  wire       clr,        //        clr.reset
		output wire       tsdcaldone, // tsdcaldone.tsdcaldone
		output wire [7:0] tsdcalo     //    tsdcalo.tsdcalo
	);

	temperatur_senser_v1_temp_sense_0 temp_sense_0 (
		.clk        (clk),        //        clk.clk
		.tsdcalo    (tsdcalo),    //    tsdcalo.tsdcalo
		.tsdcaldone (tsdcaldone), // tsdcaldone.tsdcaldone
		.clr        (clr)         //        clr.reset
	);

endmodule

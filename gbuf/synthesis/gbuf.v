// gbuf.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module gbuf (
		input  wire  inclk,  //  altclkctrl_input.inclk
		output wire  outclk  // altclkctrl_output.outclk
	);

	gbuf_altclkctrl_0 altclkctrl_0 (
		.inclk  (inclk),  //  altclkctrl_input.inclk
		.outclk (outclk)  // altclkctrl_output.outclk
	);

endmodule
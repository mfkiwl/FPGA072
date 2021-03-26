// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

// DATE "06/06/2020 21:12:29"

// 
// Device: Altera 5AGXMA7G4F31C4 Package FBGA896
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module gbuf (
	inclk,
	outclk)/* synthesis synthesis_greybox=0 */;
input 	inclk;
output 	outclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \altclkctrl_0|gbuf_altclkctrl_0_sub_component|wire_sd1_outclk ;
wire \inclk~input_o ;


gbuf_gbuf_altclkctrl_0 altclkctrl_0(
	.outclk(\altclkctrl_0|gbuf_altclkctrl_0_sub_component|wire_sd1_outclk ),
	.inclk(\inclk~input_o ));

assign \inclk~input_o  = inclk;

assign outclk = \altclkctrl_0|gbuf_altclkctrl_0_sub_component|wire_sd1_outclk ;

endmodule

module gbuf_gbuf_altclkctrl_0 (
	outclk,
	inclk)/* synthesis synthesis_greybox=0 */;
output 	outclk;
input 	inclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



gbuf_gbuf_altclkctrl_0_sub gbuf_altclkctrl_0_sub_component(
	.outclk(outclk),
	.inclk({gnd,gnd,gnd,inclk}));

endmodule

module gbuf_gbuf_altclkctrl_0_sub (
	outclk,
	inclk)/* synthesis synthesis_greybox=0 */;
output 	outclk;
input 	[3:0] inclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



arriav_clkena sd1(
	.inclk(inclk[0]),
	.ena(vcc),
	.outclk(outclk),
	.enaout());
defparam sd1.clock_type = "auto";
defparam sd1.disable_mode = "low";
defparam sd1.ena_register_mode = "always enabled";
defparam sd1.ena_register_power_up = "high";
defparam sd1.test_syn = "high";

endmodule

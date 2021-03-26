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

// DATE "08/24/2020 14:29:07"

// 
// Device: Altera 5AGXMA7G4F31C4 Package FBGA896
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module temperatur_senser_v1 (
	clk,
	clr,
	tsdcaldone,
	tsdcalo)/* synthesis synthesis_greybox=0 */;
input 	clk;
input 	clr;
output 	tsdcaldone;
output 	[7:0] tsdcalo;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \temp_sense_0|wire_sd1_tsdcaldone ;
wire \temp_sense_0|wire_sd1_tsdcalo[0] ;
wire \temp_sense_0|wire_sd1_tsdcalo[1] ;
wire \temp_sense_0|wire_sd1_tsdcalo[2] ;
wire \temp_sense_0|wire_sd1_tsdcalo[3] ;
wire \temp_sense_0|wire_sd1_tsdcalo[4] ;
wire \temp_sense_0|wire_sd1_tsdcalo[5] ;
wire \temp_sense_0|wire_sd1_tsdcalo[6] ;
wire \temp_sense_0|wire_sd1_tsdcalo[7] ;
wire \clk~input_o ;
wire \clr~input_o ;


temperatur_senser_v1_temperatur_senser_v1_temp_sense_0 temp_sense_0(
	.tsdcaldone(\temp_sense_0|wire_sd1_tsdcaldone ),
	.tsdcalo({\temp_sense_0|wire_sd1_tsdcalo[7] ,\temp_sense_0|wire_sd1_tsdcalo[6] ,\temp_sense_0|wire_sd1_tsdcalo[5] ,\temp_sense_0|wire_sd1_tsdcalo[4] ,\temp_sense_0|wire_sd1_tsdcalo[3] ,\temp_sense_0|wire_sd1_tsdcalo[2] ,\temp_sense_0|wire_sd1_tsdcalo[1] ,
\temp_sense_0|wire_sd1_tsdcalo[0] }),
	.clk(\clk~input_o ),
	.clr(\clr~input_o ));

assign \clk~input_o  = clk;

assign \clr~input_o  = clr;

assign tsdcaldone = \temp_sense_0|wire_sd1_tsdcaldone ;

assign tsdcalo[0] = \temp_sense_0|wire_sd1_tsdcalo[0] ;

assign tsdcalo[1] = \temp_sense_0|wire_sd1_tsdcalo[1] ;

assign tsdcalo[2] = \temp_sense_0|wire_sd1_tsdcalo[2] ;

assign tsdcalo[3] = \temp_sense_0|wire_sd1_tsdcalo[3] ;

assign tsdcalo[4] = \temp_sense_0|wire_sd1_tsdcalo[4] ;

assign tsdcalo[5] = \temp_sense_0|wire_sd1_tsdcalo[5] ;

assign tsdcalo[6] = \temp_sense_0|wire_sd1_tsdcalo[6] ;

assign tsdcalo[7] = \temp_sense_0|wire_sd1_tsdcalo[7] ;

endmodule

module temperatur_senser_v1_temperatur_senser_v1_temp_sense_0 (
	tsdcaldone,
	tsdcalo,
	clk,
	clr)/* synthesis synthesis_greybox=0 */;
output 	tsdcaldone;
output 	[7:0] tsdcalo;
input 	clk;
input 	clr;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;


wire [7:0] sd1_TSDCALO_bus;

assign tsdcalo[0] = sd1_TSDCALO_bus[0];
assign tsdcalo[1] = sd1_TSDCALO_bus[1];
assign tsdcalo[2] = sd1_TSDCALO_bus[2];
assign tsdcalo[3] = sd1_TSDCALO_bus[3];
assign tsdcalo[4] = sd1_TSDCALO_bus[4];
assign tsdcalo[5] = sd1_TSDCALO_bus[5];
assign tsdcalo[6] = sd1_TSDCALO_bus[6];
assign tsdcalo[7] = sd1_TSDCALO_bus[7];

arriav_tsdblock sd1(
	.clk(clk),
	.ce(vcc),
	.clr(clr),
	.tsdcaldone(tsdcaldone),
	.tsdcalo(sd1_TSDCALO_bus));
defparam sd1.clock_divider_enable = "true";
defparam sd1.clock_divider_value = 80;
defparam sd1.poi_cal_temperature = 85;
defparam sd1.sim_tsdcalo = 0;
defparam sd1.tsdblock_mode = "corner_sense";
defparam sd1.use_dft_compout = "false";

endmodule

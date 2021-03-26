// megafunction wizard: %FIR II v18.1%
// GENERATION: XML
// fir_v2.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module fir_v2 (
		input  wire        clk,              //                     clk.clk
		input  wire        reset_n,          //                     rst.reset_n
		input  wire [23:0] ast_sink_data,    //   avalon_streaming_sink.data
		input  wire        ast_sink_valid,   //                        .valid
		input  wire [1:0]  ast_sink_error,   //                        .error
		output wire [15:0] ast_source_data,  // avalon_streaming_source.data
		output wire        ast_source_valid, //                        .valid
		output wire [1:0]  ast_source_error  //                        .error
	);

	fir_v2_0002 fir_v2_inst (
		.clk              (clk),              //                     clk.clk
		.reset_n          (reset_n),          //                     rst.reset_n
		.ast_sink_data    (ast_sink_data),    //   avalon_streaming_sink.data
		.ast_sink_valid   (ast_sink_valid),   //                        .valid
		.ast_sink_error   (ast_sink_error),   //                        .error
		.ast_source_data  (ast_source_data),  // avalon_streaming_source.data
		.ast_source_valid (ast_source_valid), //                        .valid
		.ast_source_error (ast_source_error)  //                        .error
	);

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2020 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_fir_compiler_ii" version="18.1" >
// Retrieval info: 	<generic name="filterType" value="single" />
// Retrieval info: 	<generic name="interpFactor" value="1" />
// Retrieval info: 	<generic name="decimFactor" value="1" />
// Retrieval info: 	<generic name="symmetryMode" value="sym" />
// Retrieval info: 	<generic name="L_bandsFilter" value="1" />
// Retrieval info: 	<generic name="inputChannelNum" value="1" />
// Retrieval info: 	<generic name="clockRate" value="240" />
// Retrieval info: 	<generic name="clockSlack" value="0" />
// Retrieval info: 	<generic name="inputRate" value="24" />
// Retrieval info: 	<generic name="coeffReload" value="false" />
// Retrieval info: 	<generic name="baseAddress" value="0" />
// Retrieval info: 	<generic name="readWriteMode" value="read_write" />
// Retrieval info: 	<generic name="backPressure" value="false" />
// Retrieval info: 	<generic name="deviceFamily" value="Arria V" />
// Retrieval info: 	<generic name="speedGrade" value="medium" />
// Retrieval info: 	<generic name="delayRAMBlockThreshold" value="20" />
// Retrieval info: 	<generic name="dualMemDistRAMThreshold" value="1280" />
// Retrieval info: 	<generic name="mRAMThreshold" value="1000000" />
// Retrieval info: 	<generic name="hardMultiplierThreshold" value="-1" />
// Retrieval info: 	<generic name="reconfigurable" value="false" />
// Retrieval info: 	<generic name="num_modes" value="2" />
// Retrieval info: 	<generic name="reconfigurable_list" value="0" />
// Retrieval info: 	<generic name="MODE_STRING" value="None Set" />
// Retrieval info: 	<generic name="channelModes" value="0,1,2,3" />
// Retrieval info: 	<generic name="inputType" value="int" />
// Retrieval info: 	<generic name="inputBitWidth" value="24" />
// Retrieval info: 	<generic name="inputFracBitWidth" value="0" />
// Retrieval info: 	<generic name="coeffSetRealValue" value="581.0,3865.0,4854.0,2097.0,-2404.0,-2858.0,1464.0,3961.0,43.0,-4765.0,-2282.0,4700.0,4966.0,-3333.0,-7514.0,494.0,9182.0,3642.0,-9189.0,-8488.0,6937.0,13085.0,-2196.0,-16221.0,-4715.0,16679.0,12872.0,-13501.0,-20772.0,6314.0,26552.0,4455.0,-28305.0,-17446.0,24520.0,30454.0,-14497.0,-40687.0,-1281.0,45256.0,20989.0,-41754.0,-41515.0,28895.0,58840.0,-7028.0,-68661.0,-21560.0,67227.0,52705.0,-52212.0,-80792.0,23496.0,99573.0,16337.0,-103303.0,-61984.0,87930.0,105864.0,-52247.0,-139131.0,-1296.0,153117.0,66348.0,-140980.0,-133051.0,99352.0,189173.0,-29619.0,-221846.0,-61368.0,219741.0,161445.0,-175329.0,-254147.0,86931.0,320628.0,39863.0,-342200.0,-191610.0,303233.0,347458.0,-193954.0,-480499.0,12813.0,559794.0,231943.0,-552379.0,-521483.0,424183.0,825886.0,-137564.0,-1101720.0,-360099.0,1279377.0,1174607.0,-1198303.0,-2600486.0,175234.0,5598328.0,8388607.0,5598328.0,175234.0,-2600486.0,-1198303.0,1174607.0,1279377.0,-360099.0,-1101720.0,-137564.0,825886.0,424183.0,-521483.0,-552379.0,231943.0,559794.0,12813.0,-480499.0,-193954.0,347458.0,303233.0,-191610.0,-342200.0,39863.0,320628.0,86931.0,-254147.0,-175329.0,161445.0,219741.0,-61368.0,-221846.0,-29619.0,189173.0,99352.0,-133051.0,-140980.0,66348.0,153117.0,-1296.0,-139131.0,-52247.0,105864.0,87930.0,-61984.0,-103303.0,16337.0,99573.0,23496.0,-80792.0,-52212.0,52705.0,67227.0,-21560.0,-68661.0,-7028.0,58840.0,28895.0,-41515.0,-41754.0,20989.0,45256.0,-1281.0,-40687.0,-14497.0,30454.0,24520.0,-17446.0,-28305.0,4455.0,26552.0,6314.0,-20772.0,-13501.0,12872.0,16679.0,-4715.0,-16221.0,-2196.0,13085.0,6937.0,-8488.0,-9189.0,3642.0,9182.0,494.0,-7514.0,-3333.0,4966.0,4700.0,-2282.0,-4765.0,43.0,3961.0,1464.0,-2858.0,-2404.0,2097.0,4854.0,3865.0,581.0" />
// Retrieval info: 	<generic name="coeffSetRealValueImag" value="0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.0530093, -0.04498, 0.0, 0.0749693, 0.159034, 0.224907, 0.249809, 0.224907, 0.159034, 0.0749693, 0.0, -0.04498, -0.0530093, -0.0321283, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0" />
// Retrieval info: 	<generic name="coeffScaling" value="auto" />
// Retrieval info: 	<generic name="coeffType" value="int" />
// Retrieval info: 	<generic name="coeffBitWidth" value="24" />
// Retrieval info: 	<generic name="coeffFracBitWidth" value="0" />
// Retrieval info: 	<generic name="coeffComplex" value="false" />
// Retrieval info: 	<generic name="karatsuba" value="false" />
// Retrieval info: 	<generic name="outType" value="int" />
// Retrieval info: 	<generic name="outMSBRound" value="trunc" />
// Retrieval info: 	<generic name="outMsbBitRem" value="10" />
// Retrieval info: 	<generic name="outLSBRound" value="trunc" />
// Retrieval info: 	<generic name="outLsbBitRem" value="30" />
// Retrieval info: 	<generic name="bankCount" value="1" />
// Retrieval info: 	<generic name="bankDisplay" value="0" />
// Retrieval info: </instance>
// IPFS_FILES : fir_v2.vo
// RELATED_FILES: fir_v2.v, dspba_library_package.vhd, dspba_library.vhd, auk_dspip_math_pkg_hpfir.vhd, auk_dspip_lib_pkg_hpfir.vhd, auk_dspip_avalon_streaming_controller_hpfir.vhd, auk_dspip_avalon_streaming_sink_hpfir.vhd, auk_dspip_avalon_streaming_source_hpfir.vhd, auk_dspip_roundsat_hpfir.vhd, altera_avalon_sc_fifo.v, fir_v2_0002_rtl_core.vhd, fir_v2_0002_ast.vhd, fir_v2_0002.vhd

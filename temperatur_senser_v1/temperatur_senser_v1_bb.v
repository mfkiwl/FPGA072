
module temperatur_senser_v1 (
	clk,
	tsdcalo,
	tsdcaldone,
	clr);	

	input		clk;
	output	[7:0]	tsdcalo;
	output		tsdcaldone;
	input		clr;
endmodule

module test_UDP (
	input clk,    // Clock
	input clk_en, // Clock Enable
	input rst_n,  // Asynchronous reset active low

	output [31:0] out_dat,
	output  valid	
);

parameter freq=71582788;

logic signed [15:0] dat_i=0;
logic signed [15:0] dat_q=0;

logic signed [15:0] d_i=0;
logic signed [15:0] d_q=0;

logic [15:0] accum=0;
logic [15:0] sch =0;
logic [15:0] sch2=0;
logic reg_val  =0;
logic reg_valid=0;

/*
always_ff @(posedge clk) 
begin 
	if(~rst_n) 
	begin
	accum<= 0;
	sch	 <= 0;
	end else 
	if(clk_en) 
	begin
	if (sch<19)	 
		begin	
			sch<=sch+1;
			reg_val<=0;
		end
	else 
		begin
		accum<=accum+1;
		  sch<=0;
		dat_i<=accum;
		dat_q<=accum;  
	  reg_val<=1;	
		end
	end
end
*/
test_dds u0 (
		.clk       (clk),       // clk.clk
		.reset_n   (rst_n),   // rst.reset_n
		.clken     (clk_en),     //  in.clken
		.phi_inc_i (freq), //    .phi_inc_i
		.fsin_o    (dat_i),    // out.fsin_o
		.fcos_o    (dat_q),    //    .fcos_o
		.out_valid (reg_val)  //    .out_valid
	);


always_ff @(posedge clk) 
begin 
	d_i      <=dat_i>>>4;
	d_q      <=dat_q>>>4;
//	d_i      <=dat_i;
//	d_q      <=dat_q;
	reg_valid<=reg_val;
end

assign out_dat={d_i,d_q};
assign valid  =reg_valid;
endmodule
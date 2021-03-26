//-----------------------------------------------------------------------------
//
// Title       : tst_writer
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\tst_writer.v
// Generated   : Wed Apr 17 15:09:29 2019
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {tst_writer}}
module test_wr ( 
	clk ,
	start ,
	wr_req,
	 );

output wr_req;
input start;
input clk;

parameter BURST=1; //1024
parameter TIME =10;//125000

reg [24:0] reg_adr=0;
reg [15:0] N_sch=0;
reg [31:0] sch=0;
reg [ 2:0] frn=0;
reg wr_reg=0;

always @(posedge clk) frn<={frn[2:1],start}; 

always @(posedge clk)
begin
	
if (frn==3'b001) begin N_sch<=0; end
else 
	begin

	if (N_sch<BURST) 
	begin

		if (sch < TIME   )    sch<=sch+1;	else sch<=0;
		if (sch==(TIME-2)) 
		begin 
		wr_reg<=1;
		end
			else if (sch==(TIME-1)) 
			begin 
			wr_reg<=0;
			N_sch <=N_sch+1;
			end
	end	
	end

end
assign wr_req = wr_reg;
endmodule

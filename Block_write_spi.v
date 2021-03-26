//-----------------------------------------------------------------------------
//
// Title       : Block_upr_att
// Design      : mur1
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : Block_upr_att.v
// Generated   : Mon Jan 22 11:49:35 2018
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
//{module {Block_upr_spi1}}
module Block_write_spi ( clk,sclk,mosi,miso,cs ,rst ,out);	

parameter Nbit=8;	
parameter param_adr=1; 

output [Nbit-1:0] out ;
wire   [Nbit-1:0] out ;

output  miso;

input clk ;
wire clk ;	 
input sclk ;
wire sclk ;
input mosi ;
wire mosi ;
input cs ;
wire cs ;
input rst ;
wire rst ;	

reg start=0;
reg [Nbit-1:0] data_out=0; 
reg [Nbit-1:0] data_in=0; 
reg [4:0] front_clk_spi=0;	
reg [4:0] front_cs_spi=0;	 
reg [3:0] flag=0;   
reg [7:0] sch;	   
reg r_w = 0;//регистр чтение-запись
reg [Nbit:0] reg_out=0;

always @(posedge clk) front_clk_spi<={front_clk_spi[3:0],sclk};
always @(posedge clk) front_cs_spi <={front_cs_spi [3:0],  cs};

always @(posedge clk)
begin 
if (rst)
	begin sch<=0; data_out<=32'hffffffff; flag<=0; r_w<=0;end
	else 
		if (front_cs_spi[3:1]==3'b110)	 begin sch<=0; flag<=0; start<=1;end
		else
			if (start==1) 
				begin
					if (flag==0)		//пришёл первый адресный байт посылки	
					begin  		
						if (front_clk_spi[3:1]==3'b011) 
						begin
						data_in<={data_in[Nbit-2:0],mosi};
						sch<=sch+1;
						end	
					    else if (sch==8)  
							begin 
							sch<=0;
							if (data_in[6:0]==param_adr) begin flag<=1;end//проверка адресата
							else start<=0;
							r_w <=data_in[7]; 
							end 		
					end
					else  
						if (flag==1)
							begin
								if (r_w==1)	//запись
								begin  		
									if (front_clk_spi[3:1]==3'b011) 
									begin
									data_in<={data_in[Nbit-2:0],mosi};
									sch<=sch+1;
									end	 
									if (sch==Nbit)  begin data_out<=data_in; start<=0; end//	 		
								end 
							end
				end	
end
assign 	   out  =  data_out[Nbit-1:0];	
assign 	   miso =  (flag==0)?1'h1:reg_out[Nbit];
	
endmodule



 
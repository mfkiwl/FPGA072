//-----------------------------------------------------------------------------
//
// Title       : udp_sender
// Design      : list
// Author      : Microsoft
// Company     : Microsoft
//
//-----------------------------------------------------------------------------
//
// File        : d:\My_Designs\project\list\src\udp_sender.v
// Generated   : Tue Feb  5 15:49:38 2019
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
//{module {udp_sender}}
module mk_to_udp_sender_v2 ( en,tx_uflow ,tx_septy ,tx_mod ,tx_err ,
					tx_crc_fwd ,tx_wren ,tx_rdy ,tx_eop ,
					tx_sop ,tx_data,clk ,mem_data,mem_adr_rd,
					mem_length,crc_data,END_TX);

 
output END_TX ;
wire END_TX ;

input  [31:0] crc_data;					
input  [31:0] mem_data;
output [10:0] mem_adr_rd;
input  [15:0] mem_length;
output [1:0] tx_mod ;
wire [1:0] tx_mod ;	//Indicates invalid bytes in the final frame word
output tx_err ;
wire tx_err ;
output tx_crc_fwd ;
wire tx_crc_fwd ;
output tx_wren ;
wire tx_wren ;
output tx_eop ;
wire tx_eop ;
output tx_sop ;
wire tx_sop ;
output [31:0] tx_data ;
wire [31:0] tx_data ;

input en ;
wire en ;
input tx_uflow ;
wire tx_uflow ;
input tx_septy ;
wire tx_septy ;
input tx_rdy ;
wire tx_rdy ;
input clk ;
wire clk ;

reg [15:0] step=1000;
reg [31:0] data_reg=0;

reg [1:0]  tx_mod_reg=0;
reg  tx_sop_reg=0;
reg  tx_eop_reg=0;
reg  tx_wren_reg=0;	
reg [15:0] sch=0;
reg [15:0] z_length=0; 

reg END_TX_reg=0;
reg   [ 1:0] mod_reg=0;


assign tx_sop=tx_sop_reg;
assign tx_eop=tx_eop_reg;
assign tx_wren=tx_wren_reg;
assign tx_data=data_reg;
assign tx_mod=tx_mod_reg; 

assign mem_adr_rd=sch;	
assign END_TX = END_TX_reg;

always @(posedge clk)	
	if (en) 
		begin
		step<=0;	
		sch<=0;
		z_length<=mem_length;
		mod_reg <=(~mem_length[1:0])+1'b1;//формирую остаток от числа скачиваемых байт для мас-а
		END_TX_reg<=0;
		tx_mod_reg	 <=0; 
		end
	else
if (tx_rdy)
	begin	
		if (step==0)
			begin
			tx_mod_reg<=0; 
			z_length  <=z_length>>2;	//переводим 
			step      <=1;
			sch       <=1;
			end	else
		if (step==1)
			begin
			step      <=2;
			sch       <=2;
			end	else		
		if (step==2)
			begin
			tx_wren_reg<=1;			//write enable	
			tx_sop_reg<=1;			//start of packet	
			data_reg<=mem_data;
			step<=3;		
			sch<=3;
			end	else 
		if (step==3)
			begin
			tx_sop_reg<=0;//start of packet	
			data_reg<=mem_data;
			step<=4;
			sch<=4;
			if (mod_reg!=0) z_length<=z_length+1;
			end	else 
		if (step==4) //Data transfer 
			begin			
			if (sch<(z_length+2)) 
				begin
		        if (sch>1) 
		        	begin
		        	data_reg     <=mem_data;
		        	if (sch<(z_length+1))  tx_mod_reg	 <=0; 
		        					 else  
		        					 begin
		        					 tx_mod_reg<=mod_reg;//выставляем Transmit data modulo. Indicates invalid bytes in the final frameword:
		        					 tx_eop_reg<=1'b1;	//end of packet	
		        					 step<=5;//
		        					 end
		        	end
				sch<=sch+1; 
				end
			end	else
		if (step==5)
			begin
			tx_wren_reg<=0;//write desable
			tx_eop_reg<=1'b0;
			step<=6;
			END_TX_reg<=1;
			end else
		if (step==6)
			begin
			step<=7;
			END_TX_reg<=0;
			end 			
	 end 
	 else
		 begin
		 tx_wren_reg<=0;//write desable
		 tx_eop_reg<=1'b0;
		 step<=0;
		 END_TX_reg<=0;
		 end
	 
endmodule





















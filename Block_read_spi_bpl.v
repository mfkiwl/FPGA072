
//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {Block_upr_spi1}}
module Block_read_spi_bpl ( adr,clk,sclk,mosi,miso,cs ,rst ,inport,oe_drv );	

parameter Nbit=8;	

input  [Nbit-1:0] inport ;
wire   [Nbit-1:0] inport ;

output  miso;

input [6:0] adr;
wire  [6:0] adr;
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

output oe_drv ;
wire oe_drv ;

reg [Nbit-1:0] data_port=0; 
reg [Nbit-1:0] data_in=0; 
reg [3:0] front_clk_spi=0;	 
reg [3:0] front_cs_spi=0;	 
reg [3:0] flag=0;   
reg [7:0] sch;	 
reg reg_o=0;
reg r_w = 0;//
reg [Nbit:0] reg_out=0;

always @(posedge clk) front_clk_spi<={front_clk_spi[2:0],sclk};
always @(posedge clk) front_cs_spi <={front_cs_spi[2:0] ,cs};
always @(negedge clk)
begin	
	if (flag==0) reg_o<=1; else reg_o<=reg_out[Nbit];	
end
	
always @(posedge clk)
begin 
if (rst)
	begin sch<=0;flag<=0;reg_out<=0;r_w<=0; end
	else 
		if (front_cs_spi[2:1]==2'b10)	 begin sch<=0; flag<=0; reg_out<=inport;end
		else
		if (front_cs_spi[2:1]==2'b01)	 begin         flag<=0;end
		else
			if (cs==0) 
				begin
					if (flag==0)		//
					begin  		
						if (front_clk_spi[2:1]==2'b01) 
						begin
						data_in<={data_in[Nbit-2:0],mosi};
						sch<=sch+1;
						end	
					    else if (sch==8)  
							begin 
							sch<=0;
							if (data_in[6:0]==adr[6:0]) begin flag<=1; reg_out<=reg_out<<1;  end
							r_w <=data_in[7]; 
							end 		
					end
					else  
						if (flag==1)
							begin
								if (r_w==0) //
									begin
										if (front_clk_spi[2:1]==2'b01) 
										begin
										reg_out<=reg_out<<1;
										sch<=sch+1;
										end
											else if ((sch==Nbit)&&(front_clk_spi[2:1]==2'b01)) begin  sch<=0;/* flag<=0;*/  end
									end
							end
				end	
end

  assign 	   miso   = reg_o;	
//assign 	   miso =1'h1;	
  assign 	   oe_drv = flag;
endmodule  
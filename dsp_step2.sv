module dsp_step2 (
	input T1sec,            //секундная метка
	input clk,    			// Clock  48 MHz
	input clk_en, 			// Clock Enable
	input rst_n,  			// Asynchronous reset active low
	input [31:0] DATA,		//входные IQ данные
	input     data_en,		//valid входных данных
	input [31:0] real_TIME, //вход сэмплов реального времени (младшие 32 бита)
   output [31:0] dat_IQ,
   output [31:0] dat_TIME,
   output 		 valid,
   output [15:0] Numb_inter,//порядковый номер интервала после секундной метки
   output        CLR_TIME	
);

logic [31:0] reg_data;
logic [31:0] reg_time;
logic 		 reg_valid;
logic [7:0]  sch=0;
logic [2:0]  enable=0;
logic clr_reg=0;
logic [3:0] frnt=0;
logic [31:0] sch_inter=0;

always_ff @(posedge clk) frnt  <={frnt  [2:0],T1sec}; //CDC
always_ff @(posedge clk) enable<={enable[1:0],clk_en}; //CDC

always_ff @(posedge clk)
if (frnt==3'b011) sch_inter<='1;//сбрасываем счётчик
else
if (enable==3'b011) sch_inter<=sch_inter+1;


always_ff @(posedge clk) 
begin
	if(~rst_n) begin
	reg_valid<= 0;
	reg_data <= 0;
	reg_time <= 0;
	sch 	 <=0;
	end else 
	if(enable[2]) 
	begin
	clr_reg<=0;
//	if (sch!=19) //это тестовая децимация на 20 !!!!
//		begin
//		sch<=sch+1; 
//		reg_valid<= 0;
//		end else
		if(data_en) 
		begin
			begin
			sch      <= 0;
			reg_data <= DATA;
	 	 	reg_time <= real_TIME;
	 	 	reg_valid<= 1;	
			end	 	 
		end else reg_valid<= 0;
	end 
	else
	  begin
	     reg_valid<= 0;
	     clr_reg  <= 1;
	  end
end

assign Numb_inter=sch_inter[15:0];
assign valid   =reg_valid;
assign dat_IQ  =reg_data;
assign dat_TIME=reg_time; 
assign CLR_TIME=clr_reg;
endmodule
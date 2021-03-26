module temp_sense 
(
input wire clk48,
input wire clk125,
input wire clr,
output [7:0] data
);

reg [7:0] temp_clr=0;
reg [7:0]       a0=0;
reg [7:0]       a1=0;
reg      data_good=0;
reg         clr_48=0;

wire wtemp_sense_done;
wire [7:0] wtemp_data;

always @(posedge clk125)
begin
    temp_clr<={temp_clr[6:0],clr}; //ловим сигнал из домена 125 МГц 
if (temp_clr!=0) clr_48<=1; else clr_48<=0;
if (data_good) a1<=a0;
end

always @(posedge clk48)
if (wtemp_sense_done)
begin
  a0<=wtemp_data;
			data_good<=1;
end else data_good<=0;

assign data=a1;


temperatur_senser_v1 
t0 ( 
		.clk        (clk48),            // clk.clk
		.tsdcalo    (wtemp_data),    	// tsdcalo.tsdcalo
		.tsdcaldone (wtemp_sense_done), // tsdcaldone.tsdcaldone
		.clr        (clr_48)            // clr.reset
	);
	

endmodule
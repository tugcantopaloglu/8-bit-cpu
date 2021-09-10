`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:50:34
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu();
//clk'larý 8 bit cpuya atýyor (tb inputlarý dosyadan okunuyor)
reg clk,clk2;

eight_bit_cpu cpu(.clk(clk),.clk2(clk2));

initial
	begin
		clk<=0;
		clk2<=0;
		#700
		$finish;
	end
always 
	begin
		#5 clk = ~clk;
		#30 clk2 = ~clk2;
	end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:43:12
// Design Name: 
// Module Name: imem
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


module imem ( 
			input [7:0] addr, 
			output [15:0] inst); 
//memory bilgilerini al�yoruz kodu ��z�lecek olan 16 bitlik bir de�er verir (her sat�r bir de�er)
reg [15:0] RAM [255:0]; 
initial $readmemb ("memfile.dat",RAM,0,2); 
assign inst = RAM[addr];
endmodule
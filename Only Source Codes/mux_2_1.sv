`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:36:08
// Design Name: 
// Module Name: mux_2_1
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


module mux_2_1 (
    input [7:0] Data_in_0,
    input [7:0] Data_in_1,
    input sel,
    output reg [7:0] Data_out
    ); 
    //reg [7:0] Data_out;

    always @(Data_in_0,Data_in_1,sel)
    begin
        if(sel == 0) 
            Data_out = Data_in_0; 
        else
            Data_out = Data_in_1;
    end
    
endmodule

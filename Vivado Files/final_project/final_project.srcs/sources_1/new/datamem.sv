`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:45:24
// Design Name: 
// Module Name: datamem
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


module datamem (
				input [7:0] read_addr,
				input [7:0] write_addr,
				input [7:0] write_data,
				input mem_write,
				input mem_read,
				input clk, 
				output reg [7:0] read_data
				);

reg [7:0] register [255:0];
//herhangi bir d�ng�de adress bus taraf�ndan verilen adresle ya okuyoruz ya da ona yaz�yoruz bir okuma/y�kleme veya kay�t 
//talimat� olmas� durumunda adres immediate veya ALU'nun ��kt�s�d�r DMEM'in veri ��k��� her zaman rd taraf�ndan se�ilen
//kay�t dosyas�na gider
always@(posedge clk) 
begin
	if(mem_write) register[write_addr] = write_data;
	if(mem_read) read_data = register[read_addr];
end
endmodule 

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:42:16
// Design Name: 
// Module Name: reg_file
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


module regfile (
				input clk,
				input [2:0] reg_write_addr,
				input [7:0] reg_write_data,
				input reg_write_en,
				input [2:0] reg1_read_addr,
				input [2:0] reg2_read_addr, 
				output [7:0] reg1_read_data, 
				output [7:0] reg2_read_data);

reg [7:0] reg_array [7:0];
//register dosyas� i�lemleri
//her biri 8 bitlik bir de�er depolayan 8'li reg. insturction tan�mlar�nda oldu�u gibi de�erleri instruction
//kelimesine g�re se�ilen 2 ��k�� de�eri ra ve rb vard�r. kay�tlardan birine verilerin yaz�labilece�i bir ba�lant� noktas� vard�r 
//ancak de�erin g�ncellenip g�ncellenmeyece�ini kontrol etmek i�in bir clk sinyali kullan�yoruz.
integer i,f;

initial 
begin
  for(i=0;i<8;i=i+1) //register listesini 0'lar ile dolduruyoruz
   reg_array[i] <= 8'd0;
end

always@(posedge clk)  //her clk'ta yaz�lacak bir �ey varsa array'a yaz�yoruz
begin
	if(reg_write_en) begin reg_array[reg_write_addr] = reg_write_data;
	end
end

initial
 begin
 #700
  f = $fopen("result.dat");

  $fdisplay(f,"time = %d\n", $time, //zaman� yaz�d�r�p register file'daki i�erikleir her bir sat�ra s�ra s�ra yazd�r�yoruz
  "\treg[0] = %b\n", reg_array[0],   
  "\treg[1] = %b\n", reg_array[1],
  "\treg[2] = %b\n", reg_array[2],
  "\treg[3] = %b\n", reg_array[3],
  "\treg[4] = %b\n", reg_array[4],
  "\treg[5] = %b\n", reg_array[5],
  "\treg[6] = %b\n", reg_array[6],
  "\treg[7] = %b\n", reg_array[7]);
  
  $fclose(f);
 end


assign  reg1_read_data = reg_array[reg1_read_addr];
assign  reg2_read_data = reg_array[reg2_read_addr];
endmodule

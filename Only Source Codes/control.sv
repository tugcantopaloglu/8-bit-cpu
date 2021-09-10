`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2021 19:45:09
// Design Name: 
// Module Name: control
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


module control (
				input [3:0] opcode,
				input [2:0] func,
				output reg reg_dst,
				output reg reg_write,
				output reg alusrc,
				output reg [3:0]alufn,
				output reg mem_write, 
				output reg mem_read,
				output reg mem_to_reg,
				output reg nia);
//decoder ile ay�rd���m�z bitleri burada instruction set'e g�re i�lemlere sokup de�erleri belirliyoruz
always @(*) 
begin
	if (opcode == 4'b0000) 
	begin
		if (func == 4'b000) 
		begin
		alufn		= 4'b0000; //alu function'nu se�iyor yani hangi i�lemin yap�laca��
		alusrc		= 1'b0; //bu i�lem hemen mi yap�lacak yoksa kay�t m� edilecek
		mem_to_reg 	= 1'b1; //kay�t dosyas�na yaz�lan veriler bellekten mi yoksa ALU'nun ��kt�s�ndan m� geliyor onun de�eri 1 ise bellekten 0 ise alu ��kt�s�
		reg_dst		= 1'b1; //kayd�n nas�l belirlendi�ini belirler -ra veya rb-
		reg_write	= 1'b1; //kay�t yaz�l�p yaz�lmayaca�� 
		mem_read	= 1'b0; //bellekten okuma var m�
		mem_write	= 1'b0; //mevcut i�lem belle�e yaz�lacak m� onun de�eri
		nia			= 1'b1; //jump m� de�il mi j addr yap�s� sadece son 0010 instructionunda 0 7 bitten 8 bite jump ��nk� address*2 yap�yor
		end
		if (func == 3'b010) 
		begin
		alufn		= 4'b0001;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;
		end
		if (func == 3'b100) 
		begin
		alufn		= 4'b0010;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;
		end
		if (func == 3'b101) 
		begin
		alufn		= 4'b0011;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;
		end
	end
	else if (opcode==4'b0100)
		begin
		alufn		= 4'b0100;
		alusrc		= 1'b1;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b0;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;	
		end
	else if (opcode==4'b1011)
		begin
		alufn		= 4'b0101;
		alusrc		= 1'b1;
		mem_to_reg 	= 1'b0;
		reg_dst		= 1'b0;
		reg_write	= 1'b1;
		mem_read	= 1'b1;
		mem_write	= 1'b0;
		nia			= 1'b1;	
		end
	else if (opcode==4'b1111)
		begin
		alufn		= 4'b0110;
		alusrc		= 1'b1;
		reg_dst		= 1'b0;
		reg_write	= 1'b0;
		mem_read	= 1'b0;
		mem_write	= 1'b1;
		nia			= 1'b1;	
		end
	else if (opcode==4'b1000)
		begin
		alufn		= 4'b0111;
		alusrc		= 1'b1;
		reg_write	= 1'b0;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;	
		end
	else if (opcode==4'b0010)
		begin
		alusrc		= 1'b1;
		reg_write	= 1'b0;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b0;	
		end
	//�zel instruction atamalar�
	//double add
	else if (opcode==4'b1001)
		begin
		alufn		= 4'b1100;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;	
		end
	//double sub
	else if (opcode==4'b0011)
		begin
		alufn		= 4'b1001;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;		
		end
	//double and
	else if (opcode==4'b1100)
		begin
		alufn		= 4'b1010;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;	;	
		end
	//double or
	else if (opcode==4'b0001)
		begin
		alufn		= 4'b1011;
		alusrc		= 1'b0;
		mem_to_reg 	= 1'b1;
		reg_dst		= 1'b1;
		reg_write	= 1'b1;
		mem_read	= 1'b0;
		mem_write	= 1'b0;
		nia			= 1'b1;	
		end
		
end
endmodule
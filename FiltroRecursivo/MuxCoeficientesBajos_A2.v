`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:52 04/28/2015 
// Design Name: 
// Module Name:    MuxCoeficientesBajos_A2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MuxCoeficientesBajos_A2#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//a2_pasoBajo	bajo	-0,960500	23'b11111111100001010000111
	//a2_pasoBajo	medio	-0,367800	23'b11111111110100001110110
	//a2_pasoBajo	alto	-0,661700	23'b11111111101010110100111
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b1111111100001010000111;
				2'b10: Selector_Coeficiente = 22'b1111111110100001110110;
				2'b11: Selector_Coeficiente = 22'b1111111101010110100111;
			endcase


endmodule

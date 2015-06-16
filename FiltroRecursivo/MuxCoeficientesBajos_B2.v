`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:11 04/28/2015 
// Design Name: 
// Module Name:    MuxCoeficientesBajos_B2 
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
module MuxCoeficientesBajos_B2#(parameter width = 23)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//b2_pasoBajo	bajo	0,000199	23'b00000000000000000000111
	//b2_pasoBajo	medio	0,083160	23'b00000000000010101010010
	//b2_pasoBajo	alto	0,813200	23'b00000000011010000001011
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 23'b00000000000000000000111;
				2'b10: Selector_Coeficiente = 23'b00000000000010101010010;
				2'b11: Selector_Coeficiente = 23'b00000000011010000001011;
			endcase


endmodule

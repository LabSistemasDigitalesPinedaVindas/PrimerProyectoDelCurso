`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:23 04/28/2015 
// Design Name: 
// Module Name:    MuxCoeficientesBajos_B0 
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
module MuxCoeficientesBajos_B0#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//b0_pasoBajo	bajo	0,000199	23'b00000000000000000000011
	//b0_pasoBajo	medio	0,083160	23'b000 0000 0000 0101 0101 0010
	//b0_pasoBajo	alto	0,813200	23'b00000000011010000001011
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b0000000000000000000011;
				2'b10: Selector_Coeficiente = 22'b0000000000010101010010;
				2'b11: Selector_Coeficiente = 22'b0000000011010000001011;
			endcase
endmodule

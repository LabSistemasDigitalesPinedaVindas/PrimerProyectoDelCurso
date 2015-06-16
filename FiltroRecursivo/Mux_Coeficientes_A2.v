`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:23 04/27/2015 
// Design Name: 
// Module Name:    Mux_Coeficientes_A2 
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
module Mux_Coeficientes_A2#(parameter Width = 22)(
	input wire [1:0] sel,
	output reg [Width-1:0] Selector_Coeficiente
    );
//	a2_pasoAlto	bajo	-0,996000	23'b11111111100000001000010
//	a2_pasoAlto	medio	-0,960500	23'b11111111100001010000111
//	a2_pasoAlto	alto	-0,367800	23'b11111111110100001110110
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b1111111100000001000010;
				2'b10: Selector_Coeficiente = 22'b1111111100001010000111;
				2'b11: Selector_Coeficiente = 22'b1111111110100001110110;
			endcase

endmodule

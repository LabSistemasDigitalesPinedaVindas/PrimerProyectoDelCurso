`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:06 04/27/2015 
// Design Name: 
// Module Name:    Mux_Coeficientes_A1 
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
module Mux_Coeficientes_A1#(parameter Width = 22)(
	input wire [1:0] sel,
	output reg [Width-1:0] Selector_Coeficiente
    );
//	a1_pasoAlto	bajo	1,996000	23'b00000000111111110111110
//	a1_pasoAlto	medio	1,960000	23'b00000000111110101110001
//	a1_pasoAlto	alto	1,035000	23'b00000000100001000111101
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b0000000111111110111110;
				2'b10: Selector_Coeficiente = 22'b0000000111110101110001;
				2'b11: Selector_Coeficiente = 22'b0000000100001000111101;
			endcase



endmodule

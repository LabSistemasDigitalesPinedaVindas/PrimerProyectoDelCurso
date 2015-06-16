`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:07 04/27/2015 
// Design Name: 
// Module Name:    Mux_Coeficientes_B1 
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
module Mux_Coeficientes_B1#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//b1_pasoAlto	bajo	-1,996000	23'b11111111000000001000010
  // b1_pasoAlto	medio	-2,000000	23'b11111111000000000000000
 //  b1_pasoAlto	alto	-1,201000	23'b11111111011001100100011
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b1111111000000001000010;
				2'b10: Selector_Coeficiente = 22'b1111111000000000000000;
				2'b11: Selector_Coeficiente = 22'b1111111011001100100011;
			endcase



endmodule

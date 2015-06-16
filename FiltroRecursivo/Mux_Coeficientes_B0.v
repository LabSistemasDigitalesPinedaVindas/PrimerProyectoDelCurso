`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:14 04/27/2015 
// Design Name: 
// Module Name:    Mux_Coeficientes_B0 
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
module Mux_Coeficientes_B0#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//b0_pasoAlto	bajo	0,998000	   23'b00000000011111111011111  
	//b0_pasoAlto	medio	1,000000	   23'b00000000100000000000000
	//b0_pasoAlto	alto	0,600700 	23'b00000000010011001110010
	
	//4000
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b0000000011111111011111;
				2'b10: Selector_Coeficiente = 22'b0000000100000000000000;
				2'b11: Selector_Coeficiente = 22'b0000000010011001110010;
			endcase


endmodule

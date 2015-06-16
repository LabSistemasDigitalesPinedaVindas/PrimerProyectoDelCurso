`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:48 04/28/2015 
// Design Name: 
// Module Name:    MuxCoeficientesBajos_B1 
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
module MuxCoeficientesBajos_B1#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//b1_pasoBajo		0,000398	23'b00000000000000000000111
	//b1_pasoBajo		0,166300	23'b00000000000101010100101
	//b1_pasoBajo		1,626000	23'b00000000110100000010000
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b0000000000000000000111;
				2'b10: Selector_Coeficiente = 22'b0000000000101010100101;
				2'b11: Selector_Coeficiente = 22'b0000000110100000010000;
			endcase

endmodule

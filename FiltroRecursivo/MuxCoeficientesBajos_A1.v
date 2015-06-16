`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:29 04/28/2015 
// Design Name: 
// Module Name:    MuxCoeficientesBajos_A1 
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
module MuxCoeficientesBajos_A1#(parameter width = 22)(
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Coeficiente
    );
	//a1_pasoBajo	bajo	1,960000	23'b00000000111110101110001
	//a1_pasoBajo	medio	1,035000	23'b00000000100001000111101
	//a1_pasoBajo	alto	-1,591000 23'b11111111001101000101101
	
	always @(sel)
			case (sel)
				2'b00: Selector_Coeficiente = 0;
				2'b01: Selector_Coeficiente = 22'b0000000111110101110001;
				2'b10: Selector_Coeficiente = 22'b0000000100001000111101;
				2'b11: Selector_Coeficiente = 22'b1111111001101000101101;
			endcase



endmodule

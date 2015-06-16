`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:46 04/23/2015 
// Design Name: 
// Module Name:    Mux 
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
module Mux#(parameter width = 4)(
	input wire [1:0] sel,
	output reg [width-1:0] coeficiente
    );
	 
	reg [width-1:0] a1b = 2'b0011;
	reg [width-1:0] a1m = 2'b0010;
	reg [width-1:0] a1a = 2'b0001;

	always @(sel, a1b,a1m,a1a)
			case (sel)
				2'b00: coeficiente = 4'b0;
				2'b01: coeficiente = a1a;
				2'b10: coeficiente = a1m;
				2'b11: coeficiente = a1b;
			endcase

endmodule

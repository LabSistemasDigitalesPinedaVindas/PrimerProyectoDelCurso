`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:29 04/27/2015 
// Design Name: 
// Module Name:    Mux_Filtro 
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
module Mux_Filtro #(parameter width = 22)(
	input wire signed [width-1:0] banda_baja,banda_media,banda_alta,
	input wire [1:0] sel,
	output reg [width-1:0] Selector_Banda
    );

	always @(sel,banda_baja,banda_media,banda_alta)
			case (sel)
				2'b00: Selector_Banda = 0;
				2'b01: Selector_Banda = banda_baja;
				2'b10: Selector_Banda = banda_media;
				2'b11: Selector_Banda = banda_alta;
			endcase

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:37 04/19/2015 
// Design Name: 
// Module Name:    Registro_Ecualizador 
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
module Registro_Ecualizador #(parameter width = 4)(
	input clk44kHz,reset, enable,
	input [width-1:0] datoIn, 
	output [width-1:0] datoOut
    );
	 
	 reg [width-1:0] datoActual, datoSig;
	
	always @ (posedge clk44kHz, posedge reset)
	
		if (reset)
			begin
				datoActual <= 0;
				datoSig <= 0;
			end
		else 
			datoActual <= datoSig;
			
	always @*
	
		begin
			datoSig = datoActual;
			if (enable) 
				datoSig = datoIn;
			else
				datoSig = datoActual;
		end	
	assign dataOut = datoActual;			
			
endmodule

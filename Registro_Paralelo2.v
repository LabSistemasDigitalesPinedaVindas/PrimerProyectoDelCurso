`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:03 04/25/2015 
// Design Name: 
// Module Name:    Registro_Paralelo2 
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
module Registro_Paralelo2#(parameter width = 4)(
	input clk44kHz,reset, enable,
	input [width-1:0] datoIn, 
	output [width-1:0] datoOut
    );
	 
	 reg [width-1:0] datoActual, datoSig;
	
	always @ (posedge clk44kHz, posedge reset)
	
		if (reset)
			
				datoActual <= 0;
				//datoSig <= 0;
			
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
	assign datoOut = datoActual;	
	
endmodule

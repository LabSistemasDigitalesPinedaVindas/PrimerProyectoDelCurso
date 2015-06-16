`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:05 04/27/2015 
// Design Name: 
// Module Name:    Registro_Filtro 
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
module Registro_Filtro#(parameter Width = 25)(
	input clk44kHz,reset, enable,
	input wire  [Width-1:0] datoIn, 
	output wire [Width-1:0] datoOut
    );
	 
	 reg [Width-1:0] datoActual, datoSig;
	
	always @ (posedge clk44kHz, posedge reset)
	
		if (reset)
			datoActual <= 0;
		
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

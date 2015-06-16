`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:32 04/23/2015 
// Design Name: 
// Module Name:    Control_Frecuencia_Suma 
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
module Control_Frecuencia_Suma
	(input clk100MHz, reset,inicio,
	output clk_out,listo,
	output [1:0] Contador
    );
	
	 wire clk150kHz;
	 
	 Frecuencia150kHz Divisor_Frec (clk100MHz,reset,clk150kHz);
	 Control Muxes (clk150kHz,reset,inicio,Contador,listo);
	 
	 assign clk_out = clk150kHz;
	
endmodule

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
module Control_Frecuencia_Suma#(parameter width = 4)
	(input clk100MHz, reset,inicio,
	input [width-1:0] entradaSuma,
	output clk_out,listo,
	output [width-1:0] Resultado,
	output [width-1:0] Salida1,Salida2,Salida3
    );
	
	 wire clk150kHz;
	 wire [1:0] contador;
	 wire [width-1:0] dout;
	 wire [width-1:0] sumaRes;
	 
	 Frecuencia150kHz Divisor_Frec (clk100MHz,reset,clk150kHz);
	 Control Muxes (clk150kHz,reset,inicio,contador,listo);
	 Mux muxCoeficientes (contador,dout);
	 Sumador1 suma (dout,entradaSuma,sumaRes);
	 Deco_Reg Decodificador_Registros(clk150kHz,reset,contador, sumaRes,sumaRes,sumaRes,Salida1,Salida2,Salida3);
	 
	 assign clk_out = clk150kHz;
	 assign Resultado = sumaRes;
	
endmodule

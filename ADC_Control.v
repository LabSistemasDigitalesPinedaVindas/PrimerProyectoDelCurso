`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:11:09 04/24/2015 
// Design Name: 
// Module Name:    ADC_Control 
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
module ADC_Control #(parameter width=4)(
	input clk100MHz, reset,dato_SerieADC,inicioADC,
	output clk44kHz,clk150kHz,listoControl,
	output [width-1:0] Resultado, Salida1,Salida2,Salida3
    );

	wire listoDato_Paralelo,clkbajo,clkmedio;
	wire [width-1:0] datoADC_paralelo;
	
	
	ADC_Instanciado ADC (clk100MHz,reset,dato_SerieADC,inicioADC,datoADC_paralelo,listoDato_Paralelo,clkbajo);
	Control_Frecuencia_Suma Control (clk100MHz, reset,listoDato_Paralelo,datoADC_paralelo,clk150kHz,listoControl,Resultado,Salida1,Salida2,Salida3);

	assign clk44kHz = clkbajo;
	
endmodule



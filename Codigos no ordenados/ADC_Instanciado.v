`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:13 04/23/2015 
// Design Name: 
// Module Name:    ADC_Instanciado 
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
module ADC_Instanciado#(parameter width = 4)

	(input clk100MHz, reset,datoADC,inicio,
	//output [width-1:0] data_out,
	output  [width-1:0] dato_sin_basura,
	output listo,clk44kHz,CS
    );
	 
	wire clk;//done;
	//wire [width-1:0] datoEntra_Registro;
	
	Frecuencia Freq44kHz (clk100MHz,reset,clk);
	ADC Modulo_Recepcion (clk,reset,datoADC,inicio, dato_sin_basura,CS,listo);
	
	
	
	assign clk44kHz = clk;
	//assign listo = done;

endmodule

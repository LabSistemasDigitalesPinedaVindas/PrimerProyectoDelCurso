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
module ADC_Instanciado #(Width = 22)
	(
	input clk100MHz, reset, datoADC, inicio,
	//output  [15:0] dato_con_basura,
	output listo, 
	output wire signed [Width-1:0] dato23bits,
	output CS, clk
	
   );
	 
	//wire clk;
	wire [11:0] dato_sin_basura;
	
	//wire [11:0] datoSalida;
	//done;
	//wire [width-1:0] datoEntra_Registro;
	
	Frecuencia Freq44kHz (clk100MHz, reset, clk);
	ADC Modulo_Recepcion (clk, reset, datoADC, inicio, dato_sin_basura,CS, listo);
	Concatenacion #(Width) ConcatenarADC (dato_sin_basura, dato23bits);
		

	//assign listo = done;

endmodule

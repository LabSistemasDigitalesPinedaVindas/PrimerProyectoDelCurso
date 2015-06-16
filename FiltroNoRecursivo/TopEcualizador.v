`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:16 04/30/2015 
// Design Name: 
// Module Name:    TopEcualizador 
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
module TopEcualizador#(parameter Width = 22, Presicion = 14, Magnitud = Width-Presicion-1)
		(
		input wire clock, reset, datoADCSerie, inicio,							//senales de control
		input wire [1:0] seleccion,													//senales de control
		output wire SalidaDelDAC, clk44kADC, clk44kDAC, CS, CS_DAC   	
		);
		wire [Width-1:0] ykbajos, ykmedios, ykaltos;								//salidas de los filtros
		wire signed [Width-1:0] uk, yk, uk_Offset, yk_Offset;					//variables intermedias
		wire signed [11:0] datoSinBasura;											//variables intermedias
		wire  enable;																		//senales de control	
		
		
		
/// nombre viejo #(parametros) nombre nuevo (entradas); 

TopDeFiltros #(Width, Presicion, Magnitud) Top_Filtros(clock, reset, enable, uk, ykbajos, ykmedios, ykaltos);
	
Suma #(Width) SumaInicial(uk_Offset, 22'h7FE000, uk);

Suma #(Width) SumaFinal (yk, 22'h6000, yk_Offset);

ADC_Instanciado #(Width) ADCInstanciado(clock, reset, datoADCSerie, inicio , enable, uk_Offset, CS, clk44kADC);

DAC44K DAC_Listo(clock, reset, yk_Offset[Presicion-1:2], SalidaDelDAC, CS_DAC, clk44kDAC);

//Frecuencia ClockRegistros (clock, reset, clk44kADC);

MuxSalidas #(Width) Mux_Salidas(seleccion, uk, ykbajos, ykmedios, ykaltos, yk);

endmodule

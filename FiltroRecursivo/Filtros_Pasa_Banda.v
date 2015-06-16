`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:21 04/28/2015 
// Design Name: 
// Module Name:    Filtros_Pasa_Banda 
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
module Filtros_Pasa_Banda #(parameter  Width = 22, Presicion = 14, Magnitud = Width-Presicion-1)(

	input wire clk150kHz,reset,enable1,enable2,enable3,
	input wire [1:0] Sel_Muxes,
	input wire signed [Width-1:0] uk,
	output wire signed [Width-1:0] yk);
	
	wire signed [Width-1:0] Conexion_Filtros;
	
	Filtro_Paso_Alto #(Width, Presicion, Magnitud) FiltroPasoAlto (clk150kHz,reset,enable1,enable2,enable3,Sel_Muxes,uk,Conexion_Filtros);
	Filtro_Paso_Bajos #(Width, Presicion, Magnitud) FiltroPasoBajo  (clk150kHz,reset,enable1,enable2,enable3,Sel_Muxes, Conexion_Filtros,yk);
	

endmodule

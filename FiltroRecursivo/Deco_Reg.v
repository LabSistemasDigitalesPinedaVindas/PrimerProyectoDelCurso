`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:12 04/25/2015 
// Design Name: 
// Module Name:    Deco_Reg 
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
module Deco_Reg #(parameter width=25)(
	input wire clk,reset,
	input wire [1:0] Entrada_Contador,// Contador del control de muxes
	input wire [width-1:0] Entrada, //Banda baja,media,alta
	output [width-1:0] Salida1,Salida2,Salida3,
	output [2:0] Entradas_regsFiltros // Se necesitan como salidas para que entren al filtro
    );
	 
	 wire [2:0] salidaDeco;
	 
	 Deco_Registro Decodificador (clk,reset,Entrada_Contador,salidaDeco);
	 Registro_Paralelo Reg1 (clk,reset,salidaDeco[2],Entrada,Salida1);
	 Registro_Paralelo Reg2 (clk,reset,salidaDeco[1],Entrada,Salida2);
	 Registro_Paralelo Reg3 (clk,reset,salidaDeco[0],Entrada,Salida3);
	 
	 assign Entradas_regsFiltros = salidaDeco;
	

endmodule

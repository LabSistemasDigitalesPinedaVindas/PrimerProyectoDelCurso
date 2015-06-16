`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:28 04/26/2015 
// Design Name: 
// Module Name:    TopDeFiltros 
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
module TopDeFiltros#(parameter Width = 22, Presicion = 14, Magnitud = Width-Presicion-1)
		(
		input wire clock, reset,enable,   	//senales de control
		input wire signed [Width-1:0] uk, 				//entrada del filtro
		output wire signed [Width-1:0] ykbajos, ykmedios, ykaltos
	  // output wire signed [Width-1:0] yk //salida del filtro
		);
		
	wire signed [Width-1:0] ConexionDeBajos, ConexionDeMedios, ConexionDeAltos;
	//wire signed [Width-1:0] ykbajos, ykmedios, ykaltos, sumaAux;
		
////Instanciacion de filtro con las multiplicaciones(5), registros(2) y sumas(4)

/// nombre viejo #(parametros) nombre nuevo (entradas); 
//Filtro de bajos.
Filtro #(Width, Presicion, Magnitud)
		FPAlto20Hz  (22'h3FDF, 22'h7F8042, 22'h3FDF, 22'h7FBE, 22'h7FC042, clock, reset, enable, uk, ConexionDeBajos);
Filtro #(Width, Presicion, Magnitud) 
		FPBajo200Hz (22'h3, 22'h7, 22'h3, 22'h7D71, 22'h7FC287, clock, reset, enable, ConexionDeBajos, ykbajos);

//Filtro de medios.
Filtro #(Width, Presicion, Magnitud) 
		FPAlto200Hz (22'h4000, 22'h7F8000, 22'h4000, 22'h7D71, 22'h7FC287, clock, reset, enable, uk, ConexionDeMedios);
Filtro #(Width, Presicion, Magnitud) 
		FPBajo5kHz  (22'h552, 22'hAA5, 22'h552, 22'h423D, 22'h7FE876, clock, reset, enable, ConexionDeMedios, ykmedios);

//Filtro de altos.
Filtro #(Width, Presicion, Magnitud)  
		FPAlto5kHz  (22'h2672, 22'h7FB323, 22'h2672, 22'h423D, 22'h7FE876, clock, reset, enable, uk, ConexionDeAltos);
Filtro #(Width, Presicion, Magnitud)
		FPBajo20kHz (22'h340B, 22'h6810, 22'h340B, 22'h7F9A2D, 22'h7FD5A7, clock, reset, enable, ConexionDeAltos, ykaltos);

endmodule

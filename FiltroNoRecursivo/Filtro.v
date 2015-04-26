`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:57 04/22/2015 
// Design Name: 
// Module Name:    Filtro 
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
module Filtro #(parameter Width = 25, Presicion = 16, Magnitud = Width-Presicion-1,
			
			b0= 25'b0000000001111111101111100, //Coeficiente de filtro paso alto de 20 Hz
			b1= 25'b1111111100000000100000111, //Coeficiente de filtro paso alto de 20 Hz
			b2= 25'b0000000001111111101111100, //Coeficiente de filtro paso alto de 20 Hz
			a1= 25'b1111111100000000100000111, //Coeficiente de filtro paso alto de 20 Hz
			a2= 25'b0000000001111111011111001  //Coeficiente de filtro paso alto de 20 Hz
			)
		(
		input wire clock44k, reset,enable,   //senales de control
		input wire signed [Width-1:0] uk, //entrada del filtro
	   output wire signed [Width-1:0] yk //salida del filtro
		);
		
		wire signed [Width-1:0] fk, fk_b0, fk_b1, fk_b2, fk_a1, fk_a2;   //Conexiones internas del filtro       
		wire signed [Width-1:0] fk_RegSuperiorOUT, fk_RegInferiorOUT;    //Conexiones internas del filtro
		wire signed [Width-1:0] Y_suma2, Y_suma3;                        //Conexiones internas del filtro

////Instanciacion de filtro con las sumas(4), multiplicaciones(5) y registros(2).

/// nombre viejo nombre nuevo (entradas, salidas); 

//Multiplicaciones del filtro.

Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionA1 (-a1, fk_RegSuperiorOUT, fk_a1);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionA2 (-a2, fk_RegInferiorOUT, fk_a2);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB0 (b0, fk, fk_b0);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB1 (b1, fk_RegSuperiorOUT, fk_b1);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB2 (b2, fk_RegInferiorOUT, fk_b2);

//Sumas del filtro.
Suma  #(Width) Suma_1 (uk, Y_suma2, fk);
Suma  #(Width) Suma_2 (fk_a1, fk_a2, Y_suma2);
Suma  #(Width) Suma_3 (fk_b1, fk_b2, Y_suma3);
Suma  #(Width) Suma_4 (fk_b0, Y_suma3, yk);

//Registro Superior e Inferior de los filtros.

Registro  #(Width) RegistroSuperior (clock44k, reset, enable, fk, fk_RegSuperiorOUT);
Registro  #(Width) RegistroInferior (clock44k, reset, enable, fk_RegSuperiorOUT, fk_RegInferiorOUT);

endmodule

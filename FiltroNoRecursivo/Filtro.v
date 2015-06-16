`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:43:46 05/04/2015 
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
module Filtro#(parameter Width = 23, Presicion = 14, Magnitud = Width-Presicion-1)
		(
		input wire signed [Width-1:0] b0, b1, b2, a1, a2,
		input wire clock, reset,enable,   //senales de control
		input wire signed [Width-1:0] uk, //entrada del filtro
	   output wire signed [Width-1:0] yk //salida del filtro
		);
		
		wire signed [Width-1:0] fk, fk_b0, fk_b1, fk_b2, fk_a1, fk_a2;   //Conexiones internas del filtro 
		wire signed [Width-1:0] R1,R2,R3,R4,R5,R6,R7,R8, R9;					  //Conexiones internas del filtro 
		wire signed [Width-1:0] fk_RegSuperiorOUT, fk_RegInferiorOUT;    //Conexiones internas del filtro
		wire signed [Width-1:0] Y_suma2, Y_suma3;                        //Conexiones internas del filtro

////Instanciacion de filtro con las sumas(4), multiplicaciones(5) y registros(10).

/// nombre viejo nombre nuevo (entradas, salidas); 

//Multiplicaciones del filtro.
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB0 (b0, R8, fk_b0);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB1 (b1, fk_RegSuperiorOUT, fk_b1);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionB2 (b2, fk_RegInferiorOUT, fk_b2);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionA1 (a1, fk_RegSuperiorOUT, fk_a1);
Multiplicador  #(Width, Presicion, Magnitud) MultiplicacionA2 (a2, fk_RegInferiorOUT, fk_a2);

//Sumas del filtro.
Suma  #(Width) Suma_1 (uk, R6, fk);
Suma  #(Width) Suma_2 (R4, R9, Y_suma2);
Suma  #(Width) Suma_3 (R2, R3, Y_suma3);
Suma  #(Width) Suma_4 (R1, R7, yk);


//Registro Superior e Inferior de los filtros.
Registro  #(Width) RegistroSuperior (clock, reset, enable, R8, fk_RegSuperiorOUT);
Registro  #(Width) RegistroInferior (clock, reset, enable, fk_RegSuperiorOUT, fk_RegInferiorOUT);

//Registros Pipeline
RegistroPipeline #(Width) RegPipelineB0 (clock,reset, fk_b0, R1);
RegistroPipeline #(Width) RegPipelineB1 (clock,reset, fk_b1, R2);
RegistroPipeline #(Width) RegPipelineB2 (clock,reset, fk_b2, R3);
RegistroPipeline #(Width) RegPipelineA1 (clock,reset, fk_a1, R4);
RegistroPipeline #(Width) RegPipelineA2 (clock,reset, fk_a2, R5);
RegistroPipeline #(Width) RegPipelineA2_2 (clock,reset, R5, R9);
RegistroPipeline #(Width) RegPipelineSuma1 (clock,reset, fk, R8);
RegistroPipeline #(Width) RegPipelineSuma2 (clock,reset, Y_suma2, R6);
RegistroPipeline #(Width) RegPipelineSuma3 (clock,reset, Y_suma3, R7);

endmodule

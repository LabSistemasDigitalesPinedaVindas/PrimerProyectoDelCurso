`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:57 04/11/2015 
// Design Name: 
// Module Name:    Multiplicador 
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
module Multiplicador #(parameter Width = 16, Signo = 1, Magnitud = 3, Presicion = 12)// Parametros por senal
							(A, B, Y);					   //Entradas y salida
							
		input signed [Width-1:0] A,B;			//Definir entradas
		output reg signed [Width-1:0] Y; 	//Define salidas						
		wire Aux [2*Width-1:0]; 				//Variable auxiliar para realizar calculos	
		//Aux = A*B; REVISAR									//Operación de multiplicación
		
		always 
			begin 
				if (~A[Width-1] & ~B[Width-1] & Aux[2*Width-1-Signo-Magnitud]) //Verificación de overflow & underflow
					
					Y = 2**((Width-1)-1); 
				
	//			else if 
	//			//agregar más condiciones 
	//			else if 
	//			//agregar más condiciones 
	//			else if 
	//			//agregar más condiciones 
	//			else if 
	//			//agregar más condiciones 
	//			
				else 
					Y = Aux[2*Width - 1 - Signo - Magnitud:Presicion];
			end
endmodule

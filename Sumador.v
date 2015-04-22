`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:39 04/13/2015 
// Design Name: 
// Module Name:    Sumador 
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
module Sumador#(parameter Width = 25, Signo = 1, Magnitud = 8, Presicion = 16)// Parametros por senal
							(A, B, Y);					   //Entradas y salida
		 
		input [Width-1:0] A,B;			//Definir entradas
		output reg [Width-1:0] Y; 	//Define salidas						
		reg signed [Width-1:0] Aux; 			//Variable auxiliar para realizar calculos
		reg signed [Width-1:0] maximo;
		reg signed [Width-1:0] minimo;
		
		
		
		//assign Aux = A+B; 						//Operación de suma
		
		always @*
			begin
			Aux = A+B;
			maximo = (2**(Width-1))-1;
			minimo = (2**(Width-1))+1;
			end
			
		always @*
			begin
			 	if (~A[Width-1] && ~B[Width-1] && Aux[Width-1])     //Verificación de overflow 
				begin	
					//Y= 4'b1111;
					//Y = (2**(Width-1))-1;
					Y = maximo;
				 end
			
				else if (A[Width-1] && B[Width-1] && ~Aux[Width-1]) //Verificación de overflow 
					begin 
					//Y=4'b1111;
					//Y=(2**(Width-1))+1;
					Y = minimo;
				 end 
						
				else
				begin
				Y = Aux;
				end
			end
endmodule

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
module Sumador#(parameter Width = 4, Signo = 1, Magnitud = 1, Presicion = 2)// Parametros por senal
							(A, B, Y, N);					   //Entradas y salida
		 
		input [Width-1:0] A,B;			//Definir entradas
		output reg [Width-1:0] Y; 	//Define salidas						
		reg signed [Width-1:0] Aux; 			//Variable auxiliar para realizar calculos
		output reg N;
		//assign Aux = A+B; 						//Operación de suma
		
		always @*
			Aux = A+B;
			
		always @*
			begin
			 	if (~A[Width-1] && ~B[Width-1] && Aux[Width-1])     //Verificación de overflow 
				begin	
					//Y= 4'b1111;
					Y = (2**(Width-1))-1;
					N = 0; end
			
				else if (A[Width-1] && B[Width-1] && ~Aux[Width-1]) //Verificación de overflow 
					begin 
					//Y=4'b1111;
					Y=(2**(Width-1))+1;
					N = 1; end 
						
				else 
				Y = Aux;
				N=2;
				
			end
endmodule

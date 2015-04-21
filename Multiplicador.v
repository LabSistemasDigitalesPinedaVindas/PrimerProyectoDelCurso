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
module Multiplicador #(parameter Width = 7, Presicion = 0, Magnitud = Width - Presicion - 1)// Parametros por senal
							(A,B,Y);					   //Entradas y salida
			
		input signed [Width-1:0] A,B;								                     //Definir entradas
		output reg signed [Width-1:0] Y; 						                     //Define salidas	
		reg signed [Width-1:0] minimo;							                     //Coeficiente minimo para la salida
		reg signed [Width-1:0] maximo;							                     //Coeficiente minimo para la salida
		reg signed [2*Width-1:0] Auxiliar, Auxiliar_Multiplicacion; 				//Variable auxiliar para realizar calculos	
		reg signed [Width-1:0] Auxiliar_A, Auxiliar_B;									//Variable auxiliar para revisar el signo.
		
		
	always @*//Realiza la multiplicacion y convierte A en positivo
		begin
		Auxiliar = A*B;
			if (A[Width-1])//Si A fuese negativo se pasa a positivo
				Auxiliar_A = -A;
			else
				Auxiliar_A = A;
		end
		
	always @*
		begin
			if (B[Width-1])//Si B fuese negativo se pasa a positivo
				Auxiliar_B = -B;
			else			
				Auxiliar_B = B;
		end

	always @*
		begin 
		Auxiliar_Multiplicacion = Auxiliar_A[Width-2:0]*Auxiliar_B[Width-2:0];//Obtiene la multiplicacion de los positivos
		//Del auxiliar de la multiplicación se obtiene 2 magnitudes y la fraccion para que sea comparable con el maximo que tiene una magnitud y un decimal
		if (Auxiliar_Multiplicacion[2*Magnitud + 2*Presicion - 1 : Presicion] > maximo)//Si se diera el caso de overflow
			begin
			if ( (A[Width-1] == 1 && B[Width-1] == 1) || (A[Width-1] == 0 && B[Width-1] == 0) )// Resultado positivo con overflow es el maximo
				Y = maximo;
			else
				Y = minimo;
			end
		else //Resultado negativo con overflow es un minimo
			Y = Auxiliar[2*Width-2-Magnitud:Presicion];//Se trunca el resultado para ser representable
		end	

endmodule
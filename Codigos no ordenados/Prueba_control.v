`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:24:08 04/23/2015
// Design Name:   Control_Frecuencia_Suma
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Acumulador/Prueba_control.v
// Project Name:  Acumulador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Frecuencia_Suma
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba_control;

	// Inputs
	reg clk100MHz;
	reg reset;
	reg inicio;
	reg [3:0] entradaSuma;

	// Outputs
	wire clk_out;
	wire listo;
	wire [3:0] Resultado;

	// Instantiate the Unit Under Test (UUT)
	Control_Frecuencia_Suma uut (
		.clk100MHz(clk100MHz), 
		.reset(reset), 
		.inicio(inicio), 
		.entradaSuma(entradaSuma), 
		.clk_out(clk_out), 
		.Resultado(Resultado),
		.listo(listo)
	);

	initial forever
	#10 clk100MHz = ~clk100MHz;
	
	initial begin
		// Initialize Inputs
		clk100MHz = 0;
		reset = 0;
		inicio = 0;
		
		#1000
		reset = 1;
		
		#1000
		reset = 0;
		
		inicio = 0;
		#1000
		inicio=1;
		entradaSuma= 4'b0101;
		
		repeat(5) @(posedge clk_out);
				
		inicio = 0;
		
		repeat (5) @(posedge clk_out);
		inicio=1;
		
		end
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:46:51 04/24/2015
// Design Name:   ADC_Control
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Acumulador/Prueba_Control_ADC.v
// Project Name:  Acumulador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Prueba_Control_ADC;

	// Inputs
	reg clk100MHz;
	reg reset;
	reg dato_SerieADC;
	reg inicioADC;

	// Outputs
	wire clk44kHz;
	wire clk150kHz;
	wire listoControl;
	wire [3:0] Resultado;
	wire [3:0] Salida1;
	wire [3:0] Salida2;
	wire [3:0] Salida3;

	// Instantiate the Unit Under Test (UUT)
	ADC_Control uut (
		.clk100MHz(clk100MHz), 
		.reset(reset), 
		.dato_SerieADC(dato_SerieADC), 
		.inicioADC(inicioADC), 
		.clk44kHz(clk44kHz), 
		.clk150kHz(clk150kHz), 
		.listoControl(listoControl), 
		.Resultado(Resultado),
		.Salida1(Salida1),
		.Salida2(Salida2),
		.Salida3(Salida3)
	);

	initial forever 
	
	#10 clk100MHz = ~clk100MHz;

	initial begin
		// Initialize Inputs
		clk100MHz = 0;
		reset = 0;
		dato_SerieADC = 0;
		inicioADC = 0;

		#10000;
		
		reset = 1;
		
		#10000;
		
		reset = 0;
		
		@(negedge clk44kHz)
		inicioADC = 1;	
		dato_SerieADC =1; //bit numero 4 del dato
		@(negedge clk44kHz)
		dato_SerieADC =0; //bit numero 3 del dato
		@(negedge clk44kHz)
		dato_SerieADC = 0; //bit numero 2 del dato
		@(negedge clk44kHz)
		dato_SerieADC =0; //bit numero 1 del dato
		inicioADC =0;
		#100
		repeat(5) @(posedge clk44kHz)
		inicioADC=0;
		@(negedge clk44kHz)
		inicioADC = 1;
		dato_SerieADC =1; //bit numero 4 del dato
		@(negedge clk44kHz)
		dato_SerieADC =0; //bit numero 3 del dato
		@(negedge clk44kHz)
		dato_SerieADC = 1; //bit numero 2 del dato
		@(negedge clk44kHz)
		dato_SerieADC =0; //bit numero 1 del dato
		inicioADC =0;
		
		end
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:54:27 04/13/2015
// Design Name:   Recibir_ADC
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Proyecto1_Ecualizador/Simulacion_ADC.v
// Project Name:  Proyecto1_Ecualizador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Recibir_ADC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Simulacion_ADC;

	// Inputs
	reg clock44kHz;
	reg reset;
	reg datoADC;
	reg inicio;

	// Outputs
	wire [11:0] Dato_sin_basura;
	wire [15:0] dout;
	wire CS_out;
	wire listo;

	// Instantiate the Unit Under Test (UUT)
	Recibir_ADC uut (
		.clock44kHz(clock44kHz), 
		.reset(reset), 
		.datoADC(datoADC), 
		.inicio(inicio), 
		.Dato_sin_basura(Dato_sin_basura), 
		.dout(dout), 
		.CS_out(CS_out), 
		.listo(listo)
	);

			initial forever 
		#10 clock44kHz = ~clock44kHz;
		
	initial begin
		// Initialize Inputs
		clock44kHz = 0;
		reset = 0;
		datoADC = 0;
		inicio = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1;
		
		#100
		
		reset = 0;
		
		#100
		
		inicio = 1;
		
		datoADC = 1; // bit basura    //Empezando con los MSBS
		@(negedge clock44kHz)
		datoADC = 1; // bit basura 
      @(negedge clock44kHz)
		datoADC = 1; // bit basura
		@(negedge clock44kHz)
		datoADC = 1; // bit basura 
		@(negedge clock44kHz)
		datoADC = 0; // bit numero 12 del dato 
		@(negedge clock44kHz)
		datoADC = 1; // bit numero 11 del dato 
      @(negedge clock44kHz)
		datoADC = 0; // bit numero 10 del dato 
		@(negedge clock44kHz)
		datoADC = 1; // bit numero 9 del dato
		@(negedge clock44kHz)
		datoADC = 0; // bit numero 8 del dato 
		@(negedge clock44kHz)
		datoADC = 1; // bit numero 7 del dato 
      @(negedge clock44kHz)
		datoADC = 0; // bit numero 6 del dato 
		@(negedge clock44kHz)
		datoADC = 1; // bit numero 5 del dato
		@(negedge clock44kHz) 
		datoADC = 0; //bit numero 4 del dato
		@(negedge clock44kHz)
		datoADC = 1; //bit numero 3 del dato
		@(negedge clock44kHz)
		datoADC = 0; //bit numero 2 del dato
		@(negedge clock44kHz)
		datoADC = 1; //bit numero 1 del dato
		inicio = 0; 
		#100;
      repeat(10) @(posedge clock44kHz);
		$stop;
		end

endmodule


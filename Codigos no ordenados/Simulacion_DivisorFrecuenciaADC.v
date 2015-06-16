`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:09:44 04/13/2015
// Design Name:   DivisorFrecuencia_ADC
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Proyecto1_Ecualizador/Simulacion_DivisorFrecuenciaADC.v
// Project Name:  Proyecto1_Ecualizador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DivisorFrecuencia_ADC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Simulacion_DivisorFrecuenciaADC;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	DivisorFrecuencia_ADC uut (
		.clk(clk), 
		.reset(reset), 
		.clk_out(clk_out)
	);
	
	
	initial forever 
	
	#1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		reset = 1;
		
		#10
		
		reset = 0;
		
        
		// Add stimulus here

	end
      
endmodule


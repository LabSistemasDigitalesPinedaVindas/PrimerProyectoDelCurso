`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:19 04/23/2015
// Design Name:   ADC_Instanciado
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Acumulador/ADC_Registro.v
// Project Name:  Acumulador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC_Instanciado
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADC_Registro;

	// Inputs
	reg clk100MHz;
	reg reset;
	reg datoADC;
	reg inicio;

	// Outputs
	wire [3:0] dato_sin_basura;
	wire listo;
	wire CS;
	wire clk44kHz;

	// Instantiate the Unit Under Test (UUT)
	ADC_Instanciado uut (
		.clk100MHz(clk100MHz), 
		.reset(reset), 
		.datoADC(datoADC), 
		.inicio(inicio), 
		.dato_sin_basura(dato_sin_basura), 
		.listo(listo), 
		.CS(CS), 
		.clk44kHz(clk44kHz)
	);

	initial forever 
	
	#10 clk100MHz = ~clk100MHz;

	initial begin
		// Initialize Inputs
		clk100MHz = 0;
		reset = 0;
		datoADC = 0;
		inicio = 0;

		#100;
		
		reset = 1;
		
		#100
		
		reset = 0;
		#100
		
		
		
		@(negedge clk44kHz)
		inicio=1	;	
		@(negedge clk44kHz)
		datoADC =1; //bit numero 4 del dato
		@(negedge clk44kHz)
		datoADC =0; //bit numero 3 del dato
		@(negedge clk44kHz)
		datoADC = 0; //bit numero 2 del dato
		@(negedge clk44kHz)
		datoADC =0; //bit numero 1 del dato
		#100
		repeat (5) @(posedge clk44kHz);
		
		@(negedge clk44kHz)	
		datoADC =1; //bit numero 4 del dato
		@(negedge clk44kHz)
		datoADC =0; //bit numero 3 del dato
		@(negedge clk44kHz)
		datoADC = 0; //bit numero 2 del dato
		@(negedge clk44kHz)
		datoADC =1; //bit numero 1 del dato

      repeat(10) @(posedge clk44kHz);
		$stop;
		
		end
endmodule



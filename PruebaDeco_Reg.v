`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:40 04/25/2015
// Design Name:   Deco_Reg
// Module Name:   C:/Users/Andres Pineda/Documents/Documentos Andres/Xilinx/Acumulador/PruebaDeco_Reg.v
// Project Name:  Acumulador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Deco_Reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PruebaDeco_Reg;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] Entrada_Contador;
	reg [3:0] Entrada1;
	reg [3:0] Entrada2;
	reg [3:0] Entrada3;

	// Outputs
	wire [3:0] Salida1;
	wire [3:0] Salida2;
	wire [3:0] Salida3;

	// Instantiate the Unit Under Test (UUT)
	Deco_Reg uut (
		.clk(clk), 
		.reset(reset),  
		.Entrada_Contador(Entrada_Contador), 
		.Entrada1(Entrada1), 
		.Entrada2(Entrada2), 
		.Entrada3(Entrada3), 
		.Salida1(Salida1), 
		.Salida2(Salida2), 
		.Salida3(Salida3)
	);

	initial forever
	#10 clk = ~clk;
	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Entrada_Contador = 0;
		Entrada1 = 0;
		Entrada2 = 0;
		Entrada3 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset = 1;
		#10
		reset = 0;
		
		@(posedge clk)
		//Entrada1 = 4'b0001;
		Entrada_Contador = 2'b00;
		
		
		@(posedge clk)
		Entrada1 = 4'b0001;
		Entrada_Contador = 2'b01;
		
		@(posedge clk)
		Entrada2 = 4'b0010;
		Entrada_Contador = 2'b10;
		
		@(posedge clk)
		Entrada3 = 4'b0011;
		Entrada_Contador = 2'b11;
		
		// Inicia cuenta otra vez
		
		@(posedge clk)
		//Entrada1 = 4'b1111;
		Entrada_Contador = 2'b00;
		
		@(posedge clk)
		Entrada1 = 4'b1111;
		Entrada_Contador = 2'b01;
		@(posedge clk)
		Entrada2 = 4'b1110;
		Entrada_Contador = 2'b10;
		
		@(posedge clk)
		Entrada3 = 4'b1101;
		Entrada_Contador = 2'b11;
		
	
		
		#100
		$stop;
		
	end
      
endmodule


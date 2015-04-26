`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:55 04/26/2015
// Design Name:   TopDeFiltros
// Module Name:   C:/Users/JairoVnds/Dropbox/Universidades/TEC/2015/1 SEMESTRE/Lab. Sistemas Digitales/PrimerProyectoDelCurso/Filtros/FiltroNoRecursivo/TOPTEST.v
// Project Name:  FiltroNoRecursivo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopDeFiltros
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TOPTEST;

	// Inputs
	reg clock44k;
	reg reset;
	reg enable;
	reg [24:0] uk;

	// Outputs
	wire [24:0] ykbajos;
	wire [24:0] ykmedios;
	wire [24:0] ykaltos;
		
	reg [24:0] arrayIN [0:999];
	integer bajos, medios, altos;
	
	// Instantiate the Unit Under Test (UUT)
	TopDeFiltros uut (
		.clock44k(clock44k), 
		.reset(reset), 
		.enable(enable), 
		.uk(uk), 
		.ykbajos(ykbajos), 
		.ykmedios(ykmedios), 
		.ykaltos(ykaltos)
	);

	initial begin
	$readmemb("signal.txt", arrayIN);
	end
	
	integer i,n;
	initial 
		begin
			clock44k = 0;
			reset = 1;
			uk = 0;
			#5 reset = 0;
			#100;
		
		i<=0;
		
		bajos=$fopen ("Rbajos.txt");
		medios=$fopen ("Rmedios.txt");
		altos=$fopen ("Raltos.txt");
		
		for(i=0;i<1001;i=i+1)
			begin 
				enable =1'b1;
				uk = arrayIN[i];
				#5;
					
				uk=arrayIN[i];
				enable = 1'b0;
				#100;
				
				$fdisplayb(bajos,ykbajos);
				$fdisplayb(medios,ykmedios);
				$fdisplayb(altos,ykaltos);
				#5;
				
			end
		end
initial forever #5 clock44k = ~clock44k;

endmodule


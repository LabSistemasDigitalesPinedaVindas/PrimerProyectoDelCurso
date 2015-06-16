`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:03 05/05/2015 
// Design Name: 
// Module Name:    DAC44K 
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
module DAC44K
	(
	input wire clk100MHz, reset,
	input wire [11:0] Dato_paralelo,
	output DatoSerie,CS,clk
    );
	 
	//wire clk;
	
	DAC DAC_1 (clk, reset, Dato_paralelo, DatoSerie, CS);
	Frecuencia CuarentaKHz (clk100MHz, reset, clk);
	

endmodule

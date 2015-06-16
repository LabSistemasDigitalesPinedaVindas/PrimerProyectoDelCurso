`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:23 04/23/2015 
// Design Name: 
// Module Name:    Frecuencia150kHz 
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
module Frecuencia150kHz#(parameter width = 9)
	(input wire clk, reset,
	output reg clk_out
    );
	
	reg [width-1:0] contador;
	
	always @(posedge clk or posedge reset)
    begin
      if(reset)
       begin
       contador <= 0;
       clk_out <= 1'b0;
       end
     else
       if(contador == 1) //va convertir un el clk de 100Mhz a 150khz
         begin
         contador <= 0;
         clk_out <= ~clk_out;
         end
      else
       begin
       contador<=contador+1'b1;
       end
   end



endmodule

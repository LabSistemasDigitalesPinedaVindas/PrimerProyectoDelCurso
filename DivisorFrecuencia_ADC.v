`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:35 04/12/2015 
// Design Name: 
// Module Name:    DivisorFrecuencia_ADC 
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
module DivisorFrecuencia_ADC #(parameter width = 12)
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
       if(contador == 2268) //va convertir un el clk de 100Mhz a 44100hz
         begin
         contador <= 0;
         clk_out <= ~clk_out;
         end
      else
       begin
       contador<=contador+1;
       end
   end

endmodule

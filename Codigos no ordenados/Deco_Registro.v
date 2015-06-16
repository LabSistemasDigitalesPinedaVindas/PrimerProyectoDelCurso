`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:18 04/25/2015 
// Design Name: 
// Module Name:    Deco_Registro 
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
module Deco_Registro(
	input wire clk, reset,
	input wire [1:0] Contador_Control,
	output reg  [2:0] Salida_Reg
    );

   always @*
      if (reset)
         Salida_Reg = 0;
      else
         case (Contador_Control)
            2'b00   : Salida_Reg = 3'b000;
            2'b01   : Salida_Reg = 3'b100;
            2'b10   : Salida_Reg = 3'b010;
            2'b11   : Salida_Reg = 3'b001;
            default : Salida_Reg = 3'b000;
         endcase
				

endmodule

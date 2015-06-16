`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:01 05/05/2015 
// Design Name: 
// Module Name:    Concatenacion 
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
module Concatenacion #(Width=23) 
	(
	input wire [11:0] datoADC,
	output wire signed [Width-1:0] dato23bits
    );
	 
	 reg [Width-1:0] datoConcatenado;
	 localparam [8:0] Ceros = 9'b0;
	 localparam [1:0] CerosFinal = 2'b0;
	 
	
	always@*
		begin
			datoConcatenado = {Ceros,datoADC,CerosFinal};
		end 
	
	assign dato23bits = datoConcatenado;	
		

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:43 05/05/2015 
// Design Name: 
// Module Name:    MuxSalidas 
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
module MuxSalidas #(parameter Width=22)(
	input wire [1:0] sel,
	input wire signed [Width-1:0] Senal_Audio,Baja,Media,Alta,
	output reg signed [Width-1:0] Banda_Selecionada
    );

	always @*
		begin
			case (sel)
				2'b00: Banda_Selecionada = Senal_Audio;
				2'b01: Banda_Selecionada = Baja;
				2'b10: Banda_Selecionada = Media;
				2'b11: Banda_Selecionada = Alta;
			endcase
		end 

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:09 04/23/2015 
// Design Name: 
// Module Name:    Control 
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
module Control #(parameter width =2)
	(input wire clock150kHz,reset,
	input wire inicio,
	output wire [width-1:0] dout,
	output listo
    );
	 
	 //symbolic state declaration
	 
	 localparam [1:0]
	 checkeo = 2'b00,
	 contador  = 2'b01,
	 cargar = 2'b10;
	 
	 //Signal declaration
	 
	 reg [1:0] state_reg, state_next;
	 reg [1:0] cont,cont_sig;
	 reg done;
	
	 
	//====================================================
	//FSMD
	//====================================================
	//FSMD state & data registers

		always @ (posedge clock150kHz, posedge reset)
			if (reset)
				begin
					state_reg <= checkeo;
					cont <= 0;
				end
			else
				begin
					state_reg <= state_next;
					cont <= cont_sig;
				end
				
	// FSMD next-state logic
	always @*
		begin 
			state_next = state_reg;
			cont_sig = cont;
		
			done = 0;
			case (state_reg)
				checkeo:
					if (inicio )
						begin 
							cont_sig = 2'b0;
							state_next = contador;
						end
				contador: //8 data + 1 parity + 1 stop
					if (cont==3)
						state_next = cargar;
					else
						cont_sig = cont + 1;
					cargar: // 1 extra clock to complete the last shift
						begin
							state_next = checkeo;
							done = 1;
							cont_sig = 0;
						end
				endcase
			end
			
			//output
			
			assign dout = cont; // data bits
			assign listo = done;

endmodule

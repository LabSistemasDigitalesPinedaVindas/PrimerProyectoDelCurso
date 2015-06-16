`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:55 04/29/2015 
// Design Name: 
// Module Name:    DAC 
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
module DAC
	(
	input wire clock44kHz,reset,
	input wire [11:0] dato_In,
	output wire Dato_Serial,CS_out
    );
	 
	 //symbolic state declaration
	 
	 localparam [1:0]
	 lectura = 2'b00,
	 contador  = 2'b01,
	 cargar = 2'b10;
	 
	 //Signal declaration
	 reg Cs_A,Cs_S;
	 reg [1:0] state_reg, state_next;
	 reg [5:0] cont, cont_sig;
	 reg  dato_actual, dato_sig;
	  // body

	always @ (posedge clock44kHz, posedge reset)
			if (reset)
				begin
					state_reg <= lectura;
					cont <= 0;
					dato_actual <= 0;
					Cs_A <= 1;
				end
			else
				begin
					state_reg <= state_next;
					cont <= cont_sig;
					dato_actual <= dato_sig;
					Cs_A <= Cs_S;
				end
				
	// FSMD next-state logic
	always @*
		begin 
			state_next = state_reg;
			cont_sig = cont;
			dato_sig = dato_actual;
			Cs_S=1;
			Cs_S = Cs_A;
					
			
			case (state_reg)
				lectura:
					if ( Cs_S)
						begin 
							//shift in start bit
							dato_sig = 0;
							cont_sig = 2'b0;
							Cs_S = 1'b0;
							state_next = contador;
						end
					else 
						state_next = lectura;
				contador: //8 data + 1 parity + 1 stop
					if (cont_sig==4'd15)
						begin
							state_next=cargar;
							Cs_S = 1'b1;
						end
					else if (cont_sig <=4'd2)
						begin
							Cs_S = 1'b0;
							dato_sig = 0;
							cont_sig=cont_sig + 1'b1;
						end
					else 
						begin
							Cs_S = 1'b0;
							dato_sig = dato_In[14-cont_sig];
							cont_sig=cont_sig + 1'b1;
						end
					cargar: // 1 extra clock to complete the last shift
						begin
							state_next = lectura;
							Cs_S = 1'b1;
						end
				endcase
			end
			
			
			assign Dato_Serial = dato_actual;	
			assign CS_out =Cs_A;

endmodule

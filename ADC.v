`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:40 04/23/2015 
// Design Name: 
// Module Name:    ADC 
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
module ADC #(parameter width =4)
	(input wire clock44kHz,reset,
	input wire datoADC,inicio,
	//output wire [11:0] Dato_sin_basura,
	output wire [width-1:0] dout,
	output wire CS_out,
	output reg listo
    );
	 
	 //symbolic state declaration
	 
	 localparam [1:0]
	 idle = 2'b00,
	 dps  = 2'b01,
	 load = 2'b10;
	 
	 //Signal declaration
	 reg Cs_A,Cs_S;
	 reg [1:0] state_reg, state_next;
	 reg [1:0] cont, cont_sig;
	 reg [width-1:0] dato_actual, dato_sig;
	  // body

	always @ (posedge clock44kHz, posedge reset)
			if (reset)
				begin
					state_reg <= idle;
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
			listo =0;
			
			
			case (state_reg)
				idle:
					if (inicio && Cs_S)
						begin 
							//shift in start bit
							dato_sig = {datoADC, dato_actual[width-1:1]};
							cont_sig = 2'b0;
							Cs_S = 1'b0;
							state_next = dps;
						end
					else 
						state_next = idle;
				dps: //8 data + 1 parity + 1 stop
					if (cont_sig==3)
					state_next=load;
					else
						begin
							Cs_S = 1'b0;
							dato_sig = {datoADC, dato_actual[width-1:1]};
							cont_sig=cont_sig + 1'b1;
						end
					load: // 1 extra clock to complete the last shift
						begin
							state_next = idle;
							Cs_S = 1'b1;
							listo = 1'b1;
						end
				endcase
			end
			
			//output
			
			assign CS_out = Cs_A;
			assign dout = dato_actual; // data bits
			//assign listo = done;
			//assign Dato_sin_basura = b_reg[11:0];
endmodule

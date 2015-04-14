`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:38 04/08/2015 
// Design Name: 
// Module Name:    Recibir_ADC 
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
module Recibir_ADC #(parameter width =16)
	(input wire clock44kHz,reset,
	input wire datoADC,inicio,
	output wire [11:0] Dato_sin_basura,
	output wire [width-1:0] dout,
	output wire CS_out,
	output wire listo
    );
	 
	 //symbolic state declaration
	 
	 localparam [1:0]
	 idle = 2'b00,
	 dps  = 2'b01,
	 load = 2'b10;
	 
	 //Signal declaration
	 
	 reg [1:0] state_reg, state_next;
	 reg [4:0] n_reg, n_next;
	 reg [width-1:0] b_reg, b_next;
	 wire fall_edge;
	 reg f_ps2c_reg,CS,done;
	 wire f_ps2c_next;
	 reg [7:0] filter_reg;
	 wire [7:0] filter_next;
	  // body
	 //=================================================
	 // filter and falling edge tick generation for ps2c
	 //=================================================
	 
	 
	 always @ (posedge clock44kHz, posedge reset)
	 if (reset)
		begin
			filter_reg <= 0;
			f_ps2c_reg <= 0;
		end
	else
		begin
			filter_reg <= filter_next;
			f_ps2c_reg <= f_ps2c_next;
		end
	
	assign filter_next = {clock44kHz,filter_reg[7:1]};
	assign f_ps2c_next = (filter_reg==8'b11111111) ? 1'b1:
								(filter_reg==8'b00000000) ? 1'b0:
								f_ps2c_reg;
								
	assign fall_edge = f_ps2c_reg & ~f_ps2c_next;
	

	//====================================================
	//FSMD
	//====================================================
	//FSMD state & data registers

		always @ (posedge clock44kHz, posedge reset)
			if (reset)
				begin
					state_reg <= idle;
					n_reg <= 0;
					b_reg <= 0;
				end
			else
				begin
					state_reg <= state_next;
					n_reg <= n_next;
					b_reg <= b_next;
				end
				
	// FSMD next-state logic
	always @*
		begin 
			state_next = state_reg;
			n_next = n_reg;
			b_next = b_reg;
			CS = 1'b1;
			done =0;
			
			case (state_reg)
				idle:
					if (inicio && CS)
						begin 
							//shift in start bit
							b_next = {datoADC, b_reg[width-1:1]};
							n_next = 5'b10001;
							CS = 1'b0;
							state_next = dps;
						end
				dps: //8 data + 1 parity + 1 stop
					if (~fall_edge)
						begin
							CS = 1'b0;
							b_next = {datoADC, b_reg[width-1:1]};
							if (n_reg==0)
								state_next = load;
							else
								n_next = n_reg - 1;
							end
					load: // 1 extra clock to complete the last shift
						begin
							state_next = idle;
							CS = 1'b1;
							done = 1'b1;
						end
				endcase
			end
			
			//output
			
			assign CS_out = CS;
			assign dout = b_reg; // data bits
			assign listo = done;
			assign Dato_sin_basura = b_reg[11:0];
endmodule

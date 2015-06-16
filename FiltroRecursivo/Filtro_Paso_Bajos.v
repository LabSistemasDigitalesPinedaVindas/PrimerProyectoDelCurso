`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:31 04/28/2015 
// Design Name: 
// Module Name:    Filtro_Paso_Bajos 
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
module Filtro_Paso_Bajos#(parameter Width = 22, Presicion = 14, Magnitud = Width-Presicion-1)(

	input wire clk150kHz,reset,enable1,enable2,enable3,
	input wire [1:0] Sel_Muxes,
	input wire signed [Width-1:0] uk,
	output wire signed [Width-1:0] Conex_Bajos
	
    );
	 
	 wire signed [Width-1:0] dato_out_MuxB0,dato_out_MuxB1,dato_out_MuxB2,dato_out_MuxA1,dato_out_MuxA2,Banda_Selecionada_Sup,Banda_Selecionada_Inf;
	 wire signed [Width-1:0] fk, fk_b0, fk_b1, fk_b2, fk_a1, fk_a2;
	 wire signed [Width-1:0] Y_suma2, Y_suma3;  
	 wire signed [Width-1:0] fk_RegSup_Altas,fk_RegSup_Medias,fk_RegSup_Bajas,fk_RegInf_Altas,fk_RegInf_Medias,fk_RegInf_Bajas;
	 
	 Multiplicador_Filtro #(Width, Presicion, Magnitud) A1 (dato_out_MuxA1,Banda_Selecionada_Sup,fk_a1);
	 Multiplicador_Filtro #(Width, Presicion, Magnitud) A2 (dato_out_MuxA2,Banda_Selecionada_Inf,fk_a2);
	 Multiplicador_Filtro #(Width, Presicion, Magnitud) B0 (dato_out_MuxB0,fk,fk_b0);
	 Multiplicador_Filtro #(Width, Presicion, Magnitud) B1 (dato_out_MuxB1,Banda_Selecionada_Sup,fk_b1);
	 Multiplicador_Filtro #(Width, Presicion, Magnitud) B2 (dato_out_MuxB2,Banda_Selecionada_Inf,fk_b2);
	 
	 MuxCoeficientesBajos_B0 #(Width) Mux_B0(Sel_Muxes,dato_out_MuxB0);
	 MuxCoeficientesBajos_B1 #(Width)Mux_B1(Sel_Muxes,dato_out_MuxB1);
	 MuxCoeficientesBajos_B2 #(Width) Mux_B2 (Sel_Muxes,dato_out_MuxB2);
	 MuxCoeficientesBajos_A1 #(Width) Mux_A1(Sel_Muxes,dato_out_MuxA1);
	 MuxCoeficientesBajos_A2 #(Width) Mux_A2(Sel_Muxes,dato_out_MuxA2);
	 
	 Suma_Filtro #(Width) Suma1 (uk, Y_suma2,fk);
	 Suma_Filtro #(Width) Suma2 (fk_a1, fk_a2, Y_suma2);
	 Suma_Filtro #(Width) Suma3 (fk_b1, fk_b2, Y_suma3);
	 Suma_Filtro #(Width) Suma4 (fk_b0, Y_suma3, Conex_Bajos);
	 
	 Registro_Filtro #(Width) Reg_Superior_Altas (clk150kHz,reset,enable1,fk,fk_RegSup_Altas);
	 Registro_Filtro #(Width) Reg_Inferior_Altas (clk150kHz,reset,enable1,fk_RegSup_Altas,fk_RegInf_Altas); 
	 Registro_Filtro #(Width) Reg_Superior_Medias (clk150kHz,reset,enable2,fk,fk_RegSup_Medias);
	 Registro_Filtro #(Width) Reg_Inferior_Medias (clk150kHz,reset,enable2,fk_RegSup_Medias,fk_RegInf_Medias);
	 Registro_Filtro #(Width) Reg_Superior_Bajas (clk150kHz,reset,enable3,fk,fk_RegSup_Bajas);
	 Registro_Filtro #(Width) Reg_Inferior_Bajas (clk150kHz,reset,enable3,fk_RegSup_Bajas,fk_RegInf_Bajas);
	 
	 Mux_Filtro #(Width) Mux_superior (fk_RegSup_Altas,fk_RegSup_Medias,fk_RegSup_Bajas,Sel_Muxes,Banda_Selecionada_Sup);
	 Mux_Filtro #(Width) Mux_Inferior (fk_RegInf_Altas,fk_RegInf_Medias,fk_RegInf_Bajas,Sel_Muxes,Banda_Selecionada_Inf);

	 


endmodule

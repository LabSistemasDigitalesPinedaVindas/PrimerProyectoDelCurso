`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:28 04/26/2015 
// Design Name: 
// Module Name:    TopDeFiltros 
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
module TopDeFiltros#(parameter Width = 25, Presicion = 16, Magnitud = Width-Presicion-1
			)
		(
		input wire clock44k, reset,enable,   //senales de control
		input wire signed [Width-1:0] uk, //entrada del filtro
	   output wire signed [Width-1:0] ykbajos,ykmedios, ykaltos //salida del filtro
		);
		
		localparam [Width-1:0]
		//PasoBajos
			b0_bajo_fa= 25'b0000000000000000000001101, //Coeficiente de filtro paso alto de 200 Hz 
			b1_bajo_fa= 25'b0000000000000000000011010, //Coeficiente de filtro paso alto de 200 Hz
			b2_bajo_fa= 25'b0000000000000000000001101, //Coeficiente de filtro paso alto de 200 Hz
			a1_bajo_fa= 25'b1111111100000101000111101, //Coeficiente de filtro paso alto de 200 Hz
			a2_bajo_fa= 25'b0000000001111010111100011, //Coeficiente de filtro paso alto de 200 Hz
			
			b0_bajo_fb= 25'b0000000001111111101111101, //Coeficiente de filtro paso alto de 20 Hz
			b1_bajo_fb= 25'b1111111100000000100000110, //Coeficiente de filtro paso alto de 20 Hz
			b2_bajo_fb= 25'b0000000001111111101111101, //Coeficiente de filtro paso alto de 20 Hz
			a1_bajo_fb= 25'b1111111100000000100000110, //Coeficiente de filtro paso alto de 20 Hz
			a2_bajo_fb= 25'b0000000001111111011111010, //Coeficiente de filtro paso alto de 20 Hz
			
		//PasoMedios
			b0_medio_fa= 25'b0000000000001010101001010, //Coeficiente de filtro paso alto de 5k Hz
			b1_medio_fa= 25'b0000000000010101010010011, //Coeficiente de filtro paso alto de 5k Hz
			b2_medio_fa= 25'b0000000000001010101001010, //Coeficiente de filtro paso alto de 5k Hz
			a1_medio_fa= 25'b1111111101111011100001010, //Coeficiente de filtro paso alto de 5k Hz
			a2_medio_fa= 25'b0000000000101111000101000, //Coeficiente de filtro paso alto de 5k Hz
			
			b0_medio_fb= 25'b0000000010000000000000000, //Coeficiente de filtro paso alto de 200 Hz
			b1_medio_fb= 25'b1111111100000000000000000, //Coeficiente de filtro paso alto de 200 Hz
			b2_medio_fb= 25'b0000000010000000000000000, //Coeficiente de filtro paso alto de 200 Hz
			a1_medio_fb= 25'b1111111100000101000111101, //Coeficiente de filtro paso alto de 200 Hz
			a2_medio_fb= 25'b0000000001111010111100011, //Coeficiente de filtro paso alto de 200 Hz
		
		//PasoAltos
			b0_alta_fa= 25'b0000000001101000000101110,  //Coeficiente de filtro paso alto de 20k Hz
			b1_alta_fa= 25'b0000000011010000001000010,  //Coeficiente de filtro paso alto de 20k Hz
			b2_alta_fa= 25'b0000000001101000000101110,  //Coeficiente de filtro paso alto de 20k Hz
			a1_alta_fa= 25'b0000000011001011101001100,  //Coeficiente de filtro paso alto de 20k Hz
			a2_alta_fa= 25'b0000000001010100101100101,  //Coeficiente de filtro paso alto de 20k Hz
			
			b0_alta_fb= 25'b0000000001001100111000111,  //Coeficiente de filtro paso alto de 5k Hz
			b1_alta_fb= 25'b1111111101100110010001011,  //Coeficiente de filtro paso alto de 5k Hz 
			b2_alta_fb= 25'b0000000001001100111000111,  //Coeficiente de filtro paso alto de 5k Hz
			a1_alta_fb= 25'b1111111101111011100001010,  //Coeficiente de filtro paso alto de 5k Hz
			a2_alta_fb= 25'b0000000000101111000101000;  //Coeficiente de filtro paso alto de 5k Hz	
			
		wire signed [Width-1:0] ConexionDeFiltrosBajos, ConexionDeFiltrosMedios, ConexionDeFiltrosAltos;
		
		
////Instanciacion de filtro con las multiplicaciones(5), registros(2) y sumas(4)

/// nombre viejo nombre nuevo (entradas); 
//Filtro de bajos.
Filtro #(Width, Presicion, Magnitud, b0_bajo_fb, b1_bajo_fb, b2_bajo_fb, a1_bajo_fb, a2_bajo_fb)
		FiltroPasoAlto20Hz (clock44k, reset, enable, uk, ConexionDeFiltrosBajos);
Filtro #(Width, Presicion, Magnitud, b0_bajo_fa, b1_bajo_fa, b2_bajo_fa, a1_bajo_fa, a2_bajo_fa) 
		FiltroPasoBajo200Hz (clock44k, reset, enable, ConexionDeFiltrosBajos, ykbajos);

//Filtro de medios.
Filtro #(Width, Presicion, Magnitud, b0_medio_fb, b1_medio_fb, b2_medio_fb, a1_medio_fb, a2_medio_fb) 
		FiltroPasoAlto200Hz (clock44k, reset, enable, uk, ConexionDeFiltrosMedios);
Filtro #(Width, Presicion, Magnitud, b0_medio_fa, b1_medio_fa, b2_medio_fa, a1_medio_fa, a2_medio_fa) 
		FiltroPasoBajo5kHz (clock44k, reset, enable, ConexionDeFiltrosMedios, ykmedios);

//Filtro de altos.
Filtro #(Width, Presicion, Magnitud, b0_alta_fb, b1_alta_fb, b2_alta_fb, a1_alta_fb, a2_alta_fb)  
		FiltroPasoAlto5kHz (clock44k, reset, enable, uk, ConexionDeFiltrosAltos);
Filtro #(Width, Presicion, Magnitud, b0_alta_fa, b1_alta_fa, b2_alta_fa, a1_alta_fa, a2_alta_fa)
		FiltroPasoBajo20kHz (clock44k, reset, enable, ConexionDeFiltrosAltos, ykaltos);



endmodule

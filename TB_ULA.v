//João Cosmo, Mirele Silva, Ana Louise, Pedro Lucas


module TB_ULA (); //Um Testbench não tem inputs ou outputs
	reg [7:0] A, B;
	reg [3:0] Sel;
	wire [15:0] S;
	
	//Instanciar o dispositivo a ser testado
	ULA dut(.S(S),.Sel(Sel),.A(A),.B(B));
	
	initial begin	//Bloco sequencial
		$display("Testando........");
	// ------- MIRELE
	//Sel = 0000  - SOMA

		A = 8'b11000; B = 8'b11111; Sel = 4'b0000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b110111) $display("Sel = 0000 falhou com A = 11000 e B = 11111.");
		
		A = 8'b1000100; B = 8'b1001111; Sel = 4'b0000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b10010011) $display("Sel = 0000 falhou com A = 1000100 e B = 1001111.");
		
		A = 8'b11111110; B = 8'b11110101; Sel = 4'b0000; #10; //etc... etc..
		if (S !== 16'b111110011) $display("Sel = 0000 falhou com A = 11111110 e B = 11110101.");
		
		A = 8'b11111111; B = 8'b11111011; Sel = 4'b0000; #10;
		if (S !== 16'b111111010) $display("Sel = 0000 falhou com A = 11111111 e B = 11111011.");

	//Sel = 0001 - Subtração 

		A = 8'b10110; B = 8'b10001; Sel = 4'b0001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b101) $display("Sel = 0001 falhou com A = 10110 e B = 10001.");
		
		A = 8'b101100; B = 8'b100011; Sel = 4'b0001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b1001) $display("Sel = 0001 falhou com A = 101100 e B = 100011.");
		
		A = 8'b11000010; B = 8'b10111000; Sel = 4'b0001; #10; //etc... etc..
		if (S !== 16'b1010) $display("Sel = 0001 falhou com A = 11000010 e B = 10111000.");
		
		A = 8'b11111111; B = 8'b11110111; Sel = 4'b0001; #10;
		if (S !== 16'b1000) $display("Sel = 0001 falhou com A = 11111111 e B = 11110111.");
	
	//Sel = 0010 - Multiplicação 

		A = 8'b11000; B = 8'b11111; Sel = 4'b0010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b1011101000) $display("Sel = 0010 falhou com A = 11000 e B = 11111.");
		
		A = 8'b1000100; B = 8'b1001111; Sel = 4'b0010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b1010011111100) $display("Sel = 0010 falhou com A = 1000100 e B = 1001111.");
		
		A = 8'b11111110; B = 8'b11110101; Sel = 4'b0010; #10; //etc... etc..
		if (S !== 16'b1111001100010110) $display("Sel = 0010 falhou com A = 11111110 e B = 11110101.");
		
		A = 8'b11111111; B = 8'b11111011; Sel = 4'b0010; #10;
		if (S !== 16'b1111101000000101) $display("Sel = 0010 falhou com A = 11111111 e B = 11111011.");
	
	//Sel = 0011 - Divisão 

		A = 8'b110010; B = 8'b11001; Sel = 4'b0011; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b10) $display("Sel = 0011 falhou com A = 110010 e B = 11001.");
		
		A = 8'b1100100; B = 8'b11001; Sel = 4'b0011; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b100) $display("Sel = 0011 falhou com A = 1100100 e B = 11001.");
		
		A = 8'b11101010; B = 8'b1001; Sel = 4'b0011; #10; //etc... etc..
		if (S !== 16'b11010) $display("Sel = 0011 falhou com A = 11101010 e B = 1001.");
		
		A = 8'b11111111; B = 8'b0; Sel = 4'b0011; #10;
		if (S !== 16'bxxxxxxxx) $display("Sel = 0011 falhou com A = 11111111 e B = 0.");

	//------- João
	//Sel = 0100 - << 
		A = 8'b01; B = 8'bx; Sel = 4'b0100; #10;
		if(S[7:0] !== 16'b10) $display("Sel = 0100 falhou com A = 01 e B = x");
		
		A = 8'b10000000; B = 8'bx; Sel = 4'b0100; #10;
		if(S[7:0] !== 16'b00000000) $display("Sel = 0100 falhou com A = 10000000 e B = x");
		
		A = 8'b11111111; B = 8'bx; Sel = 4'b0100; #10;
		if(S[7:0] !== 16'b11111110) $display("Sel = 0100 falhou com A = 11111111 e B = x");
		
		A = 8'b10101010; B = 8'bx; Sel = 4'b0100; #10;
		if(S[7:0] !== 16'b01010100) $display("Sel = 0100 falhou com A = 10101010 e B = x");
		
	//Sel = 0101 - >> 
		A = 8'b01; B = 8'bx; Sel = 4'b0101; #10;
		if(S !== 16'b00000000) $display("Sel = 0101 falhou com A = 01 e B = x");
		
		A = 8'b10000000; B = 8'bx; Sel = 4'b0101; #10;
		if(S !== 16'b01000000) $display("Sel = 0101 falhou com A = 10000000 e B = x");
		
		A = 8'b11111111; B = 8'bx; Sel = 4'b0101; #10;
		if(S !== 16'b01111111) $display("Sel = 0101 falhou com A = 11111111 e B = x");
		
		A = 8'b10101010; B = 8'bx; Sel = 4'b0101; #10;
		if(S !== 16'b01010101) $display("Sel = 0101 falhou com A = 10101010 e B = x");
		
	//Sel = 0110 - rotacion à esquerda em 1bit 
		A = 8'b01; B = 8'bx; Sel = 4'b0110; #10;
		if(S !== 16'b10) $display("Sel = 0110 falhou com A = 01 e B = x");
		
		A = 8'b10000000; B = 8'bx; Sel = 4'b0110; #10;
		if(S !== 16'b01) $display("Sel = 0110 falhou com A = 10000000 e B = x");
		
		A = 8'b11111111; B = 8'bx; Sel = 4'b0110; #10;
		if(S !== 16'b11111111) $display("Sel = 0110 falhou com A = 11111111 e B = x");
		
		A = 8'b10101010; B = 8'bx; Sel = 4'b0110; #10;
		if(S !== 16'b01010101) $display("Sel = 0110 falhou com A = 10101010 e B = x");
			
	//Sel = 0111 - rotacion à direira em 1bit 
		A = 8'b01; B = 8'bx; Sel = 4'b0111; #10;
		if(S !== 16'b10000000) $display("Sel = 0111 falhou com A = 01 e B = x");
		
		A = 8'b10000000; B = 8'bx; Sel = 4'b0111; #10;
		if(S !== 16'b01000000) $display("Sel = 0111 falhou com A = 10000000 e B = x");
		
		A = 8'b11111111; B = 8'bx; Sel = 4'b0111; #10;
		if(S !== 16'b11111111) $display("Sel = 0111 falhou com A = 11111111 e B = x");
		
		A = 8'b10101010; B = 8'bx; Sel = 4'b0111; #10;
		if(S !== 16'b01010101) $display("Sel = 0111 falhou com A = 10101010 e B = x");

	//------- Ana
	//Sel = 1000 - and 

		A = 8'b11111111; B = 8'b11110000; Sel = 4'b1000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11110000) $display("Sel = 1000 falhou com A = 11111111 e B = 11110000.");
		
		A = 8'b10101010; B = 8'b01010101; Sel = 4'b1000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1000 falhou com A = 10101010 e B = 01010101.");

		A = 8'b11100111; B = 8'b11110011; Sel = 4'b1000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11100011) $display("Sel = 1000 falhou com A = 11100111 e B = 11110011.");

		A = 8'b11100111; B = 8'b10100101; Sel = 4'b1000; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b10100101) $display("Sel = 1000 falhou com A = 11100111 e B = 10111101.");


	//Sel = 1001 - or 
		A = 8'b11111111; B = 8'b11110000; Sel = 4'b1001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11111111) $display("Sel = 1001 falhou com A = 11111111 e B = 11110000.");
		
		A = 8'b10101010; B = 8'b01010101; Sel = 4'b1001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11111111) $display("Sel = 1001 falhou com A = 10101010 e B = 01010101.");

		A = 8'b11100111; B = 8'b11110011; Sel = 4'b1001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11110111) $display("Sel = 1001 falhou com A = 11100111 e B = 11110011.");

		A = 8'b11100111; B = 8'b10100101; Sel = 4'b1001; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11100111) $display("Sel = 1001 falhou com A = 11100111 e B = 10111101.");




	//Sel = 1100 - nand 
		A = 8'b11111111; B = 8'b11110000; Sel = 4'b1100; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00001111) $display("Sel = 1100 falhou com A = 11111111 e B = 11110000.");
		
		A = 8'b10101010; B = 8'b01010101; Sel = 4'b1100; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b11111111) $display("Sel = 1100 falhou com A = 10101010 e B = 01010101.");

		A = 8'b11100111; B = 8'b11110011; Sel = 4'b1100; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00011100) $display("Sel = 1100 falhou com A = 11100111 e B = 11110011.");

		A = 8'b11100111; B = 8'b10100101; Sel = 4'b1100; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b01011010) $display("Sel = 1100 falhou com A = 11100111 e B = 10111101.");
		


	//Sel = 1011 - nor 

		A = 8'b11111111; B = 8'b11110000; Sel = 4'b1011; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00000000) $display("Sel = 1011 falhou com A = 11111111 e B = 11110000.");
		
		A = 8'b10101010; B = 8'b01010101; Sel = 4'b1011; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00000000) $display("Sel = 1011 falhou com A = 10101010 e B = 01010101.");

		A = 8'b11100111; B = 8'b11110011; Sel = 4'b1011; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00001000) $display("Sel = 1011 falhou com A = 11100111 e B = 11110011.");

		A = 8'b11100111; B = 8'b10100101; Sel = 4'b1011; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00011000) $display("Sel = 1011 falhou com A = 11100111 e B = 10111101."); 

	//------- Pedro
	//Sel = 1010 - xor
		A = 8'b00000000; B = 8'b00000000;  Sel = 4'b1010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1010 falhou com A = 00000000, B = 00000000.");
		
		A = 8'b00001000; B = 8'b00100000;  Sel = 4'b1010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00101000) $display("Sel = 1010 falhou com A = 00001000, B = 00100000.");
		
		A = 8'b01010101; B = 8'b10101010;  Sel = 4'b1010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b11111111) $display("Sel = 1010 falhou com A = 01010101, B = 10101010.");
		
		A = 8'b11111111; B = 8'b11111111;  Sel = 4'b1010; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1010 falhou com A = 11111111, B = 11111111.");	
		
	//Sel = 1101 - xnor 
		A = 8'b00000000; B = 8'b00000000;  Sel = 4'b1101; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b11111111) $display("Sel = 1101 falhou com A = 00000000, B = 00000000.");
		
		A = 8'b00001000; B = 8'b00100000;  Sel = 4'b1101; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b11010111) $display("Sel = 1101 falhou com A = 00001000, B = 00100000.");
		
		A = 8'b01010101; B = 8'b10101010;  Sel = 4'b1101; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b00000000) $display("Sel = 1101 falhou com A = 01010101, B = 10101010.");
		
		A = 8'b11111111; B = 8'b11111111;  Sel = 4'b1101; #10; //aplicar entrada e esperar 10ns
		if (S[7:0] !== 16'b11111111) $display("Sel = 1101 falhou com A = 11111111, B = 11111111.");	
		
	//Sel = 1110 - 1, se A>B, senão 0 
		A = 8'b00000000; B = 8'b00000000;  Sel = 4'b1110; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1110 falhou com A = 00000000, B = 00000000.");
		
		A = 8'b00001000; B = 8'b00100000;  Sel = 4'b1110; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1110 falhou com A = 00001000, B = 00100000.");
		
		A = 8'b01010101; B = 8'b10101010;  Sel = 4'b1110; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1110 falhou com A = 01010101, B = 10101010.");
		
		A = 8'b11111111; B = 8'b01111111;  Sel = 4'b1110; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000001) $display("Sel = 1110 falhou com A = 11111111, B = 01111111.");	
		
	//Sel = 1111 - 1, se A=B, senão 0 
		A = 8'b00000000; B = 8'b00000000;  Sel = 4'b1111; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000001) $display("Sel = 1111 falhou com A = 00000000, B = 00000000.");
		
		A = 8'b00001000; B = 8'b00100000;  Sel = 4'b1111; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1111 falhou com A = 00001000, B = 00100000.");
		
		A = 8'b01010101; B = 8'b10101010;  Sel = 4'b1111; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1111 falhou com A = 01010101, B = 10101010.");
		
		A = 8'b11111111; B = 8'b01111111;  Sel = 4'b1111; #10; //aplicar entrada e esperar 10ns
		if (S !== 16'b00000000) $display("Sel = 1111 falhou com A = 11111111, B = 01111111.");	





		#10 $display("Fim do teste :)");
	end
endmodule

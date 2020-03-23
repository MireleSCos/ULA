module TB_ULA (); //Um Testbench não tem inputs ou outputs
	reg [7:0] A, B;
	reg [1:0] Seletor;
	wire [15:0] S;
	
	//Instanciar o dispositivo a ser testado
	ULA dut(.S(S),.Seletor(Seletor),.A(A),.B(B));
	
	initial begin	//Bloco sequencial

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
	//Sel = 0101 - >> 
	//Sel = 0110 - rotacion à esquerda em 1bit 
	//Sel = 0111 - rotacion à direira em 1bit 

	//------- Ana
	//Sel = 1000 - and 
	//Sel = 1001 - or 
	//Sel = 1100 - nand 
	//Sel = 1011 - nor 

	//------- Pedro
	//Sel = 1010 - xor
	//Sel = 1101 - xnor 
	//Sel = 1110 - 1, se A>B, senão 0 
	//Sel = 1111 - 1, se A=B, senão 0 
	end
endmodule
module TB_ULA (); //Um Testbench não tem inputs ou outputs
	reg [7:0] A, B;
	reg [1:0] Seletor;
	wire [15:0] S;
	
	//Instanciar o dispositivo a ser testado
	ULA dut(.S(S),.Seletor(Seletor),.A(A),.B(B));
	
	initial begin	//Bloco sequencial

	// ------- MIRELE
	//Sel = 0000  - SOMA
		A = 1'b11000; B = 1'b11111; Sel = 2'b0000; #10; //aplicar entrada e esperar 10ns
		if (S !== 2'b110111) $display("Sel = 00 falhou com A = 0 e B = 0.");
		
		A = 1'b1000100; B = 1'b1001111; Sel = 2'b0000; #10; //aplicar entrada e esperar 10ns
		if (S !== 2'b10010011) $display("Sel = 00 falhou com A = 0 e B = 1.");
		
		A = 1'b11111110; B = 1'b11110101; Sel = 2'b0000; #10; //etc... etc..
		if (S !== 2'b111110011) $display("Sel = 00 falhou com A = 1 e B = 0.");
		
		A = 1'b11111111; B = 1'b11111011; Sel = 2'b0000; #10;
		if (S !== 2'b111111010) $display("Sel = 00 falhou com A = 1 e B = 1.");
	
	//Sel = 0001 - Subtração 
	//Sel = 0010 - Multiplicação 
	//Sel = 0011 - Divisão 

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
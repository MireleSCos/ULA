module ULA(Seletor, A, B, S, clock);
input [7:0] A, B;
input [3:0] Seletor;
input clock;
output reg [15:0] S;	
	always @(posedge clock)
	begin
		case (Seletor)
			4'b0000: S = A + B;
			4'b0001: S = A - B;
			4'b0010: S = A * B;
			4'b0011: S = A/B;
			4'b0100: S = A << 1;
			4'b0101: S = A >> 1;
			4'b0110: S = {A[6:0], A[7]};
			4'b0111: S = {A[0], A[7:1]};
			4'b1000: S = A & B;
			4'b1001: S = A | B;
			4'b1010: S = A ^ B;
			4'b1011: S = ~(A | B); 
			4'b1100: S = ~(A & B);
			4'b1101: S = ~(A ^ B);
			4'b1110: S = A > B ? 1'b1 : 1'b0;
			4'b1111: S = A == B ? 1'b1 : 1'b0;
		endcase
	end
endmodule 
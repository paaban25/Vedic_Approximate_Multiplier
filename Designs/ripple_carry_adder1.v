`include "approximate_adder1.v"

module ripple_carry_adder1#(parameter N=16) (
  input [N-1:0] A, B,
  input Cin,
  output [N-1:0] Sum,
  output Cout
);
  
  wire [N:0] carry;
  assign carry[0] = Cin;
  
  genvar i;
  generate
    for(i = 0; i < N; i = i + 1) begin : adder_stage
      approximate_adder1 aa1 (
        .a(A[i]),
        .b(B[i]),
        .cin(carry[i]),
        .sum(Sum[i]),
        .carry(carry[i+1])
      );
    end
  endgenerate
  
  assign Cout = carry[N];
  
endmodule

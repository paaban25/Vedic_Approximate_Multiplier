`include "mux_21.v"

module approximate_adder1 (input a,b,cin,
                          output sum,carry);
  
  wire w1,w2;
  not b0_i (w1,a);
  xor x2_i(w2,b,cin);
  mux_21 m21_1 (.a(a),.b(w1),.s(w2),.out(sum));
  mux_21 m21_2 (.a(b),.b(a),.s(w2),.out(carry));
  
endmodule
//`include "mux_21.v"

module approximate_adder2 (input a,b,cin,
                          output sum,carry);
  
  wire w1,w2;
  or o2_i(w2,b,cin);
  mux_21 m21_1 (.a(a),.b(b),.s(cin),.out(w1));
  mux_21 m21_2 (.a(a),.b(w1),.s(w2),.out(carry));
  assign sum=w2;
  
endmodule
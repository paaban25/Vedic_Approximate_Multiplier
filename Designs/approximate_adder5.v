

module approximate_adder5 (input a,b,cin,
                          output sum,carry);
  wire w;
  assign w=(a&b)|(b&cin)|(a&cin);
  assign carry = w;
  assign sum= ~w;
endmodule


module approximate_adder4 (input a,b,cin,
                          output sum,carry);
  wire w;
  assign w= (a&cin)|b;
  assign carry=w;
  assign sum= (a&b&cin) | ((!w)&cin);

endmodule


module approximate_adder6 (input a,b,cin,
                          output sum,carry);

  assign sum = ((~a)&(b|cin))|(b&cin);
  assign carry = (a&b)|(b&cin)|(a&cin);
endmodule

module approximate_adder7 (input a,b,cin,
                          output sum,carry);

  assign sum = ((~a)|b)&cin;
  assign carry = (a&b)|(b&cin)|(a&cin);
endmodule
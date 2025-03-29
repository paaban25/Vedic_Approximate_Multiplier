

module approximate_adder11  (input a,b,cin,
                          output sum,carry);

  assign sum=(~a)|(b&cin);
  assign carry=(a&cin)|b;
endmodule
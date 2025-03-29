

module approximate_adder10  (input a,b,cin,
                          output sum,carry);

  assign sum=b;
  assign carry=(a&b)|(b&cin)|(cin&a);
endmodule
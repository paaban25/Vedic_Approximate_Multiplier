

module approximate_adder9 (input a,b,cin,
                          output sum,carry);

  wire w;
  assign w=(a&cin)|b;
  assign carry=w;
  assign sum=~w;
  
endmodule
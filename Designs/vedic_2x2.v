`include "half_adder.v"
module vedic_2x2(input [1:0] a,b,
                output [3:0] out);
  wire ab00,ab01,ab10,ab11;
  wire ha1s,ha1c,ha2s,ha2c;
  and and1_i(ab00,a[0],b[0]);
  and and2_i(ab01,a[0],b[1]);
  and and3_i(ab10,a[1],b[0]);
  and and4_i(ab11,a[1],b[1]);
  half_adder ha1(.a(ab01),.b(ab10),.carry(ha1c),.sum(ha1s));
  half_adder ha2(.a(ab11),.b(ha1c),.carry(ha2c),.sum(ha2s));
  assign out={ha2c,ha2s,ha1s,ab00};
endmodule
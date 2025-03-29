`include "vedic_4x4.v"
`include "adder_8b.v"

module vedic_8x8(input [7:0] a,b,
                 output [15:0] out);
  wire [7:0] v_4x4_1o,v_4x4_2o,v_4x4_3o,v_4x4_4o;
  wire [7:0] ad_8b_1s,ad_8b_2s,ad_8b_3s;
  wire ad_8b_1c,ad_8b_2c,ad_8b_3c;
  vedic_4x4 v_4x4_1 (.a(a[3:0]),.b(b[3:0]),.out(v_4x4_1o));
  vedic_4x4 v_4x4_2 (.a(a[3:0]),.b(b[7:4]),.out(v_4x4_2o));
  vedic_4x4 v_4x4_3 (.a(a[7:4]),.b(b[3:0]),.out(v_4x4_3o));
  vedic_4x4 v_4x4_4 (.a(a[7:4]),.b(b[7:4]),.out(v_4x4_4o));
  adder_8b ad_8b_1 (.a(v_4x4_2o),.b(v_4x4_3o),.carry(ad_8b_1c),.sum(ad_8b_1s));
  adder_8b ad_8b_2 (.a({4'b0,v_4x4_1o[7:4]}),.b(ad_8b_1s),.carry(ad_8b_2c),.sum(ad_8b_2s));
  adder_8b ad_8b_3 (.a({ad_8b_2c,3'b0,ad_8b_2s[7:4]}),.b(v_4x4_4o),.carry(ad_8b_3c),.sum(ad_8b_3s));
  assign out ={ad_8b_3s,ad_8b_2s[3:0],v_4x4_1o[3:0]};
endmodule
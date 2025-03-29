`include "vedic_8x8.v"
`include "adder_16b.v"

module vedic_16x16(input [15:0] a,b,
                   output [31:0] out);
  wire [15:0] v_8x8_1o,v_8x8_2o,v_8x8_3o,v_8x8_4o;
  wire [15:0] ad_16b_1s,ad_16b_2s,ad_16b_3s;
  wire ad_16b_1c,ad_16b_2c,ad_16b_3c;
  
  vedic_8x8 v_8x8_1 (.a(a[7:0]),.b(b[7:0]),.out(v_8x8_1o));
  vedic_8x8 v_8x8_2 (.a(a[7:0]),.b(b[15:8]),.out(v_8x8_2o));
  vedic_8x8 v_8x8_3 (.a(a[15:8]),.b(b[7:0]),.out(v_8x8_3o));
  vedic_8x8 v_8x8_4 (.a(a[15:8]),.b(b[15:8]),.out(v_8x8_4o));
  
  adder_16b ad_16b_1 (.a(v_8x8_2o),.b(v_8x8_3o),.carry(ad_16b_1c),.sum(ad_16b_1s));
  adder_16b ad_16b_2 (.a({8'b0,v_8x8_1o[15:8]}),.b(ad_16b_1s),.carry(ad_16b_2c),.sum(ad_16b_2s));
  adder_16b ad_16b_3 (.a({ad_16b_1c,7'b0,ad_16b_2s[15:8]}),.b(v_8x8_4o),.carry(ad_16b_3c),.sum(ad_16b_3s));
  
  assign out={ad_16b_3s,ad_16b_2s[7:0],ad_16b_1s[7:0]};
  
endmodule
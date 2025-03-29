`include "vedic_16x16.v"
`include "adder_32b.v"


module vedic_32x32(input [31:0]a,b,
                   output [63:0] out);
  
  wire [31:0] v_16x16_1o,v_16x16_2o,v_16x16_3o,v_16x16_4o;
  wire [31:0] ad_32b_1s,ad_32b_2s,ad_32b_3s;
  wire ad_32b_1c,ad_32b_2c,ad_32b_3c;
  
  vedic_16x16 v_16x16_1 (.a(a[15:0]),.b(b[15:0]),.out(v_16x16_1o));
  vedic_16x16 v_16x16_2 (.a(a[15:0]),.b(b[31:16]),.out(v_16x16_2o));
  vedic_16x16 v_16x16_3 (.a(a[31:16]),.b(b[15:0]),.out(v_16x16_3o));
  vedic_16x16 v_16x16_4 (.a(a[31:16]),.b(b[31:16]),.out(v_16x16_4o));
  
  adder_32b ad_32b_1 (.a(v_16x16_2o),.b(v_16x16_3o),.carry(ad_32b_1c),.sum(ad_32b_1s));
  adder_32b ad_32b_2 (.a({16'b0,v_16x16_1o[31:16]}),.b(ad_32b_1s),.carry(ad_32b_2c),.sum(ad_32b_2s));
  adder_32b ad_32b_3 (.a({16'b0,ad_32b_2s[31:16]}),.b(v_16x16_4o),.carry(ad_32b_3c),.sum(ad_32b_3s));
  
  assign out={ad_32b_3s,ad_32b_2s[15:0],ad_32b_1s[15:0]};
  
endmodule
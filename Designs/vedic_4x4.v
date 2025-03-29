`include "vedic_2x2.v"
`include "adder_4b.v"

module vedic_4x4(input [3:0]a,b,
                 output [7:0] out);
  wire [3:0] v_2x2_2o,v_2x2_3o,v_2x2_1o,v_2x2_4o;
  wire [3:0] ad_4b_1s,ad_4b_2s,ad_4b_3s;
  wire ad_4b_1c,ad_4b_2c,ad_4b_3c;
  
  vedic_2x2 v_2x2_1 (.a(a[1:0]),.b(b[1:0]),.out(v_2x2_1o));
  vedic_2x2 v_2x2_2 (.a(a[1:0]),.b(b[3:2]),.out(v_2x2_2o));
  vedic_2x2 v_2x2_3 (.a(a[3:2]),.b(b[1:0]),.out(v_2x2_3o));
  vedic_2x2 v_2x2_4 (.a(a[3:2]),.b(b[3:2]),.out(v_2x2_4o));
  adder_4b ad_4b_1 (.a(v_2x2_2o),.b(v_2x2_3o),.sum(ad_4b_1s),.carry(ad_4b_1c));
  adder_4b ad_4b_2 (.a({2'b0,v_2x2_1o[3:2]}),.b(ad_4b_1s),.sum(ad_4b_2s),.carry(ad_4b_2c));
  adder_4b ad_4b_3 (.a({ad_4b_1c,1'b0,ad_4b_2s[3:2]}),.b(v_2x2_4o),.sum(ad_4b_3s),.carry(ad_4b_3c));
  assign out={ad_4b_3s,ad_4b_3s[1:0],v_2x2_1o[1:0]};
  
endmodule
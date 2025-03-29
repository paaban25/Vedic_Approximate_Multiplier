module mux_21(input a,b,s,output out);
  
  assign out = s ? b:a;
  
endmodule
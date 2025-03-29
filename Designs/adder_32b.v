module adder_32b(input [31:0] a,b,
                 output [31:0] sum,
               output carry);
  wire cin = 1'b0;
  ripple_carry_adder #(.N(32),.model(1)) rca (.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(carry));
endmodule
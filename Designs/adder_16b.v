module adder_16b(input [15:0] a,b,
                 output [15:0] sum,
               output carry);
  wire cin = 1'b0;
  ripple_carry_adder #(.N(16),.model(1)) rca (.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(carry));
endmodule
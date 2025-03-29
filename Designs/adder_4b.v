`include "ripple_carry_adder.v"

module adder_4b(input [3:0] a,b,
                output [3:0] sum,
               output carry);
  wire cin = 1'b0;
  ripple_carry_adder #(.N(4),.model(1)) rca (.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(carry));
endmodule
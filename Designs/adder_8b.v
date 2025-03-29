module adder_8b(input [7:0] a,b,
                output [7:0] sum,
               output carry);
  wire cin = 1'b0;
  ripple_carry_adder #(.N(8),.model(1)) rca (.A(a), .B(b), .Cin(cin), .Sum(sum), .Cout(carry));
endmodule
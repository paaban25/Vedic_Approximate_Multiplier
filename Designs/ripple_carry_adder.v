`include "ripple_carry_adder1.v"
`include "ripple_carry_adder2.v"
`include "ripple_carry_adder3.v"
`include "ripple_carry_adder4.v"
`include "ripple_carry_adder5.v"
`include "ripple_carry_adder6.v"
`include "ripple_carry_adder7.v"
`include "ripple_carry_adder8.v"
`include "ripple_carry_adder9.v"
`include "ripple_carry_adder10.v"
`include "ripple_carry_adder11.v"


module ripple_carry_adder #(parameter N=8,model=2)
  (input [N-1:0] A, B,
  input Cin,
  output [N-1:0] Sum,
  output Cout);
  
  generate
    case(model)
      1:
        begin
          ripple_carry_adder1 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      2:
        begin
          ripple_carry_adder2 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      3:
        begin
          ripple_carry_adder3 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      4:
        begin
          ripple_carry_adder4 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      5:
        begin
          ripple_carry_adder5 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      6:
        begin
          ripple_carry_adder6 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      7:
        begin
          ripple_carry_adder7 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      8:
        begin
          ripple_carry_adder8 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      9:
        begin
          ripple_carry_adder9 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      10:
        begin
          ripple_carry_adder10 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
      11:
        begin
          ripple_carry_adder11 #(.N(N)) rca_inst (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
        end
    endcase
    
  endgenerate
  
endmodule
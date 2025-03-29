`timescale 1ns / 1ps

module vedic_2x2_tb;
  reg [1:0] a, b;
  wire [3:0] out;

  // Instantiate the Vedic 2x2 multiplier
  vedic_2x2 uut (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    // Apply all possible combinations of a and b
    $display("A B | Output");
    $display("------------");
    for (int i = 0; i < 4; i = i + 1) begin
      for (int j = 0; j < 4; j = j + 1) begin
        a = i;
        b = j;
        #10;
        $display("%b %b | %b", a, b, out);
      end
    end

    $stop;
  end
endmodule

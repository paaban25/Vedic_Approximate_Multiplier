`timescale 1ns / 1ps

module vedic_4x4_tb;
  reg [3:0] a, b;
  wire [7:0] out;
  int pass_count = 0;
  int fail_count = 0;

  // Instantiate the Vedic 4x4 multiplier
  vedic_4x4 uut (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    $display("A B | Output | Result");
    $display("-----------------------------");
    for (int i = 0; i < 16; i = i + 1) begin
      for (int j = 0; j < 16; j = j + 1) begin
        a = i;
        b = j;
        #10;
        if (out == i * j) begin
          $display("%b %b | %b | Passed", a, b, out);
          pass_count++;
        end else begin
          $display("%b %b | %b | Failed", a, b, out);
          fail_count++;
        end
      end
    end

    $display("\nTest Summary: %0d Passed, %0d Failed", pass_count, fail_count);
    $stop;
  end
endmodule

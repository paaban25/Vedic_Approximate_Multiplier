`timescale 1ns / 1ps

module vedic_8x8_tb;
  reg [7:0] a, b;
  wire [15:0] out;
  int pass_count = 0;
  int fail_count = 0;

  // Instantiate the Vedic 8x8 multiplier
  vedic_8x8 uut (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    $display("A B | Output | Result");
    $display("-------------------------------------------");
    for (int i = 0; i < 256; i = i + 1) begin
      for (int j = 0; j < 256; j = j + 1) begin
        a = i;
        b = j;
        #10;
        if (out == i * j) begin
          $display("%d %d | %d | Passed", a, b, out);
          pass_count++;
        end else begin
          $display("%d %d | %d | Failed", a, b, out);
          fail_count++;
        end
      end
    end

    $display("\nTest Summary: %0d Passed, %0d Failed", pass_count, fail_count);
    $stop;
  end
endmodule

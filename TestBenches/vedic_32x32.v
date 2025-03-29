`timescale 1ns / 1ps

module vedic_32x32_tb;
  reg [31:0] a, b;
  wire [63:0] out;
  reg [63:0] out_actual;
  int pass_count = 0;
  int fail_count = 0;

  // Instantiate the Vedic 32x32 multiplier
  vedic_32x32 uut (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    //$dumpfile("vedic_32x32_tb.vcd");
    //$dumpvars(0, vedic_32x32_tb);
    $display("A B | Output | Expected | Result");
    $display("------------------------------------------------------------");

    for (int i = 0; i < 200; i = i + 1) begin
      a = $random;
      b = $random;
      out_actual = a*b;
      #10;

      if (out == a * b) begin
        $display("%h %h | %h | %h | Passed", a, b, out, out_actual);
        pass_count++;
      end else begin
        $display("%h %h | %h | %h | Failed", a, b, out, out_actual);
        fail_count++;
      end
    end

    $display("\nTest Summary: %0d Passed, %0d Failed", pass_count, fail_count);
    $stop;
  end
endmodule

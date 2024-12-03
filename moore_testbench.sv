`timescale 1ns/1ps

module moore_sequence_detector_tb();
    reg clk, reset, in;
    wire out;

    // Instantiate the DUT
    moore_sequence_detector dut(
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        $dumpfile("moore_waveform.vcd"); // VCD output
        $dumpvars(0, moore_sequence_detector_tb);

        reset = 1; in = 0;
        #12 reset = 0;

        // Input sequence: 1011
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1; // Sequence "1011" detected
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1; // Random inputs

        #50 $finish;
    end
endmodule

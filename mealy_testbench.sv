`timescale 1ns/1ps

module state_machine_mealy_tb();
    reg clk, reset, in;
    wire out;

    // Instantiate the DUT
    state_machine_mealy #(2'b11) dut(.clk(clk), .reset(reset), .in(in), .out(out));

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate clock with period of 10ns
    end

    // Test Sequence
    initial begin
        $dumpfile("mealy_waveform.vcd");
        $dumpvars(0, state_machine_mealy_tb);

        // Reset and Initialize
        reset = 1;
        in = 0;
        #10 reset = 0;

        // Sequence Testing
        #10 in = 1;
        #10 in = 1; // Sequence 11 detected
        #10 in = 0;
        #10 in = 1;
        #10 in = 1; // Sequence 11 detected
        #10 in = 0;

        // Additional Random Input
        #20 in = 1;
        #10 in = 1; // Sequence 11 detected
        #10 in = 0;
        #20;

        $finish;
    end
endmodule

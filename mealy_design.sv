`timescale 1ns/1ps

module state_machine_mealy #(parameter SEQ = 2'b11) (input clk, reset, in, output reg out);
    parameter IDLE = 2'b00, ONE = 2'b01, DETECT = 2'b10;

    reg [1:0] state, next_state;

    // State Transition Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (in == SEQ[1])
                    next_state = ONE;
                else
                    next_state = IDLE;
            end
            ONE: begin
                if (in == SEQ[0])
                    next_state = DETECT;
                else if (in == SEQ[1])
                    next_state = ONE; // Remain in ONE for consecutive 1s
                else
                    next_state = IDLE;
            end
            DETECT: begin
                if (in == SEQ[1])
                    next_state = ONE;
                else
                    next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    // Output Logic
    always @(state) begin
        case (state)
            IDLE: out = 0;
            ONE: out = 0;
            DETECT: out = 1; // Sequence detected
            default: out = 0;
        endcase
    end
endmodule

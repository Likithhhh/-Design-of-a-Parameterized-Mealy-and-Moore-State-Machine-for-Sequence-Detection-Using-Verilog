// Advanced Moore State Machine
module moore_sequence_detector #(parameter SIZE = 4) (
    input clk,
    input reset,
    input in,
    output reg out
);
    // State encoding using parameters
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    reg [2:0] state, next_state;

    // Sequential logic for state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        // Default assignments
        next_state = S0;
        out = 0;

        case (state)
            S0: if (in) next_state = S1; else next_state = S0;
            S1: if (!in) next_state = S2; else next_state = S1;
            S2: if (in) next_state = S3; else next_state = S0;
            S3: if (in) next_state = S4; else next_state = S2;
            S4: begin
                out = 1; // Sequence detected
                if (!in) next_state = S2; else next_state = S4;
            end
            default: next_state = S0; // Error recovery
        endcase
    end
endmodule

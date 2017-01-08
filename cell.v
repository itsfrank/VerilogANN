module neuron #(parameter NUM_INPUTS, NUM_OUTPUTS)(
    input [NUM_INPUTS-1:0] inputs[7:0],
    output reg [NUM_OUTPUTS-1:0] outputs[7:0],
    reg [NUM_INPUTS-1:0] weights[7:0]
);

    wire [NUM_INPUTS-1:0] weighted_inputs[7:0];
    wire [NUM_INPUTS-2:0] summation_steps[7:0];
    wire [7:0] sum;

    genvar i, j, k;
    generate
        for (i=0; i<NUM_INPUTS; i++) begin
            assign weighted_inputs[i] = inputs[i] * weights[i];
        end

        if (NUM_INPUTS == 2) begin
            assign sum = weighted_inputs[0] + weighted_inputs[1];
        end else begin
            assign summation_steps[0] = weighted_inputs[0] + weighted_inputs[1];
            for (i=1; i<NUM_INPUTS-1; i++) begin
                assign summation_steps[i] = summation_steps[i-1] + weighted_inputs[i+1];
            end
            assign sum = summation_steps[NUM_INPUTS-2];
        end

        for(i=0; i<NUM_OUTPUTS; i++) begin
            activation_fn act(.in(sum), .out(outputs[i]));
        end
    endgenerate
endmodule

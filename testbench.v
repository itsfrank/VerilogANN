module testbench;
    reg [7:0] a;
    wire [7:0] b;

    initial begin
        a = 8'd192;
    end

    activation_fn MUT(a, b);
endmodule // testbench

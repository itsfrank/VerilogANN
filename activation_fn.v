module activation_fn (in, out);
    input [7:0] in;
    output reg [7:0] out;

    integer temp;

    always @ ( in ) begin
        temp = in;
        if (temp < 64) begin
            temp = 0;
        end else if (temp > 191) begin
            temp = 255;
        end else begin
            temp = ((temp + temp) - 128);
        end
	out <= temp;
    end
endmodule // activation_fn

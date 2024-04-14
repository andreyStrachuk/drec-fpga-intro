module clk_div #(parameter X = 12) (
    input clk,

    output clk_out
);

reg [X:0]cnt = 0;
assign clk_out = (cnt == 2 ** X);

always @(posedge clk) begin
    if (clk_out)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

endmodule

// duty cycle = 2 / (2 ^ (X + 1) + 1)

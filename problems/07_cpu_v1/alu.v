module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,

    output reg [31:0]res
);

always @(*) begin
    casez (op)
        3'b001: begin
            res <= src_a + src_b;
        end
        3'b100: begin
            res <= src_a ^ src_b;
        end
         3'b110: begin
            res <= src_a | src_b;
        end
        3'b111: begin
            res <= src_a & src_b;
        end
        default: begin
            res <= src_a;
        end
    endcase
end

endmodule

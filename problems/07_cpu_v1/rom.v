module rom #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(
    input [2 ** ADDR_WIDTH - 1:0]addr,
    input clk,
    output reg [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[0:2 ** ADDR_WIDTH - 1];

initial begin
    $readmemh("samples/addi.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule


`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for problem set #02
*/

module testbench();

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

/*
*   Problem 2/3:
*   Make an instance of your new module clk_div.
*   Create approprite wires to test it.
*/

wire clk2;

clk_div clk_div1(.clk(clk), .clk_out(clk2));

initial begin
    $dumpvars;      /* Open for dump of signals */
    /*
    *   Problem 2/3:
    *   Stop simulation after several cycles of your (divided) clock.
    */
    $display("Test started...");   /* Write to console */
    #16384 $finish;
end

endmodule

module sign_ext(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 4:
*   Describe sign extension logic.
*/

wire msb = imm[11];
wire [19:0]extended_sign = {20{msb}};
assign ext_imm = {extended_sign, imm};

endmodule

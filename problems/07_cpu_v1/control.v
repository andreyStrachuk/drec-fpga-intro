module control(
    input [31:0]instr,

    output reg [11:0]imm12,
    output reg rf_we,
    output reg [2:0]alu_op,
    output reg flag_imm
);

wire [6:0]opcode = instr[6:0];
wire [2:0]funct3 = instr[14:12];
wire [1:0]funct2 = instr[26:25];
wire [4:0]funct5 = instr[31:27];

always @(*) begin
    rf_we = 1'b0;
    alu_op = 3'b0;
    imm12 = 12'b0;
    flag_imm = 1'b1;

    casez ({funct5, funct2, funct3, opcode})
        17'b00000_00_000_0110011: begin // ADD
            rf_we = 1'b1;
            alu_op = 3'b001;
            flag_imm = 0;
        end
        17'b?????_??_000_0010011: begin // ADDI
            rf_we = 1'b1;
            alu_op = 3'b001;
            imm12 = instr[31:20];
        end
        17'b00000_00_100_0010011: begin // XOR
            rf_we = 1'b1;
            alu_op = 3'b100;
            flag_imm = 0;
        end
        17'b?????_??_100_0010011: begin // XORI
            rf_we = 1'b1;
            alu_op = 3'b100;
            imm12 = instr[31:20];
        end
        17'b00000_00_110_0010011: begin // OR
            rf_we = 1'b1;
            alu_op = 3'b110;
            flag_imm = 0;
        end
        17'b?????_??_110_0010011: begin // ORI
            rf_we = 1'b1;
            alu_op = 3'b110;
            imm12 = instr[31:20];
        end
        17'b00000_00_111_0010011: begin // AND
            rf_we = 1'b1;
            alu_op = 3'b111;
            flag_imm = 0;
        end
        17'b?????_??_111_0010011: begin // ANDI
            rf_we = 1'b1;
            alu_op = 3'b111;
            imm12 = instr[31:20];
        end
        default: ;
    endcase
end

endmodule

import risc_pkg::*;

module alu(
    input logic [31:0] alu_a,
    input logic [31:0] alu_b,
    input alu_opt_t alu_op,

    output logic [31:0] alu_res
);

logic signed [31:0] signed_a;
logic signed [31:0] signed_b;

always_comb begin
    case(alu_op)
        ADD:
            alu_res = alu_a + alu_b;
        SUB:
            alu_res = alu_a - alu_b;
        SLL:
            alu_res = alu_a << alu_b[4:0];
        SRL:
            alu_res = alu_a >> alu_b[4:0];
        SRA:
            alu_res = signed_a >> alu_b[4:0];
        OR:
            alu_res = alu_a | alu_b;
        AND:
            alu_res = alu_a & alu_b;
        XOR:
            alu_res = alu_a ^ alu_b;
        SLTU:
            alu_res = (alu_a < alu_b) ? 32'h1 : 32'h0;
        SLT:
            alu_res = (signed_a < signed_b) ? 32'h1 : 32'h0;
    endcase
end
    
endmodule
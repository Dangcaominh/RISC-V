import risc_pkg::*;

module decode (
    input logic [31:0] instruction,

    output logic [4:0] rs1_addr,
    output logic [4:0] rs2_addr,
    output logic [4:0] rd_addr,
    output logic [6:0] optcode,
    output logic [2:0] func3,
    output logic [6:0] func7,

    output logic r_type,
    output logic i_type,
    output logic s_type,
    output logic b_type,
    output logic u_type,
    output logic j_type,

    output logic [31:0] immediate
);

logic [31:0] imm_i_type;
logic [31:0] imm_s_type;
logic [31:0] imm_b_type;
logic [31:0] imm_u_type;
logic [31:0] imm_j_type;

assign imm_i_type = {{20{instruction[31]}}, instruction[31:20]};
assign imm_s_type = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
assign imm_b_type = {{19{instruction[31]}}, instruction[7], instruction[30:25],  instruction[11:8], 1'b0};


endmodule
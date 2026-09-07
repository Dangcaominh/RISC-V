import risc_pkg::*;

module branch_control (
    input logic [31:0] opr_a,
    input logic [31:0] opr_b,

    input logic is_b_type,
    input logic [2:0] funct3,

    output logic branch_taken
);
    
endmodule
module register_file (
    input logic clk,
    input logic rst_n,

    input logic [4:0] rs1_addr,
    input logic [4:0] rs2_addr,

    input logic [4:0] rd_addr,
    input logic rf_wr_en,
    input logic [31:0] wr_data,

    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);

logic [31:0] register [0:31];

always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        for(int i = 0; i < 32; i = i + 1) begin
            register[i] <= 32'h0;
        end
    end else if (rf_wr_en && rd_addr != 5'h0) begin
        register[rd_addr] <= wr_data;
    end
end

assign rs1_data = register[rs1_addr];
assign rs2_data = register[rs2_addr];

endmodule
import risc_pkg::*;

module data_memory #(
    parameter ADDR_WIDTH = 6,
    parameter DATA_WIDTH = 8
) (
    input logic         clk,
    input logic         dmem_req,
    input logic         dmem_wr_en,
    input mem_size_t    dmem_data_size,
    input logic [31:0]  dmem_addr,
    input logic [31:0]  dmem_wr_data,
    input logic         dmem_zero_extend,

    output logic [31:0] dmem_rd_data
);

logic [DATA_WIDTH - 1 : 0] mem [0 : (2**ADDR_WIDTH) - 1];

always_ff @(posedge clk) begin
    if(dmem_req && dmem_wr_en) begin
        case(dmem_data_size)
            BYTE:
                mem[dmem_addr] <= dmem_wr_data[7:0];
            HALF_WORD:
                {mem[dmem_addr + 1], mem[dmem_addr]} <= dmem_wr_data[15:0];
            WORD:
                {mem[dmem_addr + 3], mem[dmem_addr + 2], mem[dmem_addr + 1], mem[dmem_addr]} <= dmem_wr_data;
        endcase
    end
end

always_comb begin
    dmem_rd_data = 32'h0;
    if(dmem_req && !dmem_wr_en) begin
        case(dmem_data_size)
            BYTE:
                dmem_rd_data = dmem_zero_extend ? {24'h0, mem[dmem_addr]} :
                                                    {{24{mem[dmem_addr][7]}}, mem[dmem_addr]};
            HALF_WORD:
                dmem_rd_data = dmem_zero_extend ? {16'h0, mem[dmem_addr + 1],mem[dmem_addr]} :
                                                    {{16{mem[dmem_addr + 1][7]}}, mem[dmem_addr + 1],mem[dmem_addr]};
            WORD:
                dmem_rd_data = {mem[dmem_addr + 3], mem[dmem_addr + 2], mem[dmem_addr + 1], mem[dmem_addr]};
        endcase
    end
end

endmodule
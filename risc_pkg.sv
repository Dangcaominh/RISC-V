package risc_pkg;

    typedef enum logic [6:0] {  
        OPTCODE_R_TYPE = 7'h33,
        OPTCODE_I_LOAD = 7'h03,
        OPTCODE_I_ALU  = 7'h13,
        OPTCODE_I_JALR = 7'h67,
        OPTCODE_S_TYPE = 7'h23,
        OPTCODE_B_TYPE = 7'h63,
        OPTCODE_LUI    = 7'h37,
        OPTCODE_AUIPC  = 7'h17,
        OPTCODE_JAL    = 7'h6f
    } optcode_t;

endpackage
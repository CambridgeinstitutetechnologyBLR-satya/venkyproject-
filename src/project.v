`default_nettype none

module tt_um_sandy (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire [1:0] mode;
    assign mode = uio_in[1:0];

    reg [7:0] result;

    always @(*) begin
        case (mode)
            2'b00: result = ui_in << 1;                    // Left shift
            2'b01: result = ui_in >> 1;                    // Right shift
            2'b10: result = {ui_in[6:0], ui_in[7]};        // Rotate left
            2'b11: result = {ui_in[0], ui_in[7:1]};        // Rotate right
            default: result = ui_in;
        endcase
    end

    assign uo_out = result;

    // Disable bidirectional outputs
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Avoid unused warnings
    wire _unused = &{ena, clk, rst_n, uio_in[7:2], 1'b0};

endmodule

`default_nettype wire

module top(
    // Inputs for demux1_8e
    input demux_d,
    input demux_e,
    input [2:0] demux_s,
    
    // Inputs for p_encoder8_3
    input [7:0] encoder_d,
    
    // Inputs for decoder3_8e
    input [2:0] decoder_a,
    input decoder_e,
    
    // Select signal for mux4_1e_8b
    input [1:0] mux_s,
    
    // Output from mux4_1e_8b
    output [7:0] y
);

    // Internal wires
    wire [7:0] demux_out;
    wire [2:0] encoder_y;
    wire encoder_v;  // Valid signal from encoder (not used in current design)
    wire [7:0] encoder_out;
    wire [7:0] decoder_out;
    
    // Instantiate demux1_8e
    demux1_8e demux_inst (
        .y(demux_out),
        .d(demux_d),
        .e(demux_e),
        .s(demux_s)
    );
    
    // Instantiate p_encoder8_3
    p_encoder8_3 encoder_inst (
        .y(encoder_y),
        .v(encoder_v),
        .d(encoder_d)
    );
    
    // Pad encoder output from 3-bit to 8-bit
    assign encoder_out = {5'd0, encoder_y};
    
    // Instantiate decoder3_8e
    decoder3_8e decoder_inst (
        .d(decoder_out),
        .a(decoder_a),
        .e(decoder_e)
    );
    
    // Instantiate mux4_1e_8b
    // Input 0 (a) <- demux_out
    // Input 1 (b) <- encoder_out
    // Input 2 (c) <- decoder_out
    // Input 3 (d) <- 8'b0
    mux4_1e_8b mux_inst (
        .y(y),
        .a(demux_out),
        .b(encoder_out),
        .c(decoder_out),
        .d(8'b00000000),
        .s(mux_s)
    );

endmodule

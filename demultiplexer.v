module demultiplexer(
    input [7:0] data,
    input [1:0] sel,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D
);

always @(*) begin
    case(sel)
        2'b00: {A} <= {data};
        2'b01: {B} <= {data};
        2'b10: {C} <= {data};
        2'b11: {D} <= {data};
    endcase

end

endmodule
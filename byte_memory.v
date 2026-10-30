module byte_memory (
    input [7:0] data,
    input store,
    output reg [7:0] memory
);

always @(data, memory) begin
    if (store)
        memory <= data;
end

endmodule
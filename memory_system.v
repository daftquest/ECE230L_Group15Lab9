module memory_system (
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);

wire [7:0] transferMem[3:0];
wire [7:0] outTransferMem[3:0];

demultiplexer dmuxInst(
    .data(data),
    .sel(addr),
    .A(transferMem[3]),
    .B(transferMem[2]),
    .C(transferMem[1]),
    .D(transferMem[0])
);

byte_memory instA(
    .data(transferMem[3]),
    .store(store),
    .memory(outTransferMem[3])
);

byte_memory instB(
    .data(transferMem[2]),
    .store(store),
    .memory(outTransferMem[2])
);

byte_memory instC(
    .data(transferMem[1]),
    .store(store),
    .memory(outTransferMem[1])
);

byte_memory instD(
    .data(transferMem[0]),
    .store(store),
    .memory(outTransferMem[0])
);

always @(*) begin
    case(addr)
        2'b00: {memory} <= {outTransferMem[3]};
        2'b01: {memory} <= {outTransferMem[2]};
        2'b10: {memory} <= {outTransferMem[1]};
        2'b11: {memory} <= {outTransferMem[0]};
    endcase
end

endmodule
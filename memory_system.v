module memory_system (
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);

reg [7:0] regMem[3:0];
reg [7:0] outRegMem[3:0];

wire [7:0] transferMem[3:0];
wire [7:0] outTransferMem[3:0];

demultiplexer dmuxInst(
    .data(data),
    .sel(addr),
    .A(regMem[3]),
    .B(regMem[2]),
    .C(regMem[1]),
    .D(regMem[0])
);

always @(*) begin
    transferMem[0] <= regMem[0];
    transferMem[1] <= regMem[1];
    transferMem[2] <= regMem[2];
    transferMem[3] <= regMem[3];
end

byte_memory instA(
    .data(transferMem[3]),
    .store(store),
    .memory(outRegMem[3])
);

byte_memory instB(
    .data(transferMem[2]),
    .store(store),
    .memory(outRegMem[2])
);

byte_memory instC(
    .data(transferMem[1]),
    .store(store),
    .memory(outRegMem[1])
);

byte_memory instD(
    .data(transferMem[0]),
    .store(store),
    .memory(outRegMem[0])
);

always @(*) begin
    outTransferMem[0] <= outRegMem[0];
    outTransferMem[1] <= outRegMem[1];
    outTransferMem[2] <= outRegMem[2];
    outTransferMem[3] <= outRegMem[3];
    case(addr)
        2'b00: {memory} <= {outTransferMem[3]};
        2'b01: {memory} <= {outTransferMem[2]};
        2'b10: {memory} <= {outTransferMem[1]};
        2'b11: {memory} <= {outTransferMem[0]};
    endcase
end

endmodule
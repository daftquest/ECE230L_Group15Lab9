module d_latch(
    input D,
    input E,
    output reg Q,
    output reg NotQ
);

always @(D, E) begin
    if (E) begin
        Q <= D;
        NotQ <= ~Q;
    end

end

endmodule
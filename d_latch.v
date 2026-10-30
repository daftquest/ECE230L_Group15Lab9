module d_latch(
    input D,
    input E,
    output reg Q,
    output reg NotQ
);

always @(D, E) begin
    if (D && E) begin
        Q <= ~(~(D && E) && NotQ);
        NotQ <= ~Q;
    end
    else if (~D && E) begin
        NotQ <= ~(~(~D && E) && Q);
        Q <= ~NotQ;
    end

end

endmodule
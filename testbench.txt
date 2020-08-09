`timescale 1ns/1ps

module tb;
    reg [7:0] dividend = 8'b00000000;
    reg [3:0] divisor = 4'b0000;
    wire [4:0] quotient;
    reg [1:0] rc1$inout$reg = 2'bZZ;
    wire [1:0] rc1 = rc1$inout$reg;
    reg [1:0] rc2$inout$reg = 2'bZZ;
    wire [1:0] rc2 = rc2$inout$reg;
    reg [1:0] rc0$inout$reg = 2'bZZ;
    wire [1:0] rc0 = rc0$inout$reg;
    wire [2:0] remainder;
    reg [1:0] dvs_cb2$inout$reg = 2'bZZ;
    wire [1:0] dvs_cb2 = dvs_cb2$inout$reg;
    reg [1:0] dvd_c2$inout$reg = 2'bZZ;
    wire [1:0] dvd_c2 = dvd_c2$inout$reg;
    reg [1:0] dvd_c1$inout$reg = 2'bZZ;
    wire [1:0] dvd_c1 = dvd_c1$inout$reg;
    reg [1:0] dvd_c0$inout$reg = 2'bZZ;
    wire [1:0] dvd_c0 = dvd_c0$inout$reg;
    reg [4:0] b$inout$reg = 5'bZZZZZ;
    wire [4:0] b = b$inout$reg;
    reg [4:0] c$inout$reg = 5'bZZZZZ;
    wire [4:0] c = c$inout$reg;
    reg [1:0] dvs_cb1$inout$reg = 2'bZZ;
    wire [1:0] dvs_cb1 = dvs_cb1$inout$reg;
    reg [1:0] dvs_cb0$inout$reg = 2'bZZ;
    wire [1:0] dvs_cb0 = dvs_cb0$inout$reg;
    reg [1:0] dvd_c6$inout$reg = 2'bZZ;
    wire [1:0] dvd_c6 = dvd_c6$inout$reg;
    reg [1:0] dvd_c5$inout$reg = 2'bZZ;
    wire [1:0] dvd_c5 = dvd_c5$inout$reg;
    reg [1:0] dvd_c4$inout$reg = 2'bZZ;
    wire [1:0] dvd_c4 = dvd_c4$inout$reg;
    reg [1:0] dvd_c3$inout$reg = 2'bZZ;
    wire [1:0] dvd_c3 = dvd_c3$inout$reg;
    reg [1:0] dvd_c7$inout$reg = 2'bZZ;
    wire [1:0] dvd_c7 = dvd_c7$inout$reg;
    reg [1:0] qc0$inout$reg = 2'bZZ;
    wire [1:0] qc0 = qc0$inout$reg;
    reg [1:0] qc1$inout$reg = 2'bZZ;
    wire [1:0] qc1 = qc1$inout$reg;
    reg [1:0] qc2$inout$reg = 2'bZZ;
    wire [1:0] qc2 = qc2$inout$reg;
    reg [1:0] qc3$inout$reg = 2'bZZ;
    wire [1:0] qc3 = qc3$inout$reg;
    reg [1:0] qc4$inout$reg = 2'bZZ;
    wire [1:0] qc4 = qc4$inout$reg;
    reg [1:0] dvs_c2$inout$reg = 2'bZZ;
    wire [1:0] dvs_c2 = dvs_c2$inout$reg;
    reg [1:0] dvs_c1$inout$reg = 2'bZZ;
    wire [1:0] dvs_c1 = dvs_c1$inout$reg;
    reg [1:0] dvs_c0$inout$reg = 2'bZZ;
    wire [1:0] dvs_c0 = dvs_c0$inout$reg;


    div UUT (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .rc1(rc1),
        .rc2(rc2),
        .rc0(rc0),
        .remainder(remainder),
        .dvs_cb2(dvs_cb2),
        .dvd_c2(dvd_c2),
        .dvd_c1(dvd_c1),
        .dvd_c0(dvd_c0),
        .b(b),
        .c(c),
        .dvs_cb1(dvs_cb1),
        .dvs_cb0(dvs_cb0),
        .dvd_c6(dvd_c6),
        .dvd_c5(dvd_c5),
        .dvd_c4(dvd_c4),
        .dvd_c3(dvd_c3),
        .dvd_c7(dvd_c7),
        .qc0(qc0),
        .qc1(qc1),
        .qc2(qc2),
        .qc3(qc3),
        .qc4(qc4),
        .dvs_c2(dvs_c2),
        .dvs_c1(dvs_c1),
        .dvs_c0(dvs_c0));

    initial begin
        // -------------  Current Time:  100ns
        #100;
        dividend = 8'b11110001;
        divisor = 4'b1110;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        dividend = 8'b11001000;
        divisor = 4'b1000;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #200;
        dividend = 8'b11001100;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #200;
        dividend = 8'b11101010;
    end

endmodule


// Testbench for 4-Bit ALU
module tb_alu_4bit;

// Test signals
reg [3:0] a, b;
reg [3:0] opcode;
reg enable;
wire [3:0] result;
wire zero, carry, overflow;

// Instantiate ALU
four_bit_alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .enable(enable),
    .result(result),
    .zero(zero),
    .carry(carry),
    .overflow(overflow)
);

// Test procedure
initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0, tb_alu_4bit);
    
    // Initialize
    a = 0; b = 0; opcode = 0; enable = 0;
    #10;
    
    enable = 1;
    $display("=== 4-Bit ALU Test Results ===");
    $display("Time\tA\tB\tOp\tResult\tZ\tC\tV\tOperation");
    $display("----\t--\t--\t--\t------\t-\t-\t-\t---------");
    
    // Test Addition
    a = 4'b0101; b = 4'b0011; opcode = 4'b0000; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tADD", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Subtraction
    a = 4'b1000; b = 4'b0011; opcode = 4'b0001; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tSUB", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Overflow in Addition
    a = 4'b0111; b = 4'b0001; opcode = 4'b0000; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tADD (Overflow)", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Logical AND
    a = 4'b1100; b = 4'b1010; opcode = 4'b0100; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tAND", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Logical OR
    a = 4'b1100; b = 4'b1010; opcode = 4'b0101; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tOR", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test XOR
    a = 4'b1100; b = 4'b1010; opcode = 4'b0110; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tXOR", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test NOT
    a = 4'b1010; opcode = 4'b0111; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tNOT", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Shift Left
    a = 4'b0110; opcode = 4'b1000; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tSHL", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Shift Right
    a = 4'b0110; opcode = 4'b1001; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tSHR", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Zero flag
    a = 4'b0101; b = 4'b1011; opcode = 4'b0001; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tSUB (Zero)", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    // Test Enable signal
    enable = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\tDisabled", 
             $time, a, b, opcode, result, zero, carry, overflow);
    
    $display("\n=== Test Complete ===");
    $finish;
end

endmodule

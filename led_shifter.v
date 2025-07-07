module LedShifter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output  reg [7:0] leds
);

    localparam QUARTER_SECOND = CLK_FREQ/4; 
    reg [31:0] counter;

    always @(posedge clk) begin
        if (!rst_n) begin
            leds <= 8'b00011111;
            counter <= 'h0000;
        end
        else begin
            if (counter >= QUARTER_SECOND - 1)begin
                counter <= 0;
                leds <= {leds[6:0], leds[7]};
            end
            else begin
                counter <= counter + 1;
            end
        end 
    end
    
endmodule
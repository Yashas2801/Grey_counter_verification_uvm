module grey_rtl (
    input  wire       clk,        // Clock signal
    input  wire       rst,        // Reset signal
    output reg  [3:0] gray_count  // Gray code counter output
);
  reg [3:0] bin_count;  // Binary counter

  always @(posedge clk) begin
    if (rst) begin
      gray_count <= 4'b0000;  // Reset Gray count
      bin_count  <= 4'b0000;  // Reset binary count
    end else begin
      bin_count <= bin_count + 1;  // Increment binary count
      gray_count <= {
        bin_count[3],
        bin_count[3] ^ bin_count[2],
        bin_count[2] ^ bin_count[1],
        bin_count[1] ^ bin_count[0]
      };  // Convert binary to Gray code
    end
  end
endmodule

module grey_top;
  import uvm_pkg::*;
  import grey_pkg::*;

  bit clk;
  grey_if if0 (clk);

  always #5 clk = ~clk;

  grey_rtl dut (
      .clk(if0.clk),
      .rst(if0.rst),
      .gray_count(if0.grey_count)
  );

  initial begin
    uvm_config_db#(virtual grey_if)::set(null, "*", "vif", if0);
    run_test();
  end

  property counter_seq_check;
    @(posedge clk) disable iff (if0.rst) $countones(
        if0.grey_count ^ $past(if0.grey_count)
    ) <= 1;
  endproperty

  property reset_behaviour;
    @(posedge clk) if0.rst |-> (if0.grey_count == 4'b0000);
  endproperty

  CSQ :
  assert property (counter_seq_check) begin
    $display("1 bit is changing for each iteration");
  end else begin
    $display("1 bit is not changing for each iteration");
  end
  RB :
  assert property (reset_behaviour) begin
    $display("out is 4'b0000 when rst is asserted");
  end else begin
    $display("out is not 4'b0000 when rst is asserted");
  end

endmodule

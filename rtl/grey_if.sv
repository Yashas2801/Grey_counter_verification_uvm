interface grey_if (
    input bit clk
);

  logic rst;
  logic [3:0] grey_count;

  clocking cb @(posedge clk);
    //NOTE: Step keyword uses the finer timescale ie, the driving happens immediatly after edge of the clock
    default input #2 output #1step;
    input grey_count;
    output rst;
  endclocking

endinterface

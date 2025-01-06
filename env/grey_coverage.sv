class grey_coverage extends uvm_subscriber #(grey_xtn);
  `uvm_component_utils(grey_coverage)

  grey_xtn xtn;

  covergroup cg1;
    option.per_instance = 1;
    GREY_VALUE: coverpoint xtn.grey_count {
      bins all_values[] = {4'b0000, 4'b0001, 4'b0011, 4'b0010,
                           4'b0110, 4'b0111, 4'b0101, 4'b0100,
                           4'b1100, 4'b1101, 4'b1111, 4'b1110,
                           4'b1010, 4'b1011, 4'b1001, 4'b1000};
    }
    RESET: coverpoint xtn.rst {bins rst_high = {1}; bins rst_low = {0};}

  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    cg1 = new;
  endfunction

  function void write(grey_xtn t);
    xtn = t;
    cg1.sample;
  endfunction

  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(), $sformatf("Coverage: %0.2f%%", cg1.get_coverage()), UVM_MEDIUM);
  endfunction
endclass

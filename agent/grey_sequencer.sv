class grey_sequencer extends uvm_sequencer #(grey_xtn);

  `uvm_component_utils(grey_sequencer)

  extern function new(string name, uvm_component parent);
endclass

function grey_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

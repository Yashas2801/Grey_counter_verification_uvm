class grey_agent extends uvm_agent;

  `uvm_component_utils(grey_agent)

  grey_sequencer seqrh;
  grey_driver drvh;
  grey_monitor monh;

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass

function grey_agent::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void grey_agent::build_phase(uvm_phase phase);
  `uvm_info(get_type_name, "This is the build phase of agent", UVM_LOW)
  seqrh = grey_sequencer::type_id::create("seqrh", this);
  drvh  = grey_driver::type_id::create("drvh", this);
  monh  = grey_monitor::type_id::create("monh", this);
endfunction

function void grey_agent::connect_phase(uvm_phase phase);
  `uvm_info(get_type_name, "In the connect phase of agent", UVM_LOW)
  drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction

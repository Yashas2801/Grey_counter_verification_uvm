class grey_monitor extends uvm_monitor;

  `uvm_component_utils(grey_monitor)

  virtual grey_if vif;
  uvm_analysis_port #(grey_xtn) ap;

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task mon;

endclass

function grey_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
  ap = new("ap", this);
endfunction

function void grey_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info(get_type_name, "In the build phase of monitor", UVM_LOW)
  if (!uvm_config_db#(virtual grey_if)::get(this, "", "vif", vif))
    `uvm_info(get_type_name, "Faild to get vif in monitor", UVM_LOW)
endfunction

task grey_monitor::run_phase(uvm_phase phase);
  super.run_phase(phase);
  forever mon;
endtask

task grey_monitor::mon;
  grey_xtn xtn = grey_xtn::type_id::create("xtn");

  @(vif.cb);
  xtn.grey_count = vif.grey_count;
  xtn.rst = vif.rst;

  `uvm_info(get_type_name, xtn.convert2string, UVM_LOW)

  ap.write(xtn);

endtask

class grey_driver extends uvm_driver #(grey_xtn);

  `uvm_component_utils(grey_driver)
  virtual grey_if vif;
  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task drv_rst(grey_xtn xtn);

endclass

function grey_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void grey_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info(get_type_name, "In the build_phase of driver", UVM_LOW)
  if (!uvm_config_db#(virtual grey_if)::get(this, "", "vif", vif))
    `uvm_info(get_type_name, "Faild to get ", UVM_LOW)
endfunction

task grey_driver::run_phase(uvm_phase phase);
  forever begin
    seq_item_port.get_next_item(req);
    drv_rst(req);
    seq_item_port.item_done;
  end
endtask

task grey_driver::drv_rst(grey_xtn xtn);
  @(vif.cb);
  vif.rst <= xtn.rst;
endtask

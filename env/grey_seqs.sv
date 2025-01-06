class grey_seqs_base extends uvm_sequence #(grey_xtn);
  `uvm_object_utils(grey_seqs_base)

  extern function new(string name = "grey_seqs_base");
  extern task body;
endclass

function grey_seqs_base::new(string name = "grey_seqs_base");
  super.new(name);
endfunction

task grey_seqs_base::body;
  super.body();  //NOTE: writing the base seqs for future use if any
endtask

class rst_high_seqs extends grey_seqs_base;
  `uvm_object_utils(rst_high_seqs)

  extern function new(string name = "rst_high_seqs");
  extern task body;
endclass

function rst_high_seqs::new(string name = "rst_high_seqs");
  super.new(name);
endfunction

task rst_high_seqs::body;
  super.body;
  req = grey_xtn::type_id::create("req");
  start_item(req);
  `uvm_info(get_type_name, "start item unblocked", UVM_LOW)
  req.rst = 1'b1;
  finish_item(req);
  `uvm_info(get_type_name, "Finish_item unblocked", UVM_LOW)
endtask

class rst_low_seqs extends grey_seqs_base;
  `uvm_object_utils(rst_low_seqs)

  extern function new(string name = "rst_low_seqs");
  extern task body;
endclass

function rst_low_seqs::new(string name = "rst_low_seqs");
  super.new(name);
endfunction

task rst_low_seqs::body;
  super.body;
  req = grey_xtn::type_id::create("req");
  start_item(req);
  `uvm_info(get_type_name, "start item unblocked", UVM_LOW)
  req.rst = 1'b0;
  finish_item(req);
  `uvm_info(get_type_name, "Finish_item unblocked", UVM_LOW)
endtask



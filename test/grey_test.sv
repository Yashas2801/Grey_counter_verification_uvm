class grey_test extends uvm_test;
  `uvm_component_utils(grey_test)

  grey_env envh;

  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
endclass

function grey_test::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void grey_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info(get_type_name, "In the build_phase of test", UVM_LOW)
  envh = grey_env::type_id::create("envh", this);
endfunction

function void grey_test::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  `uvm_info(get_type_name, "In the end_of_elaboration_phase of test", UVM_LOW)
  uvm_top.print_topology;
  factory.print;
endfunction

class verify_grey_counter extends grey_test;
  `uvm_component_utils(verify_grey_counter)

  extern function new(string name, uvm_component parent);
  extern task run_phase(uvm_phase phase);
endclass

function verify_grey_counter::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

task verify_grey_counter::run_phase(uvm_phase phase);

  rst_high_seqs h_seqs = rst_high_seqs::type_id::create("h_seqs");
  rst_low_seqs  l_seqs = rst_low_seqs::type_id::create("l_seqs");

  phase.raise_objection(this);
  #9;
  h_seqs.start(envh.agth.seqrh);
  #15;
  l_seqs.start(envh.agth.seqrh);
  #500;
  phase.drop_objection(this);
endtask













class grey_xtn extends uvm_sequence_item;

  bit rst;
  bit [3:0] grey_count;

  `uvm_object_utils_begin(grey_xtn)
    `uvm_field_int(rst, UVM_ALL_ON)
    `uvm_field_int(grey_count, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "grey_xtn");
    super.new(name);
  endfunction

  function string convert2string();
    return $sformatf("rst=%0b | gray_count=%4b", rst, grey_count);
  endfunction

endclass

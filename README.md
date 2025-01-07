
# Verification of Grey Counter (UVM)

This project demonstrates the verification of a 4-bit Gray counter design using SystemVerilog and UVM methodology. The counter generates a Gray code sequence, ensuring only one bit changes between successive outputs.




## Architecture

![App Screenshot](https://github.com/Yashas2801/Grey_counter_verification_uvm/blob/f523667a294243463e9cb1b00a28f4c87f2f918d/Architecture.png)


## Features

- Testbench Environment: Built using UVM to verify functionality and edge cases.
- Assertions: Used to check the one-bit change property of Gray code.
- Coverage: Includes functional coverage to ensure all possible states are exercised.
- Simulation: Run on QuestaSim, with detailed logs and waveform analysis
## Directory Structure 

Tree

```bash
├── agent
│   ├── grey_agent.sv
│   ├── grey_driver.sv
│   ├── grey_moniter.sv
│   ├── grey_sequencer.sv
│   └── grey_xtn.sv
├── env
│   ├── grey_coverage.sv
│   ├── grey_env.sv
│   └── grey_seqs.sv
├── README.md
├── rtl
│   ├── grey_if.sv
│   └── grey_rtl.sv
├── sim
│   └── Makefile
├── test
│   └── grey_test.sv
└── top
    ├── grey_pkg.sv
    └── grey_top.sv

```


## Simulation and Verification


#### Tip - run this command to see what make file can do

```bash
cd sim 
make help
```


#### Running tests
- make regress - runs all the test and combines the reports
- make cov - view the coverage reports
- make view_wave2 - open the .wlf (wave file) in questa gui

```bash
  cd sim 
  make regress
  make cov
  make view_wave2
```

#### Coverage reports
The reports are available in sim/ directory

- Functional Coverage



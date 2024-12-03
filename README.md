# Advanced Design and Implementation of a Parameterized Mealy and Moore State Machine for Sequence Detection Using Verilog

## Project Overview

This project demonstrates the design and implementation of a **parameterized Mealy** and **Moore** state machine for detecting specific input sequences using Verilog. The design is capable of identifying the sequence "11" in a stream of binary inputs and is implemented with advanced features such as configurable state machines, test benches, waveform generation, and integration with simulation tools like EDA Playground.

### Key Features:
- **Parameterized State Machines**: Both Mealy and Moore state machines are implemented and configured for sequence detection.
- **Sequence Detection**: Detects the sequence "11" in a binary input stream.
- **Advanced Simulation**: Uses **test benches** for simulation, checking if the sequence is detected and generating detailed waveforms.
- **Waveform Generation**: Generates waveform files in **VCD format**, which can be visualized using tools like GTKWave for debugging and analysis.
- **Cross-Platform Compatibility**: Designed to work on any platform supporting Verilog, including EDA Playground for online simulation and local setups.

## Directory Structure

```plaintext
.
├── mealy.sv                  # Verilog code for the Mealy state machine
├── moore.sv                  # Verilog code for the Moore state machine
├── mealy_waveform.vcd        # Generated waveform for Mealy state machine simulation
├── moore_waveform.vcd        # Generated waveform for Moore state machine simulation
├── testbench_mealy.sv        # Testbench for Mealy state machine
├── testbench_moore.sv        # Testbench for Moore state machine
├── README.md                 # Project overview and documentation
└── run.sh                    # Shell script to automate the simulation

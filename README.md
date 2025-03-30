# 4-Bit ALU in Verilog

This project implements a simple **4-bit Arithmetic Logic Unit (ALU)** using Verilog. The ALU performs six basic operations based on a 3-bit control input (`sel`). Simulation is done using **Icarus Verilog**, and waveforms are visualized with **GTKWave**.

---

## Features

- **4-bit operands**: `a` and `b`
- **3-bit control input (`sel`)** for operation selection
- Supported operations:
  - `000` → ADD
  - `001` → SUBTRACT
  - `010` → AND
  - `011` → OR
  - `100` → XOR
  - `101` → SLT (Set Less Than)
- `default`: result set to `4'b0000` for unsupported operations

---



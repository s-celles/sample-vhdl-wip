# Sample VHDL

This is an example VHDL project used in Daytona.

---

## 🚀 Getting Started  

### Open Using Daytona  

1. **Install Daytona**: Follow the [Daytona installation guide](https://www.daytona.io/docs/installation/installation/).  
2. **Create the Workspace**:  
   ```bash  
   daytona create https://github.com/daytonaio/sample-vhdl/
   ```
3. **Look at the circuit**

![Circuit](circuit.png)

Architecture:


- 5 AND gates with one input inverted

![AND](and_with_1_not_as_input.png)

and

- 5 XOR gatesd

![XOR](xor.png)

Look at [circuit.vhd](circuit.vhd) VHDL code.

4. **File analysis**

   ```
   ghdl -a --std=08 circuit.vhd
   ```

Note: The `--std=08` parameter is passed in order to have access to the functions defined in the VHDL 2008 standard (to_string in particular)

4. **Development of the entity**:  
   ```bash  
   ghdl -e --std=08 circuit_test
   ```  

5. **Start the Application**:
   ```bash  
   ghdl -r --std=08 circuit_test
   ```
It should displays

```

```

---

## ✨ Features  

standardized development environment with devcontainers

console application

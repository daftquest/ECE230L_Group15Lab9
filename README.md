# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Group 15
Paul
Brian

## Summary
Implemented a D-latch logic block to store 1 bit of data and output it to one of two LEDs.

Implemented a system where 8 bits of data are passed to a demux. The output path of the demux is decided based off a 2 bit address input. 
The data from the demux is sent to one of four blocks. Each block is capable of storing 8 bits of data (byte). 
When the "clock" signal is sent, the data currently being sent to the addressed block is stored in its byte. 

On the Basys board, when the data is stored to a block, it will output to associated LEDs. 
And when the address for that block is later referenced, the same LEDs will light up. 


## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Structural verilog is how we built part 1. The d-latch made from NAND gates. We cannot use this method as a building block because we cannot predict the behavior of the individual blocks. They could have different timings, etc.  

### What is the meaning of always @(*) in a sensitivity block?
The * is a standard flag meaning "any length of any combinations of characters". With referenced by the always block, it is telling the always block to listen for and include any and all input signals.  

### What importance is memory to digital circuits?
All computers are built to do simple addition. All advanced computation is implemented using this fact in increasingly complex ways. In order to achieve this, the computer must be able to store values used in this addition. If it cant store data, it cant do math. 
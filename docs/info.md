# 8-bit Barrel Shifter

## What it does

This project implements an 8-bit Barrel Shifter using Verilog on TinyTapeout GF180.

The design takes an 8-bit input and performs shifting or rotation operations depending on the selected mode.

Supported modes:

- 00 → Left Shift
- 01 → Right Shift
- 10 → Rotate Left
- 11 → Rotate Right

Input data is provided through `ui_in[7:0]`.

Mode selection is provided using `uio_in[1:0]`.

The shifted output appears on `uo_out[7:0]`.

## How it works

The design uses combinational Verilog logic and a case statement.

Depending on the mode bits:

- Left shift moves bits toward MSB and inserts 0 at LSB
- Right shift moves bits toward LSB and inserts 0 at MSB
- Rotate left moves the MSB to LSB
- Rotate right moves the LSB to MSB

The logic is purely combinational and does not require clocked storage.

## How to test

Apply an 8-bit value to `ui_in[7:0]`.

Select the operation using `uio_in[1:0]`.

Example:

Input:

10101010

Modes:

- 00 → Output = 01010100
- 01 → Output = 01010101
- 10 → Output = 01010101
- 11 → Output = 01010101

Observe the result on `uo_out[7:0]`.

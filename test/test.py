import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_project(dut):

    # Input = 10101010
    dut.ui_in.value = 0b10101010

    # Left shift
    dut.uio_in.value = 0b00
    await Timer(1, units="ns")
    assert dut.uo_out.value == 0b01010100

    # Right shift
    dut.uio_in.value = 0b01
    await Timer(1, units="ns")
    assert dut.uo_out.value == 0b01010101

    # Rotate left
    dut.uio_in.value = 0b10
    await Timer(1, units="ns")
    assert dut.uo_out.value == 0b01010101

    # Rotate right
    dut.uio_in.value = 0b11
    await Timer(1, units="ns")
    assert dut.uo_out.value == 0b01010101

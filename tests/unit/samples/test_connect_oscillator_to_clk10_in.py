from samples.connect_oscillator_to_pxi_clk10_in import connect_oscillator_to_pxi_clk10_in

from nisync.constants import PXI_CLK10_IN, OSCILLATOR


def test_connect_oscillator_to_pxi_clk10_in(mocker, capfd):
    mock_session = mocker.patch("samples.connect_oscillator_to_pxi_clk10_in.Session")
    resource_name = "PXI1Slot2"

    connect_oscillator_to_pxi_clk10_in(resource_name)

    mock_session.assert_called_once_with(resource_name=resource_name)
    mock_session.return_value.__enter__.return_value.connect_clock_terminals.assert_called_once_with(
        source=OSCILLATOR, destination=PXI_CLK10_IN
    )
    mock_session.return_value.__exit__.assert_called()
    stdout, stderr = capfd.readouterr()
    assert "Oscillator is connected to PXI_CLK10_IN." in stdout

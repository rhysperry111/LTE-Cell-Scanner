function spectrum_scan_20M_hackrf(freq_start, lna_gain, vga_gain)
close all;
scale = 1;
sampling_rate = 19.2e6/scale;
bandwidth = 20e6/scale;
nRB = 100/scale;
r_raw = get_signal_from_sdr('hackrf', freq_start*1e6, sampling_rate, bandwidth, 0.1, lna_gain, vga_gain);
show_time_frequency_grid_raw(r_raw, sampling_rate, nRB);

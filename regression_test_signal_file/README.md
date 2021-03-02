IQ sample can be captured to file for LTE-Cell-Scanner/LTE_DL_receiver.m to use. See LTE-Cell-Scanner/Matlab/get_signal_from_sdr.m for IQ sample capture command generation.

Example:

- HackRF
```
hackrf_transfer -f 1815300000 -s 19200000 -b 20000000 -n 1728000 -l 32 -a 1 -g 50 -r tmp.bin
```

- rtlsdr
```
rtl_sdr -f 1815300000 -s 1920000 -n 172800 -g 0  tmp.bin
```

- BladeRF
```
bladeRF-cli -s bladerf.script
```
bladerf.script content:
```
set frequency rx 1815300000
set samplerate rx 19200000
set bandwidth rx 20000000
set gain rx 70
rx config file= tmp.bin format=bin n=1728000
rx start
rx wait
```

- USRP
```
uhd_rx_cfile -f 1815300000 -r 19200000 -N 1728000 -s -g 100  tmp.bin
```

Finally tmp.bin should be renamed to the formatted file name. Then feed the file name to LTE_DL_receiver.m as an argument. Example: f1815.3_s19.2_bw20_0.08s_hackrf.bin

fXXXX_sYYYY_bZZZZ_AAAAs_boardname.bin
```
XXXX: Frequency in MHz
YYYY: Sampling rate in MHz
ZZZZ: Bandwidth in MHz
AAAA: Duration in second
boardname: hackrf/rtlsdr/bladerf/usrp
```

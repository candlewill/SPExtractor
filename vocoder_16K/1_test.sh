bin/analysis_world data/test-1-16k.wav 1 1 tmp/test-1.f0 tmp/test-1.sp tmp/test-1.bapd

bin/synth_world 1024 16000 tmp/test-1.f0 tmp/test-1.sp tmp/test-1.bapd test_synth_16k.wav

rm 02*.wav 01*.wav
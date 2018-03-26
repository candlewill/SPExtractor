bin/analysis_world data/test-1.wav 1 1 tmp/test-1.f0 tmp/test-1.sp tmp/test-1.bapd

bin/synth_world 2048 48000 tmp/test-1.f0 tmp/test-1.sp tmp/test-1.bapd test_synth.wav

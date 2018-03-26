. config.sh


### WORLD Re-synthesis -- reconstruction of parameters ###

### convert lf0 to f0 ###
$sptk/sopr -magic -1.0E+10 -EXP -MAGIC 0.0 ${lf0_dir}/$file_id.lf0 | $sptk/x2x +fa > ${resyn_dir}/$file_id.resyn.f0a
$sptk/x2x +ad ${resyn_dir}/$file_id.resyn.f0a > ${resyn_dir}/$file_id.resyn.f0

### convert mgc to sp ###
$sptk/mgc2sp -a $alpha -g 0 -m $mcsize -l $nFFTHalf -o 2 ${mgc_dir}/$file_id.mgc | $sptk/sopr -d 32768.0 -P | $sptk/x2x +fd > ${resyn_dir}/$file_id.resyn.sp

### convert bap to ap ###
$sptk/mgc2sp -a $alpha -g 0 -m $order -l $nFFTHalf -o 2 ${bap_dir}/$file_id.bap | $sptk/sopr -d 32768.0 -P | $sptk/x2x +fd > ${resyn_dir}/$file_id.resyn.ap


$world/synth_world $nFFTHalf $fs ${resyn_dir}/$file_id.resyn.f0 ${resyn_dir}/$file_id.resyn.sp ${resyn_dir}/$file_id.resyn.ap $file_id.resyn.wav

rm 02*.wav 01*.wav
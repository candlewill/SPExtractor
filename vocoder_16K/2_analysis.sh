. config.sh


sox ${wav_dir}/$file_id.wav -r 16000 ${wav_dir}/${file_id}-16k.wav

file_id=${file_id}-16k

### WORLD ANALYSIS -- extract vocoder parameters ###

## extract f0, sp, ap ### 
$world/analysis_world ${wav_dir}/$file_id.wav 1 1 ${f0_dir}/$file_id.f0 ${sp_dir}/$file_id.sp ${ap_dir}/$file_id.ap

### convert f0 to lf0 ###
$sptk/x2x +da ${f0_dir}/$file_id.f0 > ${f0_dir}/$file_id.f0a
$sptk/x2x +af ${f0_dir}/$file_id.f0a | $sptk/sopr -magic 0.0 -LN -MAGIC -1.0E+10 > ${lf0_dir}/$file_id.lf0

### convert sp to mgc ###
$sptk/x2x +df ${sp_dir}/$file_id.sp | $sptk/sopr -R -m 32768.0 | $sptk/mcep -a $alpha -m $mcsize -l $nFFTHalf -e 1.0E-8 -j 30 -f 0.0 -q 3 > ${mgc_dir}/$file_id.mgc

### convert ap to bap ###
$sptk/x2x +df ${ap_dir}/$file_id.ap | $sptk/sopr -R -m 32768.0 | $sptk/mcep -a $alpha -m $order -l $nFFTHalf -e 1.0E-8 -j 30 -f 0.0 -q 3 > ${bap_dir}/$file_id.bap

rm tmp/*
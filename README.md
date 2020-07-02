# KWS-SoC
This is a SoC for neural-network acceleration based on [wujian100_open](https://github.com/T-head-Semi/wujian100_open) platform, which is a low power open source MCU by T-Head. Specially, the accelerating kernel is designed for Keyword Spotting(KWS) and the preprocess kernel is also integrated. Thus far, the current version has been verified on T-HEAD development board using CDK.
# NEW FEATURES


## QUICK START ##
This repository includes folders as following:<br>
`reference model`: <br>
  * `my_audio.py`: This is a python script for preprocessing data. <br>
  * `test_mymodel_myaudio.py`: This is a python script to generate software comparison data. <br>
  * `test_list.txt`: This file contains the label information of the test files in the dataset. <br>
  * `ds_rnn_labels.txt`: This is a mapping table between results and labels. <br> 
  * `data.dat`: This is 40 groups of floating point input data after preprocessing. <br>
  * `result.dat`: This is 40 groups of floating point result data after software computing. <br>
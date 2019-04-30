#!/bin/sh
if ! test -f example/MobileNetSSD_train.prototxt ;then
	echo "error: example/MobileNetSSD_train.prototxt does not exist."
	echo "please use the gen_model.sh to generate your own model."
        exit 1
fi
mkdir -p snapshot
mkdir -p log

file_name=train.log
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
new_fileName=$current_time-$file_name

## Fine tune from trained network weights
#../ssd_caffe/build/tools/caffe train \
$CAFFE_HOME/build/tools/caffe train \
-gpu 0 \
-solver="solver_train.prototxt" \
-weights="mobilenet_iter_73000.caffemodel" 2>&1 | tee -a log/$new_fileName


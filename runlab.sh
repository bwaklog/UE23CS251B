#!/bin/bash

docker run -it --rm --network host -e DISPLAY=$DISPLAY -v "$(pwd)/$1":/lab armsim

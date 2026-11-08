#!/bin/bash
hcc main.HC -clibs='-lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -Wall -I ./include/ -L ./lib/' -o build

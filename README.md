# Devops toolkit
This repo will help my build and recall how to work and use basic devops tools.


## About Hailo

### Data Flow Compiler
The goal is to take a NN and perform the allocation of the network on the chip.

You begin with already trained network.

The process includes parsing, model quantization, allocation and compilation.

The result is a hef file. which is basically a zip file holds the compiled network.

HailoRT (hailo runtime) will handle the upload of the hef to the chip.

### HailoRT
HailoRT is the user space library responsible to interfere with the chip, Hailo driver and FW.

The chip is connected to a computer ("host") that load the compiled network (hef) to the chip.

Our driver on the host is called Hailo PCIe driver.

The host responsibilities are:
- Loading the hef to the chip
- Preprocessing video frames
- Getting results from the chip
- Another post-processing if needed
- Display or save the results.

The basic idea is we give the chip and the client bring the host, there are also cases like Mercury when we also bring the host and than it called SoC.

### Tappas
Demos that implemented on the host. A good reference for the client to make their own design of NN.

Basically we are talking about hef (already compiled) which are wrapped with HailoRT and code (app) which done some preprocessing and postprocessing.

### My job - building automation for sw components inside hailort and tappas
The fw managing the NN core, the driver (pcie driver) responsible for connecting the fw to the user space on the host.
libhailort is the main cpp and c library controling the operations available on the user space.
Basically libhailort is the api to the fw.
Main applications of users that works with hailo wraps of libhailort in hailo:
1) Python applications via PyHailoRT.
2) Gstreamer application via HRT Gstreamer Element.
3) ONNX application via HRT ONNX Framwork.
4) CPP/C application directly on libhailort.

The abilities provided by libhailort:
1) Native c/cpp api's
2) Stream/vStream - Stream is the basic object the library use, InputStream/OutputStream oue data transfers from the host to device and back.
A kind of stream is pcie or Ethernet if works with udp. One of Stream job is to store resources on the fw.
vStream, virtual stream is complicated stream when you want to connect to the chip but using complex transformation on the data when doing it. Like adjust the user's format to match the stream's format or encompass re-ordering, re-typing, adding or removing padding, scaling/quantization, transposing etc'.
Format Order could be NV12, YUY2, NMS. Format type could by uint8, uint16, float32. Flags can be quantized, transposed.

3) Device/vDevice - device represents a single physical device, like hailo8 or Mercury and he is responsible for controls, notifications, all the work around the...

4) Model Scheduler
5) Stream Multiplexer
6) Multi-Process Service

## Git
The version control - handling basic and advanced use cases.
Also git configuration you can use.

## Linux && Bash
Bash commands, usefull bash scripts for linux, shell configurations.

## Docker Container
Basic docker image files, docker compose.

## tmux
tmux commands, tmux navigation, tmux tips, tmux configurations.

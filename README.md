# Repacked [OpenFace][openface] Docker Images

You can run OpenFace in Docker based on `bamos/openface` image,
everything is pre-installed so it's easy to try demos.

```sh
$ docker pull bamos/openface
$ docker images --format='table {{.Repository}}\t{{.Size}}'
REPOSITORY                   SIZE
bamos/openface               2.54 GB
marselester/openface         1.59 GB
marselester/openface-slim    1.5 GB
```

If you only want to use `align_dlib.py` or `torch_neural_net.py` and wish to save space on storage,
the following Docker images should suffice:

* [Dockerfile][dockerfile-dlib-slim] with OpenCV, Dlib and OpenFace Python library.
* [Dockerfile][dockerfile-torch-slim] with OpenCV, Torch, OpenFace Python library.

You can build them as following:

```sh
$ make build_opencv_slim
$ make build_openface_dlib_slim
$ make build_openface_torch_slim
$ docker images --format='table {{.Repository}}\t{{.Size}}'
REPOSITORY                         SIZE
marselester/opencv2-slim           559 MB
marselester/openface-dlib-slim     887 MB
marselester/openface-torch-slim    1.24 GB
```

## AlignDlib Example

The following script `examples/align_face.py` finds the biggest face on the given image,
aligns it and saves as `aligned_clapton-2.jpg`.

Make sure you have downloaded OpenFace and Dlib models into `examples` folder.

```sh
$ make get_models
```

Run the script in Docker container (it mounts `examples` folder).

```sh
$ make run_dlib_example
root$ cd ~/openface/
root$ python align_face.py images/clapton-2.jpg
```

You should find `aligned_clapton-2.jpg` in `examples` folder.

## TorchNeuralNet Example

The following script `examples/measure_face.py` generates measurements
for an aligned face and prints them.

Make sure you have downloaded OpenFace and Dlib models into `examples` folder.

```sh
$ make get_models
```

Run the script in Docker container (it mounts `examples` folder).

```sh
$ make run_torch_example
root$ cd ~/openface/
root$ python measure_face.py images-aligned/clapton-2.jpg
[-0.01996974  0.13793974  0.06658511 -0.12310965  0.04212612  0.08658472
 -0.00071847 -0.03964911  0.00701445  0.01821036  0.03846877 -0.06870271
  0.00337498 -0.04999543  0.02964276  0.03428217 -0.04439747  0.06662365
 -0.06348877 -0.15714459  0.14961186  0.14424312 -0.12359982 -0.09387214
  0.02863807  0.04213185  0.00287303 -0.04264241  0.09203013  0.0950174
  0.03441251 -0.08189332 -0.03663833 -0.02480839  0.19210815  0.02228966
  0.02575306 -0.0686565   0.09901609 -0.02994603 -0.01766101 -0.01551702
  0.02814125  0.18121193  0.05302487  0.18493372  0.03669818  0.01030886
 -0.18581022 -0.20957251  0.00359649  0.06615958 -0.06902418 -0.05221251
 -0.04161739  0.04959064 -0.08259821  0.00748943 -0.09619097 -0.00600074
  0.05321096 -0.11785337  0.04854152  0.07703206  0.11113075 -0.18830433
 -0.03845159  0.10698912  0.09087287  0.12208497  0.12011147 -0.03152813
 -0.03906494 -0.30703473 -0.0794403   0.0542872  -0.15968515  0.15069671
 -0.04513952 -0.00762652  0.03152423  0.11575807  0.0134319   0.10898586
 -0.0984518  -0.02996826  0.07974634 -0.03575389 -0.08751615  0.1014987
 -0.02020852 -0.07092579 -0.14091884  0.01398935 -0.09189792  0.00707059
  0.00684055 -0.03296148 -0.01071183  0.02416798  0.04569601  0.10447645
 -0.05339807 -0.05505237 -0.01265476 -0.05654936 -0.03122586  0.06311976
 -0.00300073 -0.02177739  0.03205861 -0.1457721  -0.19731636  0.01120732
  0.10813212  0.0550241  -0.20201455 -0.09190235 -0.07985182 -0.0256094
  0.04879292  0.01763798 -0.00126225  0.05275609  0.14141054 -0.01362754
  0.05811732 -0.02798298]
```

[openface]: https://github.com/cmusatyalab/openface
[dockerfile-dlib-slim]: ./Dockerfile-openface-dlib-slim
[dockerfile-torch-slim]: ./Dockerfile-openface-torch-slim

build_opencv:
	docker build -t marselester/opencv2:latest -f Dockerfile-opencv .

build_opencv_slim:
	docker build -t marselester/opencv2-slim:latest -f Dockerfile-opencv-slim .

build_openface:
	docker build -t marselester/openface:latest -f Dockerfile-openface .

build_openface_slim:
	docker build -t marselester/openface-slim:latest -f Dockerfile-openface-slim .

build_openface_dlib:
	docker build -t marselester/openface-dlib:latest -f Dockerfile-openface-dlib .

build_openface_dlib_slim:
	docker build -t marselester/openface-dlib-slim:latest -f Dockerfile-openface-dlib-slim .

build_openface_torch:
	docker build -t marselester/openface-torch:latest -f Dockerfile-openface-torch .

build_openface_torch_slim:
	docker build -t marselester/openface-torch-slim:latest -f Dockerfile-openface-torch-slim .

get_models:
	wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 \
		-O examples/shape_predictor_68_face_landmarks.dat.bz2
	bunzip2 examples/shape_predictor_68_face_landmarks.dat.bz2
	wget http://openface-models.storage.cmusatyalab.org/nn4.small2.v1.t7 \
		-O examples/nn4.small2.v1.t7

run_dlib_example:
	docker run --rm -it \
		-v `pwd`/examples/:/root/openface/ \
		marselester/openface-dlib-slim /bin/bash

run_torch_example:
	docker run --rm -it \
		-v `pwd`/examples/:/root/openface/ \
		marselester/openface-torch-slim /bin/bash

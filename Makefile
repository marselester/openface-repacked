build_opencv:
	sudo docker build -t marselester/opencv2:latest -f Dockerfile-opencv .

build_openface_dlib:
	sudo docker build -t marselester/openface-dlib:latest -f Dockerfile-openface-dlib .

build_openface_torch:
	sudo docker build -t marselester/openface-torch:latest -f Dockerfile-openface-torch .

get_models:
	wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 \
		-O examples/shape_predictor_68_face_landmarks.dat.bz2
	bunzip2 examples/shape_predictor_68_face_landmarks.dat.bz2
	wget http://openface-models.storage.cmusatyalab.org/nn4.small2.v1.t7 \
		-O examples/nn4.small2.v1.t7

run_dlib_example:
	sudo docker run --rm -it \
		-v `pwd`/examples/:/root/openface/ \
		marselester/openface-dlib /bin/bash

run_torch_example:
	sudo docker run --rm -it \
		-v `pwd`/examples/:/root/openface/ \
		marselester/openface-torch /bin/bash

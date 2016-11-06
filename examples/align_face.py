"""
Usage:

$ python align_face.py images/clapton-2.jpg

The program finds the biggest face on the given image,
aligns it and saves as "aligned_clapton-2.jpg".

"""
import sys
import os

from openface.align_dlib import AlignDlib
import cv2

img_path = sys.argv[1]
img_name = os.path.basename(img_path)

IMG_DIMENSION = 96
DLIB_FACE_PREDICTOR_MODEL_PATH = '/root/openface/shape_predictor_68_face_landmarks.dat'

face_aligner = AlignDlib(DLIB_FACE_PREDICTOR_MODEL_PATH)

# It loads a color image as numpy.ndarray with (height, width, 3) shape.
# Any transparency of image will be neglected.
# Color image loaded by OpenCV is in BGR mode.
img_bgr = cv2.imread(img_path)
# Dlib expects images to be in RGB mode.
img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)

aligned_face_rgb = face_aligner.align(IMG_DIMENSION, img_rgb)
if aligned_face_rgb is None:
	raise Exception(u'Unable to align image: {}'.format(img_path))

aligned_img_name = u'aligned_{}'.format(img_name)
aligned_face_bgr = cv2.cvtColor(aligned_face_rgb, cv2.COLOR_RGB2BGR)
cv2.imwrite(aligned_img_name, aligned_face_bgr)

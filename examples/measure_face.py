"""
Usage:

$ python measure_face.py images-aligned/clapton-2.jpg

The program generates measurements for an aligned face and prints them.

"""
import sys

from openface.torch_neural_net import TorchNeuralNet

aligned_face_path = sys.argv[1]

IMG_DIMENSION = 96
NETWORK_MODEL_PATH = '/root/openface/nn4.small2.v1.t7'

torch_net = TorchNeuralNet(NETWORK_MODEL_PATH, IMG_DIMENSION)
face_features = torch_net.forwardPath(aligned_face_path)
print face_features

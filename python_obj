# to be translated into julia at a later date
from math import exp
import numpy as np
import random
import json 

class NeuralNet():
    def __init__(self,layers,weights=[],biases=[],neurons=[]):
        self.layers = layers
        self.weights = weights
        self.biases = biases
        self.neurons = neurons
    
    def sigmoid(x):
        # activation function
        return (exp(x))/(exp(x)+1)
    
    def cost():
        # cost function
        return
    
    def decision():
        # decision rule on output layer
        return
    
    def build(self):
        # initalize weights & biases
        if self.weights == []:
            for i in range(len(self.layers)-1):
                self.weights.append(np.reshape([random.uniform(0,1) for j in range(self.layers[i]*self.layers[i+1])],(self.layers[i+1],self.layers[i])))
        
        if self.biases == []:
            for i in range(len(self.layers)-1):
                self.biases.append(np.array([random.uniform(0,1) for j in range(self.layers[i+1])]))
                
        self.neurons = [[0 for j in range(self.layers[i])] for i in range(len(self.layers))]
    
    def feedforward(input_):
        # evaluate model on input
        return
    
    def train(training_set):
        # train model on training_set
        return
    
    def dump(self):
        # return weights & biases
        #with open("wandb.json", "w") as file: 
            #json.dump({"layers":self.layers, "weights":self.weights, "biases":self.biases}, file)
            #NumPy array is not JSON serializable
    
    def load(self,wb_file):
        # load dumped weights & biases
        #self.weights = 
        #self.biases =

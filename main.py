# to be translated into julia at a later date
from math import exp
import numpy as np
import random
import json 

class NeuralNet():
    def __init__(self,layers,weights=[],biases=[],neurons=[],activation,cost,rule):
        self.layers = layers
        self.weights = weights
        self.biases = biases
        self.neurons = neurons
        self.activation = activation
        self.cost = cost
        self.rule = rule
    
    def build(self):
        # initalize weights & biases
        if self.weights == []:
            for i in range(len(self.layers)-1):
                self.weights.append(np.reshape([random.uniform(0,1) for j in range(self.layers[i]*self.layers[i+1])],(self.layers[i+1],self.layers[i])))
        
        if self.biases == []:
            for i in range(len(self.layers)-1):
                self.biases.append(np.array([random.uniform(0,1) for j in range(self.layers[i+1])]))
                
        self.neurons = [np.array([0 for j in range(self.layers[i])]) for i in range(len(self.layers))]
    
    def feedforward(input_):
        # evaluate model on input
        #self.neurons = [np.array([0 for j in range(self.layers[i])]) for i in range(len(self.layers))]
        # use self.rule
        return
    
    def predict(input_):
        # makes prediction
        # feedforward then decision rule 
    
    def train(training_set):
        # train model on training_set
        # use self.cost
        return
    
    def dump(self):
        # return weights & biases
        weights_out = [i.tolist() for i in self.weights]
        biases_out = [i.tolist() for i in self.biases]
        
        with open("wandb.json", "w") as file: 
            json.dump({"layers":self.layers, "weights":weights_out, "biases":biases_out}, file)        
    
    def load(self):
        # load dumped weights & biases
        with open("wandb.json", "r") as file: 
            wandb = json.load(file) 
            
        weights_in = [np.array(i) for i in wandb["weights"]]
        biases_in = [np.array(i) for i in wandb["biases"]]
        layers_in = wandb["layers"]
        
        self.layers = layers_in
        self.weights = weights_in
        self.biases = biases_in
        
        self.build()

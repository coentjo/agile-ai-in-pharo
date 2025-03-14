---
Title: More on Training and Learning
---
#More on Training and Learning

There is a lot to learn about the algorhithms involved in making a NNetwork able to ***learn***.
We learned that the number of input neurons corresponds to the dataset being used (in this case, 28 x 28 = 784), while the number of output neurons matches the number of classes (in this case, 10). Additionally, two hidden layers, each containing 16 neurons, were chosen. The number of hidden layers and neurons per layer were selected arbitrarily.
Once the structure of the neural network and the activation function for each neuron (e.g., sigmoid or ReLU) are determined, the next step is to assign values to the weights of the connections between neurons and the biases of each neuron. This results in a large number of parameters to assign (about 13,000 in this case). This process happens automatically during training.
The goal of training a neural network is to adjust the weights and biases so that, when a specific input is provided, the expected output neuron will activate (while the others remain inactive). Training involves feeding the network with many examples from the dataset, along with their corresponding expected outputs. As the network processes each example, the weights and biases are updated based on a learning rule.
In the next video, the concept of gradient descent is introduced, which is the algorithm used to train neural networks. It also discusses the importance of splitting the dataset into a training set and a test set. The training set is used to train the network, while the test set is used to evaluate how well the network has learned by using a cost function. A preview of the next module on Convolutional Neural Networks is also provided.


[Gradient descent, how neural networks learn | DL2](https://www.youtube.com/watch?v=IHZwWFHWa-w)

The core algorithm how neural networks learn is backpropagation. An intuitive explanation of the backpropagation algorithm is presented in the next video. In addition, it is explained how the training set is divided into so-called mini-batches to speed-up the algorithm.

[Backpropagation, step-by-step | DL3](https://www.youtube.com/watch?v=Ilg3gGewQ5U)



[Backpropagation calculus | DL4](https://www.youtube.com/watch?v=tIeHLnjs5U8)

## Multivariable calculus

In the second video, multivariable calculus was used to explain gradient descent. For the interested student, more on multivariable calculus can be found in the next video from Kahn Academy:

Multivariable functions and multivariable calculus (Khan Academy):

[Multivariable functions | Multivariable calculus | Khan Academy](https://www.youtube.com/watch?v=TrcCbdWwCBc&list=PLSQl0a2vh4HC5feHa6Rc5c0wbRTx56nF7)

# Wanna know more on neural networks?
In one of the videos by 3Blue1Brown the following freely available digital book was mentioned:

Neural Networks and Deep Learning by Michael Nielsen:
[neuralnetworksanddeeplearning.com](http://neuralnetworksanddeeplearning.com/)

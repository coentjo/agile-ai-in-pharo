---
Title: The 'magic' behind a Neural Network
---
#The 'magic' behind a Neural Network

We saw that a **Neural Network** (let's shorten it to **NNetwork**) is a combination of **Neuron**s.
In a previous chapter we saw how a Neuron can 'learn'. When combining Neurons in a Neural Network we want the network also be able to learn. You may be able to imagine that that is more complicated.
## How does 'learning' work in a NNetwork?
    - Well, it is based on an algorithm called 'Backpropagation'. The background is mathematical and made up by very smart people, **although** if you did HAVO (for the Netherlands) or another secondary school in another country, you *have* learned all mathematics you need to understand backpropagation!
    - To **use** NNetworks you don't need to know exactly how backpropagation works, but below you will find a really nice video that clearly explains backpropagation.
    - Previously we learned that the number of input neurons corresponds to the dataset being used (in this case, 28 x 28 = 784), while the number of output neurons matches the number of classes (in this case, 10). Additionally, two hidden layers, each containing 16 neurons, were chosen. The number of hidden layers and neurons per layer were selected arbitrarily.
    - Once the structure of the neural network and the activation function for each neuron (e.g., sigmoid or ReLU) are determined, the next step is to assign values to the weights of the connections between neurons and the biases of each neuron. This results in a large number of parameters to assign (about 13,000 in this case). This process happens automatically during training.
    - The goal of training a neural network is to adjust the weights and biases so that, when a specific input is provided, the expected output neuron will activate (while the others remain inactive). Training involves feeding the network with many examples from the dataset, along with their corresponding expected outputs. As the network processes each example, the weights and biases are updated based on a learning rule.
    - In the next video, the concept of gradient descent is introduced, which is the algorithm used to train neural networks. It also discusses the importance of splitting the dataset into a training set and a test set. The training set is used to train the network, while the test set is used to evaluate how well the network has learned by using a cost function. A preview of the next module on Convolutional Neural Networks is also provided.
    
[The Most Important Algorithm in Machine Learning](https://www.youtube.com/watch?v=SmZmBKc7Lrs)



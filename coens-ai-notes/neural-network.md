---
Title: Neural Network
---
#Neural Network

# What is a Neural Network?
***Neural Networks***, also called ***Artificial Neural Networks (ANNs)*** are computational systems modeled after the biological neural networks found in human and animal brains. Typically, an ANN is composed of multiple layers of neurons, with each neuron in one layer being connected to every neuron in the following layer. This type of structure is often referred to as a ***multilayer perceptron*** or ***MLP***.
A neuron represents a single unit that can be either active (firing) or inactive, depending on the activity of neurons in the previous layer, the strength (or weight) of the connections, and a bias factor.
- attachments/acubx5u98dal5skto751e2ub7/2021-AI-General.041.png
- ![](workshop-AI/agile-ai-as-markdownpages/attach/2021-AI-General.041.png)
# Back to a case that was impossible with a Perceptron
Example network and training it on getting this behavior:
Inputs 0 and 0 must give output 0.
Inputs 0 and 1 must give output 1.
Inputs 1 and 0 must give output 1.
Inputs 1 and 1 must give output 0.
In the following video, you’ll see an explanation of the layered structure of neural networks and how neurons are activated, illustrated through a classification problem. The video provides an intuitive rationale for why neural networks are often made up of multiple layers. The layers between the input and output layers are referred to as hidden layers. Toward the end, the video also clarifies the difference between a sigmoid neuron and a rectified linear unit (ReLU) neuron.
```Pharo
network := NNetwork new.
network configure: 2 hidden: 3 nbOfOutputs: 1.

20000 timesRepeat: [  
	network train: #(0 0) desiredOutputs: #(0).	
	network train: #(0 1) desiredOutputs: #(1).
	network train: #(1 0) desiredOutputs: #(1).
	network train: #(1 1) desiredOutputs: #(0).
].
^ network
```
Check if it does what it should by inspecting the result of:
```Pharo
network feed: #(0 0)
```
```Pharo
network feed: #(0 1)
```
```Pharo
network feed: #(1 0)
```
```Pharo
network feed: #(1 1)
```
# ANN inexplained a video
We all know how challenging it can be to read someone else’s handwriting. Yet, despite variations in handwriting style, we are generally quite successful at recognizing letters or digits. For example, the human brain is remarkably adept at identifying different representations of the number “5.”

[But what is a neural network? | Deep learning chapter 1](https://www.youtube.com/watch?v=aircAruvnKk)

Are the results correct?

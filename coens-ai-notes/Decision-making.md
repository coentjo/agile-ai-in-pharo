---
Title: Decision making: Metal Concert
---
#Decision making: Metal Concert

A perceptron can be used in decision making.
Suppose there is a Metal concert and you may want to go, but it depends on 3 parameters/inputs:
- x1: Is the weather good?
- x2: Do you have company to go with you?
- x3: Can you get there easy using public transport?
Using 0 for false, 1 for true.
When you prioritize going together you give a heigh weight to the company, w2 := 6 for example:
```Pharo
perceptron := Neuron new step;
	weights: #( 3 5 2 );
	bias: -4.5
```
Good weather, no company, difficult by public transport: would I go?
```Pharo
perceptron fire: #(1 0 0)
```
Bad weather, good company, difficult by public transport: would I go?
```Pharo
perceptron fire: #(0 1 0)
```
Good weather, no company, easy by public transport?
```Pharo
perceptron fire: #(1 0 1)
```

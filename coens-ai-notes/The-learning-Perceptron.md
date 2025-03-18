---
Title: The Learning Perceptron
---
#The Learning Perceptron

The Perceptron can ***learn*** when we train it:
***Training*** means we give input to the perceptron **and** we also tell it what the outputvalue is are that we want for those input values.
Let's look at an example: 
- First we create a perceptron, 2 inputs with weights -1 and -1, and a bias of 2.  
- For  input values `1` and `1`, written as:   `#( 1 1 )` 
this Perceptron will give an output value of 0 initially. Check this by `inspecting` the next 2 scripts:
```Pharo
perceptron := Neuron new step. 
perceptron weights: #( -1 -1 ).
perceptron bias: 2.
^ perceptron
```
Set the input values to  `#( 1 1 )` respectively, and see what the output value is.
```Pharo
^ perceptron fire: #( 1 1 )
```
***Training***: Now we are going to tell that for inputs `#( 1 1 )`  the desired output is 1. The next script is one trainings step:
```Pharo
perceptron train: #( 1 1 ) desiredOutput: 1
```
If you look at the
We call this ***labeled data***: We have inputs (***data***) and tell the machine what the output should be for for those inputs (***the desired output*** or ***label***).
```Pharo
10 timesRepeat: [ perceptron train: #( 0 1 ) desiredOutput: 0 ].
^ perceptron
```
```Pharo
"After training the input #(0 1) will give output 0"
^ perceptron fire: #( 0 1 )
"If you are curious as to what method 'train:desiredOutput:' does: 
click at the little triangle behind 'desiredOutput:' in the third script.
(the triangle does only appear AFTER you executed the first script)"
```

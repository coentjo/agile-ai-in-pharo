---
Title: Applying the Perceptron: AND/OR
---
#Applying the Perceptron: AND/OR


Now what can we use that for? Well, look at the code below: it creates a Perceptron with 
weights    `w1 := 1`, `w2 := 1`,   put together as an array: `#( 1 1 )` 
and `bias := -1.5`.
```Pharo
"Perceptron with weights 1, 1 with bias -1.5" 
perceptron := Neuron new
		step;
		weights: #(1 1);
		bias: -1.5.
```
You can look at the tabs to see multiple ways of looking at the Perceptron. Not all tabs will mean something to you at this moment.
Next step is to see what the `output` will be at given `inputs`:
```Pharo
perceptron fire: #(1 1)
```
You can change the values in the array. Try all of these: #(0 0), #(0 1), #(1 0), #(1 1) and you will find that this perceptron has **ONLY output 1 if both inputs are 1** . That means it behaves as an **AND** logical gate. Looking at the weights and bias, do you understand that?
If you look at the weights and bias that seems to be right: rewrite the formula for `z` for 2 inputs, filling in the known numbers, gives:
`z := 1*x1 + 1*x2 - 1.5`
If you calculate the `z` for all 4 input combinations you see that if either `x1`  or  `x2`  (or both) equals  `0`  than the sum of them will be less then `1.5`, which means the perceptron will output `0`. Only when  `x1` and `x2`  both have value `1`  will the value of `z` be greater than '0', so only then will the perceptron output `1`.
Well, programmers like to test their code automatically. Here you see a method that checks  all these 4 cases: first a perceptron is created, then 'assert:equals:' is called 4 times with the 4 inputs and corresponding outputs. Let's look at the first assert: 
`self assert: (perceptron feed: #(0 0)) equals: 0.`
In this line the perceptron is fed two zero's: if the result is zero nothing special happens (inspecting  shows a green thingy after the method name and shows a 'FiredNeuronShot'), but if something else comes out the program will warn you: the inspected result is 'nil' and after the method name you see an orange thingy . You can change the values to try that if you want.
{{gtExample:WorkshopAIPerceptronGT>>testANDGate}}
First a variable `p` is created (by putting it between vertical bars), then it gets assigned a perceptron that acts as an AND gate, by calling the method we saw before. Then a message `'assert:equals:'` is sent (to self) to check that if you `FEED` the perceptron the input `0` and `0` , it will output `0` (that's the first test, figure out whether you agree to all 4 tests).
Just like it is possible to configure a perceptron as an AND gate it is also possible to configure one as an OR gate (output is 1 if at least one of the inputs is 1), a NOR gate (only 1 if the inputs are 0) or a NOT gate (input 0 gives output 1 and input 1 gives output 0). Which of the following is which, and can you complete the code for the missing one?
```Pharo
perceptron := Neuron new
		step;
		weights: #(-1 -1);
		bias: 0.5 .
```
```Pharo
perceptron := Neuron new
		step;
		weights: #( -1 );
		bias: 0.5 .
```
```Pharo
perceptron := ??? "can you complete this code for the missing third?"
```

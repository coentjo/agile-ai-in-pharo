Class {
	#name : #Perceptron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias'
	],
	#category : #'NeuralNetwork-NeuralNetwork'
}

{ #category : #accessing }
Perceptron >> bias [

	^ bias
]

{ #category : #accessing }
Perceptron >> bias: aNumber [
	bias := aNumber
]

{ #category : #accessing }
Perceptron >> feed: inputs [

	| z |
	z := (inputs with: weights collect: [ :x :w | x * w ]) sum + bias.
	^ z > 0
		  ifTrue: [ 1 ]
		  ifFalse: [ 0 ]
]

{ #category : #accessing }
Perceptron >> weights [
	^ weights
]

{ #category : #accessing }
Perceptron >> weights: someWeightsAsNumber [
	"Set the weights of the neuron.
	 Take a collection of numbers as argument."
	weights := someWeightsAsNumber
]

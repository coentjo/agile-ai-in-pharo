Class {
	#name : #StepAF,
	#superclass : #ActivationFunction,
	#category : #NeuralNetwork
}

{ #category : #'as yet unclassified' }
StepAF >> derivative: output [
	^ 1
]

{ #category : #accessing }
StepAF >> eval: z [
	^ z > 0 
		ifTrue: [ 1 ] 
		ifFalse: [ 0 ]
]

{ #category : #accessing }
StepAF >> sayType [
	^ 'Perceptron'
]

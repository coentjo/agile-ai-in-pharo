Class {
	#name : #InputPseudoLayer,
	#superclass : #Object,
	#instVars : [
		'children'
	],
	#category : #'NeuralNetwork-NeuralNetwork'
}

{ #category : #accessing }
InputPseudoLayer >> children [

	^ children
]

{ #category : #accessing }
InputPseudoLayer >> children: aChildrenCollection [

	children := aChildrenCollection
]

{ #category : #accessing }
InputPseudoLayer >> descriptiveLabel [
	^ 'Inputs'
]

{ #category : #accessing }
InputPseudoLayer >> elementColor [

	^ Color darkGray
]

{ #category : #accessing }
InputPseudoLayer >> elementSize [
	^ 10 @ 10
]

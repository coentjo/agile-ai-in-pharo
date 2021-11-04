Class {
	#name : #FiredNeuronShot,
	#superclass : #Object,
	#instVars : [
		'neuron',
		'inputs',
		'outputValue'
	],
	#category : #'NeuralNetwork-NeuralNetwork'
}

{ #category : #accessing }
FiredNeuronShot class >> input: inputs neuron: aNeuron output: outputValue [
	^ self new
		inputs: inputs;
		neuron: aNeuron;
		output: outputValue;
		yourself
]

{ #category : #accessing }
FiredNeuronShot >> gtVisual: aView [
	<gtView>
	| weightsContainer inputsContainer |
	^ aView explicit 
		title: 'Visual' translated;
		priority: 4;
		stencil: [
			|container verticalContainer detailsTextContainer details|
			details := String streamContents: [:aStream |
				aStream 
					nextPutAll: 'PERCEPTRON-visualisation'  ].
			container := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].
			inputsContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: self inputsAsString;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			detailsTextContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: details;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			verticalContainer := BlElement new
				layout: BlLinearLayout vertical;
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent].
			verticalContainer addChild: detailsTextContainer.
			container addChild: inputsContainer.
			container addChild: verticalContainer.
			container ].
]

{ #category : #accessing }
FiredNeuronShot >> inputs: aInputCollection [
	inputs := aInputCollection
]

{ #category : #accessing }
FiredNeuronShot >> neuron: aNeuron [
	neuron := aNeuron
]

{ #category : #accessing }
FiredNeuronShot >> output: anOutputValue [
	outputValue := anOutputValue
	
]

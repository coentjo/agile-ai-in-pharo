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
			|container verticalContainer detailsTextContainer  nameTextContainer details|
			details := String streamContents: [:aStream |
				aStream 
					nextPutAll: 'bias: ', 'self bias' printString; cr;
					nextPutAll: 'learningRate: ', 'self learningRate' printString; cr
].
			container := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].
			weightsContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: 'self weightsAsString';
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			nameTextContainer := BlTextElement new
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (neuron sayType asRopedText glamorousRegularFont
					fontSize: 30;
					foreground: Color black).
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
			verticalContainer addChild: nameTextContainer.
			verticalContainer addChild: detailsTextContainer.
			container addChild: weightsContainer.
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

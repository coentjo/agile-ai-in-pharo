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
		title: 'VisualW' translated;
		priority: 4;
		stencil: [
			| verticalContainer detailsTextContainer |
			inputsContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: self inputsAsString;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
					
			detailsTextContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: (String streamContents: [:aStream |
						aStream nextPutAll: 'PERCEPTRON-visualisation'  ]);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			
			verticalContainer := BlElement new
				layout: BlLinearLayout vertical;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent];
				addChild: detailsTextContainer.

			BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent];
				addChild: inputsContainer;
				addChild: verticalContainer;
				yourself ].
]

{ #category : #accessing }
FiredNeuronShot >> inputs: aInputCollection [
	inputs := aInputCollection
]

{ #category : #accessing }
FiredNeuronShot >> inputsAsString [


"	^ String streamContents: [:aStream |
		aStream cr;cr;cr.
		self weights 
			do: [ :aWeight | 
				aStream nextPutAll: '--- ', aWeight asString,' -->'; cr ]
			separatedBy: [ aStream cr ] ]."
	String streamContents: [ :stream | 
		stream nextPutAll: 'asd'.
		"inputs 
			do: [ :inp | stream nextPutAll: inp  ] 
			separatedBy: [ stream cr ]"
			 ]
]

{ #category : #accessing }
FiredNeuronShot >> neuron: aNeuron [
	neuron := aNeuron
]

{ #category : #accessing }
FiredNeuronShot >> output: anOutputValue [
	outputValue := anOutputValue
	
]

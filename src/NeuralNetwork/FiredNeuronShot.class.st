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
FiredNeuronShot >> detailsText [

	^ BrEditor new 
		  aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
		  text: (String streamContents: [ :aStream | 
					   aStream nextPutAll: neuron weightsAsString ]);
		  constraintsDo: [ :c | 
			  c horizontal matchParent.
			  c vertical matchParent ]
]

{ #category : #accessing }
FiredNeuronShot >> gtVisual: aView [

	<gtView>
	| weightsContainer inputsContainer |
	^ aView explicit
		title: 'Schematic' translated;
		priority: 4;
		stencil: [ 
			BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ];
				addChild: self inputsContainer;
				addChild: neuron visualStencil;
				addChild: self outputContainer;
				yourself ]
]

{ #category : #accessing }
FiredNeuronShot >> inputs [
	^ inputs ifNil: [self error: 'Every ', self class name, ' should have inputs!' ]
]

{ #category : #accessing }
FiredNeuronShot >> inputs: aInputCollection [
	inputs := aInputCollection
]

{ #category : #accessing }
FiredNeuronShot >> inputsAsString [
	^ String streamContents: [ :aStream | 
		  self inputs
			  do: [ :inp | aStream nextPutAll: inp asString ]
			  separatedBy: [ aStream cr; cr ] ]
]

{ #category : #accessing }
FiredNeuronShot >> inputsContainer [

	| cr |
	cr := Character cr asString.
	^ BrEditor new
		  aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
		  text: cr , 'inputs:' , cr , cr , self inputsAsString;
		  constraintsDo: [ :c | 
			  c horizontal matchParent.
			  c vertical matchParent ]
]

{ #category : #accessing }
FiredNeuronShot >> neuron: aNeuron [
	neuron := aNeuron
]

{ #category : #accessing }
FiredNeuronShot >> neuronVisualFor: detailsTextContainer [

	^ BlElement new
		  layout: BlLinearLayout vertical;
		  margin: (BlInsets all: 20);
		  constraintsDo: [ :c | 
			  c horizontal matchParent.
			  c vertical matchParent ];
		  addChild: detailsTextContainer
]

{ #category : #accessing }
FiredNeuronShot >> output: anOutputValue [
	outputValue := anOutputValue
	
]

{ #category : #accessing }
FiredNeuronShot >> outputContainer [
	| cr |
	cr := Character cr asString .
	^ BrEditor new
		  aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
		  text: 'output:', cr, cr,cr,  '  ----> ', outputValue asString;
		  constraintsDo: [ :c | 
			  c horizontal matchParent.
			  c vertical matchParent ]
]

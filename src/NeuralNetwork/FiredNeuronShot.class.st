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
FiredNeuronShot >> aiVisual: aView [
	<gtView>
	|  aWardleyMap inp1 inp2 neuronModel out edge1 edge2 edge3 central xRow1 xRow2 xRow3  yMax yMin yCenter calcYForNthInput ySlope |
	"Started as copy of >>newMapWithNodes"
	"Probably a misuse of a WardleyMap, but well, it does the job for now. "

	
	xRow1 := 0.2 .
	xRow2 := 0.5 .
	xRow3 := 0.8 .
	yMin := 0.2 min: (xRow2 - xRow1).  " 'min:' ensures maximum angel 45 degrees"
	yMax := 0.8 min: (xRow2 - xRow1).
	yCenter := (yMax + yMin) / 2 . 
	
	"Calculate y for n-th input"
	ySlope := (yMax - yMin) / (self neuron weights size - 1).
	calcYForNthInput := [ :index | ((index - 1) * ySlope) + yMin ] . 
	
	central := xRow2 @ yCenter.
	aWardleyMap := GtWardleyMapModel new.

	neuronModel := GtWardleyMapNodeModel new.
	neuronModel
		coordinate: central;
		size: 100 @ 100;
		color: Color blue lighter;
		label: (String streamContents: [ :stream |
			stream 
				nextPutAll: 'bias: '; 
				nextPutAll: self neuron bias printString; cr;
				nextPutAll: 'learningRate: ';
				nextPutAll: self neuron learningRate printString; cr;
				nextPutAll: self computation ] ).

	out := GtWardleyMapNodeModel new.
	out
		coordinate: xRow3 @ yCenter;
		color: Color gray;
		label: 'output = ', outputValue asString.

	aWardleyMap addNode: neuronModel.
	aWardleyMap addNode: out.
	aWardleyMap addEdge: (GtWardleyMapEdgeModel new
		 fromNode: neuronModel;
		 toNode: out;
		 arrow: true;
		 width: 1).

	
	self neuron weights withIndexDo: [ :aWeight :aIndex |  | input inputLabelText |
		"node for every input"
		inputLabelText := 
			'x',aIndex asString,' = ', (inputs at: aIndex) asString,
			' , w',aIndex asString,' = ', aWeight asString.
		input := GtWardleyMapNodeModel new.
		input
			coordinate: xRow1 @ (calcYForNthInput value: aIndex);
			color: Color gray;
			label: inputLabelText. 
		aWardleyMap addNode: input. 
		"add edge from this node to neuron"
		aWardleyMap addEdge: (GtWardleyMapEdgeModel new
			 fromNode: input;
			 toNode: neuronModel;
			 arrow: true;
			 width: 1). ].

	^ aView explicit
		title: 'Visual';
		priority: 2;
		stencil: [
			GtWardleyMapElement new
				wardleyMapViewModel: (GtWardleyMapViewModel new wardleyMapModel: aWardleyMap);
				yourself ]
]

{ #category : #accessing }
FiredNeuronShot >> computation [

	| weights |
	weights := self neuron weights.
	^ String streamContents: [ :stream | 
		  1 to: self inputs size do: [ :i | 
		  	i = 1 ifFalse: [stream nextPutAll: ' + '].
			  stream
				  nextPutAll: (inputs at: i) asString;
				  nextPutAll: '*';
				  nextPutAll: (weights at: i) asString ] ]
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
FiredNeuronShot >> neuron [
^ neuron
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

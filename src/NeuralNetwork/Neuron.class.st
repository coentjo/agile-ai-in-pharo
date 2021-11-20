Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias',
		'learningRate',
		'activationFunction',
		'delta',
		'output'
	],
	#category : #NeuralNetwork
}

{ #category : #'as yet unclassified' }
Neuron >> adjustBias [
	bias := bias + (learningRate * delta)
]

{ #category : #'as yet unclassified' }
Neuron >> adjustDeltaWith: anError [
	delta := anError * (activationFunction derivative: output)
]

{ #category : #'as yet unclassified' }
Neuron >> adjustWeightWithInput: inputs [
	inputs withIndexDo: [ :anInput :index | 
		weights at: index put: ((weights at: index) + (learningRate * delta * anInput)) ]
]

{ #category : #'as yet unclassified' }
Neuron >> bias [
	"Return the bias of the neuron"
	^ bias
]

{ #category : #'as yet unclassified' }
Neuron >> bias: aNumber [
	"Set the bias of the neuron"
	bias := aNumber
]

{ #category : #'as yet unclassified' }
Neuron >> delta [
	"Return the delta value computed when propagating the error"
	^ delta
]

{ #category : #accessing }
Neuron >> detailsContainer [

	^ BrEditor new
		  aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
		  text: (String streamContents: [ :aStream | 
					   aStream
						   nextPutAll: 'bias: ';
						   nextPutAll: self bias printString;
						   cr;
						   nextPutAll: 'learningRate: ';
						   nextPutAll: self learningRate printString;
						   cr ]);
		  constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ]
]

{ #category : #accessing }
Neuron >> feed: inputs [
	| z |
	z := (inputs with: weights collect: [ :x :w | x * w ]) sum + bias.
	output := activationFunction eval: z.
	^ output
]

{ #category : #accessing }
Neuron >> fire: inputs [
	<gtExample>
	^ FiredNeuronShot
		input: inputs
		neuron: self
		output: (self feed: inputs)
]

{ #category : #accessing }
Neuron >> gtPrintFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 8;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self printString asRopedText ]
]

{ #category : #accessing }
Neuron >> gtVisual2: aView [
	<gtView>
	|  aWardleyMap inp1 inp2 neuron out edge1 edge2 edge3 central xRow1 xRow2 xRow3  |
	"Started as copy of >>newMapWithNodes"
	"Probably a misuse of a WardleyMap, but well, it does the job for now. "

	
	xRow1 := 0.2 .
	xRow2 := 0.5 .
	xRow3 := 0.8 .
	
	central := xRow2 @ 0.25.
	aWardleyMap := GtWardleyMapModel new.

	neuron := GtWardleyMapNodeModel new.
	neuron
		coordinate: central;
		size: 100 @ 100;
		color: Color gray lighter lighter;
		label: (String streamContents: [ :stream |
			stream 
				nextPutAll: 'bias: '; 
				nextPutAll: self bias printString; cr;
				nextPutAll: 'learningRate: ';
				nextPutAll: self learningRate printString ] ).
				
	out := GtWardleyMapNodeModel new.
	out
		coordinate: xRow3 @ 0.25;
		color: Color gray;
		label: 'output'.

	aWardleyMap addNode: neuron.
	aWardleyMap addNode: out.
	aWardleyMap addEdge: (GtWardleyMapEdgeModel new
		 fromNode: neuron;
		 toNode: out;
		 arrow: true;
		 width: 1).

	
	self weights withIndexDo: [ :aWeight :aIndex |  | input |
		"node for every input"
		input := GtWardleyMapNodeModel new.
		input
			coordinate: xRow1 @ (0.2 * aIndex);
			color: Color gray;
			label: 'w',aIndex asString,' = ', aWeight asString. 
		aWardleyMap addNode: input. 
		"add edge from this node to neuron"
		aWardleyMap addEdge: (GtWardleyMapEdgeModel new
			 fromNode: input;
			 toNode: neuron;
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
Neuron >> gtVisual: aView [

	<gtView>
	| inputsContainer |
	^ aView explicit
		  title: 'Schematic' translated;
		  priority: 4;
		  stencil: [ self visualStencil ]
]

{ #category : #'as yet unclassified' }
Neuron >> initialize [
	super initialize.
	learningRate := 0.1.
	self sigmoid
]

{ #category : #'as yet unclassified' }
Neuron >> learningRate [
	"Return the learning rate of the neuron"
	^ learningRate 
]

{ #category : #'as yet unclassified' }
Neuron >> learningRate: aLearningRateAsFloat [
	"Set the learning rate of the neuron. The argument should be a small floating value. For example, 0.01"
	learningRate := aLearningRateAsFloat
]

{ #category : #'as yet unclassified' }
Neuron >> numberOfWeights [
	"Return the number of weights contained in the neuron"
	^ weights size
]

{ #category : #'as yet unclassified' }
Neuron >> output [
	"Return the output value, previous computed when doing a feed:"
	^ output
]

{ #category : #accessing }
Neuron >> printString [
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."
	| cr tab |
	cr := Character cr asString.
	tab := Character tab asString .
	^ self sayType
		, cr , tab , 'bias: ', self bias printString 
		, cr , tab , ' learningRate: ', self learningRate printString
		, cr, tab , ' weights: ', self weights printString
]

{ #category : #accessing }
Neuron >> sayType [ 
	^ activationFunction sayType
]

{ #category : #'as yet unclassified' }
Neuron >> sigmoid [
	"Use the sigmoid activation function"
	activationFunction := SigmoidAF new
]

{ #category : #'as yet unclassified' }
Neuron >> step [
	"Use the step activation function"
	activationFunction := StepAF new
]

{ #category : #'as yet unclassified' }
Neuron >> train: inputs desiredOutput: desiredOutput [
    | diff output delta |
    output := self feed: inputs.
    diff := desiredOutput - output.
    delta := diff * (activationFunction derivative: output).    

    inputs withIndexDo: [ :anInput :index | 
        weights at: index put: ((weights at: index) + (learningRate * delta * anInput)) ].

    bias := bias + (learningRate * delta)
]

{ #category : #accessing }
Neuron >> visualStencil [

	| weightsContainer nameTextContainer container verticalContainer |
	container := BlElement new
		             layout: BlLinearLayout horizontal;
		             background: Color white;
		             aptitude: BrShadowAptitude;
		             margin: (BlInsets all: 20);
		             constraintsDo: [ :c | 
			             c horizontal fitContent.
			             c vertical fitContent ].
	weightsContainer := BrEditor new
		                    aptitude:
			                    (BrGlamorousRegularEditorAptitude new 
				                     fontSize: 16);
		                    text: self weightsAsString;
		                    constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ].
	nameTextContainer := BlTextElement new
		                     constraintsDo: [ :c | c horizontal matchParent ];
		                     margin: (BlInsets
				                      top: 5
				                      right: 0
				                      bottom: 20
				                      left: 5);
		                     text:
			                     (self sayType asRopedText glamorousRegularFont
				                      fontSize: 30;
				                      foreground: Color black).


	verticalContainer := BlElement new
		                     layout: BlLinearLayout vertical;
		                     margin: (BlInsets all: 10);
		                     constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ].
	verticalContainer addChild: nameTextContainer.
	verticalContainer addChild: self detailsContainer.
	container addChild: weightsContainer.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
Neuron >> weights [
	"Return the weights of the neuron."
	^ weights
]

{ #category : #'as yet unclassified' }
Neuron >> weights: someWeightsAsNumbers [
	"Set the weights of the neuron. 
	 Takes a collection of numbers as argument."
	weights := someWeightsAsNumbers asOrderedCollection
]

{ #category : #accessing }
Neuron >> weightsAsString [
	^ String streamContents: [:aStream |
		aStream nextPutAll: 'weights:' ; cr ; cr .
		self weights 
			do: [ :aWeight | 
				aStream nextPutAll: '---  ', aWeight asString,'  -->'; cr ]
			separatedBy: [ aStream cr ] ].
]

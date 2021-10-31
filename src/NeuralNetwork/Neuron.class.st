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
Neuron >> gtVisual: aView [
	<gtView>
	| weightsContainer inputsContainer |
	^ aView explicit 
		title: 'Visual' translated;
		priority: 4;
		stencil: [
			|container verticalContainer detailsTextContainer  nameTextContainer details|
			details := String streamContents: [:aStream |
				aStream 
					nextPutAll: 'bias: ', self bias printString; cr;
					nextPutAll: 'learningRate: ', self learningRate printString; cr
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
				text: self weightsAsString;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			nameTextContainer := BlTextElement new
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (self sayType asRopedText glamorousRegularFont
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
		aStream cr;cr;cr.
		self weights 
			do: [ :aWeight | 
				aStream nextPutAll: '--- ', aWeight asString,' -->'; cr ]
			separatedBy: [ aStream cr ] ].
]

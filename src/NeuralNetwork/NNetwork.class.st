Class {
	#name : #NNetwork,
	#superclass : #Object,
	#instVars : [
		'layers',
		'errors',
		'precisions'
	],
	#category : #NeuralNetwork
}

{ #category : #'as yet unclassified' }
NNetwork >> addLayer: aNeuronLayer [
	"Add a neural layer. The added layer is linked to the already added layers."
	layers ifNotEmpty: [ 
		aNeuronLayer previousLayer: layers last.
		layers last nextLayer: aNeuronLayer ].
	layers add: aNeuronLayer.
]

{ #category : #accessing }
NNetwork >> aiSchematic: aView [

	<gtView>
	| inputsContainer |
	^ aView explicit
		  title: 'Schematic' translated;
		  priority: 4;
		  stencil: [ self visualStencil ]
]

{ #category : #accessing }
NNetwork >> aiVisual: aView [
	<gtView>
	|  aWardleyMap inp1 inp2 neuronModel  edge1 edge2 edge3 central xRow1 xRow2 xRow3  yMax yMin yCenter calcYForNthInput ySlope selfWeights selfLearningRate selfBias |
	"Started as copy of >>newMapWithNodes"
	"Probably a misuse of a WardleyMap, but well, it does the job for now. "

	selfWeights := #(1 1 ).
	selfLearningRate := 0.1 .
	selfBias := -2 .
	
	xRow1 := 0.2 .
	xRow2 := 0.5 .
	xRow3 := 0.8 .
	yMin := 0.2 min: (xRow2 - xRow1).  " 'min:' ensures maximum angel 45 degrees"
	yMax := 0.8 min: (xRow2 - xRow1).
	yCenter := (yMax + yMin) / 2 . 
	
	"Calculate y for n-th input"
	ySlope := (yMax - yMin) / (selfWeights size - 1).
	calcYForNthInput := [ :index | ((index - 1) * ySlope) + yMin ] . 
	
	central := xRow2 @ yCenter.
	aWardleyMap := GtWardleyMapModel new.

	neuronModel := GtWardleyMapNodeModel new.
	neuronModel
		coordinate: central;
		size: 10 @ 10;
		color: Color gray lighter lighter;
		label: (String streamContents: [ :stream |
			stream 
				nextPutAll: 'work in progress' ] ).

	"out := GtWardleyMapNodeModel new.
	out
		coordinate: xRow3 @ yCenter;
		color: Color gray;
		label: 'output'."

	aWardleyMap addNode: neuronModel.
	"aWardleyMap addNode: out.
	aWardleyMap addEdge: (GtWardleyMapEdgeModel new
		 fromNode: neuronModel;
		 toNode: out;
		 arrow: true;
		 width: 1)."

	
	selfWeights withIndexDo: [ :aWeight :aIndex |  | input |
		"node for every input"
		input := GtWardleyMapNodeModel new.
		input
			coordinate: xRow1 @ (calcYForNthInput value: aIndex);
			color: Color gray;
			label: 'w',aIndex asString,' = ', aWeight asString. 
		"aWardleyMap addNode: input. "
		"add edge from this node to neuron"
		"aWardleyMap addEdge: (GtWardleyMapEdgeModel new
			 fromNode: input;
			 toNode: neuronModel;
			 arrow: true;
			 width: 1). "].

	^ aView explicit
		title: 'Visual';
		priority: 2;
		stencil: [
			GtWardleyMapElement new
				wardleyMapViewModel: (GtWardleyMapViewModel new wardleyMapModel: aWardleyMap);
				yourself ]
]

{ #category : #'as yet unclassified' }
NNetwork >> backwardPropagateError: expectedOutputs [
	"expectedOutputs corresponds to the outputs we are training the network against"
	self outputLayer backwardPropagateError: expectedOutputs
]

{ #category : #'as yet unclassified' }
NNetwork >> configure: nbOfInputs hidden: nbOfNeurons1 hidden: nbOfNeurons2 nbOfOutputs: nbOfOutput [
	"Configure the network with the given parameters
	The network has only one hidden layer"
	| random |
	random := Random seed: 42.
	self addLayer: (NeuronLayer new initializeNbOfNeurons: nbOfNeurons1 nbOfWeights: nbOfInputs using: random).
	self addLayer: (NeuronLayer new initializeNbOfNeurons: nbOfNeurons2 nbOfWeights: nbOfNeurons1 using: random).
	self addLayer: (NeuronLayer new initializeNbOfNeurons: nbOfOutput nbOfWeights: nbOfNeurons2 using: random).
]

{ #category : #'as yet unclassified' }
NNetwork >> configure: nbOfInputs hidden: nbOfNeurons nbOfOutputs: nbOfOutput [
	"Configure the network with the given parameters
	The network has only one hidden layer"
	| random |
	random := Random seed: 42.
	self addLayer: (NeuronLayer new initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfInputs using: random).
	self addLayer: (NeuronLayer new initializeNbOfNeurons: nbOfOutput nbOfWeights: nbOfNeurons using: random).
]

{ #category : #'as yet unclassified' }
NNetwork >> feed: someInputValues [
    "Feed the first layer with the provided inputs"
    ^ layers first feed: someInputValues
]

{ #category : #'as yet unclassified' }
NNetwork >> getPossibleCutpoints [
	"Return the indexes of each neurons values.
	This method is useful when applying genetic algorithm to neural network"
	| result index |
	result := OrderedCollection new.
	index := 1.
	self neurons do: [ :n | 
		result add: index.
		index := index + n weights size + 1. ].
	^ result asArray
]

{ #category : #'as yet unclassified' }
NNetwork >> initialize [
	super initialize.
	layers := OrderedCollection new.
	errors := OrderedCollection new.
	precisions := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
NNetwork >> learningRate: aLearningRate [
	"Set the learning rate for all the layers"
	layers do: [ :l | l learningRate: aLearningRate ] 
]

{ #category : #'as yet unclassified' }
NNetwork >> neurons [
	"Return the list of neurons contains in the network"
	^ layers flatCollect: #neurons
]

{ #category : #'as yet unclassified' }
NNetwork >> numberOfInputs [
	"Return the number of inputs the network has"
    ^ layers first neurons size
]

{ #category : #'as yet unclassified' }
NNetwork >> numberOfNeurons [
	"Return the total number of neurons the network has"
	^ (layers collect: #numberOfNeurons) sum
]

{ #category : #'as yet unclassified' }
NNetwork >> numberOfOutputs [
	"Return the number of output of the network"
	^ layers last numberOfNeurons
]

{ #category : #'as yet unclassified' }
NNetwork >> numberOfParameters [
	"Return the number of weights and biases contained in the network"
	^ (self neurons collect: #numberOfWeights) sum + self neurons size
]

{ #category : #'as yet unclassified' }
NNetwork >> outputLayer [
	"Return the output layer, which is also the last layer"
	^ layers last
]

{ #category : #'as yet unclassified' }
NNetwork >> predict: inputs [
	"Make a prediction. This method assumes that the number of outputs is the same as the number of different values the network can output"
	"The index of a collection begins at 1 in Pharo"
	| outputs |
	outputs := self feed: inputs.
	^ (outputs indexOf: (outputs max)) - 1
]

{ #category : #'as yet unclassified' }
NNetwork >> setWeightsAndBias: weightsAndBias [
	"Set the weights and bias of each neuron.
	This method is useful when applying genetic algorithm to neural network"
	| index |
	self assert: [ self numberOfParameters = weightsAndBias size ].
	self assert: [ weightsAndBias allSatisfy: #isNumber ].
	index := 1.
	self neurons do: [ :n | 
		n weights: (weightsAndBias copyFrom: index to: n numberOfWeights + index - 1).
		index := index + n numberOfWeights.
		n bias: (weightsAndBias at: index).
		index := index + 1 ]
]

{ #category : #'as yet unclassified' }
NNetwork >> train: someInputs desiredOutputs: desiredOutputs [
	"Train the neural network with a set of inputs and some expected output"
	self feed: someInputs.
	self backwardPropagateError: desiredOutputs.
	self updateWeight: someInputs
]

{ #category : #'as yet unclassified' }
NNetwork >> train: train nbEpochs: nbEpochs [
    "Train the network using the train data set."
    | sumError outputs expectedOutput epochPrecision t |
    1 to: nbEpochs do: [ :epoch |
        sumError := 0.
		  epochPrecision := 0.
        train do: [ :row |
            outputs := self feed: row allButLast.
            expectedOutput := (1 to: self numberOfOutputs) collect: [ :notUsed | 0 ].
            expectedOutput at: (row last) + 1 put: 1.
            (row last = (self predict: row allButLast)) ifTrue: [ epochPrecision := epochPrecision + 1 ].
            t := (1 to: expectedOutput size) 
                    collect: [ :i | ((expectedOutput at: i) - (outputs at: i)) squared ].
            sumError := sumError + t sum.
            self backwardPropagateError: expectedOutput.
            self updateWeight: row allButLast.
        ].
        errors add: sumError.
		  precisions add: (epochPrecision / train size) asFloat.
    ] 
]

{ #category : #'as yet unclassified' }
NNetwork >> updateWeight: initialInputs [
	"Update the weights of the neurons using the initial inputs"
	layers first updateWeight: initialInputs
]

{ #category : #'as yet unclassified' }
NNetwork >> viewLearningCurve [
	"Draw the error and precision curve"
	| b ds |
	"No need to draw anything if the network has not been run"
	errors ifEmpty: [ ^ RTView new
				add: (RTLabel elementOn: 'Should first run the network');
				yourself ].

	b := RTDoubleGrapher new.

	"We define the size of the charting area"
	b extent: 500 @ 300.
	ds := RTData new.
	"A simple optimization that Roassal offers"
	ds samplingIfMoreThan: 2000.
	"No need of dots, simply a curve"
	ds noDot; connectColor: Color blue.
	ds points: (errors collectWithIndex: [ :y :i | i -> y ]).
	ds x: #key.
	ds y: #value.
	ds dotShape rectangle color: Color blue.
	b add: ds.
	ds := RTData new.
	ds samplingIfMoreThan: 2000.
	ds noDot.
	ds connectColor: Color red.
	ds points: (precisions collectWithIndex: [ :y :i | i -> y ]).
	ds x: #key.
	ds y: #value.
	ds dotShape rectangle color: Color blue.
	b addRight: ds.
	b axisX noDecimal; title: 'Epoch'.
	b axisY title: 'Error'.
	b axisYRight title: 'Precision'; color: Color red.
	^ b
]

{ #category : #'as yet unclassified' }
NNetwork >> viewLearningCurveIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'Learning';
		initializeView: [ self viewLearningCurve ]
]

{ #category : #'as yet unclassified' }
NNetwork >> viewNetwork [
	| b lb |
	b := RTMondrian new.
	
	b nodes: layers forEach: [ :aLayer |
		b shape circle size: 20.
		b nodes: aLayer neurons.
		b layout verticalLine.
	].

	b shape arrowedLine; withShorterDistanceAttachPoint.
	b edges connectTo: #nextLayer.
	b layout horizontalLine gapSize: 30; center.
	
	b build.
	
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: self numberOfNeurons asString, ' neurons'.
	lb addText: self numberOfInputs asString, ' inputs'.
	lb build.
	^ b view
]

{ #category : #'as yet unclassified' }
NNetwork >> viewNetworkIn: composite [
	<gtInspectorPresentationOrder: -5>
	composite roassal2
		title: 'Network';
		initializeView: [ self viewNetwork ]
]

{ #category : #accessing }
NNetwork >> visualStencil [

	| weightsContainer nameTextContainer containerTotal verticalContainer containerLayerLabel containerForNeuron |
	containerTotal := BlElement new
		             layout: BlLinearLayout horizontal;
		             background: Color white;
		             aptitude: BrShadowAptitude;
		             margin: (BlInsets all: 20);
		             constraintsDo: [ :c | 
			             c horizontal fitContent.
			             c vertical fitContent ].
			             
	" --- inputs --- "
	layers withIndexDo: [ :layer :index | 
			| containerForALayer containerSeparator |
			containerForALayer := BlElement new
				layout: BlLinearLayout vertical;
				background: Color yellow lighter.
			containerLayerLabel := ( BrEditor new
		                    aptitude:
			                    (BrGlamorousRegularEditorAptitude new 
				                     fontSize: 16);
		                    text: 'layer ',index asString , '         ';
		                    constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ]).
			containerForALayer addChild: containerLayerLabel.
			
			layer neurons withIndexDo: [ :neuron :neuronIndex | 
				containerForNeuron := (BrEditor new 
					aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
					text: 'neuron').
				containerForALayer addChild: containerForNeuron
			].
			containerTotal addChild: containerForALayer.
			
			"sep"
			containerSeparator := (BlElement new background: Color white).
			containerTotal addChild: containerSeparator
	]. 

	
	"	containerTotal addChild: ( BrEditor new
		                    aptitude:
			                    (BrGlamorousRegularEditorAptitude new 
				                     fontSize: 16);
		                    text: 'inputs';
		                    constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ]).
	"				
	" --- hidden --- "
	" --- output layer --- "

	nameTextContainer := BlTextElement new
		                     constraintsDo: [ :c | c horizontal matchParent ];
		                     margin: (BlInsets
				                      top: 5
				                      right: 0
				                      bottom: 20
				                      left: 5);
		                     text:
			                     ('output' asRopedText glamorousRegularFont
				                      fontSize: 16;
				                      foreground: Color black).
	verticalContainer := BlElement new
		                     layout: BlLinearLayout vertical;
		                     margin: (BlInsets all: 10);
		                     constraintsDo: [ :c | c horizontal fitContent. 
					c vertical fitContent ].
	verticalContainer addChild: nameTextContainer.
	containerTotal addChild: verticalContainer.

	^ containerTotal
]

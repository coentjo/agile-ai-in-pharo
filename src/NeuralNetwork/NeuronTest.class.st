Class {
	#name : #NeuronTest,
	#superclass : #TestCase,
	#category : #NeuralNetwork
}

{ #category : #accessing }
NeuronTest >> neutronMap [
"Started as copy of >>newMapWithNodes"
	<gtExample>
	| aWardleyMap inp1 inp2 neuron out edge1 edge2 |
	neuron := GtWardleyMapNodeModelExamples new newNode.
	neuron coordinate: (0.50@0.25);
		size: 50@50;
		color: Color gray lighter;
		label: 'bias 1.0'.


	inp1 := GtWardleyMapNodeModelExamples new newNode.
	inp1 
		coordinate: (0.1@0.15);
		color: Color gray ;
		label: 'weight 1'.

	inp2 := GtWardleyMapNodeModelExamples new newNode.
	inp2 coordinate: (0.1@0.30);
		color: (Color gray);
		label: 'weight 1.5'.
		
	out := GtWardleyMapNodeModelExamples new newNode.
	out coordinate: (0.5@0.25);
		color: (Color gray);
		size: 25@25;
		label: 'weight 1.5'.

	edge1 := GtWardleyMapEdgeModel new fromNode: inp1; toNode: neuron; arrow: true; width: 1.
	edge2 := GtWardleyMapEdgeModel new fromNode: inp2; toNode: neuron; arrow: true; width: 1.

	aWardleyMap := self newMap.
	aWardleyMap addNode: inp1.
	aWardleyMap addNode: inp2.
	aWardleyMap addNode: neuron.
	aWardleyMap addEdge: edge1.
	aWardleyMap addEdge: edge2.
	
	self assert: aWardleyMap nodes size equals: 3.
	self assert: aWardleyMap edges size equals:2.

	^ aWardleyMap
]

{ #category : #accessing }
NeuronTest >> newMap [
	<gtExample>
	| aWardleyMap |
	
	aWardleyMap := GtWardleyMapModel new.
	self assert: aWardleyMap nodes isEmpty.
	^ aWardleyMap
]

{ #category : #'as yet unclassified' }
NeuronTest >> testTrainingAND [
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	
	5000
		timesRepeat: [ 
			p train: #(0 0) desiredOutput: 0.
			p train: #(0 1) desiredOutput: 0.
			p train: #(1 0) desiredOutput: 0.
			p train: #(1 1) desiredOutput: 1 ].
		
	self assert: ((p feed: #(0 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(0 1)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(1 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(1 1)) closeTo: 1 precision: 0.1).
]

{ #category : #'as yet unclassified' }
NeuronTest >> testTrainingOR [
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	
	5000
		timesRepeat: [ 
			p train: #(0 0) desiredOutput: 0.
			p train: #(0 1) desiredOutput: 1.
			p train: #(1 0) desiredOutput: 1.
			p train: #(1 1) desiredOutput: 1 ].
		
	self assert: ((p feed: #(0 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(0 1)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 0)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 1)) closeTo: 1 precision: 0.1).
]

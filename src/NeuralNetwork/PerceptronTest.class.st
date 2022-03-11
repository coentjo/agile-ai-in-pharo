Class {
	#name : #PerceptronTest,
	#superclass : #TestCase,
	#category : #NeuralNetwork
}

{ #category : #'as yet unclassified' }
PerceptronTest >> digitalComparator: inputs [
    "Return an array of three elements"
    | not and nor a b aGb aEb aLb notA notB |
    a := inputs first.
    b := inputs second.

    and := self newNeuron weights: #(1 1); bias: -1.5.
    not := self newNeuron weights: #(-1); bias: 0.5.
    nor := self newNeuron weights: #(-1 -1); bias: 0.5. 

    notA := not feed: { a }. 
    notB := not feed: { b }.
    
    aLb := and feed: { notA . b }.
    aGb := and feed: { a . notB }.
    aEb := nor feed: { aGb . aLb }.
    ^ { aGb . aEb . aLb }
]

{ #category : #accessing }
PerceptronTest >> neuronMap [
"Started as copy of >>newMapWithNodes"
	<gtExample>
	| aWardleyMap aNodeA aNodeB aNodeC anEdgeAtoB |

	aNodeA := GtWardleyMapNodeModelExamples new newNode.
	aNodeA coordinate: (0.25@0.75).
	aNodeA color: Color gray.
	aNodeA label: 'Node A'.

	aNodeB := GtWardleyMapNodeModelExamples new newNode.
	aNodeB coordinate: (0.5@0.25).
	aNodeB color: (Color black alpha: 0.2).
	aNodeB label: 'Node B'.

	aNodeC := GtWardleyMapNodeModelExamples new newNode.
	aNodeC coordinate: (0.75@0.5).
	aNodeC color: Color red darker.
	aNodeC label: 'Node C'.

	anEdgeAtoB := GtWardleyMapEdgeModel new
		fromNode: aNodeA;
		toNode: aNodeB;
		arrow: true;
		width: 2.

	aWardleyMap := self newMap.
	aWardleyMap addNode: aNodeA.
	aWardleyMap addNode: aNodeB.
	aWardleyMap addNode: aNodeC.
	aWardleyMap addEdge: anEdgeAtoB.
	
	self assert: aWardleyMap nodes size equals: 3.
	self assert: aWardleyMap edges size equals: 1.

	^ aWardleyMap
]

{ #category : #accessing }
PerceptronTest >> newMap [
	<gtExample>
	| aWardleyMap |
	
	aWardleyMap := GtWardleyMapModel new.
	self assert: aWardleyMap nodes isEmpty.
	^ aWardleyMap
]

{ #category : #accessing }
PerceptronTest >> newNeuron [
	<gtExample>
	"Return a new neuron with the step activation function"
	^ Neuron new step
]

{ #category : #accessing }
PerceptronTest >> testAND [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(1 1).
	p bias: -1.5.
	
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 1.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testDigitalComparator [
	<gtExample>
	self assert: (self digitalComparator: #(0 0)) equals: #(0 1 0).
	self assert: (self digitalComparator: #(0 1)) equals: #(0 0 1).
	self assert: (self digitalComparator: #(1 0)) equals: #(1 0 0).
	self assert: (self digitalComparator: #(1 1)) equals: #(0 1 0).
]

{ #category : #accessing }
PerceptronTest >> testNOR [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(-1 -1).
	p bias: 0.5.
	
	self assert: (p feed: #(0 0)) equals: 1.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 0.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testNOT [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(-1).
	p bias: 0.5.
	
	self assert: (p feed: #(1)) equals: 0.
	self assert: (p feed: #(0)) equals: 1.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testOR [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(1 1).
	p bias: -0.5.
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 1.
	self assert: (p feed: #(1 0)) equals: 1.
	self assert: (p feed: #(1 1)) equals: 1.
	p feed: #(0 0).
	^ p

]

{ #category : #accessing }
PerceptronTest >> testSmallExample [
	<gtExample>
	| p result |
	p := self newNeuron.
	p weights: #(1 2).
	p bias: -2.
	result := p feed: #(5 2).
	self assert: result equals: 1.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testTrainingNOT [
	<gtExample>

	| p |
	p := self newNeuron.
	p weights: #(-1).
	p bias: 2.
	
	40 timesRepeat: [ 
		p train: #(0) desiredOutput: 1.
		p train: #(1) desiredOutput: 0.
	].
	
	self assert: (p feed: #(0)) equals: 1.
	self assert: (p feed: #(1)) equals: 0.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testTrainingOR [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(-1 -1).
	p bias: 2.
	
	40 timesRepeat: [ 
		p train: #(0 0) desiredOutput: 0.
		p train: #(0 1) desiredOutput: 1.
		p train: #(1 0) desiredOutput: 1.
		p train: #(1 1) desiredOutput: 1.
	].
	
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 1.
	self assert: (p feed: #(1 0)) equals: 1.
	self assert: (p feed: #(1 1)) equals: 1.
	^ p
]

{ #category : #accessing }
PerceptronTest >> testWrongFeeding [
	<gtExample>
	| p |
	p := self newNeuron.
	p weights: #(-1).
	p bias: 0.5.
	
	self should: [ p feed: #(1 1) ] raise: Error.
	^ p
]

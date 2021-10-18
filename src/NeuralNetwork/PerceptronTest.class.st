Class {
	#name : #PerceptronTest,
	#superclass : #TestCase,
	#category : #NeuralNetwork
}

{ #category : #examples }
PerceptronTest >> chapter02Example01 [
	<gtExample>
	^ #(1 2 3) 
		with: #(10 20 30) 
		collect: [ :a :b | a + b ]
]

{ #category : #examples }
PerceptronTest >> chapter02Example02 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(1 2).
	p bias: -2.
	p feed: #(5 2). 
	^ p
]

{ #category : #examples }
PerceptronTest >> chapter02Example03 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	p feed: #(0 1).
	^ p
]

{ #category : #accessing }
PerceptronTest >> chapter02Example04 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	p train: #(0 1) desiredOutput: 0.
	p feed: #(0 1).
	^ p
]

{ #category : #accessing }
PerceptronTest >> chapter02Example05 [
<gtExample>
| p |
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
10 timesRepeat: [ p train: #(0 1) desiredOutput: 0 ].
p feed: #(0 1).
^ p
]

{ #category : #accessing }
PerceptronTest >> chapter02Example06 [
<gtExample>
| g d |
g := 'RTGrapher new'.
d := 'RTData new'.
d connectColor: Color blue.
d points: (1 to: 100).
d y: [ :x | (x / 3.14) sin  ].
g add: d.
g
]

{ #category : #accessing }
PerceptronTest >> chapter02Example07 [
	<gtExample>
| somePoints f g d |
somePoints := OrderedCollection new.
500 timesRepeat: [ 
	somePoints add: {(50 atRandom - 25) . (50 atRandom - 25)}
].

f := [ :x | (-2 * x) - 3 ].

"We use the Roassal Grapher engine to plot our points"
g := 'RTGrapher new'.
d := 'RTData new'.
d dotShape 
	color: [ :p | (p second > (f value: p first)) 
					ifTrue: [ Color red trans ] 
					ifFalse: [ Color blue trans ] ].
d points: somePoints.
d x: #first.
d y: #second.
g add: d.
g
]

{ #category : #accessing }
PerceptronTest >> chapter02Example08 [
	<gtExample>
| somePoints f g d d2 |
	somePoints := OrderedCollection new.
500 timesRepeat: [ 
	somePoints add: {(50 atRandom - 25) . (50 atRandom - 25)}
].

f := [ :x | (-2 * x) - 3 ].

g := 'RTGrapher new'.
d := 'RTData new'.
d dotShape 
	color: [ :p | (p second > (f value: p first)) 
					ifTrue: [ Color red trans ] 
					ifFalse: [ Color blue trans ] ].
d points: somePoints.
d x: #first.
d y: #second.
g add: d.

"Added code below"
d2 := 'RTData new'.
d2 noDot.
d2 connectColor: Color red.
d2 points: (-15 to: 15 by: 0.1).
d2 y: f.
d2 x: #yourself.
g add: d2.
g
]

{ #category : #accessing }
PerceptronTest >> chapter02Example09 [
	<gtExample>
| f p r g d d2 testPoints |
	f := [ :x | (-2 * x) - 3 ].
p := Neuron new.
p weights: { 1 . 2 }.
p bias: -1.
r := Random new seed: 42.

"We are training the perceptron"
500 timesRepeat: [  | anX anY designedOutput |
	anX := (r nextInt: 50) - 25.
	anY := (r nextInt: 50) - 25.
	designedOutput := (f value: anX) >= anY 
								ifTrue: [ 1 ] ifFalse: [ 0 ].
	p train: { anX . anY } desiredOutput: designedOutput 
].

"Test points"
testPoints := OrderedCollection new.
2000 timesRepeat: [ 
	testPoints add: { ((r nextInt: 50) - 25) . ((r nextInt: 50) - 25) }
].

g := 'RTGrapher new'.
d := 'RTData new'.
d dotShape 
	color: [ :point | (p feed: point) > 0.5 
					ifTrue: [ Color red trans ] 
					ifFalse: [ Color blue trans ] ].
d points: testPoints.
d x: #first.
d y: #second.
g add: d.

d2 := 'RTData new'.
d2 noDot.
d2 connectColor: Color red.
d2 points: (-15 to: 15 by: 0.1).
d2 y: f.
d2 x: #yourself.
g add: d2.
^ g
]

{ #category : #accessing }
PerceptronTest >> chapter02Example10 [
	<gtExample>
| r |
r := Random new seed: 42.
^ r nextInt: 50
]

{ #category : #accessing }
PerceptronTest >> chapter02Example11 [
	<gtExample>
^ (1 to: 5) 
	collect: [ :i | 50 atRandom ]
]

{ #category : #accessing }
PerceptronTest >> chapter02Example12 [
	<gtExample>
	| r |
	r := Random new seed: 42.
	^ (1 to: 5) collect: [ :i | r nextInt: 50 ]
]

{ #category : #accessing }
PerceptronTest >> chapter02Example13 [
	<gtExample>
| learningCurve f g d |
learningCurve := OrderedCollection new.
f := [ :x | (-2 * x) - 3 ].

0 to: 2000 by: 10 do: [ :nbOfTrained | | r p anX anY trainedOutput nbOfGood nbOfTries realOutput |
	r := Random new seed: 42.
	p := Neuron new.
	p weights: #(1 2).
	p bias: -1.

	nbOfTrained timesRepeat: [ 
		anX := (r nextInt: 50) - 25.
		anY := (r nextInt: 50) - 25.
		trainedOutput := (f value: anX) >= anY ifTrue: [1] ifFalse: [0].
		p train: (Array with: anX with: anY) desiredOutput: trainedOutput ].
	
	nbOfGood := 0.
	nbOfTries := 1000.
	nbOfTries timesRepeat: [ 
		anX := (r nextInt: 50) - 25.
		anY := (r nextInt: 50)- 25.
		realOutput := (f value: anX) >= anY ifTrue: [1] ifFalse: [0].
		((p feed: { anX . anY }) - realOutput) abs < 0.2
			ifTrue: [ nbOfGood := nbOfGood + 1 ].
	].
	learningCurve add: { nbOfTrained . (nbOfGood / nbOfTries) }.
].

g := 'RTGrapher new'.
d := 'RTData new'.
d noDot.
d connectColor: Color blue.
d points: learningCurve.
d x: #first.
d y: #second.
g add: d.
g axisY title: 'Precision'.
g axisX noDecimal; title: 'Training iteration'.
g
]

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

{ #category : #'as yet unclassified' }
PerceptronTest >> newNeuron [
	"Return a new neuron with the step activation function"
	^ Neuron new step
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testAND [
	| p |
	p := self newNeuron.
	p weights: #(1 1).
	p bias: -1.5.
	
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 1.
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testDigitalComparator [
	self assert: (self digitalComparator: #(0 0)) equals: #(0 1 0).
	self assert: (self digitalComparator: #(0 1)) equals: #(0 0 1).
	self assert: (self digitalComparator: #(1 0)) equals: #(1 0 0).
	self assert: (self digitalComparator: #(1 1)) equals: #(0 1 0).
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testNOR [
	| p |
	p := self newNeuron.
	p weights: #(-1 -1).
	p bias: 0.5.
	
	self assert: (p feed: #(0 0)) equals: 1.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 0.
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testNOT [
	| p |
	p := self newNeuron.
	p weights: #(-1).
	p bias: 0.5.
	
	self assert: (p feed: #(1)) equals: 0.
	self assert: (p feed: #(0)) equals: 1.
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testOR [
	| p |
	p := self newNeuron.
	p weights: #(1 1).
	p bias: -0.5.
	
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 1.
	self assert: (p feed: #(1 0)) equals: 1.
	self assert: (p feed: #(1 1)) equals: 1.
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testSmallExample [
	| p result |
	p := self newNeuron.
	p weights: #(1 2).
	p bias: -2.
	result := p feed: #(5 2).
	self assert: result equals: 1.
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testTrainingNOT [
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
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testTrainingOR [
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
]

{ #category : #'as yet unclassified' }
PerceptronTest >> testWrongFeeding [
	| p |
	p := self newNeuron.
	p weights: #(-1).
	p bias: 0.5.
	
	self should: [ p feed: #(1 1) ] raise: Error
]

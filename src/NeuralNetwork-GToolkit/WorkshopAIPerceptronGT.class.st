"
Some examples:
-----------------------------
#(1 2 3) with: #(10 20 30) collect: [ :a :b | a + b ]
-----------------------------
p := Neuron new.
p weights: #(1 2).
p bias: -2.
p feed: #(5 2)
-----------------------------
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
p feed: #(0 1).
-----------------------------
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
p train: #(0 1) desiredOutput: 0.
p feed: #(0 1).
-----------------------------
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
10 timesRepeat: [ p train: #(0 1) desiredOutput: 0 ].
p feed: #(0 1).
-----------------------------
g := RTGrapher new.
d := RTData new.
d connectColor: Color blue.
d points: (1 to: 100).
d y: [ :x | (x / 3.14) sin  ].
g add: d.
g
-----------------------------
somePoints := OrderedCollection new.
500 timesRepeat: [
	somePoints add: {(50 atRandom - 25) . (50 atRandom - 25)}
].
f := [ :x | (-2 * x) - 3 ].
""We use the Roassal Grapher engine to plot our points""
g := RTGrapher new.
d := RTData new.
d dotShape
	color: [ :p | (p second > (f value: p first))
					ifTrue: [ Color red trans ]
					ifFalse: [ Color blue trans ] ].
d points: somePoints.
d x: #first.
d y: #second.
g add: d.
g
-----------------------------
somePoints := OrderedCollection new.
500 timesRepeat: [
	somePoints add: {(50 atRandom - 25) . (50 atRandom - 25)}
].
f := [ :x | (-2 * x) - 3 ].
g := RTGrapher new.
d := RTData new.
d dotShape
	color: [ :p | (p second > (f value: p first))
					ifTrue: [ Color red trans ]
					ifFalse: [ Color blue trans ] ].
d points: somePoints.
d x: #first.
d y: #second.
g add: d.
""Added code below""
d2 := RTData new.
d2 noDot.
d2 connectColor: Color red.
d2 points: (-15 to: 15 by: 0.1).
d2 y: f.
d2 x: #yourself.
g add: d2.
g
-----------------------------
f := [ :x | (-2 * x) - 3 ].
p := Neuron new.
p weights: { 1 . 2 }.
p bias: -1.
r := Random new seed: 42.
""We are training the perceptron""
500 timesRepeat: [
	anX := (r nextInt: 50) - 25.
	anY := (r nextInt: 50) - 25.
	designedOutput := (f value: anX) >= anY
								ifTrue: [ 1 ] ifFalse: [ 0 ].
	p train: { anX . anY } desiredOutput: designedOutput
].
""Test points""
testPoints := OrderedCollection new.
2000 timesRepeat: [
	testPoints add: { ((r nextInt: 50) - 25) . ((r nextInt: 50) - 25) }
].
g := RTGrapher new.
d := RTData new.
d dotShape
	color: [ :point | (p feed: point) > 0.5
					ifTrue: [ Color red trans ]
					ifFalse: [ Color blue trans ] ].
d points: testPoints.
d x: #first.
d y: #second.
g add: d.
d2 := RTData new.
d2 noDot.
d2 connectColor: Color red.
d2 points: (-15 to: 15 by: 0.1).
d2 y: f.
d2 x: #yourself.
g add: d2.
g
-----------------------------
r := Random new seed: 42.
r nextInt: 50.
-----------------------------
(1 to: 5) collect: [ :i | 50 atRandom ]
-----------------------------
r := Random new seed: 42.
(1 to: 5) collect: [ :i | r nextInt: 50 ]
-----------------------------
learningCurve := OrderedCollection new.
f := [ :x | (-2 * x) - 3 ].
0 to: 2000 by: 10 do: [ :nbOfTrained |
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
g := RTGrapher new.
d := RTData new.
d noDot.
d connectColor: Color blue.
d points: learningCurve.
d x: #first.
d y: #second.
g add: d.
g axisY title: 'Precision'.
g axisX noDecimal; title: 'Training iteration'.
g
"
Class {
	#name : #WorkshopAIPerceptronGT,
	#superclass : #Object,
	#category : #'NeuralNetwork-NeuralNetwork'
}

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron01 [
	<gtExample>
	^ #(1 2 3)
		with: #(10 20 30)
		collect: [ :a :b | a + b ]
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron02 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(1 2).
	p bias: -2.
	p feed: #(5 2).
	^ p
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron03 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	p feed: #(0 1).
	^ p
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron04 [
	<gtExample>
	| p |
	p := Neuron new.
	p weights: #(-1 -1).
	p bias: 2.
	p train: #(0 1) desiredOutput: 0.
	p feed: #(0 1).
	^ p
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron05 [
<gtExample>
| p |
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
10 timesRepeat: [ p train: #(0 1) desiredOutput: 0 ].
p feed: #(0 1).
^ p
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron06 [
	<gtExample>
	"started as copy of GtPlotterRawLineExamples>>content"

	| aScaleY aScaleX vertices f xValues contentLine |
	f := [ :x | (x / 3.14) sin ].
	xValues := 1 to: 100.
	aScaleX := GtPlotterLinearScale new domainFrom: 1 to: 100.
	aScaleY := GtPlotterLinearScale new domainFrom: -1 to: 1.
		vertices := xValues collect: [ :i |
		               (aScaleX map: i) @ (1 - (aScaleY map: (f  value: i))) ].
	contentLine := BlElement new
		geometry: (BlNormalizedPolyline vertices: vertices);
		border: (BlBorder paint: Color orange width: 2);
		outskirts: BlOutskirts centered;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	^ BrFrame new
		  matchParent;
		  addChildren: { contentLine }
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01Perceptron07 [
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
WorkshopAIPerceptronGT >> chapter01Perceptron08 [
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
WorkshopAIPerceptronGT >> chapter01Perceptron09 [
	<gtExample>
	| f p r g d d2 testPoints |
	f := [ :x | -2 * x - 3 ].
	p := Neuron new.
	p weights: { 1. 2 }.
	p bias: -1.
	r := Random new seed: 42.

	"We are training the perceptron"
	500 timesRepeat: [
		| anX anY designedOutput |
		anX := (r nextInteger: 50) - 25.
		anY := (r nextInteger: 50) - 25.
		designedOutput := (f value: anX) >= anY
			                  ifTrue: [ 1 ]
			                  ifFalse: [ 0 ].
		p
			train: {
					anX.
					anY }
			desiredOutput: designedOutput ].

	"Test points"
	testPoints := OrderedCollection new.
	2000 timesRepeat: [
		testPoints add: {
				((r nextInteger: 50) - 25).
				((r nextInteger: 50) - 25) } ].

	g := 'RTGrapher new'.
	d := 'RTData new'.
	d dotShape color: [ :point |
		(p feed: point) > 0.5
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
WorkshopAIPerceptronGT >> chapter01Perceptron10 [
	<gtExample>
	| r |
	r := Random new seed: 42.
	^ r nextInteger: 50
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron11 [
	<gtExample>
^ (1 to: 5)
	collect: [ :i | 50 atRandom ]
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron12 [
	<gtExample>
	| r |
	r := Random new seed: 42.
	^ (1 to: 5) collect: [ :i | r nextInteger: 50 ]
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron13 [

	<gtExample>
	| learningCurve f g d |
	learningCurve := OrderedCollection new.
	f := [ :x | -2 * x - 3 ].

	0 to: 2000 by: 10 do: [ :nbOfTrained |
		| r p anX anY trainedOutput nbOfGood nbOfTries realOutput |
		r := Random new seed: 42.
		p := Neuron new.
		p weights: #( 1 2 ).
		p bias: -1.

		nbOfTrained timesRepeat: [
			anX := (r nextInt: 50) - 25.
			anY := (r nextInt: 50) - 25.
			trainedOutput := (f value: anX) >= anY
				                 ifTrue: [ 1 ]
				                 ifFalse: [ 0 ].
			p train: (Array with: anX with: anY) desiredOutput: trainedOutput ].

		nbOfGood := 0.
		nbOfTries := 1000.
		nbOfTries timesRepeat: [
			anX := (r nextInteger: 50) - 25.
			anY := (r nextInteger: 50) - 25.
			realOutput := (f value: anX) >= anY
				              ifTrue: [ 1 ]
				              ifFalse: [ 0 ].
			((p feed: {
					  anX.
					  anY }) - realOutput) abs < 0.2 ifTrue: [
				nbOfGood := nbOfGood + 1 ] ].
		learningCurve add: {
				nbOfTrained.
				(nbOfGood / nbOfTries) } ].

	g := 'RTGrapher new'.
	d := 'RTData new'.
	d noDot.
	d connectColor: Color blue.
	d points: learningCurve.
	d x: #first.
	d y: #second.
	g add: d.
	g axisY title: 'Precision'.
	g axisX
		noDecimal;
		title: 'Training iteration'.
	g
]

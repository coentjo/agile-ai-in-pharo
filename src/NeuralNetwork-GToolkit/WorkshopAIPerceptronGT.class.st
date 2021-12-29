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
	#superclass : #WorkshopAI,
	#instVars : [
		'random',
		'currentSlide'
	],
	#category : #'NeuralNetwork-GToolkit'
}

{ #category : #accessing }
WorkshopAIPerceptronGT >> aRandomNumber [

	^ 50 atRandom - 25
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
	50 timesRepeat: [
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
	20 timesRepeat: [
		testPoints add: {
				((r nextInteger: 50) - 25).
				((r nextInteger: 50) - 25) } ].

	g := RTGrapher new.
	d := RTData new.
	d dotShape color: [ :point |
		(p feed: point) > 0.5
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
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron10 [
	<gtExample>
	"Example code to generate a random number"
	"By using a known seed (the 42 below) it becomes repeatable!"
	| r |
	r := Random new seed: 42.
	^ r nextInteger: 50
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron11 [

	<gtExample>
	"so this will generate different numbers every time you run it"
	^ (1 to: 5) collect: [ :i | 50 atRandom ]
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01Perceptron12 [

	<gtExample>
	"This will give the same numbers over and over again."
	| r |
	r := Random new seed: 42.
	^ (1 to: 5) collect: [ :i | r nextInteger: 50 ]
]

{ #category : #example }
WorkshopAIPerceptronGT >> chapter01PerceptronAndGateWithInputs [

	"Weights 1, 1 with bias -1.5 makes it an AND gate"

	<gtExample>
	| andGate |
	andGate := self perceptronForANDGate.
	" Putting 1 and 1 in an AND Gate gives: "
	^ andGate fire: #( 1 1 )
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> chapter01PerceptronSinus [
	<gtExample>
	| g d |
	g := RTGrapher new.
	d := RTData new.
	d connectColor: Color blue.
	d points: (1 to: 100).
	d y: [ :x | (x / 3.14) sin  ].
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> exampleGraphSinus [

	<gtExample>
	"Example of how to create a graph"
	| g d |
	g := RTGrapher new.
	d := RTData new.
	d connectColor: Color blue.
	d points: (1 to: 100).
	d y: [ :x | (x / 3.14) sin ].
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> exampleGraphSinus_b [

	"started as copy of GtPlotterRawLineExamples>>content"

	<gtExample>
	| aScaleY aScaleX vertices xValues verticesScaled range function |
	function := [ :x | (x / 3.14) sin ].
	range := 1 to: 100.
	vertices := range collect: [ :x | x @ (function value: x) ].
	aScaleX := GtPlotterLinearScale new
		           domainFrom: range first
		           to: range last.
	aScaleY := GtPlotterLinearScale new domainFrom: -1 to: 1.
	verticesScaled := self scale: vertices inX: aScaleX inY: aScaleY.
	^ self plot: verticesScaled
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> exampleMeasuringPrecision [

	<gtExample>
	| learningCurve f r p anX anY trainedOutput nbOfGood nbOfTries realOutput g d |
	learningCurve := OrderedCollection new.
	f := [ :x | -2 * x - 3 ].
	0 to: 20 by: 10 do: [ :nbOfTrained | 
		r := Random new seed: 42.
		p := Neuron new.
		p weights: #( 1 2 ).
		p bias: -1.
		nbOfTrained timesRepeat: [ 
			anX := (r nextInteger: 50) - 25.
			anY := (r nextInteger: 50) - 25.
			trainedOutput := (f value: anX) >= anY
				                 ifTrue: [ 1 ]
				                 ifFalse: [ 0 ].
			p train: (Array with: anX with: anY) desiredOutput: trainedOutput ].

		nbOfGood := 0.
		nbOfTries := 10.
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
	g := RTGrapher new.
	d := RTData new.
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
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> exampleMeasuringPrecision_b [

	<gtExample>
	| function aScaleY aScaleX verticesScaled xValues contentLine learningCurve g d range vertices perceptron |
	learningCurve := OrderedCollection new.
	function := [ :x | -2 * x - 3 ].
	range := 0 to: 2000 by: 10.

	range first to: range last by: range increment do: [ :nbOfTrained | 
		| anX anY trainedOutput nbOfGood nbOfTries realOutput |
		perceptron := self newPerceptronWithWeights: { 1 . 2 } andBias: -1.

		nbOfTrained timesRepeat: [ 
			anX := self aRandomNumber.
			anY := self aRandomNumber.
			trainedOutput := (function value: anX) >= anY
				                 ifTrue: [ 1 ]
				                 ifFalse: [ 0 ].
			perceptron train: (Array with: anX with: anY) desiredOutput: trainedOutput ].

		nbOfGood := 0.
		nbOfTries := 1000.
		nbOfTries timesRepeat: [ 
			anX := self randomIntegerBetween: -24 and: 25.
			anY := self randomIntegerBetween: -24 and: 25.
			realOutput := (function value: anX) >= anY
				              ifTrue: [ 1 ]
				              ifFalse: [ 0 ].
			((perceptron feed: { 
					  anX.
					  anY }) - realOutput) abs < 0.2 ifTrue: [ 
				nbOfGood := nbOfGood + 1 ] ].
		learningCurve add: nbOfTrained @ (nbOfGood / nbOfTries) ].

	vertices := range collect: [ :x | x @ (function value: x) ].
	aScaleX := GtPlotterLinearScale new domainFrom: 1 to: 2000.
	aScaleY := GtPlotterLinearScale new domainFrom: -1000 to: 1.
	verticesScaled := self scale: vertices inX: aScaleX inY: aScaleY.
	^ self plot: verticesScaled
]

{ #category : #example }
WorkshopAIPerceptronGT >> examplePharoArrays [
	<gtExample>
	^ #(1 2 3)
		with: #(10 20 30)
		collect: [ :a :b | a + b ]
]

{ #category : #example }
WorkshopAIPerceptronGT >> getRTDataForSomePoints [

	| somePoints d f |
	somePoints := OrderedCollection new.
	500 timesRepeat: [ 
		somePoints add: { 
				(50 atRandom - 25).
				(50 atRandom - 25) } ].

	f := [ :x | -2 * x - 3 ].

	d := RTData new.
	d dotShape color: [ :p | 
		p second > (f value: p first)
			ifTrue: [ Color red trans ]
			ifFalse: [ Color blue trans ] ].
	d points: somePoints.
	d x: #first.
	d y: #second.
	^ d
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> newPerceptronWithWeights: anArray andBias: anInteger [ 
	"in fact an instance of Neuron is created, not of Perceptron, but because of the 'step' it will behave like a Perceptron."
	^ Neuron new step
		weights: anArray;
		bias: anInteger;
		yourself

]

{ #category : #example }
WorkshopAIPerceptronGT >> perceptronColoredDots [

	<gtExample>
	| somePoints f g d |
	somePoints := OrderedCollection new.
	500 timesRepeat: [ 
		somePoints add: { 
				self aRandomNumber .
				self aRandomNumber } ].

	f := [ :x | -2 * x - 3 ].

	"We use the Roassal Grapher engine to plot our points"
	g := RTGrapher new.
	d := RTData new.
	d dotShape color: [ :p | 
		p second > (f value: p first)
			ifTrue: [ Color red trans ]
			ifFalse: [ Color blue trans ] ].
	d points: somePoints.
	d x: #first.
	d y: #second.
	g add: d.
	
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> perceptronColoredDotsWithLine [

	<gtExample>
	| somePoints f g d d2 |
	somePoints := OrderedCollection new.
	500 timesRepeat: [ 
		somePoints add: { 
				self aRandomNumber.
				self aRandomNumber } ].

	f := [ :x | -2 * x - 3 ].

	"We use the Roassal Grapher engine to plot our points"
	g := RTGrapher new.
	d := RTData new.
	d dotShape color: [ :p | 
		p second > (f value: p first)
			ifTrue: [ Color red trans ]
			ifFalse: [ Color blue trans ] ].
	d points: somePoints.
	d x: #first.
	d y: #second.
	g add: d.

	"Added line to graph"
	d2 := RTData new.
	d2 noDot.
	d2 connectColor: Color red.
	d2 points: (-15 to: 15 by: 0.1).
	d2 y: f.
	d2 x: #yourself.
	g add: d2.
	^ self showGraphInMorph: g
]

{ #category : #example }
WorkshopAIPerceptronGT >> perceptronColoredDots_b [
	<gtExample>
	| g somePoints d function aScaleX aScaleY |
	function := [ :x | -2 * x - 3 ].
	somePoints := OrderedCollection new.
	500 timesRepeat: [ 
		somePoints add:  
				self aRandomNumber @ self aRandomNumber ].
	aScaleX := GtPlotterLinearScale new domainFrom: -25 to: 25.
	aScaleY := GtPlotterLinearScale new domainFrom: -25 to: 25 .
"	d := RTData new.
	d dotShape color: [ :p | 
		p second > (function value: p first)
			ifTrue: [ Color red trans ]
			ifFalse: [ Color blue trans ] ].
	d points: somePoints.
	d x: #x.
	d y: #y.
	^ d
"
	^ self plot: somePoints
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> perceptronForANDGate [

	"Weights 1, 1 with bias -1.5 makes the Perceptron an AND gate"

	<gtExample>
	<noTest>
	^ self 
		newPerceptronWithWeights: #( 1 1 ) 
		andBias: -1.5

	"Look at both the tabs 'Visual' as well as 'Schematic' "
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> perceptronForNORGate [
	<gtExample>
	<noTest>
	"Weights -1, -1 with bias -0.5 makes the Perceptron an NOR gate"

	^ self 
		newPerceptronWithWeights: #(-1 -1) 
		andBias: -0.5 .

]

{ #category : #accessing }
WorkshopAIPerceptronGT >> perceptronForNOTGate [
	<gtExample>
	<noTest>
	"Weight -1 with bias 0.5 makes the Perceptron a NOT gate"

	^ self newPerceptronWithWeights: #( -1 ) andBias: 0.5

]

{ #category : #accessing }
WorkshopAIPerceptronGT >> perceptronForORGate [
	<gtExample>
	<noTest>
	"Weights 1, 1 with bias -0.5 makes the Perceptron an OR gate"

	^ self newPerceptronWithWeights: #(1 1) andBias: -0.5 .

]

{ #category : #example }
WorkshopAIPerceptronGT >> perceptronTrain [

	<gtExample>
	<npoTest>
	| p |
	p := self newPerceptronWithWeights: #( -1 -1 ) andBias: 2.
	10 timesRepeat: [ p train: #( 0 1 ) desiredOutput: 0 ].
	"p feed: #(0 1)."
	^ p fire: #( 0 1 )
]

{ #category : #example }
WorkshopAIPerceptronGT >> plot: vertices [

	| contentLine |
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

{ #category : #accessing }
WorkshopAIPerceptronGT >> random [
	^ random 
		ifNil: 
			[random := Random new seed: 42]
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> randomIntegerBetween: lowerbound and: upperbound [
	^ self random nextIntegerBetween: lowerbound and: upperbound 
]

{ #category : #example }
WorkshopAIPerceptronGT >> scale: vertices inX: aScaleX inY: aScaleY [

	^ vertices collect: [ :p | 
		  (aScaleX map: p x) @ (1 - (aScaleY map: p y)) ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0010: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.1;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.001.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0020: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.2;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.002.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0030: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.3;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.003.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0040: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.4;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.004.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #accessing }
WorkshopAIPerceptronGT >> testANDGate [
	<gtExample>
	| p |
	p := self perceptronForANDGate.
	
	self assert: (p feed: #(0 0)) equals: 0.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 1.
	
	"Let's show one"
	^ p fire: #(0 0)
]

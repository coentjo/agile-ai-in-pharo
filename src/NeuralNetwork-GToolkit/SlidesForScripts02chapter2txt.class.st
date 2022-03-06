Class {
	#name : #SlidesForScripts02chapter2txt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide10: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
f := [ :x | (-2 * x) - 3 ].
p := Neuron new.
p weights: { 1 . 2 }.
p bias: -1.
r := Random new seed: 42.

"We are training the perceptron"
500 timesRepeat: [ 
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

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide11: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 11;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
r := Random new seed: 42.
r nextInt: 50.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide12: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 12;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
(1 to: 5) collect: [ :i | 50 atRandom ]

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide13: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 13;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
r := Random new seed: 42.
(1 to: 5) collect: [ :i | r nextInt: 50 ]

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide14: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 14;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
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
g axisY title: ''Precision''.
g axisX noDecimal; title: ''Training iteration''.
g
'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide2: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
#(1 2 3) with: #(10 20 30) collect: [ :a :b | a + b ]

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide3: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
p := Neuron new.
p weights: #(1 2).
p bias: -2.
p feed: #(5 2)

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide4: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
p feed: #(0 1).

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide5: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
p train: #(0 1) desiredOutput: 0.
p feed: #(0 1).

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide6: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
p := Neuron new.
p weights: #(-1 -1).
p bias: 2.
10 timesRepeat: [ p train: #(0 1) desiredOutput: 0 ].
p feed: #(0 1).

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide7: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 7;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
g := RTGrapher new.
d := RTData new.
d connectColor: Color blue.
d points: (1 to: 100).
d y: [ :x | (x / 3.14) sin  ].
g add: d.
g

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide8: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 8;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
somePoints := OrderedCollection new.
500 timesRepeat: [ 
	somePoints add: {(50 atRandom - 25) . (50 atRandom - 25)}
].

f := [ :x | (-2 * x) - 3 ].

"We use the Roassal Grapher engine to plot our points"
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

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts02chapter2txt >> scriptSnippetSlide9: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 9;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
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

"Added code below"
d2 := RTData new.
d2 noDot.
d2 connectColor: Color red.
d2 points: (-15 to: 15 by: 0.1).
d2 y: f.
d2 x: #yourself.
g add: d2.
g

'
				]
]

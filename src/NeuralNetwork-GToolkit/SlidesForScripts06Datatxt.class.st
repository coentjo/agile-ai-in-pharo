Class {
	#name : #SlidesForScripts06Datatxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
network := NNetwork new.
network configure: 2 hidden: 3 nbOfOutputs: 1.

20000 timesRepeat: [ 
	network train: #(0 0) desiredOutputs: #(0).	
	network train: #(0 1) desiredOutputs: #(1).
	network train: #(1 0) desiredOutputs: #(1).
	network train: #(1 1) desiredOutputs: #(0).
].
^ network
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 1 1) .
	#(1 0 1) .
	#(1 1 0) }.
n train: data nbEpochs: 20000.
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
	#(0 0 1 1).
	#(0 1 0 2).
	#(0 1 1 3).
	#(1 0 0 4).
	#(1 0 1 5).
	#(1 1 0 6).
	#(1 1 1 7) }.
n train: data nbEpochs: 1000.
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide05: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
	#(0 0 1 1).
	#(0 1 0 2).
	#(0 1 1 3).
	#(1 0 0 4).
	#(1 0 1 5).
	#(1 1 0 6).
	#(1 1 1 7) }.
n train: data nbEpochs: 1000.
...
n predict: #(0 1 1).
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide06: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
data := {#(0 0 0 0).
	#(0 0 1 1).
	#(0 1 0 2).
	#(0 1 1 3).
	#(1 0 0 4).
	#(1 0 1 5).
	#(1 1 0 6).
	#(1 1 1 7) }.
	
d := Dictionary new.
data do: [ :anExample |
	d at: anExample allButLast put: anExample last ].
d at: #(0 1 1).
^ n
'
]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide07: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 7;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
	#(0 0 1 1).
	#(0 1 0 2).
	#(0 1 1 3).
	#(1 0 0 4).
	#(1 0 1 5).
	#(1 1 0 6).
	#(1 1 1 7) }.
n train: data nbEpochs: 1000.
^ n predict: #(0.4 0.7 0.6)
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide08: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 8;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
    #(0 1 1) .
    #(1 0 1) .
    #(1 1 0) }.
n train: data nbEpochs: 10000.
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide09: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 9;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 0 1) }.
n train: data nbEpochs: 1000.
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide10: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 1 1) .
	#(1 0 1) .
	#(1 1 0) }.
n train: data nbEpochs: 10000. 
^ n
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide11: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 11;
		snippets: 
{
'"How to download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.

'n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: irisData nbEpochs: 1000.
'

}.

]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide14: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 14;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'g := RTGrapher new.
#(0.001 0.01 0.1 0.2 0.3)
	doWithIndex: [ :lr :index | 
		learningCurveNeuron := OrderedCollection new.
		0 to: 1000 do: [ :nbOfTrained | 
			r := Random new seed: 42.
			p := Neuron new.
			p weights: #(-1 -1).
			p bias: 2.
			p learningRate: lr.
			nbOfTrained
				timesRepeat: [ p train: #(0 0) desiredOutput: 0.
					p train: #(0 1) desiredOutput: 0.
					p train: #(1 0) desiredOutput: 0.
					p train: #(1 1) desiredOutput: 1 ].
			res := ((p feed: #(0 0)) - 0) abs + ((p feed: #(0 1)) - 0) abs
				+ ((p feed: #(1 0)) - 0) abs + ((p feed: #(1 1)) - 1) abs.
			learningCurveNeuron add: res / 4 ].
		d := RTData new.
		d label: ''Sigmoid neuron lr = '' , lr asString.
		d noDot.
		d connectColor: (RTPalette c1 at: index).
		d points: learningCurveNeuron.
		d y: #yourself.
		g add: d ].
g legend addText: ''Learning rate effect''.
^ WorkshopAI showGraphInMorph: g
'
				]
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide15: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 15;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.

'n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n learningRate: 0.3. " Repeat the script with a different value"
n train: irisData nbEpochs: 1000.
^ n
'
}				
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide16: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 16;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.


'cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.'
}				


]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide17: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 17;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.

'cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
...
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.'
}
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide18: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 18;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.
				
'cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.

(((testData collect: [ :d |
	(n predict: d allButLast) = d last
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 '
}				
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide19: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 19;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.
				
'cut := 0.7.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.

(((testData collect: [ :d |
	(n predict: d allButLast) = d last
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 '
}
				
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide20: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 20;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.
								
'shuffledIrisData := irisData shuffleBy: (Random seed: 42).
cut := 0.8.
cutTraining := (shuffledIrisData size * cut) rounded.
cutTest := (shuffledIrisData size * (1 - cut)) rounded.
trainingData := shuffledIrisData first: cutTraining.
testData := shuffledIrisData last: cutTest.
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.

(((testData collect: [ :d |
	(n predict: d allButLast) = d last
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 '

}
]

{ #category : #accessing }
SlidesForScripts06Datatxt >> scriptSnippetSlide21: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 21;
		snippets: 
{
'"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
'

. 

'"Initialize the variable irisData."
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: '',''.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
		row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
		row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
'

.		

'max := OrderedCollection new.
min := OrderedCollection new.
(1 to: 4) collect: [ :i |
	max add: (irisData collect: [ :d | d at: i ]) max.
	min add: (irisData collect: [ :d | d at: i ]) min.
].
{ max . min }'
}
]

{ #category : #'as yet unclassified' }
SlidesForScripts06Datatxt >> scriptSnippetSlide22: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 22;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
    #(0 0 1 1).
    #(0 1 0 2).
    #(0 1 1 3).
    #(1 0 0 4).
    #(1 0 1 5).
    #(1 1 0 6).
    #(1 1 1 7) }.
n train: data nbEpochs: 1000.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts06Datatxt >> scriptSnippetSlide23: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 23;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
    #(0 0 1 1).
    #(0 1000 0 2).
    #(0 1000 1 3).
    #(0.1 0 0 4).
    #(0.1 0 1 5).
    #(0.1 1000 0 6).
    #(0.1 1000 1 7) }.
n train: data nbEpochs: 10000.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts06Datatxt >> scriptSnippetSlide24: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 24;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
n := NNetwork new.
n configure: 3 hidden: 8 nbOfOutputs: 8.

data := {#(0 0 0 0).
    #(0 0 1 1).
    #(0 1000 0 2).
    #(0 1000 1 3).
    #(0.1 0 0 4).
    #(0.1 0 1 5).
    #(0.1 1000 0 6).
    #(0.1 1000 1 7) }.
n train: data nbEpochs: 10000.
'
				]
]

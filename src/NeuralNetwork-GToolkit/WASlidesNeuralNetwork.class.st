Class {
	#name : #WASlidesNeuralNetwork,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-Workshop'
}

{ #category : #slides }
WASlidesNeuralNetwork >> coderWithComment [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Initial Coder'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ (GtCoder forClass: GtCSPicture) createInPager maximized ] ].
	aScripter
		substep: 'Evaluate first snippet and inspect'
		do: [ :aStep | 
			aStep click
				label: 'Click on evaluate and inspect button';
				onBreadthFirstChildOfClass: GtPharoBehaviorCoderElement;
				onBreadthFirstChildOfClass: BrTabGroup;
				onChildNamed: #header;
				onChildAt: 1;
				onChildAt: 1;
				onChildAt: 2.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter elementWithoutParent
]

{ #category : #'examples data' }
WASlidesNeuralNetwork >> exampleChap05Data01 [
<gtExample>
| network |
	network := NNetwork new.
network configure: 2 hidden: 3 nbOfOutputs: 1.

20000 timesRepeat: [ 
	network train: #(0 0) desiredOutputs: #(0).	
	network train: #(0 1) desiredOutputs: #(1).
	network train: #(1 0) desiredOutputs: #(1).
	network train: #(1 1) desiredOutputs: #(0).
].
^ network
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data02 [
<gtExample>
| n data |
	n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 1 1) .
	#(1 0 1) .
	#(1 1 0) }.
n train: data nbEpochs: 20000
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data03 [
<gtExample>
| n data |
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
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data04 [
<gtExample>
| n data |
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
n predict: #(0 1 1)
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data05 [
<gtExample>
| data d |
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
d at: #(0 1 1)
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data06 [
<gtExample>

| n data |
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
n predict: #(0.4 0.7 0.6)
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data07 [
<gtExample>
| n data |
	n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
    #(0 1 1) .
    #(1 0 1) .
    #(1 1 0) }.
n train: data nbEpochs: 10000.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data08 [
<gtExample>
| n data |
	n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 0 1) }.
n train: data nbEpochs: 1000.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data09 [
<gtExample>

| n data |
	n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.

data := {#(0 0 0) .
	#(0 1 1) .
	#(1 0 1) .
	#(1 1 0) }.
n train: data nbEpochs: 10000
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data10 [
<gtExample>

(ZnEasy get: 'https://agileartificialintelligence.github.io/Datasets/iris.csv') contents.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data11 [
<gtExample>

"The execution of this script initializes the variable irisData.
This variable is used in the subsequent scripts of this chapter"
| irisCSV lines tLines irisData |
	irisCSV := (ZnEasy get: 'https://agileartificialintelligence.github.io/Datasets/iris.csv') contents.
lines := irisCSV lines. 
lines := lines allButFirst.
tLines := lines collect: [ :l | 
		| ss |
		ss := l substrings: ','.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].

irisData := tLines collect: [ :row | 
		| l |
		row last = 'setosa' ifTrue: [ l := #( 0 ) ].
		row last = 'versicolor' ifTrue: [ l := #( 1 ) ].
		row last = 'virginica' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	
irisData.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data12 [
<gtExample>

| n irisData |
	n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: irisData nbEpochs: 1000.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data13 [
<gtExample>

| g learningCurveNeuron r p res d |
	g := RTGrapher new.
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
		d label: 'Sigmoid neuron lr = ' , lr asString.
		d noDot.
		d connectColor: (RTPalette c1 at: index).
		d points: learningCurveNeuron.
		d y: #yourself.
		g add: d ].
g legend addText: 'Learning rate effect'.
g
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data14 [
<gtExample>

| n irisData |
	n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n learningRate: 0.3. " Repeat the script with a different value"
n train: irisData nbEpochs: 1000.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data15 [
<gtExample>

| cut cutTraining irisData cutTest trainingData testData |
	cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data16 [
<gtExample>

| cut cutTraining irisData cutTest trainingData testData n |
	cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
...
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data17 [
<gtExample>

| cut cutTraining irisData cutTest trainingData testData n |
	cut := 0.8.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.

(((testData collect: [ :d |
	(n predict: d allButLast) = d last
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data18 [
<gtExample>

| cut cutTraining irisData cutTest trainingData testData n |
	cut := 0.7.
cutTraining := (irisData size * cut) rounded.
cutTest := (irisData size * (1 - cut)) rounded.
trainingData := irisData first: cutTraining.
testData := irisData last: cutTest.
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.
n train: trainingData nbEpochs: 1000.

(((testData collect: [ :d |
	(n predict: d allButLast) = d last
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data19 [
<gtExample>

| shuffledIrisData irisData cut cutTraining cutTest trainingData testData n |
	shuffledIrisData := irisData shuffleBy: (Random seed: 42).
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
]) select: [ :d | d = true]) size / testData size) asFloat round: 2 
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data20 [
<gtExample>

| max min irisData |
	max := OrderedCollection new.
min := OrderedCollection new.
(1 to: 4) collect: [ :i |
	max add: (irisData collect: [ :d | d at: i ]) max.
	min add: (irisData collect: [ :d | d at: i ]) min.
].
{ max . min }
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data21 [
<gtExample>

| n data |
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
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data22 [
<gtExample>

| n data |
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
]

{ #category : #accessing }
WASlidesNeuralNetwork >> exampleChap05Data23 [
<gtExample>

| n data |
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
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0060: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.006.png'.
	prio := 1.0060.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0070: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.007.png'.
	prio := 1.0070.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0080: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.008.png'.
	prio := 1.0080.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0090: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.009.png'.
	prio := 1.0090.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0100: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.010.png'.
	prio := 1.0100.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0110: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.011.png'.
	prio := 1.0110.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0112: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 1.0112;
		newFadedText: 'The output is calculated in method >>feed:';
		element: [ GtClassCoderLiveSlide new
				class: Neuron ;
				expandMethodAt: 10]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0120: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.012.png'.
	prio := 1.0120.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0130: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.013.png'.
	prio := 1.0130.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0140: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.014.png'.
	prio := 1.0140.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0142: aSlide [

	<gtSlide>
	^ aSlide playground
		priority: 1.0142;
		snippets: 
{
'"Perceptron for Metal Concert"
"
x1 : is the weather good?
x2 : Does your brother/sister/{boy,girl}friend want to accompany you? 
x3 : Is the festival near a metro stop? (You do not like driving)
"

perceptron := Neuron new step. 
perceptron weights: #( 2 6 2 ) .
perceptron threshold: 5 .
^ perceptron
"Look at both the tabs ''Visual'' as well as ''Schematic'' "' 

. 

'"When weather is good, noone to accompany you, festival near metro: Will you go?"
perceptron fire: #( 1 0 1 )
"inspect: output 0 means you will not go, output 1 means you will go!"'

. 

'"When weather is not good, someone to accompany you, festival not near metro: Will you go?"
perceptron fire: #( 0 1 0 )
"inspect: output 0 means you will not go, output 1 means you will go!"'

}
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0150: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.015.png'.
	prio := 1.0150.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0152: aSlide [

	<gtSlide>
	^ aSlide playground
		priority: 1.0152;
		snippets: 
{
'"Perceptron for Metal Concert"
"
x1 : is the weather good?
x2 : Does your brother/sister/{boy,girl}friend want to accompany you? 
x3 : Is the festival near a metro stop? (You do not like driving)
"

perceptron := Neuron new step. 
perceptron weights: #( 1 1 8 ) .
perceptron threshold: 5 .
^ perceptron
"Look at both the tabs ''Visual'' as well as ''Schematic'' "' 

. 

'"When weather is good, noone to accompany you, festival near metro: Will you go?"
perceptron fire: #( 1 0 1 )
"inspect: output 0 means you will not go, output 1 means you will go!"'

. 

'"When weather is not good, someone to accompany you, festival not near metro: Will you go?"
perceptron fire: #( 0 1 0 )
"inspect: output 0 means you will not go, output 1 means you will go!"'

}
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0160: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.016.png'.
	prio := 1.0160.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0170: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.017.png'.
	prio := 1.0170.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0180: aSlide [


	| filename prio |
	filename := '2021-AI-General.018.png'.
	prio := 1.0180.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0200: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.020.png'.
	prio := 1.0200.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0210: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.021.png'.
	prio := 1.0210.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0220: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.022.png'.
	prio := 1.0220.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0230: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.023.png'.
	prio := 1.0230.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0238: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0204;
		  newFadedText: 'Perceptron NOR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForNORGate;
				  newSnippet: 'perceptron fire: #( 0 0 )';
				  newSnippet: 'perceptron fire: #( 0 1 )';
				  newSnippet: 'perceptron fire: #( 1 0 )';
				  newSnippet: 'perceptron fire: #( 1 1 )' ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0240: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0240;
		  newFadedText: 'Training a perceptron';
		  element: [ 
			  GtPlaygroundLiveSlide new 
			  	newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronTrain;

newSnippet: 
'"Before training the input #(0 1) will give output 1"
^ perceptron fire: #( 0 1 )'; 
					  
newSnippet: 
'10 timesRepeat: [ perceptron train: #( 0 1 ) desiredOutput: 0 ].
^ perceptron';

newSnippet: 
'"After training the input #(0 1) will give output 0"
^ perceptron fire: #( 0 1 )
"If you are curious as to what method ''train:desiredOutput:'' does: 
click at the little triangle behind ''desiredOutput:'' in the third script.
(the triangle does only appear AFTER you executed the first script)"' ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0242: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0242;
		  newFadedText: 'Example script for drawing a Graph of a given function';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #exampleGraphSinus ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0247: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0247;
		  newFadedText: 'Graph: Classifying dots depending on their side of a line.';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronColoredDotsWithLine ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0248: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0248;
		  newFadedText: 'Training a Perceptron to classify';
		  element: [ 
			  GtPlaygroundLiveSlide new 
			  	newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron09a;
					newSnippetFromMethod: 
						WorkshopAIPerceptronGT >>  #chapter01Perceptron09b;
					newSnippetFromMethod: 
						WorkshopAIPerceptronGT >>  #chapter01Perceptron09c]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0250: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0250;
		  newFadedText:
			  'Random: Seed 42 makes the result reproducable.';
		  element: [ 
			  GtPlaygroundLiveSlide new
				  newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron10;
				  newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron11;
				  newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron12 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0256: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0256;
		  newFadedText: 'Graph: Precision after number of training steps.';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #exampleMeasuringPrecision ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0258: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.025.png'.
	prio := 1.0258.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0260: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.026.png'.
	prio := 1.0260.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0270: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.027.png'.
	prio := 1.0270.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0280: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0280;
		  newFadedText: 'Step function: output only 0 or 1, and change is abrupt. ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showStepFunction ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0290: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.029.png'.
	prio := 1.0290.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0298: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0298;
		  newFadedText: 'Solution: Instead of Step use Sigmoid function: smooth!';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showSigmoidFunction ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0300: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.030.png'.
	prio := 1.0300.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0310: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.031.png'.
	prio := 1.0310.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0320: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0320;
		  newFadedText: 'Learning: Step vs Sigmoid (training them as an OR gate)';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showLearningStepVsSigmoid ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0330: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.033.png'.
	prio := 1.0330.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0340: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.034.png'.
	prio := 1.0340.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0350: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.035.png'.
	prio := 1.0350.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0360: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.036.png'.
	prio := 1.0360.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0362: aSlide [

	"<gtSlide>"
	| filename prio |
	filename := '2021-AI-General.037.png'.
	prio := 1.0362.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0380: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.038.png'.
	prio := 1.0380.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0390: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.039.png'.
	prio := 1.0390.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0400: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.040.png'.
	prio := 1.0400.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0410: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.041.png'.
	prio := 1.0410.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0420: aSlide [

	<gtSlide>
	| prio |
	prio := 1.0420 .
		^ aSlide labelAndElement
		  priority: prio;
		  newFadedText: 'Neural Network';
		  element: [ 
			  GtPlaygroundLiveSlide new
newSnippet: 
'network := NNetwork new.
network configure: 2 hidden: 3 nbOfOutputs: 1.

20000 timesRepeat: [ 
	network train: #(0 0) desiredOutputs: #(0).	
	network train: #(0 1) desiredOutputs: #(1).
	network train: #(1 0) desiredOutputs: #(1).
	network train: #(1 1) desiredOutputs: #(0).
].
^ network']
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0430: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.043.png'.
	prio := 1.0430.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0440: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.044.png'.
	prio := 1.0440.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0450: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.045.png'.
	prio := 1.0450.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  |  form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0460: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.046.png'.
	prio := 1.0460.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0470: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.047.png'.
	prio := 1.0470.				  
	^ aSlide playground
		priority: prio;
		snippets: 
{
'"Step 1."
"Download Iris csv from url"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.'

. 

'"Step 2."
lines := irisCSV lines allButFirst.	"Initialize the variable irisData."
tLines := lines
		collect: [ :line | 
			| valuesOnThisLine |
			valuesOnThisLine := line substrings: '',''.
			(valuesOnThisLine allButLast collect: [ :w | w asNumber ])
				, (Array with: valuesOnThisLine last) ].

irisData := tLines
		collect: [ :row | 
			| l |
			row last = ''setosa'' ifTrue: [ l := #(0) ].
			row last = ''versicolor'' ifTrue: [ l := #(1) ].
			row last = ''virginica'' ifTrue: [ l := #(2) ].
			row allButLast , l ].
^ irisData'

.

'"Step 3."
network := NNetwork new.
network configure: 4 hidden: 6 nbOfOutputs: 3.
network learningRate: 0.3 .
^ network'
.
'"Step 4."
 " Repeat the script "
network train: irisData nbEpochs: 1000.
^ network'
.
'"Step 5."
network feed: #(  5.6  2.9  3.6  1.3 )'
}				
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0490: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.049.png'.
	prio := 1.0490.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0500: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.050.png'.
	prio := 1.0500.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0510: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.051.png'.
	prio := 1.0510.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0520: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.052.png'.
	prio := 1.0520.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0530: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.053.png'.
	prio := 1.0530.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slideXmplPercepForANDGate: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0201;
		  newFadedText: 'Perceptron configured as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new
				  newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForANDGate;
				  newSnippet: 'perceptron fire: #( 0 0 )';
				  newSnippet: 'perceptron fire: #( 0 1 )';
				  newSnippet: 'perceptron fire: #( 1 0 )';
				  newSnippet: 'perceptron fire: #( 1 1 )'
					  
]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slideXmplPercepForORGate: aSlide [

	<gtSlide>
	"p.14"
	^ aSlide labelAndElement
		  priority: 1.0202;
		  newFadedText: 'Perceptron configured as an OR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new
				  newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForORGate;
				  newSnippet: 'perceptron fire: #( 0 0 )';
				  newSnippet: 'perceptron fire: #( 0 1 )';
				  newSnippet: 'perceptron fire: #( 1 0 )';
				  newSnippet: 'perceptron fire: #( 1 1 )'
					  
]
]

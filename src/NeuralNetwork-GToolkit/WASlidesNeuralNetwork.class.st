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
			  | container form |
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
			  | container form |
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
			  | container form |
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
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
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
			  | container form |
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
			  | container form |
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
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0142: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0142;
		  newFadedText: 'Perceptron for Metal Concert';
		  element: [ 
			  GtPlaygroundLiveSlide new
			  	newSnippet: 
'perceptron := Neuron new step. 
perceptron weights: #( 2 6 2 ) .
perceptron bias: 5 .
^ perceptron
"Look at both the tabs ''Visual'' as well as ''Schematic'' "' ]
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
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0152: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0142;
		  newFadedText: 'Perceptron for Metal Concert';
		  element: [ 
			  GtPlaygroundLiveSlide new
			  	newSnippet: 
'perceptron := Neuron new step. 
perceptron weights: #( 1 1 8 ) .
perceptron bias: 5 .
^ perceptron
"Look at both the tabs ''Visual'' as well as ''Schematic'' "' ]
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

	<gtSlide>
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
WASlidesNeuralNetwork >> slidePercep0190: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.019.png'.
	prio := 1.0190.
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
WASlidesNeuralNetwork >> slidePercep0232: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0232;
		  newFadedText: 'Perceptron as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new
			  	newSnippetFromMethod: 
					  WorkshopAIPerceptronGT >> #perceptronForANDGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0234: aSlide [
	<gtSlide>
	

	^ aSlide  labelAndElement
		  priority: 1.0234;
		  newFadedText: 'Perceptron configured as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT>>#chapter01PerceptronAndGateWithInputs ]
	
		

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0236: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0236;
		  newFadedText: 'Perceptron for OR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForORGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0238: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0238;
		  newFadedText: 'Perceptron NOR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForNORGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0240: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0240;
		  newFadedText: 'Training a perceptron';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronTrain ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0242: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0242;
		  newFadedText: 'Example script for drawing a Graph';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #exampleGraphSinus ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0244: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0244;
		  newFadedText: 'Graph colored dots';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronColoredDots ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0247: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0247;
		  newFadedText: 'Graoh colored dots with line';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronColoredDotsWithLine ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0248: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0248;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron09 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0250: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0250;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron10 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0252: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0252;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron11 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0254: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0254;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron12 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0256: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0256;
		  newFadedText: ' ';
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
		  newFadedText: 'Step function';
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
		  newFadedText: 'Sigmoid function';
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
		  newFadedText: 'Learning: Step vs Sigmoid';
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
			  | container form |
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
			  | container form |
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
			  | container form |
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
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0362: aSlide [

	<gtSlide>
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
WASlidesNeuralNetwork >> slidePercep0364: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0364;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning02PointsAndLine ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0366: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0366;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning03LossFunctionMSE ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0368: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0368;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning04GradientDescent ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0370: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0370;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning05TrainingVsLossFunction ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0372: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0372;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning07 ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0374: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0374;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning08 ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0376: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0376;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning09 ]
]

{ #category : #accessing }
WASlidesNeuralNetwork >> slidePercep0378: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0378;
		  newFadedText: '>>';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAILearningGT >> #learning10 ]
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
			  | container form |
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
			  | container form |
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
			  | container form |
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
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0420: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.042.png'.
	prio := 1.0420.
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
WASlidesNeuralNetwork >> slidePercep0430: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.043.png'.
	prio := 1.0430.
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
WASlidesNeuralNetwork >> slidePercep0440: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.044.png'.
	prio := 1.0440.
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
WASlidesNeuralNetwork >> slidePercep0450: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.045.png'.
	prio := 1.0450.
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
WASlidesNeuralNetwork >> slidePercep0460: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.046.png'.
	prio := 1.0460.
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
WASlidesNeuralNetwork >> slidePercep0470: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.047.png'.
	prio := 1.0470.
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
WASlidesNeuralNetwork >> slidePercep0480: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.048.png'.
	prio := 1.0480.
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
WASlidesNeuralNetwork >> slidePercep0490: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.049.png'.
	prio := 1.0490.
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
WASlidesNeuralNetwork >> slidePercep0500: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.050.png'.
	prio := 1.0500.
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
			  | container form |
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
		  priority: 1.0192;
		  newFadedText: 'Perceptron configured as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForANDGate ]
]

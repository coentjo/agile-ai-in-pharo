Class {
	#name : #SlidesForScripts08MatrixNNtxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #accessing }
SlidesForScripts08MatrixNNtxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 

'xor := #(#(0 0 0)
		 #(0 1 1)
		 #(1 0 1)
		 #(1 1 0)).
n := NMNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2. 
n train: xor nbEpochs: 5000. 
n predict: (MMatrix newFromVector: #(1 0)).'
				]
]

{ #category : #accessing }
SlidesForScripts08MatrixNNtxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'
"The execution of this script initializes the variable irisData.
     This variable is used in the subsequent scripts of this chapter"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
lines := irisCSV lines.
lines := lines allButFirst.
tLines := lines collect: [ :l |
             | ss |
             ss := l substrings: '',''.
             (ss allButLast collect: [ :w | w asNumber ]), (Array with: ss
last) ].
irisData := tLines collect: [ :row | |l|
             row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
             row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
             row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
             row allButLast, l ].
irisData.

n := NMNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3. 
n train: irisData nbEpochs: 3000. 
n'
]
]

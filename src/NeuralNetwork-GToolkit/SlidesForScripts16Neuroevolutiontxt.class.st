Class {
	#name : #SlidesForScripts16Neuroevolutiontxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts16Neuroevolutiontxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
data := {
	{0 . 0 . 0} . 
	{0 . 1 . 1} . 
	{1 . 0 . 1} . 
	{1 . 1 . 0} }.

n := NNetwork new.
n configure: 2 hidden: 3 nbOfOutputs: 2.	
	
g := GAEngine new.
g populationSize: 500.
g mutationRate: 0.01.
g endForMaxNumberOfGeneration: 30.
g crossoverOperator: (GAConstrainedCrossoverOperation new possibleCutpoints: n getPossibleCutpoints).

g numberOfGenes: n numberOfParameters.
g createGeneBlock: [ :rand :index :ind | rand next * 10 - 5 ].
g fitnessBlock: [ :genes | 
	| r |
	n setWeightsAndBias: genes.
	r := (data collect: [ :row | 
				(n predict: row allButLast) = row last ]) select: #yourself.
	(r size / 4) round: 4.
	].
g run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts16Neuroevolutiontxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
data := {
		{ 0 . 0 . 0 . 0 } .
		{ 0 . 0 . 1 . 1 } .
		{ 0 . 1 . 0 . 2 } .
		{ 0 . 1 . 1 . 3 } .
		{ 1 . 0 . 0 . 4 } .
		{ 1 . 0 . 1 . 5 } .
		{ 1 . 1 . 0 . 6 } .
		{ 1 . 1 . 1 . 7 } }.
n := NNetwork new.
n configure: 3 hidden: 5 nbOfOutputs: 8.
	
g := GAEngine new.
g populationSize: 500.
g endForMaxNumberOfGeneration: 100.
g crossoverOperator: (GAConstrainedCrossoverOperation new possibleCutpoints: n getPossibleCutpoints).
g numberOfGenes: n numberOfParameters.
g createGeneBlock: [ :rand :index :ind | rand next * 10 - 5 ].
g fitnessBlock: [ :genes | 
	| r |
	n setWeightsAndBias: genes.
	r := (data collect: [ :row | 
				(n predict: row allButLast) = row last ]) select: #yourself.
	(r size / data size) round: 4.	
	].
g run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts16Neuroevolutiontxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
lines := irisCSV lines allButFirst collect: [ :l | 
        | ss |
        ss := l substrings: '',''.
        (ss allButLast collect: [ :w | w asNumber ]), { ss last } ].

irisData := lines collect: [ :row | 
        | l |
        row last = ''setosa'' ifTrue: [ l := #( 0 ) ].
        row last = ''versicolor'' ifTrue: [ l := #( 1 ) ].
        row last = ''virginica'' ifTrue: [ l := #( 2 ) ].
        row allButLast, l ].
"The variable irisData contains the Iris dataset"
	
n := NNetwork new.
n configure: 4 hidden: 6 nbOfOutputs: 3.

g := GAEngine new.
g populationSize: 500.
g endForMaxNumberOfGeneration: 30.
g crossoverOperator: (GAConstrainedCrossoverOperation new possibleCutpoints: n getPossibleCutpoints).

g numberOfGenes: n numberOfParameters.
g createGeneBlock: [ :rand :index :ind | rand next * 10 - 5 ].
g fitnessBlock: [ :genes | 
	| r |
	n setWeightsAndBias: genes.
	r := (irisData collect: [ :row | 
				(n predict: row allButLast) = row last ]) select: #yourself.
	(r size / irisData size) asFloat round: 4 ].
g run.
'
				]
]

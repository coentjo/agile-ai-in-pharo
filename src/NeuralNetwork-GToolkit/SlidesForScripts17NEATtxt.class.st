Class {
	#name : #SlidesForScripts17NEATtxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts17NEATtxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
dataset := #( #(0 0 0) #(0 1 1) #(1 0 1) #(1 1 0) ).

neat := NEAT new.
neat numberOfInputs: 2.
neat numberOfOutputs: 1.
neat fitness: [ :ind | 
		| score |
		score := 0.
		dataset do: [ :tuple |
			diff := (ind evaluate: tuple allButLast) first - tuple last.
			score := score + (diff * diff) ]. 
		(score / -4) asFloat ].

neat numberOfGenerations: 180.
neat run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts17NEATtxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We prepare the data"
irisCSV := (ZnEasy get: ''https://agileartificialintelligence.github.io/Datasets/iris.csv'') contents.
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
	
"We run the NEAT algorithm"
neat := NEAT new.
neat numberOfInputs: 4.
neat numberOfOutputs: 3.
neat fitness: [ :ind | 
		| score |
		score := 0.
		irisData do: [ :tuple |
			diff := (ind predict: tuple allButLast) - tuple last.
			score := score + (diff * diff) ]. 
		(score / -4) asFloat ].

neat numberOfGenerations: 180.
neat run.
'
				]
]

Class {
	#name : #SlidesForScripts18MarioGametxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new seed: 7; open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new showCompleteMap

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide05: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new seed: 7; showCompleteMap

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide06: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
neat := NEAT new.
neat numberOfInputs: 121.
neat numberOfOutputs: 3.
neat populationSize: 200.

neat fitness: [ :ind | 
	w := MNWorld new.
	w mario: (MNAIMario new network: ind).
	450 timesRepeat: [ w beat. ].
	w mario position x ].

neat numberOfGenerations: 160.
neat run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide07: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 7;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
neat := NEAT new.
neat numberOfInputs: 121.
neat numberOfOutputs: 3.
neat populationSize: 200.

neat fitness: [ :ind | 
	w := MNWorld new.
	w mario: (MNAIMario new network: ind).
	450 timesRepeat: [ w beat. ].
	w mario position x ].

neat numberOfGenerations: 160.
neat run.
...
w := MNWorld new.
w mario: (MNAIMario new network: neat result).
w open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide08: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 8;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide09: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 9;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new seed: 7; open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide10: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new showCompleteMap

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide11: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 11;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
MNWorld new seed: 7; showCompleteMap

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide12: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 12;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
neat := NEAT new.
neat numberOfInputs: 121.
neat numberOfOutputs: 3.
neat populationSize: 200.

neat fitness: [ :ind | 
	w := MNWorld new.
	w mario: (MNAIMario new network: ind).
	450 timesRepeat: [ w beat. ].
	w mario position x ].

neat numberOfGenerations: 160.
neat run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts18MarioGametxt >> scriptSnippetSlide13: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 13;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
neat := NEAT new.
neat numberOfInputs: 121.
neat numberOfOutputs: 3.
neat populationSize: 200.

neat fitness: [ :ind | 
	w := MNWorld new.
	w mario: (MNAIMario new network: ind).
	450 timesRepeat: [ w beat. ].
	w mario position x ].

neat numberOfGenerations: 160.
neat run.
...
w := MNWorld new.
w mario: (MNAIMario new network: neat result).
w open
'
				]
]

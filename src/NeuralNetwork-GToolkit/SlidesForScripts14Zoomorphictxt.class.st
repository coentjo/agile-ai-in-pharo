Class {
	#name : #SlidesForScripts14Zoomorphictxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts14Zoomorphictxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
creature := CCreature new configureBall: 10.
c := CWorld new.
c addCreature: creature.
c open

'
				]
]

{ #category : #accessing }
SlidesForScripts14Zoomorphictxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
redCreature := CCreature new configureBall: 7.
blueCreature := CCreature new color: Color blue; configureBall: 10.
yellowCreature := CCreature new color: Color yellow; configureBall: 15.

c := CWorld new.
c addCreature: redCreature.
c addCreature: blueCreature.
c addCreature: yellowCreature.
c open.
blueCreature translateTo: 100 @ -50.
yellowCreature translateTo: 200 @ -50.
c open
'
				]
]

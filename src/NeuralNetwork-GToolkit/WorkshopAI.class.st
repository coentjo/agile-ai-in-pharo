Class {
	#name : #WorkshopAI,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #'helper methods' }
WorkshopAI class >> aRandomNumber [

	^ 50 atRandom - 25
]

{ #category : #'helper methods' }
WorkshopAI class >> showGraphInMorph: grapher [
	"Probably deprecated on all sides ...  :-(
	 but does the job for this moment... "
	^ GTInspector openOn: grapher
]

{ #category : #'helper methods' }
WorkshopAI >> slide1For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide empty
		priority: 1.
]

{ #category : #'helper methods' }
WorkshopAI >> slide: aSlide prio: prio fromPicture: filename [

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

{ #category : #configuration }
WorkshopAI >> slidesDirectory [

	^ GtResourceReference path:
		  Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
]

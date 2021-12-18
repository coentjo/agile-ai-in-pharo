Class {
	#name : #WorkshopAI,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #accessing }
WorkshopAI >> showGraphInMorph: grapher [
	"Probably deprecated on all sides ...  :-(
	 but does the job for this moment... "
	^ GTInspector openOn: grapher
]

{ #category : #slides }
WorkshopAI >> slide1For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide empty
		priority: 1.
]

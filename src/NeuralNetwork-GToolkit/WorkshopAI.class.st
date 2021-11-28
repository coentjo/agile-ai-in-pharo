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

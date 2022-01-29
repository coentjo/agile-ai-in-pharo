Class {
	#name : #WorkshopAI,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #graph }
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

{ #category : #slides }
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

{ #category : #accessing }
WorkshopAI >> slidesDirectory [

	^ GtResourceReference path:
		  Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
]

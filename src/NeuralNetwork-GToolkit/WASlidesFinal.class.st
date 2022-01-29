Class {
	#name : #WASlidesFinal,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit'
}

{ #category : #slides }
WASlidesFinal >> slidePercep0980: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0980;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.098.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesFinal >> slidePercep0990: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0990;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.099.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesFinal >> slidePercep1000: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.1000;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.100.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

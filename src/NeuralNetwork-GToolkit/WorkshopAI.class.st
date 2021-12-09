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
WorkshopAIPerceptronGT >> slidePercep0010: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.1;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.001.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0020: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.2;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.002.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0030: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.3;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.003.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WorkshopAIPerceptronGT >> slidePercep0040: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.4;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.004.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

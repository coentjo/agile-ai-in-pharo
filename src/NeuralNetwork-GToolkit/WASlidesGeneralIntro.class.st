Class {
	#name : #WASlidesGeneralIntro,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0010: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0010;
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
WASlidesGeneralIntro >> slidePercep0020: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0020;
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
WASlidesGeneralIntro >> slidePercep0030: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0030;
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
WASlidesGeneralIntro >> slidePercep0040: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0040;
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

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0050: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0050;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.005.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #accessing }
WASlidesGeneralIntro >> slidePharo0100: aSlide [
	<gtSlide>
	
	^ aSlide example
		priority: 1.0100;
		method: WorkshopAIPerceptronGT>>#examplePharoArrays .
	
]

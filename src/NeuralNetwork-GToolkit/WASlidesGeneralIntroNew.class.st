Class {
	#name : #WASlidesGeneralIntroNew,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #accessing }
WASlidesGeneralIntroNew >> slide: aSlide prio: prio fromPicture: filename [

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
WASlidesGeneralIntroNew >> slidePercep0010: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.001.png'.
	prio := 1.0010.
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
WASlidesGeneralIntroNew >> slidePercep0020: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.002.png'.
	prio := 1.0020.
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
WASlidesGeneralIntroNew >> slidePercep0030: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.003.png'.
	prio := 1.0030.
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
WASlidesGeneralIntroNew >> slidePercep0040: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.004.png'.
	prio := 1.0040.
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
WASlidesGeneralIntroNew >> slidePercep0050: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.005.png'.
	prio := 1.0050.
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
WASlidesGeneralIntroNew >> slidePharo0100: aSlide [
	<gtSlide>
	
	^ aSlide labelAndElement
		priority: 1.0100;
		newFadedText: 'Example with Pharo arrays' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippetFromMethod: WorkshopAIPerceptronGT>>#examplePharoArrays
				]
	
]

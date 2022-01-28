Class {
	#name : #WASlidesGeneralIntro,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #slides }
WASlidesGeneralIntro >> slide: aSlide prio: prio fromPicture: filename [

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

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0010: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.001
		  fromPicture: '2021-AI-General.001.png'
]

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0020: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0020
		  fromPicture: '2021-AI-General.002.png'
]

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0030: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0030
		  fromPicture: '2021-AI-General.003.png'
]

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0040: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0040
		  fromPicture: '2021-AI-General.004.png'

]

{ #category : #slides }
WASlidesGeneralIntro >> slidePercep0050: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0050
		  fromPicture: '2021-AI-General.005.png'
]

{ #category : #accessing }
WASlidesGeneralIntro >> slidePharo0100: aSlide [
	<gtSlide>
	
	^ aSlide labelAndElement
		priority: 1.0100;
		newFadedText: 'Example with Pharo arrays' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippetFromMethod: WorkshopAIPerceptronGT>>#examplePharoArrays
				]
	
]

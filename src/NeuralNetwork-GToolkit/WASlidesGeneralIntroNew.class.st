Class {
	#name : #WASlidesGeneralIntroNew,
	#superclass : #WorkshopAI,
	#instVars : [
		'presenterName'
	],
	#category : #'NeuralNetwork-GToolkit-Workshop'
}

{ #category : #accessing }
WASlidesGeneralIntroNew >> presenterName [
	^ presenterName ifNil: [ '<<Dear presenter, your own name could have been shown here>>']
]

{ #category : #accessing }
WASlidesGeneralIntroNew >> presenterName: aName [

	aName = 'Rumpelstiltskin' ifFalse: [ presenterName := aName ]
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
<gtExample>
	<gtSlide>
	| prio cr tab |
	cr := Character cr asString.
	tab := Character tab asString .
	prio := 1.0020.
	^ aSlide text
		priority: prio;
		newTextWithFormat:
			(('Original Material created by: ',tab, tab, tab, tab, 'Alexandre Bergel, ',cr,
			tab, tab, 'Full-time professor at the University of Chile', cr,
			tab, tab, 'Researcher in the field of software engineering,', cr,
			tab, tab, 'Helping the Humanity to produce better software. ', cr,
			tab, tab, 'Applying visualization and AI techniques to improve the way software is built. ', cr,
			cr,
			'GToolkit-version by: ', tab, tab, tab, tab, 'Coen Crombach', cr, 
			tab, tab, 'teacher computing science at FHICT, ', cr,
			tab, tab, 'Fontys Hogeschool for ICT, Eindhoven.', cr, 
			cr,
			'Presented to you by: ', tab, tab, tab, tab, self presenterName, cr
			
	) asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
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

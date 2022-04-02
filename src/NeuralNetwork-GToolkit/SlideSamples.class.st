Class {
	#name : #SlideSamples,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-WsMetaHelper'
}

{ #category : #accessing }
SlideSamples >> slideMultiplePlaygrounds: aSlide [
	<gtSlide>
	^ aSlide playground
		priority: 20;
		snippets: 
{
'"Initialize ..."
x := 42
'

. 

'"Use the initialized value"
y := x + 24
'


}
]

{ #category : #accessing }
SlideSamples >> slidePNG: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.014.png'.
	prio := 1.0140.
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
SlideSamples >> slidePercep0020: aSlide [
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
SlideSamples >> slideText: aSlide [

	<gtSlide>
	| prio cr tab |
	cr := Character cr asString.
	tab := Character tab asString.
	prio := 123.
	^ aSlide text
		  priority: prio;
		  newTextWithFormat: (('Once upon a time... ',cr,'... there was a dragon.' )asRopedText
				   glamorousRegularFont;
				   fontSize: 50)
]

{ #category : #accessing }
SlideSamples >> slideTitleAndPlayground: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0142;
		  newFadedText: 'Perceptron for Metal Concert';
		  element: [ 
			  GtPlaygroundLiveSlide new
			  	newSnippet: 
'perceptron := Neuron new step. 
perceptron weights: #( 2 6 2 ) .
perceptron bias: 5 .
^ perceptron
"Look at both the tabs ''Visual'' as well as ''Schematic'' "' ]
]

{ #category : #accessing }
SlideSamples >> slidesDirectory [

	^ GtResourceReference path:
		  Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
]

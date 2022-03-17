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

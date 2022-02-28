Class {
	#name : #Scripts06Datatxt2,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #accessing }
Scripts06Datatxt2 >> slidePharo0100: aSlide [
	<gtSlide>
	
	^ aSlide labelAndElement
		priority: 1.0100;
		newFadedText: 'Example with Pharo arrays' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: '^ #(1 2 3)
	with: #(10 20 30)
	collect: [ :a :b | a + b ]'
				]
	
]

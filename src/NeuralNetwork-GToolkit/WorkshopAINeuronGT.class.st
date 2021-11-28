Class {
	#name : #WorkshopAINeuronGT,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #accessing }
WorkshopAINeuronGT >> chapter02Neuron01 [

	<gtExample>
	<noTest>
	| g d |
	g := RTGrapher new.
	d := RTData new.
	d connectColor: Color blue.
	d noDot.
	d points: (-7.0 to: 7.0 by: 0.01).
	d x: #yourself.
	d y: [ :x | 
		x > 0
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ].
	g add: d.
	^ self showGraphInMorph: g
]

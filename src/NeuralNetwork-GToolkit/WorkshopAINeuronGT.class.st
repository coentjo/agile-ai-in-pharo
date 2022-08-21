Class {
	#name : #WorkshopAINeuronGT,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-Workshop'
}

{ #category : #accessing }
WorkshopAINeuronGT >> exampleGraphSine [
	<gtExample>
	| domain f yValues |
	domain := 0 to: 2 * 3.14 by: 0.1.
	f := [ :x | x sin ].
	yValues := domain collect: [ :i | f value: i ].
	^ RSCanvas new
		add: (RSChart new
				addPlot: (RSLinePlot new x: domain y: yValues);
				build) canvas asShape;
		open
]

{ #category : #accessing }
WorkshopAINeuronGT >> showLearningStepVsSigmoid [
	<gtExample>
	<noTest>

	| learningCurveNeuron p res learningCurvePerceptron g d |
	learningCurveNeuron := OrderedCollection new.
	0 to: 1000 do: [ :nbOfTrained | 
		p := Neuron new.
		p weights: #( -1 -1 ).
		p bias: 2.

		nbOfTrained timesRepeat: [ 
			p train: #( 0 0 ) desiredOutput: 0.
			p train: #( 0 1 ) desiredOutput: 0.
			p train: #( 1 0 ) desiredOutput: 0.
			p train: #( 1 1 ) desiredOutput: 1 ].

		res := ((p feed: #( 0 0 )) - 0) abs + ((p feed: #( 0 1 )) - 0) abs
		       + ((p feed: #( 1 0 )) - 0) abs + ((p feed: #( 1 1 )) - 1) abs.
		learningCurveNeuron add: res / 4 ].

	learningCurvePerceptron := OrderedCollection new.
	0 to: 1000 do: [ :nbOfTrained | 
		p := Neuron new.
		p step.
		p weights: #( -1 -1 ).
		p bias: 2.

		nbOfTrained timesRepeat: [ 
			p train: #( 0 0 ) desiredOutput: 0.
			p train: #( 0 1 ) desiredOutput: 0.
			p train: #( 1 0 ) desiredOutput: 0.
			p train: #( 1 1 ) desiredOutput: 1 ].

		res := ((p feed: #( 0 0 )) - 0) abs + ((p feed: #( 0 1 )) - 0) abs
		       + ((p feed: #( 1 0 )) - 0) abs + ((p feed: #( 1 1 )) - 1) abs.
		learningCurvePerceptron add: res / 4 ].

	g := RTGrapher new.
	d := RTData new.
	d label: 'Sigmoid neuron'.
	d noDot.
	d connectColor: Color blue.
	d points: learningCurveNeuron.
	d y: #yourself.
	g add: d.

	d := RTData new.
	d label: 'Perceptron'.
	d noDot.
	d connectColor: Color green.
	d points: learningCurvePerceptron.
	d y: #yourself.
	g add: d.
	g axisY title: 'Error'.
	g axisX
		noDecimal;
		title: 'Epoch'.
	g legend addText: 'Perceptron vs Sigmoid neuron'.
	^ WorkshopAI showGraphInMorph: g
]

{ #category : #examples }
WorkshopAINeuronGT >> showSigmoidFunction [

	<gtExample>
	<noTest>
	| g d |
	g := RTGrapher new.
	d := RTData new.
	d connectColor: Color blue.
	d noDot.
	d points: (-7.0 to: 7.0 by: 0.01).
	d x: #yourself.
	d y: [ :x | 1 / (1 + x negated exp) ].
	g add: d.
	^ WorkshopAI showGraphInMorph: g
]

{ #category : #examples }
WorkshopAINeuronGT >> showStepFunction [

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
	^ WorkshopAI showGraphInMorph: g
]

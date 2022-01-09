Class {
	#name : #WorkshopAILearningGT,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
}

{ #category : #accessing }
WorkshopAILearningGT >> addGraphForFunction: f [

	| d |
	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d points: (0 to: 5).
	d x: #yourself.
	d y: f.
	^ d
]

{ #category : #accessing }
WorkshopAILearningGT >> dataForPoints: aPointCollection [ 
	| d |
	d := RTData new.
	d dotShape color: Color red.
	d points: aPointCollection.
	d
		x: #x;
		y: #y.
	^ d
]

{ #category : #accessing }
WorkshopAILearningGT >> graphWithPoints [

	| g d |
	g := RTGrapher new.
	d := self dataForPoints: self somePoints.
	g add: d.
	^ g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning01ShowSomePoints [

	"Graph with points"

	<gtExample>
	<noTest>
	| g |
	g := self graphWithPoints.  
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning02PointsAndLine [

	"Showing points in a graph and a line"
	"We want to find the straight line that is the closest to the points."

	<gtExample>
	<noTest>
	| a b f g d |
	"line to be shown:   y = 0.5 * x + 3 "
	a := 0.5.
	b := 3.
	f := [ :x | a * x + b ].
	"Take same graph as before, add line f"
	g := self graphWithPoints.
	d := self addGraphForFunction: f.
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning03LossFunctionMSE [

	"loss function: How different is the result we get away from the result we (ideally) expect?"

	"A common loss function (used in this method) is the  
		MSE : Mean Squared Error
	"
	"For given inputs a and b we can calculate the error: "

	<gtExample>
	<noTest>
	| a b f loss points |
	points := self somePoints.
	"line:   y = 0.5 * x + 3 "
	a := 0.5.
	b := 3.
	f := [ :x | a * x + b ].
	"for every point 'p' calculate the error, which is 'y' minus the 'f(x)' "
	"Then take the square of the error."
	"Then sum those squares."
	loss := (points collect: [ :p | 
		         (p y - (f value: p x)) squared ]) sum
	        / points size.
	^ loss
]

{ #category : #accessing }
WorkshopAILearningGT >> learning04GradientDescent [

	<gtExample>
	<noTest>
	|  a b f learningRate deriMSEa deriMSEb g d points |
	points := self somePoints.
	"line:   y = 0.5 * x + 3 "
	a := 0.5.
	b := 3.
	f := [ :x | x * a + b ].

	learningRate := 0.01.
	1000 timesRepeat: [ 
		deriMSEa := 2 / points size * (points collect: [ :aPoint | 
			             aPoint x * (aPoint y - (f value: aPoint x)) negated ])
			            sum.
		deriMSEb := 2 / points size * (points collect: [ :aPoint | 
			             1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb) ].

	g := RTGrapher new.
	d := RTData new.
	d dotShape color: Color red.
	d points: points.
	d
		x: #x;
		y: #y.
	g add: d.

	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d dotShape color: Color blue.
	d points: (0 to: 5).
	d x: #yourself.
	d y: f.
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning05TrainingVsLossFunction [

	<gtExample>
	<noTest>
	| points a b f learningRate result deriMSEa deriMSEb mse g d |
	points := self somePoints.
	"line:   y = 0.5 * x + 3 "
	a := 0.5.
	b := 3.
	f := [ :x | x * a + b ].

	learningRate := 0.01.

	result := OrderedCollection new.
	1000 timesRepeat: [ 
		deriMSEa := 2 / points size * (points collect: [ :aPoint | 
			             aPoint x * (aPoint y - (f value: aPoint x)) negated ])
			            sum.
		deriMSEb := 2 / points size * (points collect: [ :aPoint | 
			             1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb).

		mse := (points collect: [ :aPoint | 
			        (aPoint y - (f value: aPoint x)) squared ]) sum
		       / points size.
		result add: mse ].

	g := RTGrapher new.
	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning06SameAs05Question [

	<gtExample>
	<noTest>
	| points a b f learningRate result deriMSEa deriMSEb mse g d |
	points := self somePoints.

	a := 0.5.
	b := 3.

	f := [ :x | x * a + b ].

	learningRate := 0.01.

	result := OrderedCollection new.
	1000 timesRepeat: [ 
		deriMSEa := 2 / points size * (points collect: [ :aPoint | 
			             aPoint x * (aPoint y - (f value: aPoint x)) negated ])
			            sum.
		deriMSEb := 2 / points size * (points collect: [ :aPoint | 
			             1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb).

		mse := (points collect: [ :aPoint | 
			        (aPoint y - (f value: aPoint x)) squared ]) sum
		       / points size.
		result add: mse ].

	g := RTGrapher new.
	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning07 [

	<gtExample>
	<noTest>
	| nbOfPoints r points a b learningRate f result deriMSEa deriMSEb mse g d d2 |
	nbOfPoints := 100.
	r := Random seed: 42.
	points := (1 to: nbOfPoints) collect: [ :i | 
		          (i / nbOfPoints) asFloat
		          @ (r next * 40 - 20 + i / nbOfPoints) asFloat ].

	a := 0.5.
	b := 3.
	learningRate := 0.01.
	f := [ :x | x * a + b ].

	result := OrderedCollection new.
	3000 timesRepeat: [ 
		deriMSEa := 2 / points size * (points collect: [ :aPoint | 
			             aPoint x * (aPoint y - (f value: aPoint x)) negated ])
			            sum.
		deriMSEb := 2 / points size * (points collect: [ :aPoint | 
			             1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb).

		mse := (points collect: [ :aPoint | 
			        (aPoint y - (f value: aPoint x)) squared ]) sum
		       / points size.
		result add: mse ].

	g := RTGrapher new.
	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	g.
	" ...    <----??    @todo check this with script in git!"
	g := RTGrapher new.
	d := RTData new.
	d dotShape color: Color red.
	d points: points.
	d y: #y.
	d x: #x.
	g add: d.

	d2 := RTData new.
	d2
		noDot;
		connectColor: Color blue.
	d2 points: (0 to: 1.0 by: 0.01).
	d2 x: #yourself.
	d2 y: f.
	g add: d2.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning08 [

	<gtExample>
	<noTest>
	| nbOfPoints r points currentBatch miniBatches batchSize a b learningRate f result accumulatedMse deriMSEa deriMSEb mse g d |
	nbOfPoints := 100.
	r := Random seed: 42.
	points := (1 to: nbOfPoints) collect: [ :i | 
		          (i / nbOfPoints) asFloat
		          @ (r next * 40 - 20 + i / nbOfPoints) asFloat ].

	currentBatch := OrderedCollection new.
	miniBatches := OrderedCollection new.
	batchSize := 5.
	1 to: points size do: [ :index | 
		currentBatch add: (points at: index).
		index \\ batchSize = 0 ifTrue: [ 
			miniBatches add: currentBatch copy.
			currentBatch := OrderedCollection new ] ].
	miniBatches.

	a := 0.5.
	b := 3.
	learningRate := 0.01.
	f := [ :x | x * a + b ].

	result := OrderedCollection new.
	1000 timesRepeat: [ 
		accumulatedMse := 0.
		miniBatches do: [ :pointsBatch | 
			deriMSEa := 2 / pointsBatch size
			            * (pointsBatch collect: [ :aPoint | 
					             aPoint x * (aPoint y - (f value: aPoint x)) negated ])
					            sum.
			deriMSEb := 2 / pointsBatch size
			            * (pointsBatch collect: [ :aPoint | 
					             1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
			a := a - (learningRate * deriMSEa).
			b := b - (learningRate * deriMSEb).

			mse := (pointsBatch collect: [ :aPoint | 
				        (aPoint y - (f value: aPoint x)) squared ]) sum
			       / points size.
			accumulatedMse := accumulatedMse + mse ].
		result add: accumulatedMse ].

	g := RTGrapher new.
	d := RTData new.
	d
		noDot;
		connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	^ self showGraphInMorph: g
]

{ #category : #accessing }
WorkshopAILearningGT >> learning09 [

	<gtExample>
	<noTest>
	| nbOfPoints r points a b f learningRate result deriMSEa deriMSEb mse |
	^ [ 
	  nbOfPoints := 30000.
	  r := Random seed: 42.
	  points := (1 to: nbOfPoints) collect: [ :i | 
		            (i / nbOfPoints) asFloat
		            @ (r next * 40 - 20 + i / nbOfPoints) asFloat ].

	  a := 0.5.
	  b := 3.
	  f := [ :x | x * a + b ].
	  learningRate := 0.01.

	  result := OrderedCollection new.
	  3000 timesRepeat: [ 
		  deriMSEa := 2 / points size * (points collect: [ :aPoint | 
			               aPoint x * (aPoint y - (f value: aPoint x)) negated ])
			              sum.
		  deriMSEb := 2 / points size * (points collect: [ :aPoint | 
			               1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		  a := a - (learningRate * deriMSEa).
		  b := b - (learningRate * deriMSEb).

		  mse := (points collect: [ :aPoint | 
			          (aPoint y - (f value: aPoint x)) squared ]) sum
		         / points size.
		  result add: mse ] ] timeToRun
]

{ #category : #accessing }
WorkshopAILearningGT >> learning10 [

	<gtExample>
	<noTest>
	| nbOfPoints r points currentBatch miniBatches batchSize a b f learningRate result accumulatedMse deriMSEa deriMSEb mse |
	^ [ 
	  nbOfPoints := 30000.
	  r := Random seed: 42.
	  points := (1 to: nbOfPoints) collect: [ :i | 
		            (i / nbOfPoints) asFloat
		            @ (r next * 40 - 20 + i / nbOfPoints) asFloat ].

	  currentBatch := OrderedCollection new.
	  miniBatches := OrderedCollection new.
	  batchSize := 5.
	  1 to: points size do: [ :index | 
		  currentBatch add: (points at: index).
		  index \\ batchSize = 0 ifTrue: [ 
			  miniBatches add: currentBatch copy.
			  currentBatch := OrderedCollection new ] ].

	  a := 0.5.
	  b := 3.
	  f := [ :x | x * a + b ].
	  learningRate := 0.01.

	  result := OrderedCollection new.
	  1000 timesRepeat: [ 
		  accumulatedMse := 0.
		  miniBatches do: [ :pointsBatch | 
			  deriMSEa := 2 / pointsBatch size
			              * (pointsBatch collect: [ :aPoint | 
					               aPoint x
					               * (aPoint y - (f value: aPoint x)) negated ]) sum.
			  deriMSEb := 2 / pointsBatch size
			              * (pointsBatch collect: [ :aPoint | 
					               1 * (aPoint y - (f value: aPoint x)) negated ])
					              sum.
			  a := a - (learningRate * deriMSEa).
			  b := b - (learningRate * deriMSEb).

			  mse := (pointsBatch collect: [ :aPoint | 
				          (aPoint y - (f value: aPoint x)) squared ]) sum
			         / points size.
			  accumulatedMse := accumulatedMse + mse ].
		  result add: accumulatedMse ] ] timeToRun
]

{ #category : #accessing }
WorkshopAILearningGT >> somePoints [
	<gtExample>
	<noTest>
	^ { 
		  (1 @ 3.0).
		  (3 @ 5.2).
		  (2 @ 4.1).
		  (4 @ 7.5) }
]

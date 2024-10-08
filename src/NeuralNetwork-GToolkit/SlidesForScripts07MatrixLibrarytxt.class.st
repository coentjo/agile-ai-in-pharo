Class {
	#name : #SlidesForScripts07MatrixLibrarytxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #accessing }
SlidesForScripts07MatrixLibrarytxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'm := MMatrix newFromArrays: #(#(1 2 3) #(4 5 6)). 
m + m'
				]
]

{ #category : #accessing }
SlidesForScripts07MatrixLibrarytxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'n := 8.         "Number of examples"
din := 10.      "Number of input values"
h := 20.        "Size of the hidden layer"
dout := 5.      "Number of output values"

r := Random seed: 42.
x := (MMatrix newRows: n columns: din) random: r.
y := (MMatrix newRows: n columns: dout) random: r.
w1 := (MMatrix newRows: din columns: h) random: r.
w2 := (MMatrix newRows: h columns: dout) random: r.

learningRate := 1e-6.
losses := OrderedCollection new.
1500 timesRepeat: [ 
    hh := x +* w1.
    hrelu := hh collect: [ :v | v max: 0 ].
    ypred := hrelu +* w2.
    
    "Compute and print loss"
    loss := ((ypred - y) collect: [:vv | vv * vv ]) sum.
    losses add: loss.
    
    "Backprop to compute gradients of w2 and w2 with respect to loss"
    gradYPred := (ypred - y) * 2.0.
    gradW2 := hrelu transposed +* gradYPred.
    gradHRelu := gradYPred +* w2 transposed.
    gradH := gradHRelu collect: [ :v | v max: 0 ].
    gradW1 := x transposed +* gradH.
    
    w1 := w1 - (gradW1 * learningRate).
    w2 := w2 - (gradW2 * learningRate) 
].

g := RTGrapher new.
d := RTData new.
d noDot; connectColor: Color blue.
d points: losses.
d y: #yourself.
g add: d.
g axisX title: ''Epoch''.
g axisY title: ''Error''.
g'

]
]

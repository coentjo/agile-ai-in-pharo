Class {
	#name : #SlidesForScripts10GeneticAlgorithmtxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #accessing }
SlidesForScripts10GeneticAlgorithmtxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'[ :x :y | x + y ] cull: 10 cull: 20 cull: 30. "=> 20"
[ :x :y :z | x + y + z] cull: 10 cull: 20 cull: 30. "=> 60"
[ 42 ] cull: 10 cull: 20 cull: 30. "=> 42" '
				]
]

{ #category : #accessing }
SlidesForScripts10GeneticAlgorithmtxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'inds := GAIndividual 
			create: 1000 
			individualsAndInitialize: 3 
			genesWith: [ :r | ($a to: $z) atRandom: r ].
fitnessBlock := [ :genes | 
	(genes with: ''cat'' asArray collect: [ :a :b | (a == b) 
		ifTrue: [ 1 ] 
		ifFalse: [ 0 ] ]) sum ].
inds do: [ :i | i computeFitnessUsing: fitnessBlock ]. '
				]
]

{ #category : #accessing }
SlidesForScripts10GeneticAlgorithmtxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'inds := GAIndividual 
			create: 1000 
			individualsAndInitialize: 3 
			genesWith: [ :r | ($a to: $z) atRandom: r ].
fitnessBlock := [ :genes | 
	(genes with: ''cat'' asArray collect: [ :a :b | (a == b) 
		ifTrue: [ 1 ] 
		ifFalse: [ 0 ] ]) sum ].
inds do: [ :i | i computeFitnessUsing: fitnessBlock ].		
...
data := ((inds collect: #fitness) groupedBy: #yourself) associations 
			collect: [ : as | as key -> as value size ] .
 
g := RTGrapher new.
d := RTData new.
d points: data.
d barChartWithBarTitle: #key.
d y: [ :as | as value ].
d yLog.
g add: d.
g axisY noDecimal.
g axisX noTick.
^ WorkshopAI showGraphInMorph: g '
				]
]

{ #category : #accessing }
SlidesForScripts10GeneticAlgorithmtxt >> scriptSnippetSlide05: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'inds := GAIndividual 
			create: 100000 
			individualsAndInitialize: 3 
			genesWith: [ :r | ($a to: $z) atRandom: r ].
			
fitnessBlock := [ :genes | (genes with: ''cat'' asArray collect: [ :a :b | (a == b) 
									ifTrue: [ 1 ] 
									ifFalse: [ 0 ] ]) sum ].

inds do: [ :i | i computeFitnessUsing: fitnessBlock ].

data := ((inds collect: #fitness) groupedBy: #yourself) associations collect: [ : as | as key -> as value size ] .
 
g := RTGrapher new.
d := RTData new.
d points: data.
d barChartWithBarTitle: #key.
d y: [ :as | as value ].
d yLog.
g add: d.
g axisY noDecimal.
g axisX noTick.
^ WorkshopAI showGraphInMorph: g '
				]
]

{ #category : #accessing }
SlidesForScripts10GeneticAlgorithmtxt >> scriptSnippetSlide06: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
'g := GAEngine new.
g populationSize: 1000.
g numberOfGenes: 4.
g createGeneBlock: [ :rand :index :ind | ($a to: $z) atRandom: rand ].
g fitnessBlock: [ :genes | 
	(#($g $a $t $o) with: genes collect: [ :a :b | a = b 
        ifTrue: [ 1 ] ifFalse: [ 0 ] ]) sum ].
g run.'
				]
]

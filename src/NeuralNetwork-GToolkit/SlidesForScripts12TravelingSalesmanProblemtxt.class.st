Class {
	#name : #SlidesForScripts12TravelingSalesmanProblemtxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We encode distances"
d := { ($A -> $B) -> 10 . ($A -> $D) -> 10 . ($B -> $C) -> 10 . ($C -> $D) -> 10 . ($A -> $C) -> 20 . ($B -> $D) -> 8 } asDictionary.

g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 100.
g numberOfGenes: 4.
g createGeneBlock: [ :rand :index :ind | ''ABCD'' atRandom: rand ].
g minimizeComparator.
g fitnessBlock: [ :genes |
	| currentCity length | 
	currentCity := genes first.
	length := 0.
	genes allButFirst do: [ :nextCity |
		length := length + (d at: (currentCity -> nextCity) ifAbsent: [ d at: (nextCity -> currentCity) ifAbsent: [ 0 ] ]).
		currentCity := nextCity ].
	length 
	 ].
g run

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We encode distances"
d := { ($A -> $B) -> 10 . ($A -> $D) -> 10 . ($B -> $C) -> 10 . ($C -> $D) -> 10 . ($A -> $C) -> 20 . ($B -> $D) -> 8 } asDictionary.

g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 1000.
g numberOfGenes: 4.
g createGeneBlock: [ :rand :index :ind | ''ABCD'' atRandom: rand ].
g minimizeComparator.
g fitnessBlock: [ :genes |
	| currentCity length | 
	currentCity := genes first.
	length := 0.
	genes allButFirst do: [ :nextCity |
		length := length + (d at: (currentCity -> nextCity) ifAbsent: [ d at: (nextCity -> currentCity) ifAbsent: [ 0 ] ]).
		currentCity := nextCity ].
	length + ((4 - genes asSet size) * 100)
	 ].
g run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We encode distances"
points := {(100@160). (20@40). (60@20). (180@100). (200@40). (60@200). (80@180). (40@120). (140@180). (140@140). (20@160). (200@160). (180@60). (100@120). (120@80). (100@40). (20@20). (60@80). (180@200). (160@20)}.

g := GAEngine new.
g endIfNoImprovementFor: 60.
g populationSize: 1000.
g numberOfGenes: points size.
g createGeneBlock: [ :rand :index :ind | points atRandom: rand ].
g minimizeComparator.
g fitnessBlock: [ :genes |
        | distance d |
        distance := 0.
        2 to: genes size do: [ :pointIndex |
            d := (genes at: pointIndex) dist: (genes at: pointIndex - 1).
            distance := distance + d ].
        distance + ((points size - genes asSet size) * 1000) ].
g run.

'
				]
]

{ #category : #accessing }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide05: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We encode distances"
points := {(100@160). (20@40). (60@20). (180@100). (200@40). (60@200). (80@180). (40@120). (140@180). (140@140). (20@160). (200@160). (180@60). (100@120). (120@80). (100@40). (20@20). (60@80). (180@200). (160@20)}.

g := GAEngine new.
g endIfNoImprovementFor: 60.
g populationSize: 1000.
g numberOfGenes: points size.
g createGeneBlock: [ :rand :index :ind | points atRandom: rand ].
g minimizeComparator.
g fitnessBlock: [ :genes |
        | distance d |
        distance := 0.
        2 to: genes size do: [ :pointIndex |
            d := (genes at: pointIndex) dist: (genes at: pointIndex - 1).
            distance := distance + d ].
        distance + ((points size - genes asSet size) * 1000) ].
g run.
...
result := g result.
v := RTView new.
elements := RTEllipse new size: 10; color: Color red trans; elementsOn: result.
elements @ RTPopup.
v addAll: elements.
elements do: [ :e | e translateTo: e model ].
2 to: result size do: [ :index |
    | l |
    l := RTArrowedLine new color: Color blue; headOffset: 0.8.
    v add: (l edgeFrom: (v elementFromModel: (result at: index - 1)) to: (v elementFromModel: (result at: index))) ].
^ WorkshopAI showGraphInMorph: g

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide06: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We define the points"
points := {(100@160). (20@40). (60@20). (180@100). (200@40). (60@200). (80@180). (40@120). (140@180). (140@140). (20@160). (200@160). (180@60). (100@120). (120@80). (100@40). (20@20). (60@80). (180@200). (160@20)}.

g := GAEngine new.
g endIfNoImprovementFor: 5.
g populationSize: 1000.
g numberOfGenes: points size.
g crossoverOperator:  GAOrderedCrossoverOperation new.
g beforeCreatingInitialIndividual: 
		[ :rand | points copy shuffleBy: rand ].
g mutationOperator: GASwapMutationOperation new.
g createGeneBlock: [ :rand :index :ind | points at: index ].

g minimizeComparator.
g fitnessBlock: [ :genes |
	| distance d |
	distance := 0.
	2 to: genes size do: [ :pointIndex |
		d := (genes at: pointIndex) dist: (genes at: pointIndex - 1).
		distance := distance + d ].
	distance ].
g run.

'
				]
]

{ #category : #accessing }
SlidesForScripts12TravelingSalesmanProblemtxt >> scriptSnippetSlide07: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 7;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We define the points"
points := {(100@160). (20@40). (60@20). (180@100). (200@40). (60@200). (80@180). (40@120). (140@180). (140@140). (20@160). (200@160). (180@60). (100@120). (120@80). (100@40). (20@20). (60@80). (180@200). (160@20)}.

g := GAEngine new.
g endIfNoImprovementFor: 5.
g populationSize: 1000.
g numberOfGenes: points size.
g crossoverOperator:  GAOrderedCrossoverOperation new.
g beforeCreatingInitialIndividual: 
		[ :rand | points copy shuffleBy: rand ].
g mutationOperator: GASwapMutationOperation new.
g createGeneBlock: [ :rand :index :ind | points at: index ].

g minimizeComparator.
g fitnessBlock: [ :genes |
	| distance d |
	distance := 0.
	2 to: genes size do: [ :pointIndex |
		d := (genes at: pointIndex) dist: (genes at: pointIndex - 1).
		distance := distance + d ].
	distance ].
g run.
...
result := g result.
v := RTView new.
elements := RTEllipse new size: 10; color: Color red trans; elementsOn: result.
elements @ RTPopup.
v addAll: elements.
elements do: [ :e | e translateTo: e model ].
2 to: result size do: [ :index |
	| l city1 city2 |
	l := RTArrowedLine new color: Color blue; headOffset: 0.8.
	city1 := v elementFromModel: (result at: index - 1).
	city2 := v elementFromModel: (result at: index).
	v add: (l edgeFrom: city1 to: city2) ].
^ WorkshopAI showGraphInMorph: v
'
				]
]

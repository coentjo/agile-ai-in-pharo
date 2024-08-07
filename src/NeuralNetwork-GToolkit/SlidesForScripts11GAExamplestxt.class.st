Class {
	#name : #SlidesForScripts11GAExamplestxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
numberOfIdentifyFactors := 345.
primeNumbers := #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199).
candidateFactors := #(1), primeNumbers.
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 10000.
g numberOfGenes: 10.
g createGeneBlock: 
	[ :rand :index :ind | candidateFactors atRandom: rand ].
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		((genes inject: 1 into: [ :r :v | r * v ]) - numberOfIdentifyFactors) abs ].
g run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
numberOfIdentifyFactors := 345.
primeNumbers := #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199).
candidateFactors := #(1), primeNumbers.
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 10000.
g numberOfGenes: 10.
g createGeneBlock: 
	[ :rand :index :ind | candidateFactors atRandom: rand ].
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		((genes inject: 1 into: [ :r :v | r * v ]) - numberOfIdentifyFactors) abs ].
g run.
...
g logs last bestFitness.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
numberOfIdentifyFactors := 345.
primeNumbers := #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199).
candidateFactors := #(1), primeNumbers.
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 10000.
g numberOfGenes: 10.
g createGeneBlock: 
	[ :rand :index :ind | candidateFactors atRandom: rand ].
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		((genes inject: 1 into: [ :r :v | r * v ]) - numberOfIdentifyFactors) abs ].
g run.
...
g logs last bestFitness.
...
g result copyWithout: 1.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide05: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 5;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
knapsackMaxWeight := 15.
"a box = (value, weight)"
boxes := #(#(4 12) #(2 1) #(2 2) #(1 1) #(10 4) #(0 0)).
	
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 20000.
g numberOfGenes: 15.
g createGeneBlock: [ :rand :index :ind | boxes atRandom: rand ].
g maximizeComparator.
g
	fitnessBlock: [ :genes | 
		| totalWeight totalValue penalty |
		totalValue := (genes collect: #first) sum.
		totalWeight := (genes collect: #second) sum.
		knapsackMaxWeight < totalWeight 
			ifTrue: [ penalty := (knapsackMaxWeight - totalWeight) abs * 50 ]
			ifFalse: [ penalty := 0 ].
		totalValue - penalty
		 ].
g run.
g result copyWithout: #(0 0)

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide06: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
knapsackMaxWeight := 15.
"a box = (value, weight)"
boxes := #(#(4 12) #(2 1) #(2 2) #(1 1) #(10 4) ).
	
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 20000.
g numberOfGenes: boxes size.
g createGeneBlock: [ :rand :index :ind | #(0 1) atRandom: rand ].
g maximizeComparator.
g fitnessBlock: [ :genes | 
		| totalWeight totalValue penalty |
		decodeToBoxes := OrderedCollection new.
		genes doWithIndex: [ :b :ind | b = 1 ifTrue: [ decodeToBoxes add: (boxes at: ind) ] ].
		decodeToBoxes 
			ifEmpty: [ totalValue := 0. totalWeight := 0 ]
			ifNotEmpty: [ 
				totalValue := (decodeToBoxes collect: #first) sum.
				totalWeight := (decodeToBoxes collect: #second) sum ].
		knapsackMaxWeight < totalWeight 
			ifTrue: [ penalty := (knapsackMaxWeight - totalWeight) abs * 50 ]
			ifFalse: [ penalty := 0 ].
		
		totalValue - penalty ].
g run.

"We now retrieve the solution"
decodeToBoxes := OrderedCollection new.
g result doWithIndex: [ :b :ind | 
			b = 1 ifTrue: [ decodeToBoxes add: (boxes at: ind) ] ].
decodeToBoxes 

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide07: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 7;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We assume that each meeting is correctly defined"	
"a meeting = (start time, end time)"
meetings := #(#(1 3) #(2 3) #(5 6) #(7 9) #(4 7)).
numberOfMeetings := meetings size.
	
g := GAEngine new.
g endIfNoImprovementFor: 10.
g populationSize: 20000.
g numberOfGenes: numberOfMeetings.
g createGeneBlock: [ :rand :index :ind | (1 to: numberOfMeetings) atRandom: rand ].
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		| distribution |
		distribution := OrderedCollection new.
		numberOfMeetings timesRepeat: [ distribution add: OrderedCollection new ].
		genes doWithIndex: [ :roomNumber :index | (distribution at: roomNumber) add: (meetings at: index) ].
		
		numberOfOverlap := 0.
		distribution do: [ :aSetOfMeetings |
			table := OrderedCollection new: 10 withAll: 0.
			aSetOfMeetings do: [ :meet |
				meet first to: meet second do: [ :v | table at: v put: (table at: v) + 1 ]
			].
			numberOfOverlap := numberOfOverlap + (table select: [ :v | v >= 2 ]) size.
		].

		(distribution select: #notEmpty) size + numberOfOverlap.
		 ].
g run.
g result asSet size

'
				]
]

{ #category : #accessing }
SlidesForScripts11GAExamplestxt >> scriptSnippetSlide08: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 8;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"The number of locate in the grid"
list := #(2 4 6 8 10 12 14 16 18).

"The different combinations to sum.
E.g., the three first cells could be summed (#(1 2 3))
	  the diagonal top-left to bottom-right (#1 5 9))"
sums := { 
	"Horizontal sums"
	#(1 2 3).
	#(4 5 6).
	#(7 8 9).
	
	"Diagonal sums"
	#(1 5 9).
	#(7 5 3).
	
	"Vertical sums"
	#(1 4 7).
	#(2 5 8).
	#(3 6 9) }.
g := GAEngine new.
g populationSize: 400.
g endIfFitnessIsAbove: 9.
g mutationRate: 0.01.
g numberOfGenes: 9.
g createGeneBlock: [ :rand :index | list atRandom: rand. ].
g fitnessBlock: [ :genes |
	| score penalty |
	score := (sums collect: [ :arr |
			(arr collect: [ :index | genes at: index]) sum ]) 
				inject: 0 into: [ :a :b | a + (b - 30) abs ].
	penalty := (genes size - genes asSet size) * 3.
	9 - (score + penalty) ].
g run.

"Visualize the grid"
v := RTView new.
label := RTLabel new.
elements := label elementsOn: g result. 
v addAll: elements.
RTGridLayout on: elements.
^ WorkshopAI showGraphInMorph: v
'
				]
]

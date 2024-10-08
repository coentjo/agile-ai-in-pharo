Class {
	#name : #SlidesForScripts13Robottxt,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-Scripts'
}

{ #category : #'as yet unclassified' }
SlidesForScripts13Robottxt >> scriptSnippetSlide02: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 2;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We build a map with 80 wall blocks"
map := GARobotMap new fillWithWalls: 80.

"We build the robot"
robot := GARobot new.
"Make the robot lives in the map"
robot map: map.


g := GAEngine new.
g endIfNoImprovementFor: 5.
g numberOfGenes: 100.
g populationSize: 250.
"A gene value is a cardinal direction"
g createGeneBlock: [ :rand :index :ind | #($N $S $W $E) atRandom: rand ].

"We want to minimize the distance between the robot and the exit"
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		robot followOrders: genes.
		robot position dist: map exitPosition ].
g run.

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts13Robottxt >> scriptSnippetSlide03: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 3;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
"We build a map with 80 wall blocks"
map := GARobotMap new fillWithWalls: 80.

"We build the robot"
robot := GARobot new.
"Make the robot lives in the map"
robot map: map.


g := GAEngine new.
g endIfNoImprovementFor: 5.
g numberOfGenes: 100.
g populationSize: 250.
"A gene value is a cardinal direction"
g createGeneBlock: [ :rand :index :ind | #($N $S $W $E) atRandom: rand ].

"We want to minimize the distance between the robot and the exit"
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		robot followOrders: genes.
		robot position dist: map exitPosition ].
g run.
...
map drawRobotPath: (robot followOrders: g result).
map open

'
				]
]

{ #category : #'as yet unclassified' }
SlidesForScripts13Robottxt >> scriptSnippetSlide04: aSlide [
	<gtSlide>

	^ aSlide labelAndElement
		priority: 4;
		newFadedText: 'Example' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	'
map := GARobotMap new fillWithWalls: 80.
robot := GARobot new.
robot map: map.
g := GAEngine new.
g endIfNoImprovementFor: 5.
g numberOfGenes: 100.
g populationSize: 250.
g createGeneBlock: [ :rand :index :ind | #($N $S $W $E) atRandom: rand ].
g minimizeComparator.
g
	fitnessBlock: [ :genes | 
		| path penalty |
		path := robot followOrders: genes.
		penalty := path size / 2.
		(robot position dist: map exitPosition) + penalty ].
g run.
map drawRobotPath: (robot followOrders: g result).
map open
'
				]
]

Class {
	#name : #NNetworkTest,
	#superclass : #TestCase,
	#category : #NeuralNetwork
}

{ #category : #accessing }
NNetworkTest >> testBasic [
	<gtExample>
    | nnetwork |
    nnetwork := NNetwork new.
    nnetwork configure: 2 hidden: 2 nbOfOutputs: 1.
    self assert: ((nnetwork feed: #(1 3)) anyOne closeTo: 0.6745388083637036 precision: 0.0000000001).
    self assert: nnetwork numberOfOutputs equals: 1.
    ^ nnetwork
]

{ #category : #accessing }
NNetworkTest >> testXOR [
	<gtExample>
	| nnetwork |
	nnetwork := NNetwork new.
	nnetwork configure: 2 hidden: 3 nbOfOutputs: 1.

	20000 timesRepeat: [ 
		nnetwork train: #(0 0) desiredOutputs: #(0).	
		nnetwork train: #(0 1) desiredOutputs: #(1).
		nnetwork train: #(1 0) desiredOutputs: #(1).
		nnetwork train: #(1 1) desiredOutputs: #(0).
	].

	self assert: (nnetwork feed: #(0 0)) first < 0.1.
	self assert: (nnetwork feed: #(0 1)) first > 0.9.
	self assert: (nnetwork feed: #(1 0)) first > 0.9.
	self assert: (nnetwork feed: #(1 1)) first < 0.1.
	^nnetwork
]

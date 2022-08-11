Extension { #name : #NNetwork }

{ #category : #'*NeuralNetwork-GToolkit' }
NNetwork >> aiLayers: aView [
	<gtView>
	
	| incomingLinks element mondrian |
	incomingLinks := OrderedCollection new.
	mondrian := aView mondrian.
	^ mondrian
		title: 'Layers';
		priority: 25;
		painting: [ :m | 
			| all |
			all := self neurons asSet.
			m nodes
				stencil: [ :layer | 
					| layerElement |
					layerElement := BlElement new
							layout: (BlLinearLayout vertical cellSpacing: 10);
							size: 50 @ 500;
							constraintsDo: [ :c | 
								c vertical fitContent.
								c horizontal fitContent ].
					layerElement
						addChild: (BlTextElement new text: (layer descriptiveLabel , ' - - - - - - ') asRopedText).
					layer children
						do: [ :neuron | 
							layerElement
								addChild: (BlElement new
										geometry: BlCircleGeometry new;
										size: layer elementSize;
										border: (BlBorder paint: Color black);
										when: BlClickEvent do: [ :e | e target phlow spawnObject: neuron ];
										aptitude: ((BrGlamorousWithTooltipAptitude
												content: [ | aContainer |
													aContainer := BlElement new
															layout: BlFrameLayout new;
															constraintsDo: [ :c | 
																c horizontal fitContent.
																c vertical fitContent ];
															when: GtPhlowObjectToSpawn
																do: [ :anEvent | 
																	element
																		fireEvent: (GtPhlowObjectToSpawn new
																				object: anEvent object;
																				sourceElement: anEvent target) ].
													(neuron gtViewsFor: GtPhlowEmptyView new)
														asElementDo: [ :anInspectorElement | 
															aContainer
																addChild: ((anInspectorElement exact: 400 @ 400) asScalableElement size: 800 @ 800) ] ])
												showDelay: 100 milliSeconds);
										background: layer elementColor) ].

					layerElement ];
				with: {self inputPseudoLayer} , layers.
			m edges
				fromNearestTightCircle;
				toNearestTightCircle;
				stencil: [ :each | 
					BlLineElement new
						zIndex: -1;
						border: (BlBorder paint: (Color lightGray alpha: 0.5) width: 1);
						toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: Color lightGray width: 1)) ];
				connect: all toAll: [ :each | #() asSet ].

			m ]
]

{ #category : #'*NeuralNetwork-GToolkit' }
NNetwork >> aiVisual: aView [
	<gtView>
	
	| incomingLinks element mondrian connections |
	incomingLinks := OrderedCollection new.
	mondrian := aView mondrian.
	connections := OrderedCollection new.

	"connect inputs to neurons in first layer"
	self inputPseudoLayer neurons do: [ :anInput | 
		layers first neurons do: [ :aNeuronInFirstLayer |
			connections add: anInput -> aNeuronInFirstLayer ] ] .
	layers
		do: [ :oneLayer | 
			oneLayer neurons
				do: [ :aNeuronInThatOneLayer "connect it to all neurons in next layer" | 
					oneLayer nextLayer
						ifNotNil: [ :nextL | 
							nextL neurons
								do: [ :neuronInNextLayer | connections add: aNeuronInThatOneLayer -> neuronInNextLayer ] ] ] ].

	^ mondrian
		title: 'Visual';
		priority: 10;
		painting: [ :m | 
			m nodes
				stencil: [ :each | GtMondrianUMLClassElement withDefaultContainer label: each descriptiveLabel ];
				with: {self inputPseudoLayer} , layers
					forEach: [ :layer | 
						m nodes
							shape: [ :neuron | 
								BlElement new
									geometry: BlCircleGeometry new;
									size: layer elementSize;
								   border: (BlBorder paint: Color black);
								   when: BlClickEvent
								   do: [ :e | e target phlow spawnObject: neuron ];
								   aptitude: ((BrGlamorousWithTooltipAptitude content: [ 
											     | aContainer |
											     aContainer := BlElement new
												                   layout: BlFrameLayout new;
												                   constraintsDo: [ :c | 
													                   c horizontal fitContent.
													                   c vertical fitContent ];
												                   when: GtPhlowObjectToSpawn
												                   do: [ :anEvent | 
													                   element fireEvent:
															                   (GtPhlowObjectToSpawn new
																                    object: anEvent object;
																                    sourceElement: anEvent target) ].
											     (neuron gtViewsFor: GtPhlowEmptyView new) 
												     asElementDo: [ :anInspectorElement | 
													     aContainer addChild:
														     ((anInspectorElement exact: 400 @ 400)
															      asScalableElement size: 800 @ 800) ] ]) 
										    showDelay: 100 milliSeconds);
								   background: layer elementColor ];
							with: layer neurons.
						m layout horizontalTree ].
			m edges
				connect: connections
				from: [ :x | x key ]
				to: [ :x | x value ].
			m ]
]

{ #category : #'*NeuralNetwork-GToolkit' }
NNetwork >> visualStencil [

	| weightsContainer inputsContainer containerTotal verticalContainer containerLayerLabel containerForNeuron |
	containerTotal := BlElement new
		                  layout: BlLinearLayout horizontal;
		                  background: Color white;
		                  aptitude: BrShadowAptitude;
		                  margin: (BlInsets all: 20);
		                  constraintsDo: [ :c | 
			                  c horizontal fitContent.
			                  c vertical fitContent ].
	" --- inputs --- "
	inputsContainer := BlTextElement new
		                   constraintsDo: [ :c | c horizontal matchParent ];
		                   margin: (BlInsets
				                    top: 5
				                    right: 0
				                    bottom: 20
				                    left: 5);
		                   text:
			                   (('Inputs: ' , self numberOfInputs asString)
				                    asRopedText glamorousRegularFont
				                    fontSize: 16;
				                    foreground: Color black).
	verticalContainer := BlElement new
		                     layout: BlLinearLayout vertical;
		                     margin: (BlInsets all: 10);
		                     constraintsDo: [ :c | 
			                     c horizontal fitContent.
			                     c vertical fitContent ].
	verticalContainer addChild: inputsContainer.
	containerTotal addChild: verticalContainer.


	" --- hidden layers --- "
	layers withIndexDo: [ :layer :index | 
		| containerForALayer containerSeparator layerLabel |
		containerForALayer := BlElement new
			                      layout: BlLinearLayout vertical;
			                      background: Color white;
			                      aptitude: BrShadowAptitude;
			                      margin: (BlInsets all: 20);
			                      constraintsDo: [ :c | 
				                      c horizontal fitContent.
				                      c vertical fitContent ].
		layerLabel := layer isOutputLayer
			              ifTrue: [ 'Output layer' ]
			              ifFalse: [ 'Layer ' , index asString ].
		containerLayerLabel := BrEditor new
			                       aptitude:
				                       (BrGlamorousRegularEditorAptitude new 
					                        fontSize: 26);
			                       text: layerLabel;
			                       constraintsDo: [ :c | 
				                       c horizontal fitContent.
				                       c vertical fitContent ].
		containerForALayer addChild: containerLayerLabel.

		layer neurons withIndexDo: [ :neuron :neuronIndex | 
			containerForNeuron := BrEditor new
				                      aptitude:
					                      (BrGlamorousRegularEditorAptitude new 
						                       fontSize: 16);
				                      text: neuron printString;
				                      constraintsDo: [ :c | 
					                      c horizontal fitContent.
					                      c vertical fitContent ].
			containerForALayer addChild: containerForNeuron ].
		containerTotal addChild: containerForALayer ].



	^ containerTotal
]

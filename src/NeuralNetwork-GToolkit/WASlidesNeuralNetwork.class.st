Class {
	#name : #WASlidesNeuralNetwork,
	#superclass : #WorkshopAI,
	#category : #'NeuralNetwork-GToolkit'
}

{ #category : #slides }
WASlidesNeuralNetwork >> coderWithComment [
	<gtExample>
	| aScripter |
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Initial Coder'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ (GtCoder forClass: GtCSPicture) createInPager maximized ] ].
	aScripter
		substep: 'Evaluate first snippet and inspect'
		do: [ :aStep | 
			aStep click
				label: 'Click on evaluate and inspect button';
				onBreadthFirstChildOfClass: GtPharoBehaviorCoderElement;
				onBreadthFirstChildOfClass: BrTabGroup;
				onChildNamed: #header;
				onChildAt: 1;
				onChildAt: 1;
				onChildAt: 2.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	^ aScripter elementWithoutParent
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0060: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.006.png'.
	prio := 1.0060.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0070: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.007.png'.
	prio := 1.0070.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0080: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.008.png'.
	prio := 1.0080.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0090: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.009.png'.
	prio := 1.0090.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0100: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.010.png'.
	prio := 1.0100.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0110: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.011.png'.
	prio := 1.0110.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0120: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.012.png'.
	prio := 1.0120.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0130: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.013.png'.
	prio := 1.0130.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0140: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.014.png'.
	prio := 1.0140.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0150: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.015.png'.
	prio := 1.0150.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0160: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.016.png'.
	prio := 1.0160.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0170: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.017.png'.
	prio := 1.0170.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0180: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.018.png'.
	prio := 1.0180.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0190: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.019.png'.
	prio := 1.0190.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0200: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.020.png'.
	prio := 1.0200.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0210: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.021.png'.
	prio := 1.0210.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0220: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.022.png'.
	prio := 1.0220.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0230: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.023.png'.
	prio := 1.0230.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0232: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0232;
		  newFadedText: 'Perceptron as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new
			  	newSnippetFromMethod: 
					  WorkshopAIPerceptronGT >> #perceptronForANDGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0234: aSlide [
	<gtSlide>
	

	^ aSlide  labelAndElement
		  priority: 1.0234;
		  newFadedText: 'Perceptron configured as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT>>#chapter01PerceptronAndGateWithInputs ]
	
		

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0236: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0236;
		  newFadedText: 'Perceptron for OR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForORGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0238: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0238;
		  newFadedText: 'Perceptron NOR Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForNORGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0240: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0240;
		  newFadedText: 'Training a perceptron';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronTrain ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0242: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0242;
		  newFadedText: 'Example script for drawing a Graph';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #exampleGraphSinus ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0244: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0244;
		  newFadedText: 'Graph colored dots';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronColoredDots ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0247: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0247;
		  newFadedText: 'Graoh colored dots with line';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronColoredDotsWithLine ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0248: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0248;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron09 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0250: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0250;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron10 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0252: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0252;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron11 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0254: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0254;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #chapter01Perceptron12 ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0256: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0256;
		  newFadedText: ' ';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #exampleMeasuringPrecision ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0258: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.025.png'.
	prio := 1.0258.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0260: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.026.png'.
	prio := 1.0260.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0270: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.027.png'.
	prio := 1.0270.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0280: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0280;
		  newFadedText: 'Step function';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showStepFunction ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0290: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.029.png'.
	prio := 1.0290.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0298: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0298;
		  newFadedText: 'Sigmoid function';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showSigmoidFunction ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0300: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.030.png'.
	prio := 1.0300.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0310: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.031.png'.
	prio := 1.0310.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0320: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0320;
		  newFadedText: 'Learning: Step vs Sigmoid';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAINeuronGT >> #showLearningStepVsSigmoid ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0330: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.033.png'.
	prio := 1.0330.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0340: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.034.png'.
	prio := 1.0340.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0350: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.035.png'.
	prio := 1.0350.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0360: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.036.png'.
	prio := 1.0360.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0362: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.037.png'.
	prio := 1.0362.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0370: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.037.png'.
	prio := 1.0370.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0380: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.038.png'.
	prio := 1.0380.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0390: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.039.png'.
	prio := 1.0390.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0400: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.040.png'.
	prio := 1.0400.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0410: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.041.png'.
	prio := 1.0410.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0420: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.042.png'.
	prio := 1.0420.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0430: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.043.png'.
	prio := 1.0430.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0440: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.044.png'.
	prio := 1.0440.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0450: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.045.png'.
	prio := 1.0450.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0460: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.046.png'.
	prio := 1.0460.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0470: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.047.png'.
	prio := 1.0470.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0480: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.048.png'.
	prio := 1.0480.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0490: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.049.png'.
	prio := 1.0490.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0500: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.050.png'.
	prio := 1.0500.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0510: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.051.png'.
	prio := 1.0510.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0520: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.052.png'.
	prio := 1.0520.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0530: aSlide [

	<gtSlide>
	| filename prio |
	filename := '2021-AI-General.053.png'.
	prio := 1.0530.
	^ aSlide element
		  priority: prio;
		  element: [ 
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (self slidesDirectory / filename) fullName.
			  form asElement asScalableElement constraintsDo: [ :c | 
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slideXmplPercepForANDGate: aSlide [

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0192;
		  newFadedText: 'Perceptron configured as an AND Gate';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippetFromMethod:
					  WorkshopAIPerceptronGT >> #perceptronForANDGate ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slideXmplPercepForORGate: aSlide [
	<gtSlide>

	^ aSlide example
		priority: 1.0202;
		method: WorkshopAIPerceptronGT>>#testOR

]

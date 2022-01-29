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
	^ self
		  slide: aSlide
		  prio: 1.0060
		  fromPicture: '2021-AI-General.006.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0070: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0070
		  fromPicture: '2021-AI-General.007.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0080: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0080
		  fromPicture: '2021-AI-General.008.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0090: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0090
		  fromPicture: '2021-AI-General.009.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0100: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0100
		  fromPicture: '2021-AI-General.010.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0110: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0110
		  fromPicture: '2021-AI-General.011.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0120: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0120
		  fromPicture: '2021-AI-General.012.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0130: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0130
		  fromPicture: '2021-AI-General.013.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0140: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0140
		  fromPicture: '2021-AI-General.014.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0150: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0150
		  fromPicture: '2021-AI-General.015.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0160: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0160
		  fromPicture: '2021-AI-General.016.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0170: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0170
		  fromPicture: '2021-AI-General.017.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0180: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0180
		  fromPicture: '2021-AI-General.018.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0190: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0190
		  fromPicture: '2021-AI-General.019.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0200: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0200
		  fromPicture: '2021-AI-General.020.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0210: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0210
		  fromPicture: '2021-AI-General.021.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0220: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0220
		  fromPicture: '2021-AI-General.022.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0230: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0230
		  fromPicture: '2021-AI-General.023.png'
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
	

	^ aSlide example
		priority: 1.0236;
		method: WorkshopAIPerceptronGT>>#perceptronForORGate

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0238: aSlide [
	<gtSlide>
	

	^ aSlide example
		priority: 1.0238;
		method: WorkshopAIPerceptronGT>>#perceptronForNORGate

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0240: aSlide [
	<gtSlide>
	

	^ aSlide example
		priority: 1.0240;
		method: WorkshopAIPerceptronGT>>#perceptronTrain

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0242: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0242;
		method: WorkshopAIPerceptronGT>>#exampleGraphSinus

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0244: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0244;
		method: WorkshopAIPerceptronGT>>#perceptronColoredDots

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0247: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0247;
		method: WorkshopAIPerceptronGT>>#perceptronColoredDotsWithLine

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0248: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0248;
		method: WorkshopAIPerceptronGT>>#chapter01Perceptron09

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0250: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0250;
		method: WorkshopAIPerceptronGT>>#chapter01Perceptron10

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0252: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0252;
		method: WorkshopAIPerceptronGT>>#chapter01Perceptron11

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0254: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0254;
		method: WorkshopAIPerceptronGT>>#chapter01Perceptron12

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0256: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0256;
		method: WorkshopAIPerceptronGT>>#exampleMeasuringPrecision

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0258: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0258
		  fromPicture: '2021-AI-General.025.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0260: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0260
		  fromPicture: '2021-AI-General.026.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0270: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0270
		  fromPicture: '2021-AI-General.027.png'
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0280: aSlide [

	<gtSlide>
	^ aSlide example
		priority: 1.0280;
		method: WorkshopAINeuronGT>>#showStepFunction
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0290: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0290;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.029.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0298: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0298;
		method: WorkshopAINeuronGT>>#showSigmoidFunction

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0300: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0300;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.030.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0310: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0310;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.031.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0320: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0320;
		method: WorkshopAINeuronGT>>#showLearningStepVsSigmoid

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0330: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0330;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.033.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0340: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0340;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.034.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0350: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0350;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.035.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0360: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0360;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.036.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0362: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0362;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.037.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0370: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0370;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.037.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0378: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0378;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.037.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0380: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0380;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.038.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0390: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0390;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.039.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0400: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0400;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.040.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0410: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0410;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.041.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0420: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0420;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.042.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0430: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0430;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.043.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0440: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0440;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.044.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0450: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0450;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.045.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0460: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0460;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.046.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0470: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0470;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.047.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0480: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0480;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.048.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0490: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0490;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.049.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0500: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0500;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.050.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0510: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0510;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.051.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0520: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0520;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.052.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0530: aSlide [

	<gtSlide>
	^ self
		  slide: aSlide
		  prio: 1.0730
		  fromPicture: '2021-AI-General.073.png'
	^ aSlide element
		  priority: 1.0530;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.053.png') fullName.
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

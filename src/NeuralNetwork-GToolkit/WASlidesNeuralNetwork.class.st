Class {
	#name : #WASlidesNeuralNetwork,
	#superclass : #Object,
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
	^ aSlide element
		  priority: 1.0060;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.006.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0070: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0070;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.007.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0080: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0080;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.008.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0090: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0090;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.009.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0100: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0100;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.010.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0110: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0110;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.011.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0120: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0120;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.012.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0130: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0130;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.013.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0140: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0140;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.014.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0150: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0150;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.015.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0160: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0160;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.016.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0170: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0170;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.017.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0180: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0180;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.018.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0190: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0190;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.019.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0200: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0200;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.020.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0210: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0210;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.021.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0220: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0220;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.022.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0230: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0230;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.023.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0232: aSlide [

	<gtSlide>
	^ aSlide example
		  priority: 1.0232;
		  method: WorkshopAIPerceptronGT >> #perceptronForANDGate
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0234: aSlide [
	<gtSlide>
	

	^ aSlide example
		priority: 1.0234;
		method: WorkshopAIPerceptronGT>>#chapter01PerceptronAndGateWithInputs

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
		method: WorkshopAIPerceptronGT>>#perceptronForNOTGate

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0247: aSlide [
	<gtSlide>
	^ aSlide example
		priority: 1.0247;
		method: WorkshopAIPerceptronGT>>#chapter01Perceptron08

]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0250: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0250;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.025.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0260: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0260;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.026.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0270: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0270;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.027.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0280: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.0280;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.028.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0290: aSlide [

	<gtSlide>
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
WASlidesNeuralNetwork >> slidePercep0300: aSlide [

	<gtSlide>
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
	^ aSlide element
		  priority: 1.0320;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * 'coentjo' / 'agile-ai-in-pharo' / 'slides'
							           / '2021-AI-General.032.png') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

{ #category : #slides }
WASlidesNeuralNetwork >> slidePercep0330: aSlide [

	<gtSlide>
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
WASlidesNeuralNetwork >> slidePercep0370: aSlide [

	<gtSlide>
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
WASlidesNeuralNetwork >> slidePercep0380: aSlide [

	<gtSlide>
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
	

	^ aSlide example
		priority: 1.0192;
		method: WorkshopAIPerceptronGT>>#perceptronForANDGate

]

{ #category : #slides }
WASlidesNeuralNetwork >> slideXmplPercepForORGate: aSlide [
	<gtSlide>

	^ aSlide example
		priority: 1.0202;
		method: WorkshopAIPerceptronGT>>#testOR

]

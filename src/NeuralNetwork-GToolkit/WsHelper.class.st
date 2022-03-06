Class {
	#name : #WsHelper,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-WsMetaHelper'
}

{ #category : #accessing }
WsHelper class >> generateSlideMethods [
	<gtExample>
	<noTest>
"for git"
"file: src/*.st"
| s s1 s2 s3 s4 file  nr filenumbers | 
s := '{ #category : #slides }
WorkshopAI >> slidePercep0010: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.1;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * ''coentjo'' / ''agile-ai-in-pharo'' / ''slides''
							           / ''2021-AI-General.001.png'') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

'. 
s1 :=  '{ #category : #slides }
WorkshopAI >> slidePercep'.
s2 := '0: aSlide [

	<gtSlide>
	^ aSlide element
		  priority: 1.'.
s3 := '0;
		  element: [
			  | container form |
			  form := PNGReadWriter formFromFileNamed:
					          (GtResourceReference path:
							           Path * ''coentjo'' / ''agile-ai-in-pharo'' / ''slides''
							           / ''2021-AI-General.'.
s4 := '.png'') fullName.
			  form asElement asScalableElement constraintsDo: [ :c |
					  c horizontal matchParent.
					  c vertical matchParent ] ]
]

'.

file := '/Users/Coen/git/agile-ai-in-pharo/slides' asFileReference.
filenumbers := (file children collect: [ :f | 
	| nm | 
	nm := f basename .
	nr := (nm splitOn: $. ) at: 2
	 ]) sorted.
^ (String streamContents: [ :aStream | 
filenumbers do: [ :filenr | 
	aStream 
		nextPutAll: s1; 
		nextPutAll: filenr; 
		nextPutAll: s2; 
		nextPutAll: filenr; 
		nextPutAll: s3; 
		nextPutAll: filenr; 
		nextPutAll: s4.

	 ]])
]

{ #category : #accessing }
WsHelper >> ClassHeaderForClass: className [

	^ 'Class {
	#name : #' , className
	  ,
	  ',
	#superclass : #Object,
	#category : #''NeuralNetwork-GToolkit-Workshop''
}

'
]

{ #category : #accessing }
WsHelper >> classNameFor: aName [
	| name |
	name := aName reject: [ : char | char = $- or: [char = $.]].
	^ 'Scripts',name
]

{ #category : #accessing }
WsHelper >> createClass: className [

	^ Smalltalk at: className ifAbsent: [ 
		  Object
			  subclass: className
			  instanceVariableNames: ''
			  classVariableNames: ''
			  package: 'NeuralNetwork-GToolkit-Scripts' ]
]

{ #category : #accessing }
WsHelper >> createMethods: aText inClass: class [

	| examples methodBody |
	examples := aText splitOn: '-----------------------------'.
	^ examples withIndexDo: [ :anExample :anIndex | 
		  | methodName |
		  methodName := 'slideWithExample'.
		  methodBody := anExample.
		  self
			  methodNumberAsString: anIndex asString
			  class: class
			  className: class name
			  snippet: methodBody ]
]

{ #category : #accessing }
WsHelper >> ensureClassExists: className [

	^ Smalltalk at: className ifAbsent: [ 
		  Object
			  subclass: className
			  instanceVariableNames: ''
			  classVariableNames: ''
			  package: 'NeuralNetwork-GToolkit-Scripts' ]
]

{ #category : #accessing }
WsHelper >> forClass: className script: exampleScript indexString: index [ 

	^ '{ #category : #slides }
',className,' >> script',( self indexLength2: index),': aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 1.0100;
		newFadedText: ''A script'' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: ''^ #(1 2 3)
	with: #(10 20 30)
	collect: [ :a :b | a + b ]''
				]
	
]
'


]

{ #category : #accessing }
WsHelper >> generateSlidesForScripts [

	"Generate a class-file (as to put in git for every script-file) 
	with every script as a separate method. "

	<gtExample>
	|  fromDir  baseDir    |
	baseDir := FileLocator imageDirectory / 'pharo-local' / 'iceberg'
	           / 'coentjo' / 'agile-ai-in-pharo'.
	fromDir := baseDir / 'scripts'.

	fromDir children do: [ :inFile | 
		| class className |
		className := ('SlidesFor' , (self classNameFor: inFile basename))
			             asSymbol.
		class := self ensureClassExists: className.
		self 
			createMethods:  inFile contents
			inClass: class.
		]

]

{ #category : #accessing }
WsHelper >> inClass: aClass createExample: aMethodName body: aMethodBody [

	| cr method |
	cr := Character cr asString.
	method := aMethodName , ' aSlide', cr , '	<gtSlide>' , cr , aMethodBody.
	^ aClass compile: method
]

{ #category : #accessing }
WsHelper >> indexLength2: index [

	"if index is only 1 digit: add '0' in front "
	| indexLengthMin2String |
	indexLengthMin2String := index asString.
	indexLengthMin2String size > 1 ifFalse: [ 
		indexLengthMin2String := '0' , indexLengthMin2String ].
	^ indexLengthMin2String
]

{ #category : #accessing }
WsHelper >> methodNumberAsString: methodNumberString class: class className: className snippet: snippet [

	| methodName methodBody mth |
	methodName := 'scriptSnippetSlide' , methodNumberString , ':'.
	methodBody := '
	^ aSlide labelAndElement
		priority: ' , methodNumberString , ';
		newFadedText: ''Example'' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: 
	''' , snippet , '''
				]'.

	self inClass: class createExample: methodName body: methodBody.
	mth := class methodDict at: methodName asSymbol.
	self assert: mth class name equals: CompiledMethod name
]

{ #category : #accessing }
WsHelper >> staticSlides [
	<gtExample>
	<noTest>
	"well, better make slidesDirectory a class method..."
	^  WorkshopAI new slidesDirectory asFileReference. 
]

{ #category : #accessing }
WsHelper >> testCreateExemple [

	"Glad I found out how to generate methods, 
but does not work because not all variable are declared, 
so methods don't compile"

	"Wait, I can create slides with Playgrounds with the code in a Snippet!!  "

	<gtExample>
	| className class methodNumberString snippet |
	className := #ByteString.
	class := Smalltalk at: className.
	snippet := '^ #(1 2 3)
	with: #(10 20 30)
	collect: [ :a :b | a + b ]'.
	methodNumberString := '01'.
	self
		methodNumberAsString: methodNumberString
		class: class
		className: className
		snippet: snippet
]

{ #category : #accessing }
WsHelper >> test_forClass_script_indexString [
	<gtExample>

	| expectedOutcome realOutcome className |
	className := 'AbcClass'.
	expectedOutcome:= '{ #category : #slides }
AbcClass >> script01: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 1.0100;
		newFadedText: ''Example with Pharo arrays'' ;
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippet: ''WorkshopAIPerceptronGT browse''
				]
]

'.
	realOutcome := self forClass: className script: 'xyz' indexString: '01'.
"	self assert: realOutcome equals: expectedOutcome."
	^ realOutcome
]

{ #category : #accessing }
WsHelper >> workshopAiExamples [
	<gtExample>
	<noTest>
	| examples text aPage aSnippet stream e2 exSorted |
	examples := OrderedCollection  new.
	WorkshopAI allSubclasses do: [ :aClass |
		examples addAll: aClass gtExamplesAll  ] . 
	e2 := examples collect: [ :x | x gtDisplayText ] . 
	
	stream := WriteStream on:  String new.
	e2 do: [ :example | 
		stream
			nextPutAll: '{{gtExample:';
			nextPutAll: example ;
			nextPutAll:  '| noCode= false | previewHeight= 200 | previewExpanded= true}}'; cr; cr
			 ]. 
	^ stream contents. 


]

{ #category : #accessing }
WsHelper >> write: classFileSrc toFile: toFile [

	| tab stream |
	toFile asFileReference writeStreamDo: [ : aStream | 
		aStream nextPutAll: classFileSrc
	]
]

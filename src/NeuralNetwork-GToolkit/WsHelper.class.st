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
"file: src/"
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
WsHelper >> createExample: methodName body: methodBody [ 

	| cr method |
	cr := Character cr asString.
	method := methodName , cr , '	<gtExample>' , cr , methodBody.
	^ (Smalltalk at: #ByteString) compile: method
]

{ #category : #accessing }
WsHelper >> createMethods: aText inClass: className [

	| examples methodBody |
	examples := aText splitOn: '-----------------------------'.
	^ { (examples at: 1) } withIndexDo: [ :anExample :anIindex | 
		  | methodName |
		  methodName := 'scriptExample'.
		  methodBody := ' ^ 42'.
	  self createExample: methodName body: methodBody ]
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
WsHelper >> exampleParseScripts [

	"Generate a class-file (as to put in git for every script-file) 
	with every script as a separate method. "

	<gtExample>
	| contents fromDir toDir classFileSrc outFile baseDir str fileName className |
	baseDir := FileLocator imageDirectory / 'pharo-local' / 'iceberg'
	           / 'coentjo' / 'agile-ai-in-pharo'.
	fromDir := baseDir / 'scripts'.
	toDir := baseDir / 'src'.

	fromDir children do: [ :inFile | 
		| class |
		className := ('Test' , (self classNameFor: inFile basename))
			             asSymbol.
		"Create class (if it does not exist already!)"
		class := self ensureClassExists: className.
		self 
			createMethods:  inFile contents
			inClass: class.
		"classFileSrc := self parseScriptFileToExample: inFile."
		
		"self write: classFileSrc toFile: outFile." 
		
		"for now only do it for 1 clas!"
		^ 42
		]

	"(Smalltalk at: #String className) inspect"
	"outFile := toDir / className, 'st'."
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
WsHelper >> inClass: aClassName createExample: aMethodName body: aMethodBody [

	| cr method |
	cr := Character cr asString.
	method := aMethodName , cr , '	<gtExample>' , cr , aMethodBody.
	^ (Smalltalk at: #ByteString) compile: method
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
WsHelper >> parseScriptFileToExample: aFileLocator [

	| className examples indexLengthMin2String stream |
	className := self classNameFor: aFileLocator basename.
	examples := aFileLocator contents splitOn:
		            '-----------------------------'.

	^ String streamContents: [ :aStream | 
		  aStream nextPutAll: (self ClassHeaderForClass: className).
		  examples withIndexDo: [ :exampleScript :index | 
			  aStream nextPutAll: (self
					   forClass: className
					   script: exampleScript
					   indexString: index) ] ]
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

	<gtExample>
	| className class methodName mth methodBody |
	className := #ByteString. 
	class := Smalltalk at: className. 
	methodName := 'aaascriptExample01'.
	methodBody := '

	<gtSlide>
	^ aSlide labelAndElement
		  priority: 1.0242;
		  newFadedText: ''Example script'';
		  element: [ 
			  GtPlaygroundLiveSlide new newSnippet:
					  ''	| g d |
	g := RTGrapher new.
	d := RTData new.
	d connectColor: Color blue.
	d points: (1 to: 100).
	d y: [ :x | (x / 3.14) sin ].
	g add: d.
	^ WorkshopAI showGraphInMorph: g'' ]'	.
	
	self inClass: className createExample: methodName body: methodBody.
	mth := (class methodDict at: methodName asSymbol).
	self assert: mth class name equals: CompiledMethod name
	
	
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

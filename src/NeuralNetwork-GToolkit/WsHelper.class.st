Class {
	#name : #WsHelper,
	#superclass : #Object,
	#category : #'NeuralNetwork-GToolkit-NeuralNetwork-GToolkit'
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
WsHelper >> staticSlides [
	<gtExample>
	<noTest>
	"well, bettrer make slidesDirectory a class method..."
	^  WorkshopAI new slidesDirectory asFileReference. 
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

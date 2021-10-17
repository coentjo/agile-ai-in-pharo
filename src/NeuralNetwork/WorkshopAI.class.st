"
# Workshop Agile AI
source: Book 'Agile AI in Pharo' by Alexandre Bergel. 

!! WORK IN PROGRESS !! More a proof-of-concept right now than a ready-to-use workshop. 

## Perceptron
A perceptron is ... 

"
Class {
	#name : #WorkshopAI,
	#superclass : #Object,
	#category : #'NeuralNetwork-NeuralNetwork'
}

{ #category : #accessing }
WorkshopAI >> slide02For: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 10;
		titleWithFormat: ('Perceptron' asRopedText 
			fontSize: 60;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 'glamorous' size + 1 to: t size) bold]; yourself);
		subtitleWithFormat: ('a tour' asRopedText 
			fontSize: 40;
			glamorousRegularFont;
			bold)
]

{ #category : #accessing }
WorkshopAI >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Workshop AI' asRopedText 
			fontSize: 60;
			glamorousRegularFont;
			thin;
			in: [:t | (t from: 'glamorous' size + 1 to: t size) bold]; yourself);
		subtitleWithFormat: ('a tour' asRopedText 
			fontSize: 40;
			glamorousRegularFont;
			bold)
]

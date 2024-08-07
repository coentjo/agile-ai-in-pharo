Class {
	#name : #BaselineOfAgileArtificialIntelligence,
	#superclass : #BaselineOf,
	#category : #BaselineOfAgileArtificialIntelligence
}

{ #category : #accessing }
BaselineOfAgileArtificialIntelligence class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'coentjo'
			/ 'agile-ai-in-pharo'
			/ 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload.
	

]

{ #category : #baselines }
BaselineOfAgileArtificialIntelligence >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"spec baseline: 'Roassal2' with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ]."
			
			spec package: 'NeuralNetwork' with: [ "spec requires: 'Roassal2' " ].
			spec package: 'Matrix'.
			spec package: 'NeuralNetwork-Matrix' with: [ spec requires: #('Matrix' 'NeuralNetwork') ].
			
			spec package: 'GeneticAlgorithm-Core'.
			spec package: 'GeneticAlgorithm-Tests' with: [ spec requires: 'GeneticAlgorithm-Core' ].
			spec package: 'Robot' with: [ spec requires: 'GeneticAlgorithm-Core' ].
			spec package: 'Creature' with: [ spec requires: 'GeneticAlgorithm-Core' ].
			
			spec package: 'NEAT' with: [ "spec requires: 'Roassal2' " ].
			spec package: 'MiniMario' with: [ spec requires: 'NEAT' ].
			
			spec group: 'Core' with: #('NeuralNetwork' 'Matrix' 'NeuralNetwork-Matrix' 'GeneticAlgorithm-Core' 'GeneticAlgorithm-Tests' 'Robot' 'Creature' 'NEAT' 'MiniMario')
		]. 
		
spec for: #GToolkit do: [ 
		spec package: 'NeuralNetwork-GToolkit' with: [ spec requires: #(NeuralNetwork) ] ]
]

{ #category : #accessing }
BaselineOfAgileArtificialIntelligence >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #accessing }
BaselineOfAgileArtificialIntelligence >> isGTImage [
^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-']
]

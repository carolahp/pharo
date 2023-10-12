"
MCClassTraitParser identifies classTrait. 
"
Class {
	#name : 'MCClassTraitParser',
	#superclass : 'MCDoItParser',
	#category : 'Monticello-Chunk Format',
	#package : 'Monticello',
	#tag : 'Chunk Format'
}

{ #category : 'factory identification hook' }
MCClassTraitParser class >> pattern [
	^ '*classTrait*uses:*'
]

{ #category : 'actions' }
MCClassTraitParser >> addDefinitionsTo: aCollection [

	| tokens definition traitCompositionString |
	tokens := source parseLiterals.
	traitCompositionString := (source readStream
		                           match: 'uses:';
		                           upToEnd) trimBoth.
	definition := (MCClassTraitDefinition baseTraitName: (tokens at: 1))
		              classTraitComposition: traitCompositionString;
		              yourself.
	aCollection add: definition
]
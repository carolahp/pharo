"
I represent an Icon in the system. In my iv 'forms' I store forms of different sizes to render myself at different scales depending on the world scale.
"
Class {
	#name : #Icon,
	#superclass : #Form,
	#instVars : [
		'forms'
	],
	#category : #'Polymorph-Widgets-Themes'
}

{ #category : #accessing }
Icon >> at: aSymbol put: aForm [
	^ forms at: aSymbol put: aForm

]

{ #category : #accessing }
Icon >> forms: aCollection [ 
	forms := aCollection
]

{ #category : #initialization }
Icon >> initialize [
	super initialize.
	forms := Dictionary new
]

{ #category : #private }
Icon >> resolveForm [

	^ self scaledByDisplayScaleFactor 
]

{ #category : #private }
Icon >> resolveFormForScaleFactor: aScaleFactor [
	aScaleFactor asFloat = 1.0 ifTrue: [ ^ self ]. 
	^ forms at: aScaleFactor asFloat ifAbsent: [ 
		  | closestScale minRest |
		  minRest := SmallInteger maxVal.
		  forms keys do: [ :key | 
			  (aScaleFactor - key asFloat) abs < minRest ifTrue: [ 
				  minRest := (aScaleFactor - key asFloat) abs.
				  closestScale := key ] ].
		  Transcript show: minRest asString.
		  (forms at: closestScale asFloat) "scaledByWorldScaleFactor" ]
]

{ #category : #'as yet unclassified' }
Icon >> scaledByDisplayScaleFactor [
	
	^ self resolveFormForScaleFactor: WorldMorph scaleFactor
]

{ #category : #'scaling, rotation' }
Icon >> scaledToSize: newExtent [

	| scaleFactor |
	
	scaleFactor := newExtent / self extent.
	^self resolveFormForScaleFactor: scaleFactor x
]

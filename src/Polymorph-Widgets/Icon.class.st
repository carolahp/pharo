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

{ #category : #converting }
Icon >> asIcon [
	^ self
]

{ #category : #accessing }
Icon >> at: aSymbol put: aForm [
	^ forms at: aSymbol put: aForm

]

{ #category : #private }
Icon >> closestScaleFor: aScaleFactor [

	" We assume form keys are multiples of 0.5 "

	| rest maxKey scaleKey |
	maxKey := 0.
	forms keysDo: [ :key | maxKey := maxKey max: key ].

	rest := aScaleFactor % 0.5.
	scaleKey := aScaleFactor + (0.5 - rest) abs.

	^ scaleKey min: maxKey
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

	| newExtent |
	
	(aScaleFactor asFloat closeTo: 1.0) ifTrue: [ ^ self ].
	newExtent := self extent * aScaleFactor.
	^ (forms
		   at: aScaleFactor asFloat
		   ifAbsent: [ forms at: (self closestScaleFor: aScaleFactor) ]) 
		  scaledToSize: newExtent
]

{ #category : #'as yet unclassified' }
Icon >> scaledByDisplayScaleFactor [

	^ self scaledToSize: WorldMorph scaleFactor * width
		  @ (WorldMorph scaleFactor * height)
]

{ #category : #'scaling, rotation' }
Icon >> scaledToSize: newExtent [

	| scaleFactor |
	newExtent = self extent ifTrue: [^self].
	scaleFactor := (newExtent x / self width min: newExtent y / self height) asFloat.
	scaleFactor < 1.0 ifTrue: [ ^ super scaledToSize: newExtent ].
	^ (self resolveFormForScaleFactor: scaleFactor) scaledToSize: newExtent
]

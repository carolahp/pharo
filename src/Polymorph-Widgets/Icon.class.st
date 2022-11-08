"
I represent a system's icon. 
I store multiple forms in different sizes to be displayed according to scale of the world.
"
Class {
	#name : #Icon,
	#superclass : #Object,
	#instVars : [
		'forms'
	],
	#category : #'Polymorph-Widgets-Themes'
}

{ #category : #accessing }
Icon >> asForm [
	^ self resolveForm
]

{ #category : #accessing }
Icon >> at: aScale put: aForm [
	forms at: aScale asFloat put: aForm
]

{ #category : #accessing }
Icon >> boundingBox [
	
	^ self resolveForm boundingBox 
]

{ #category : #accessing }
Icon >> depth [
	^ self resolveForm depth
]

{ #category : #accessing }
Icon >> doesNotUnderstand: aMessage [
	| form |
	form := self resolveForm.
	^ ( form respondsTo: aMessage selector)
		ifTrue: [ form perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #accessing }
Icon >> extent [
	^ self resolveForm extent
]

{ #category : #accessing }
Icon >> forms: aDictionary [ 
	forms := aDictionary
]

{ #category : #accessing }
Icon >> height [
	
	^ self resolveForm height
]

{ #category : #accessing }
Icon >> hibernate [
	^ self resolveForm hibernate
]

{ #category : #initialization }
Icon >> initialize [
	super initialize.
	forms := IdentityDictionary new
]

{ #category : #testing }
Icon >> isTranslucent [
	^ self resolveForm isTranslucent 
]

{ #category : #accessing }
Icon >> resolveForm [

	| scale |
	scale := WorldMorph scaleFactor.
	^ self resolveFormForScaleFactor: scale
]

{ #category : #accessing }
Icon >> resolveFormForScaleFactor: aScaleFactor [

	^ forms
		  at: aScaleFactor asFloat
		  ifAbsent: [ (forms at: 1 asFloat) scaledByWorldScaleFactor ]
]

{ #category : #accessing }
Icon >> scaledByWorldScaleFactor [
	^ self resolveForm
]

{ #category : #accessing }
Icon >> scaledToSize: newSize [
	self error: 'should not implement'
]

{ #category : #accessing }
Icon >> width [
	
	^ self resolveForm width
]

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
Icon >> boundingBox [
	
	^ self resolveForm boundingBox 
]

{ #category : #accessing }
Icon >> depth [
	^ self resolveForm depth
]

{ #category : #accessing }
Icon >> extent [
	^ self resolveForm extent
]

{ #category : #accessing }
Icon >> forms: aCollection [ 
	forms := aCollection
]

{ #category : #accessing }
Icon >> height [
	
	^ self resolveForm height
]

{ #category : #accessing }
Icon >> hibernate [
	^ self resolveForm hibernate
]

{ #category : #testing }
Icon >> isTranslucent [
	^ self resolveForm isTranslucent 
]

{ #category : #accessing }
Icon >> resolveForm [

	^ self resolveFormForScaleFactor: 1.0
]

{ #category : #accessing }
Icon >> resolveFormForScaleFactor: aScaleFactor [

	^ forms
		  at: aScaleFactor asFloat
		  ifAbsent: [ (forms at: 1 asFloat) scaledByDisplayScaleFactor ]
]

{ #category : #accessing }
Icon >> scaledToSize: newSize [
	self error: 'should not implement'
]

{ #category : #accessing }
Icon >> width [
	
	^ self resolveForm width
]

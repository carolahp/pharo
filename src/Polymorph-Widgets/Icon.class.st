Class {
	#name : #Icon,
	#superclass : #Object,
	#instVars : [
		'forms'
	],
	#category : #'Polymorph-Widgets-Themes'
}

{ #category : #converting }
Icon >> asForm [
	^ self resolveForm
]

{ #category : #accessing }
Icon >> at: aSymbol put: aForm [
	^ forms at: aSymbol put: aForm

]

{ #category : #'reflective operations' }
Icon >> doesNotUnderstand: aMessage [
	"ToDo: To remove this hack, Icon should inherit from Form and when the world scale changes, each icon instance should become into another instance whith the correct scale while storing its forms in other scales into the forms collection"
	^ (self asForm respondsTo: aMessage selector)
		ifTrue: [ self asForm perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #accessing }
Icon >> forms: aCollection [ 
	forms := aCollection
]

{ #category : #private }
Icon >> resolveForm [

	^ self scaledByDisplayScaleFactor 
]

{ #category : #private }
Icon >> resolveFormForScaleFactor: aScaleFactor [

	^ forms
		  at: aScaleFactor asFloat
		  ifAbsent: [ (forms at: 1 asFloat) scaledByWorldScaleFactor ]
]

{ #category : #'as yet unclassified' }
Icon >> scaledByDisplayScaleFactor [
	
	^ self resolveFormForScaleFactor: WorldMorph scaleFactor
]

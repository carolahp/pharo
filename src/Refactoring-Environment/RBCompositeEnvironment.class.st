Class {
	#name : 'RBCompositeEnvironment',
	#superclass : 'RBBrowserEnvironmentWrapper',
	#instVars : [
		'otherEnvironment'
	],
	#category : 'Refactoring-Environment',
	#package : 'Refactoring-Environment'
}

{ #category : 'description' }
RBCompositeEnvironment >> description [
	^ label
]

{ #category : 'testing' }
RBCompositeEnvironment >> isCompositeEnvironment [
	^ true
]

{ #category : 'testing' }
RBCompositeEnvironment >> isTerminal [
	"A terminal composite environment does not contain composite environments"

	^ self environment isCompositeEnvironment not and: [
		  self otherEnvironment isCompositeEnvironment not ]
]

{ #category : 'accessing' }
RBCompositeEnvironment >> operator [
	self subclassResponsibility
]

{ #category : 'accessing' }
RBCompositeEnvironment >> otherEnvironment [
	^ otherEnvironment
]

{ #category : 'printing' }
RBCompositeEnvironment >> printOn: aStream [
	aStream nextPutAll: label
]

{ #category : 'accessing' }
RBCompositeEnvironment >> shortDescription [
	^ self description
]

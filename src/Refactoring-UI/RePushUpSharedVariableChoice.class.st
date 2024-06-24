Class {
	#name : 'RePushUpSharedVariableChoice',
	#superclass : 'ReVariableChoice',
	#category : 'Refactoring-UI-Choices',
	#package : 'Refactoring-UI',
	#tag : 'Choices'
}

{ #category : 'accessing' }
RePushUpSharedVariableChoice >> action [
	driver pushUpReferencedSharedVars
]

{ #category : 'accessing' }
RePushUpSharedVariableChoice >> description [ 

	^ 'Push up shared variable(s)'
]
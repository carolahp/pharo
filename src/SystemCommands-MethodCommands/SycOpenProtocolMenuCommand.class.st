Class {
	#name : #SycOpenProtocolMenuCommand,
	#superclass : #SycOpenContextMenuCommand,
	#category : #'SystemCommands-MethodCommands'
}

{ #category : #execution }
SycOpenProtocolMenuCommand >> activationStrategy [ 
	^ SycProtocolMenuActivation
]

{ #category : #'context menu' }
SycOpenProtocolMenuCommand >> cmCommandClass [ 
	^ SycProtocolCmCommand
]

{ #category : #accessing }
SycOpenProtocolMenuCommand >> defaultMenuIconName [
	^#user
]

{ #category : #accessing }
SycOpenProtocolMenuCommand >> defaultMenuItemName [
	^'Custom Scopes'
]

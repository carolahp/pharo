"
I am a command to add protocol scope to listScopes
"
Class {
	#name : #SycAddProtocolToNewScopeCommand,
	#superclass : #SycProtocolCmCommand,
	#instVars : [
		'class'
	],
	#category : #'SystemCommands-MethodCommands'
}

{ #category : #accessing }
SycAddProtocolToNewScopeCommand >> icon [ 
	^ self iconNamed: #add
]

{ #category : #accessing }
SycAddProtocolToNewScopeCommand >> name [
	^ 'Add protocol(s) to new scope'
]

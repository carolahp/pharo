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

{ #category : #executing }
SycAddProtocolToNewScopeCommand >> execute [
	| scope protocols |
	self prepareFullExecution.
	protocols := methodGroups select: [:each | each isKindOf: ClyTaggedMethodGroup] 
		thenCollect: [ :each | each tag].
	scope := RBBrowserEnvironment new forClass: class protocols: protocols.
	RefactoringSettings addScope: scope.
	RBEnvironmentsPresenter openSelecting: scope
]

{ #category : #accessing }
SycAddProtocolToNewScopeCommand >> icon [ 
	^ self iconNamed: #add
]

{ #category : #accessing }
SycAddProtocolToNewScopeCommand >> name [
	^ 'Add protocol(s) to new scope'
]

{ #category : #preparation }
SycAddProtocolToNewScopeCommand >> prepareFullExecution [
	super prepareFullExecution.
	class := context lastSelectedClass.
]

"
I am a base class for commands which configure existing debugging commands found in methods
"
Class {
	#name : #ClyConfigureDebuggingCommand,
	#superclass : #ClyDebuggingCommand,
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Commands'
}

{ #category : #testing }
ClyConfigureDebuggingCommand class >> isAbstract [
	^self = ClyConfigureDebuggingCommand
]

{ #category : #execution }
ClyConfigureDebuggingCommand >> configurationPresenterClass [
	self subclassResponsibility 
]

{ #category : #execution }
ClyConfigureDebuggingCommand >> debuggingCommandsIn: aNode [
	self subclassResponsibility
]

{ #category : #accessing }
ClyConfigureDebuggingCommand >> defaultMenuIconName [
	^#configuration
]

{ #category : #accessing }
ClyConfigureDebuggingCommand >> defaultMenuItemName [ 
	^'Configure '", self debuggingToolClass name asLowercase"
]

{ #category : #execution }
ClyConfigureDebuggingCommand >> execute [

	sourceNode nodesWithLinks do: [ :node | 
		(self debuggingCommandsIn: node) do: [ :cmd |
			(self configurationPresenterClass on: cmd) open ] ]
]

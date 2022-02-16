"
I am a base class for commands which configure existing breakpoints found in methods
"
Class {
	#name : #ClyConfigureBreakpointCommand,
	#superclass : #ClyConfigureDebuggingCommand,
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Breakpoints'
}

{ #category : #testing }
ClyConfigureBreakpointCommand class >> canBeExecutedInContext: aBrowserContext [

	^ (super canBeExecutedInContext: aBrowserContext) and: [ 
		  aBrowserContext isSelectedItemHasBreakpoint ]
]

{ #category : #activation }
ClyConfigureBreakpointCommand class >> contextMenuOrder [
	^0.5
]

{ #category : #execution }
ClyConfigureBreakpointCommand >> configurationPresenterClass [
	^ BreakpointNavigatorPresenter 
]

{ #category : #execution }
ClyConfigureBreakpointCommand >> debuggingCommandsIn: aNode [
	^ aNode breakpoints
]

"
I am a command to add conditional breakpoint into particular source node..
Condition is configured by block
 
Internal Representation and Key Implementation Points.

    Instance Variables
	conditionBlock:		<BlockClosure>
"
Class {
	#name : #ClyAddConditionalBreakpointCommand,
	#superclass : #ClyAddBreakpointCommand,
	#instVars : [
		'conditionBlock'
	],
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Breakpoints'
}

{ #category : #activation }
ClyAddConditionalBreakpointCommand class >> contextMenuOrder [
	^1.2
]

{ #category : #execution }
ClyAddConditionalBreakpointCommand >> applyBreakpointCondition: aBreakpoint [
	aBreakpoint condition: conditionBlock
]

{ #category : #execution }
ClyAddConditionalBreakpointCommand >> codeScriptPresenterClass [
	^ CodeScriptingInMethodPresenter
]

{ #category : #accessing }
ClyAddConditionalBreakpointCommand >> conditionBlock [
	^ conditionBlock
]

{ #category : #accessing }
ClyAddConditionalBreakpointCommand >> conditionBlock: anObject [
	conditionBlock := anObject
]

{ #category : #accessing }
ClyAddConditionalBreakpointCommand >> defaultMenuItemName [
	^'Break on  ', sourceNode displaySourceCode, '  when ...'
]

{ #category : #execution }
ClyAddConditionalBreakpointCommand >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	conditionBlock := self requestConditionBlock
]

{ #category : #execution }
ClyAddConditionalBreakpointCommand >> requestConditionBlock [

	| script presenter |
	script := 'true'.

	presenter := self codeScriptPresenterClass on: method.
	presenter text: script.
	presenter asModalWindow cancelAction: [ presenter text: '' ]; open.
	script := presenter text.
	script isEmptyOrNil ifTrue: [ CmdCommandAborted signal ].
	^ (BreakpointCondition fromScriptCode: script) block
]

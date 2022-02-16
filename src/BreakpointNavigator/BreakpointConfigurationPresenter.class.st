"
I am a presenter to configure existing breakpoints
"
Class {
	#name : #BreakpointConfigurationPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'breakpoint',
		'conditionCodePresenter',
		'saveButton'
	],
	#category : #'BreakpointNavigator-View'
}

{ #category : #layout }
BreakpointConfigurationPresenter class >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		add: #conditionCodePresenter;
		add: #saveButton;
		yourself
]

{ #category : #'instance creation' }
BreakpointConfigurationPresenter class >> on: aBreakpoint [
	^ self new
		breakpoint: aBreakpoint;
		yourself
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> breakpoint [
	^ breakpoint ifNil: [ self error: 'You must set the breakpoint' ]
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> breakpoint: aBreakpoint [ 
	breakpoint := aBreakpoint.
	self privateUpdate
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> conditionCodePresenter [
	^ conditionCodePresenter
]

{ #category : #initialization }
BreakpointConfigurationPresenter >> initializePresenters [

	conditionCodePresenter := self newCodeScriptingPresenter.
	saveButton := self newButton.
	saveButton icon: (self iconNamed: #smallSave)
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> newCodeScriptingPresenter [

	^ CodeScriptingInMethodPresenter new
]

{ #category : #updating }
BreakpointConfigurationPresenter >> privateUpdate [

	conditionCodePresenter method: breakpoint node methodNode method.
	conditionCodePresenter text:
		(BreakpointCondition fromBlock: breakpoint condition) scriptCode
			asString
]

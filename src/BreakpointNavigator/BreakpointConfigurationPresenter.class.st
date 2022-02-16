"
I am a presenter to configure existing breakpoints
"
Class {
	#name : #BreakpointConfigurationPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'breakpoint',
		'conditionScriptLabel',
		'conditionScriptPresenter',
		'conditionScriptAcceptButton',
		'conditionScriptRevertButton'
	],
	#category : #'BreakpointNavigator-View'
}

{ #category : #layout }
BreakpointConfigurationPresenter class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #conditionScriptLabel withConstraints: [ :constraints | 
			  constraints
				  fill: false;
				  expand: false;
				  width: self toolbarHeight ];
		  add: (SpBoxLayout newLeftToRight
				   add: #conditionScriptPresenter;
				   add: (SpBoxLayout newTopToBottom
						    add: #conditionScriptAcceptButton;
						    add: #conditionScriptRevertButton;
						    yourself)
				   withConstraints: [ :constraints | 
					   constraints
						   fill: false;
						   expand: false;
						   width: self buttonWidth / 2 ];
				   yourself);
		  yourself
]

{ #category : #'instance creation' }
BreakpointConfigurationPresenter class >> on: aBreakpoint [
	^ self new
		breakpoint: aBreakpoint;
		yourself
]

{ #category : #initialization }
BreakpointConfigurationPresenter >> acceptConditionScript [

	breakpoint condition:
		(BreakpointCondition fromScriptCode: conditionScriptPresenter text)
			block
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
BreakpointConfigurationPresenter >> conditionScriptPresenter [
	^ conditionScriptPresenter
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> conditionScriptWidgets [

	^ { 
		  conditionScriptAcceptButton.
		  conditionScriptRevertButton.
		  conditionScriptLabel.
		  conditionScriptPresenter }
]

{ #category : #initialization }
BreakpointConfigurationPresenter >> configureConditionScriptActions [
	
	conditionScriptAcceptButton whenActivatedDo: [ self acceptConditionScript ].
	conditionScriptRevertButton whenActivatedDo: [ self loadConditionScript ]
]

{ #category : #initialization }
BreakpointConfigurationPresenter >> initializeConditionScriptWidgets [

	conditionScriptLabel := self newLabel label: 'Break condition'.
	conditionScriptPresenter := self newCodeScriptingPresenter.
	conditionScriptAcceptButton := self newButton.
	conditionScriptAcceptButton icon: (self iconNamed: #smallOk).
	conditionScriptAcceptButton help: 'Save condition'.
	conditionScriptRevertButton := self newButton.
	conditionScriptRevertButton icon: (self iconNamed: #smallUndo).
	conditionScriptRevertButton help: 'Revert changes'
]

{ #category : #initialization }
BreakpointConfigurationPresenter >> initializePresenters [
	self initializeConditionScriptWidgets.
	self configureConditionScriptActions
]

{ #category : #updating }
BreakpointConfigurationPresenter >> loadConditionScript [

	conditionScriptPresenter method: breakpoint node methodNode method.
	conditionScriptPresenter text:
		(BreakpointCondition fromBlock: breakpoint condition) scriptCode
			asString
]

{ #category : #accessing }
BreakpointConfigurationPresenter >> newCodeScriptingPresenter [

	^ CodeScriptingInMethodPresenter new
]

{ #category : #updating }
BreakpointConfigurationPresenter >> privateUpdate [

	breakpoint hasCondition
		ifTrue: [ 
			self conditionScriptWidgets do: #show.
			self loadConditionScript ]
		ifFalse: [ 
			self conditionScriptWidgets do: #hide.
			conditionScriptPresenter text: '' ]
]

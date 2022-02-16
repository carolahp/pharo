"
I am a presenter to script code in the context of a method.

I am used to input the condition when creating a conditional breakpoint
"
Class {
	#name : #CodeScriptingInMethodPresenter,
	#superclass : #SpCodePresenter,
	#instVars : [
		'method'
	],
	#category : #'BreakpointNavigator-View'
}

{ #category : #'instance creation' }
CodeScriptingInMethodPresenter class >> on: aMethod [
	^ self new
		method: aMethod;
		yourself
]

{ #category : #initialization }
CodeScriptingInMethodPresenter >> initialize [

	super initialize.
	self
		withSyntaxHighlight;
		property: #titleHolder
		rawValue: 'Write the breakpoint''s condition'
]

{ #category : #accessing }
CodeScriptingInMethodPresenter >> method: aMethod [

	method := aMethod.
	self updateInteractionModel
]

{ #category : #initialization }
CodeScriptingInMethodPresenter >> updateInteractionModel [

	self
		behavior: method methodClass;
		interactionModel:
			(SpCodeScriptingInMethodInteractionModel on: method)
]

"
I am a presenter to script code in the context of a method.

I am used to input the condition when creating a conditional breakpoint
"
Class {
	#name : #SpCodeScriptingInMethodPresenter,
	#superclass : #SpCodePresenter,
	#instVars : [
		'method'
	],
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Breakpoints'
}

{ #category : #'instance creation' }
SpCodeScriptingInMethodPresenter class >> on: aMethod [
	^ self basicNew
		method: aMethod;
		initialize
]

{ #category : #initialization }
SpCodeScriptingInMethodPresenter >> initialize [ 
	super initialize.
	self 
		behavior: method methodClass;
		withSyntaxHighlight;
		property: #titleHolder
		rawValue: 'Write the breakpoint''s condition';
		interactionModel:
			(SpCodeScriptingInMethodInteractionModel on: method)
]

{ #category : #initialization }
SpCodeScriptingInMethodPresenter >> initializePresenters [ 
	self selectAll
]

{ #category : #accessing }
SpCodeScriptingInMethodPresenter >> method: aMethod [ 
	method := aMethod
]

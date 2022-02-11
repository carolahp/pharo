"
I am an interaction model for SpCodePresenter, to script code in the context of a method.

To highlight the code I consider method's temporary variables, arguments, and all bindings defined by the method's class.

I do not consider the method's selector as part of the code.
"
Class {
	#name : #SpCodeScriptingInMethodInteractionModel,
	#superclass : #SpCodeScriptingInteractionModel,
	#instVars : [
		'method'
	],
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Breakpoints'
}

{ #category : #'instance creation' }
SpCodeScriptingInMethodInteractionModel class >> on: aMethod [

	^ self basicNew
		  method: aMethod;
		  initialize
]

{ #category : #accessing }
SpCodeScriptingInMethodInteractionModel >> behavior [

	^ self method ifNotNil: [ self method methodClass ]
]

{ #category : #binding }
SpCodeScriptingInMethodInteractionModel >> bindingOf: aString [

	^ (self behavior bindingOf: aString) ifNil: [ 
		  self bindings associationAt: aString ]
]

{ #category : #initialization }
SpCodeScriptingInMethodInteractionModel >> initialize [

	(self method argumentNames , self method tempNames) flattened do: [ 
		:each | self addBinding: each asSymbol -> nil ].
	super initialize
]

{ #category : #accessing }
SpCodeScriptingInMethodInteractionModel >> method [

	^ method
]

{ #category : #accessing }
SpCodeScriptingInMethodInteractionModel >> method: aMethod [ 
	method := aMethod
]

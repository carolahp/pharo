"
I exist to test refactoring conditions
"
Class {
	#name : 'MyClassBetaSibling',
	#superclass : 'MyClassAlpha',
	#category : 'Refactoring-DataForTesting-StaticModel',
	#package : 'Refactoring-DataForTesting',
	#tag : 'StaticModel'
}

{ #category : 'dummy methods' }
MyClassBetaSibling >> methodDuplicated [
	^ self
]

{ #category : 'dummy methods' }
MyClassBetaSibling >> methodDuplicated2 [
	^ self
]

{ #category : 'dummy methods' }
MyClassBetaSibling >> sendSuper [
	^ super methodOverriden 
]
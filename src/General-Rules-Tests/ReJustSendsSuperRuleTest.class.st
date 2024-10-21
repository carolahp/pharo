Class {
	#name : 'ReJustSendsSuperRuleTest',
	#superclass : 'ReAbstractRuleTestCase',
	#instVars : [
		'classFactory'
	],
	#category : 'General-Rules-Tests-Optimization',
	#package : 'General-Rules-Tests',
	#tag : 'Optimization'
}

{ #category : 'running' }
ReJustSendsSuperRuleTest >> setUp [
	super setUp.
	classFactory := ClassFactoryForTestCase new.
]

{ #category : 'running' }
ReJustSendsSuperRuleTest >> tearDown [ 

	classFactory cleanUp.
	super tearDown
]

{ #category : 'tests' }
ReJustSendsSuperRuleTest >> testRule [ 

	| superClass class critiques |
	
	superClass := classFactory make: [ :aBuilder | aBuilder ].
	superClass compile: 'method ^ 3'  classified: 'test-helper'.
	
	class := classFactory make: [ :aBuilder | aBuilder 
		superclass: superClass ].
	class compile: 'method ^ super method' classified: 'test-helper'.
	
	critiques := self myCritiquesOnMethod: class >> #method.
	self assert: critiques size equals: 1 
	
]
Class {
	#name : #BreakpointConditionTest,
	#superclass : #TestCase,
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Tests-Breakpoints'
}

{ #category : #tests }
BreakpointConditionTest >> parserClass [
	^ RBParser
]

{ #category : #tests }
BreakpointConditionTest >> testMessageSend_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'val msg: arg')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | (ThisContext readVariableNamed: #val) msg: (ThisContext readVariableNamed: #arg)]')
]

{ #category : #tests }
BreakpointConditionTest >> testSelf_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'self')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver ]')
]

{ #category : #tests }
BreakpointConditionTest >> testSimpleCondition_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'true')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | true ]')
]

{ #category : #tests }
BreakpointConditionTest >> testSuperSendNoArg_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'super msg')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver perform: #msg withArguments: {} inSuperclass: ThisContext receiver class superclass ]')
]

{ #category : #tests }
BreakpointConditionTest >> testSuperSendWithArgs_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode:
				 'super foo: arg1 bar: arg2')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver perform: #foo:bar: withArguments: {ThisContext readVariableNamed: #arg1. ThisContext readVariableNamed: #arg2.} inSuperclass: ThisContext receiver class superclass ]')
]

{ #category : #tests }
BreakpointConditionTest >> testVariableLookup_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'var')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext readVariableNamed: #var ]')
]

{ #category : #tests }
BreakpointConditionTest >> testVariableNamedThisContext_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'ThisContext')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext readVariableNamed: #ThisContext ]')
]

{ #category : #tests }
BreakpointConditionTest >> testthisContext_conditionBlockProducerMethodAST [

	self
		assert: (BreakpointCondition blockASTFromScriptCode: 'thisContext')
		equals: (self parserClass parseMethod:
				 'conditionBlockGenerator ^[ :ThisContext | ThisContext ]')
]

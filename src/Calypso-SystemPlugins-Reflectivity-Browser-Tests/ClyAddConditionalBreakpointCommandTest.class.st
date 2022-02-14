Class {
	#name : #ClyAddConditionalBreakpointCommandTest,
	#superclass : #TestCase,
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Tests-Breakpoints'
}

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> parserClass [
	^ RBParser
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testMessageSend_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'val msg: arg')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | (ThisContext readVariableNamed: #val) msg: (ThisContext readVariableNamed: #arg)]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testSelf_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'self')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testSimpleCondition_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'true')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | true ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testSuperSendNoArg_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'super msg')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver perform: #msg withArguments: {} inSuperclass: ThisContext receiver class superclass ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testSuperSendWithArgs_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'super foo: arg1 bar: arg2')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext receiver perform: #foo:bar: withArguments: {ThisContext readVariableNamed: #arg1. ThisContext readVariableNamed: #arg2.} inSuperclass: ThisContext receiver class superclass ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testVariableLookup_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'var')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext readVariableNamed: #var ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testVariableNamedThisContext_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'ThisContext')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext readVariableNamed: #ThisContext ]')
]

{ #category : #tests }
ClyAddConditionalBreakpointCommandTest >> testthisContext_conditionBlockProducerMethodAST [
	self
		assert:
			(ClyAddConditionalBreakpointCommand 
				conditionBlockProducerMethodAST: 'thisContext')
		equals:
			(self parserClass
				parseMethod:
					'conditionBlockGenerator ^[ :ThisContext | ThisContext ]')
]

"
Conditional breakpoints use condition blocks to decide when they should break execution.

I define the logic to create condition blocks from user defined scripts and vice versa.

This is necessary because condition blocks access variables through a special variable named 'ThisContext'


## Public API:
 
### Class side (instance creation)
- `fromScriptCode: aString` Creates an instance from some code given as a string.
- `fromBlock: aBlock` Creates an instance from a condition blocks that reads variables using the special variable ThisContext
		
### Instance side
- `block` Returns a block that uses the special variable ThisContext to read variables
- `scriptCode` Returns a string containing the script 

## Examples: 
`(BreakpointCondition fromScript: 'x = 1') block` 
Returns `[:ThisContext | (ThisContext readVariableNamed: #x) = 1 ]`

`(BreakpointCondition fromBlock: [:ThisContext | (ThisContext readVariableNamed: #x) = 1 ]) scriptCode`
Returns `'x = 1'`
"
Class {
	#name : #BreakpointCondition,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Calypso-SystemPlugins-Reflectivity-Browser-Breakpoints'
}

{ #category : #'ast manipulation' }
BreakpointCondition class >> blockASTFromScriptCode: aString [
	| conditionBlockProducerMethodAST ast |
	
	ast := self parserClass parseExpression: aString.
	conditionBlockProducerMethodAST := RBMethodNode
		selector: #conditionBlockGenerator
		body:
			(RBReturnNode
				value:
					(RBBlockNode
						arguments: {(RBVariableNode named: 'ThisContext')}
						body:
							ast asSequenceNode)) asSequenceNode.
	conditionBlockProducerMethodAST := self
		rewriteASTToSimulateExecutionInADifferentContext: conditionBlockProducerMethodAST.
	conditionBlockProducerMethodAST
		source: conditionBlockProducerMethodAST formattedCode.
	^ conditionBlockProducerMethodAST
]

{ #category : #'instance creation' }
BreakpointCondition class >> fromBlock: aBlock [

	^ self new 
		block: aBlock;
		yourself
]

{ #category : #'instance creation' }
BreakpointCondition class >> fromScriptCode: aString [

	| conditionBlockProducerMethodAST |
	conditionBlockProducerMethodAST := self 
		                                   blockASTFromScriptCode:
		                                   aString.
	^ self new 
		block: (conditionBlockProducerMethodAST generateWithSource
		  valueWithReceiver: nil
		  arguments: {  });
		yourself
]

{ #category : #'default values' }
BreakpointCondition class >> parserClass [
	^ RBParser
]

{ #category : #'ast manipulation' }
BreakpointCondition class >> rewriteASTFirstStep: semanticallyAnalysedMethodAST [
	| rewriter allMessageNodes receiverSuperclassValueNode |
	rewriter := self rewriterClass new.
	rewriter
		replace: (RBVariableNode named: #ThisContext) name
		with:
			'(ThisContext readVariableNamed: #'
				, (RBVariableNode named: #ThisContext) name , ')'.
	allMessageNodes := semanticallyAnalysedMethodAST allChildren
		select: [ :astElem | astElem isMessage ].
	receiverSuperclassValueNode := self parserClass
		parseExpression: 'ThisContext receiver class superclass'.
	allMessageNodes
		do: [ :msgNode | 
			msgNode receiver isSuperVariable
				ifTrue: [ rewriter
						replaceTree: msgNode
						withTree:
							(RBMessageNode
								receiver: (self parserClass parseExpression: 'ThisContext receiver')
								selector: #perform:withArguments:inSuperclass:
								arguments:
									{(RBLiteralValueNode value: msgNode selector).
									(RBArrayNode statements: msgNode arguments).
									receiverSuperclassValueNode}) ] ].
	^ rewriter
		executeTree: semanticallyAnalysedMethodAST;
		tree
]

{ #category : #'ast manipulation' }
BreakpointCondition class >> rewriteASTSecondStep: analysedIntermediateAST [
	| rewriter2 allUndeclaredVariableNodes allUndeclaredVariableSymbols |
	rewriter2 := self rewriterClass new.
	allUndeclaredVariableNodes := analysedIntermediateAST allChildren
		select: [ :astElem | astElem isVariable and: [ astElem isUndeclaredVariable ] ].
	allUndeclaredVariableSymbols := (allUndeclaredVariableNodes
		collect: [ :varNode | varNode name ]) asSet asArray.
	allUndeclaredVariableSymbols
		withIndexDo: [ :tempName :index | 
			rewriter2
				replace: tempName
				with: '(ThisContext readVariableNamed: #' , tempName , ')' ].
	rewriter2 replace: 'thisContext' with: 'ThisContext'.
	rewriter2 replace: 'self' with: 'ThisContext receiver'.
	^ rewriter2
		executeTree: analysedIntermediateAST;
		tree
]

{ #category : #'ast manipulation' }
BreakpointCondition class >> rewriteASTToSimulateExecutionInADifferentContext: anAST [
	| semanticallyAnalysedMethodAST rewrittenConditionBlockProducerAST intermediateAST analysedIntermediateAST |
	"AnAST is the AST of a method returning a block taking a context as its argument named `ThisContext` and whose body is the condition of this conditional breakpoint.
	The goal is to rewrite this AST so that evaluating the block by passing it a context as argument will evaluate its body as it would have been evaluated in the passed context.
	To do this, we rewrite anAST following these three rules:
	1) Rewriting references to variables named 'ThisContext' into context lookups to avoid conflicts with the 'ThisContext' argument of the block.
	For example, a reference to a variable named ThisContext is rewritten into `ThisContext readVariableNamed: #ThisContext`
	2) Replacing all message nodes whose receiver is super with alternative ast replicating the method lookup a message send to super has.
		For example, 'super foo: 1' is rewritten into 'ThisContext receiver perform: #foo withArguments: 1 inSuperclass: ThisContext receiver class superclass'
	3) Rewriting references to undeclared variables into context lookup
		For example, a reference to a variable named flower is rewritten into `ThisContext readVariableNamed: #flower`
	4) Rewriting references to `thisContext` into references to `ThisContext`
	5) Rewriting references to `self` into references to `ThisContext receiver`"
	
	semanticallyAnalysedMethodAST := anAST doSemanticAnalysis.	"To find which variables are undefined"
	intermediateAST := self rewriteASTFirstStep: semanticallyAnalysedMethodAST.
	
	analysedIntermediateAST := intermediateAST doSemanticAnalysis.
	rewrittenConditionBlockProducerAST := self rewriteASTSecondStep: analysedIntermediateAST.
	
	^ rewrittenConditionBlockProducerAST doSemanticAnalysis
]

{ #category : #'default values' }
BreakpointCondition class >> rewriterClass [
	^ RBParseTreeRewriter
]

{ #category : #accessing }
BreakpointCondition >> block [
	^ block
]

{ #category : #accessing }
BreakpointCondition >> block: aBlock [
	block := aBlock
]

{ #category : #accessing }
BreakpointCondition >> scriptCode [
	| ast rewriter matchVarRead matchBlockWrap matchSelf |
	
	ast := self class parserClass parseExpression: block asString.
	rewriter := self class rewriterClass new.
	
	matchVarRead := '(ThisContext readVariableNamed: `#varName)'.
	rewriter replace: matchVarRead withValueFrom: [ :aNode | 
		RBVariableNode named:
			(aNode arguments anyOne sourceText copyReplaceAll: '#' with: '') ].
	rewriter executeTree: ast.
	
	matchSelf := 'ThisContext receiver'.
	rewriter replace: matchSelf with: 'self'.
	rewriter executeTree: ast.
	
	matchBlockWrap := '[ :ThisContext | `@expression ]'.	
	rewriter replace: matchBlockWrap with: '`@expression'.
	rewriter executeTree: ast.

	^ rewriter tree formattedCode
]

Extension { #name : #Breakpoint }

{ #category : #'*BreakpointNavigator' }
Breakpoint >> targetMethodsToNodesMap [

	| methodsToNodes |
	methodsToNodes := Dictionary new.
	methodsToNodes
		at: node methodNode method
		put: (OrderedCollection with: node).
	^ methodsToNodes
]

Extension { #name : #VariableBreakpoint }

{ #category : #'*BreakpointNavigator' }
VariableBreakpoint >> targetMethodsToNodesMap [

	| methodsToNodes |
	methodsToNodes := Dictionary new.
	self link nodes do: [ :n | 
		(methodsToNodes
			 at: n methodNode method
			 ifAbsentPut: [ OrderedCollection new ]) add: n ].

	^ methodsToNodes
]

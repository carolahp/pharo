"
I extend the `StRemoveBreakpointCommand` by just adding a refresh of the breakpoint browser.
Should I be merged later into `StRemoveBreakpointCommand`?
"
Class {
	#name : #BreakpointNavigatorRemoveBreakpointCommand,
	#superclass : #StRemoveBreakpointCommand,
	#category : #'BreakpointNavigator-Commands'
}

{ #category : #executing }
BreakpointNavigatorRemoveBreakpointCommand >> execute [

	super execute.
	self context resetAll
"	self context methodsWithBreakpoints items remove:
		(self transform value: self context)"
]

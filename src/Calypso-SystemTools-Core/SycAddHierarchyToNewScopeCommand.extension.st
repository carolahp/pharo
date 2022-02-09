Extension { #name : #SycAddHierarchyToNewScopeCommand }

{ #category : #'*Calypso-SystemTools-Core' }
SycAddHierarchyToNewScopeCommand class >> browserContextMenuActivation [
	<classAnnotation>

	^ CmdContextMenuActivation byItemOf: ClyScopesMenuGroup order: 2 for: ClyClass asCalypsoItemContext
]

{ #category : #'*Calypso-SystemTools-Core' }
SycAddHierarchyToNewScopeCommand class >> sourceCodeMenuActivation [
	<classAnnotation>

	^ SycSourceCodeMenuActivation byRootGroupItemOrder: 1.2 for: ClySourceCodeContext
]

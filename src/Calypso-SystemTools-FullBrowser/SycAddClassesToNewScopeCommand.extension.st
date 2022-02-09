Extension { #name : #SycAddClassesToNewScopeCommand }

{ #category : #'*Calypso-SystemTools-FullBrowser' }
SycAddClassesToNewScopeCommand class >> browserContextMenuActivation [
	<classAnnotation>

	^ CmdContextMenuActivation byItemOf: ClyScopesMenuGroup order: 1 for: ClyClass asCalypsoItemContext
]

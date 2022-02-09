Extension { #name : #SycAddPackagesToNewScopeCommand }

{ #category : #'*Calypso-SystemTools-FullBrowser' }
SycAddPackagesToNewScopeCommand class >> fullBrowserMenuActivation [
	<classAnnotation>

	^ CmdContextMenuActivation byItemOf: ClyScopesMenuGroup order: 2 for: ClyFullBrowserPackageContext
]

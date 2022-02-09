"
I am a command to add packages scope to listScopes
"
Class {
	#name : #SycAddPackagesToNewScopeCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'packages'
	],
	#category : #'SystemCommands-PackageCommands-Scope'
}

{ #category : #accessing }
SycAddPackagesToNewScopeCommand >> defaultMenuIconName [
	^ #add
]

{ #category : #accessing }
SycAddPackagesToNewScopeCommand >> defaultMenuItemName [
	^ 'Add to new scope'
]

{ #category : #execution }
SycAddPackagesToNewScopeCommand >> execute [
	| scope |
	scope := RBBrowserEnvironment new forPackages: packages.
	RefactoringSettings addScope: scope.
	RBEnvironmentsPresenter openSelecting: scope
]

{ #category : #accessing }
SycAddPackagesToNewScopeCommand >> packages [

	^ packages
]

{ #category : #accessing }
SycAddPackagesToNewScopeCommand >> packages: anObject [

	packages := anObject
]

{ #category : #execution }
SycAddPackagesToNewScopeCommand >> prepareFullExecutionInContext: aBrowserContext [

	super prepareFullExecutionInContext: aBrowserContext.
	packages := aBrowserContext selectedPackageItems collect: [:e | e actualObject ].
]

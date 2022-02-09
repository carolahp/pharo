"
I am a command to add classes scope to listScopes
"
Class {
	#name : #SycAddClassesToNewScopeCommand,
	#superclass : #SycClassCommand,
	#category : #'SystemCommands-ClassCommands-Scope'
}

{ #category : #accessing }
SycAddClassesToNewScopeCommand >> defaultMenuIconName [
	^ #add
]

{ #category : #accessing }
SycAddClassesToNewScopeCommand >> defaultMenuItemName [
	^ 'Add class(es) to new scope'
]

{ #category : #execution }
SycAddClassesToNewScopeCommand >> execute [
	| scope |
	scope := RBBrowserEnvironment new forClasses: classes.
	RefactoringSettings addScope: scope.
	RBEnvironmentsPresenter openSelecting: scope
]

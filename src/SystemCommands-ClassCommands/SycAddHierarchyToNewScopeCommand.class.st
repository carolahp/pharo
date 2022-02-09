"
I am a command to add class hierarchy scope to listScopes
"
Class {
	#name : #SycAddHierarchyToNewScopeCommand,
	#superclass : #SycSingleClassCommand,
	#category : #'SystemCommands-ClassCommands-Scope'
}

{ #category : #accessing }
SycAddHierarchyToNewScopeCommand >> defaultMenuIconName [
	^ #add
]

{ #category : #accessing }
SycAddHierarchyToNewScopeCommand >> defaultMenuItemName [
	^ 'Add hierarchy to new scope'
]

{ #category : #execution }
SycAddHierarchyToNewScopeCommand >> execute [
	| scope |
	scope :=  RBBrowserEnvironment new forClassHierarchy: targetClass.
	RefactoringSettings addScope: scope.
	RBEnvironmentsPresenter openSelecting: scope
]

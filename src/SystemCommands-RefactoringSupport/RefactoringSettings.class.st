"
I define the scope and the way refactorings are applied
"
Class {
	#name : #RefactoringSettings,
	#superclass : #Object,
	#classVars : [
		'CurrentScope',
		'ScopeList'
	],
	#category : #'SystemCommands-RefactoringSupport-Scope'
}

{ #category : #adding }
RefactoringSettings class >> addScope: aScope [
	self scopeList add: aScope
]

{ #category : #adding }
RefactoringSettings class >> addScope: aScope withKey: key [
	aScope label: key.
	self scopeList add: aScope
]

{ #category : #accessing }
RefactoringSettings class >> availableScopes [
	"We don't return the Current image scope"
	^ self scopeList allButFirst
]

{ #category : #accessing }
RefactoringSettings class >> currentScope [

	^ CurrentScope ifNil: [ CurrentScope := self defaultScope ]
]

{ #category : #accessing }
RefactoringSettings class >> currentScope: aRBBrowserEnvironment [

	CurrentScope := aRBBrowserEnvironment
]

{ #category : #default }
RefactoringSettings class >> defaultScope [

	^ (self scopeList select: [ :scope | scope isSystem ])
		  at: 1
		  ifAbsent: [ self error: 'Root Scope (containing full image contents) is not defined' ]
]

{ #category : #accessing }
RefactoringSettings class >> domainValues [

	^ self scopeList collect: [ :each |
		each description asSymbol -> each
	]
]

{ #category : #accessing }
RefactoringSettings class >> invalidNames [
	^ self scopeList collect: [ :e | e label ]
]

{ #category : #accessing }
RefactoringSettings class >> refactoringSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #refactoring)
		label: 'Refactoring Engine';
		description:
			'All refactoring related settings';
		noOrdering;
		with: [
			(aBuilder pickOne: #currentScope)
				order: 0;
				target: self;
				description: 'The default scope on which refactorings are applied';
				label: 'Default scope';
				default: self defaultScope;
				domainValues: self domainValues.
			(aBuilder setting: #undoSize)
				target: RBRefactoryChangeManager;
				default: 20;
				label: 'Undo size';
				parentName: #refactoring ]
]

{ #category : #removing }
RefactoringSettings class >> removeScopeNamed: key [

	self scopeList removeAllSuchThat:
		[ :e | e description = key and:
			[ e description ~= 'Current image'] ]
]

{ #category : #accessing }
RefactoringSettings class >> scopeList [

	^ ScopeList ifNil:
		[ ScopeList := OrderedCollection with:
			(ClyNavigationEnvironment currentImageScope asRBEnvironment label: 'Image') ]
]

{ #category : #accessing }
RefactoringSettings class >> scopeList: anObject [

	ScopeList := anObject
]

{ #category : #setting }
RefactoringSettings class >> setDescriptionOf: anItem with: aString [
	anItem label: aString
]

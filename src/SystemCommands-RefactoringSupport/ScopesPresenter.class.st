"
A Presenter to manipulate Scopes
"
Class {
	#name : #ScopesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'scopeList'
	],
	#classVars : [
		'SingleInstance'
	],
	#category : #'SystemCommands-RefactoringSupport-Scope'
}

{ #category : #layout }
ScopesPresenter class >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		add:
			(SpBoxLayout newLeftToRight
				add: #scopeList;
				yourself);
		yourself
]

{ #category : #specs }
ScopesPresenter class >> menuCommandOn: aBuilder [
    <worldMenu>
    (aBuilder item: #'Scopes Editor')
                action: [self open];
                parent: #Refactoring;
                help: 'Editor for custom refactoring environments (scopes)';
                order: 10
]

{ #category : #specs }
ScopesPresenter class >> open [

	<script>
	(self singleInstance
		 updateList; 
		 yourself) isDisplayed ifFalse: [ self singleInstance open ]
]

{ #category : #specs }
ScopesPresenter class >> openSelecting: aScope [
	
	self open.
	self singleInstance selectScope: aScope
]

{ #category : #'class initialization' }
ScopesPresenter class >> reset [

	SingleInstance := nil
]

{ #category : #specs }
ScopesPresenter class >> singleInstance [

	^ SingleInstance ifNil: [ SingleInstance := self new ]
]

{ #category : #specs }
ScopesPresenter class >> title [
	^ 'Scope options'
]

{ #category : #accessing }
ScopesPresenter >> andWithScope: anItem [
	self performOperation: #& with: anItem
]

{ #category : #accessing }
ScopesPresenter >> argumentsListMenu [
	^ self newMenu
		addGroup: [ :aGroup |
			aGroup
				addItem: [ :anItem |
					anItem
						name: 'AND';
						action: [ self andWithScope: scopeList selectedItem ] ];
				addItem: [ :anItem |
					anItem
						name: 'OR';
						action: [ self orWithScope: scopeList selectedItem ] ];
				addItem: [ :anItem |
					anItem
						name: 'NOT';
						action: [ self notWithScope: scopeList selectedItem ] ];
				addItem: [ :anItem |
					anItem
						name: 'Inspect';
						visibleIf: [ (scopeList selectedItem isCompositeEnvironment not
							and: [ scopeList selectedItem label ~= 'current image' ])];
						action: [ self inspect: scopeList selectedItem ] ];
				addItem: [ :anItem |
					anItem
						name: 'Edit';
						visibleIf: [ (scopeList selectedItem isCompositeEnvironment not
							and: [ scopeList selectedItem label ~= 'current image' ])];
						action: [ self edit: scopeList selectedItem ] ];
				addItem: [ :anItem |
					anItem
						name: 'Remove';
						visibleIf: [ scopeList selectedItem label ~= 'current image' ];
						action: [ self remove: scopeList selectedItem ] ]
				 ]
]

{ #category : #actions }
ScopesPresenter >> changeCurrentScope: aRBEnvironment [ 
	RefactoringSettings currentScope: aRBEnvironment
]

{ #category : #actions }
ScopesPresenter >> edit: anItem [
	[ anItem acceptVisitor: ScopeVisitor new ]
	on: Error
	do: [ :e | self inform:  'Somethig was wrong']
]

{ #category : #'initialization - deprecated' }
ScopesPresenter >> initializePresenter [

	| currentScopeColumn |
	currentScopeColumn := SpCheckBoxTableColumn
		                      title: 'Current Scope for Refactorings'
		                      evaluated: [ :item |
		                      RefactoringSettings currentScope == item ].
	currentScopeColumn onActivation: [ :item |
		self changeCurrentScope: item.
		self updateList ].
	scopeList
		addColumn:
			(SpStringTableColumn title: 'Scope' evaluated: #shortDescription);
		addColumn: currentScopeColumn;
		roots: RefactoringSettings scopeList;
		children: [ :aClass |
			RefactoringSettings scopeList select: [ :cls |
					aClass isCompositeEnvironment
						ifTrue: [
							aClass environment == cls or: [ aClass otherEnvironment == cls ] ]
						ifFalse: [ false ] ] ];
		contextMenu: self argumentsListMenu
]

{ #category : #'initialization - deprecated' }
ScopesPresenter >> initializeWidgets [
	scopeList := self newTreeTable
]

{ #category : #actions }
ScopesPresenter >> inspect: anItem [

	(anItem inspectIn: self) open title: anItem shortDescription
]

{ #category : #actions }
ScopesPresenter >> notWithScope: anItem [

	[ | newScope |
	newScope := anItem not.
	(self confirm: 'Do you want store this result in the list?')
		ifTrue: [
			RefactoringSettings addScope: newScope.
			self updateList.
		] ifFalse: [ newScope inspect ] ]
	on: Error
	do: [ :e | self inform: 'Something was wrong']
]

{ #category : #actions }
ScopesPresenter >> orWithScope: anItem [
	self performOperation: #| with: anItem
]

{ #category : #actions }
ScopesPresenter >> performOperation: aSymbol with: anItem [
	| anEnvironment newScope |
	[ anEnvironment := self selectAnotherScopeWhitout: anItem.
	newScope := anItem perform: aSymbol with: anEnvironment.
	(self confirm: 'Do you want store this result in the list?')
		ifTrue: [
			RefactoringSettings addScope: newScope.
			self updateList.
		] ifFalse: [ newScope inspect ].
	]
	on: Error
	do: [ :e | self inform: 'Something was wrong']
]

{ #category : #actions }
ScopesPresenter >> remove: anItem [
	RefactoringSettings removeScopeNamed: anItem description.
	self updateList
]

{ #category : #actions }
ScopesPresenter >> selectAnotherScopeWhitout: anItem [
	| anotherScope list |
	list := RefactoringSettings scopeList copyWithout: anItem.
	anotherScope := UIManager default
			chooseFrom: (list collect: #shortDescription)
			values: list
			title: 'Select another scope (RBEnvironment)'.
	^ anotherScope
]

{ #category : #'api-selection' }
ScopesPresenter >> selectScope: aRBClassEnvironment [ 
	scopeList selectItem: aRBClassEnvironment
]

{ #category : #actions }
ScopesPresenter >> updateList [
	scopeList roots: RefactoringSettings scopeList
]

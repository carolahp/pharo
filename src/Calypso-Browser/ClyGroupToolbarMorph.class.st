"
I implement a toobar in the browser (middle panel) under each navigation view.
I collect commands annotated by ClyToolbarCommandActivation strategy and ask them to build toolbar items.

This logic is implemented in method #updateItems, were I ask my navigationView to update the toolbar in the browser. 
It is based on Commander menu:

	menu := CmdMenu activatedBy: ClyGroupToolbarActivation.

In my UI, I display a single toolbar group.


My instances are created on the browser: 

	ClyGroupToolbar of: aBrowser
	 
Internal Representation and Key Implementation Points.

    Instance Variables
	navigationView:		<ClyQueryViewMorph>
"
Class {
	#name : #ClyGroupToolbarMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'navigationView'
	],
	#category : #'Calypso-Browser-Toolbar'
}

{ #category : #'instance creation' }
ClyGroupToolbarMorph class >> of: aNavigationView [
	^self new 
		navigationView: aNavigationView
]

{ #category : #accessing }
ClyGroupToolbarMorph >> addNewItem: aMorph [

	self addMorphBack: aMorph
]

{ #category : #accessing }
ClyGroupToolbarMorph >> defaultHeight [
	^30
]

{ #category : #accessing }
ClyGroupToolbarMorph >> initialize [
	super initialize.
	self 
		color: self theme windowColor;
		changeTableLayout;
		height: self defaultHeight;	
		layoutInset: 2@0; 
		listDirection: #leftToRight;
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #rigid
]

{ #category : #accessing }
ClyGroupToolbarMorph >> navigationView [
	self flag: 'Caro remove me'.
	^ navigationView
]

{ #category : #accessing }
ClyGroupToolbarMorph >> navigationView: aNavigationView [
	navigationView := aNavigationView
]

{ #category : #accessing }
ClyGroupToolbarMorph >> updateItems [

	| menu |
	
	menu := CmdMenu activatedBy: ClyGroupToolbarActivation.
	menu buildInContext: navigationView createSelectionContext.
	self removeAllMorphs.
 	[menu buildBrowserToolbar: self] ensure: [self show]
]

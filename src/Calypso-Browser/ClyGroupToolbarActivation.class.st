Class {
	#name : #ClyGroupToolbarActivation,
	#superclass : #CmdMenuCommandActivationStrategy,
	#category : #'Calypso-Browser-Toolbar'
}

{ #category : #accessing }
ClyGroupToolbarActivation >> menuItemNameFor: aCommand [
	^ menuItemName ifNil: [ aCommand defaultToolbarItemName ]
]

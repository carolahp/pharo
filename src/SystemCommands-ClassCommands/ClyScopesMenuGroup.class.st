"
I am menu group to arrange together commands related to scopes creation/edition
"
Class {
	#name : #ClyScopesMenuGroup,
	#superclass : #CmdMenuGroup,
	#category : #'SystemCommands-ClassCommands-Scope'
}

{ #category : #accessing }
ClyScopesMenuGroup >> description [ 
	^ 'Custom Scopes'
]

{ #category : #accessing }
ClyScopesMenuGroup >> iconName [ 
	^ #user
]

{ #category : #accessing }
ClyScopesMenuGroup >> name [ 
	^ 'Custom Scopes'
]

{ #category : #accessing }
ClyScopesMenuGroup >> order [
	^1.5
]

Class {
	#name : #ClySwitchToVariablesCommand2,
	#superclass : #ClySwitchToVariablesCommand,
	#category : #'Calypso-SystemTools-FullBrowser-Commands-MethodGroups'
}

{ #category : #activation }
ClySwitchToVariablesCommand2 class >> canBeExecutedInContext: aToolContext [

	^aToolContext isClassSelected
]

{ #category : #activation }
ClySwitchToVariablesCommand2 class >> fullBrowserGroupToolbarActivation [
	<classAnnotation>
	
	^ClyGroupToolbarActivation byItemOf: ClyMethodViewToolbarGroup for: ClyFullBrowserMethodGroupContext
]

{ #category : #activation }
ClySwitchToVariablesCommand2 class >> fullBrowserGroupToolbarActivation2 [
	<classAnnotation>
	
	^ClyGroupToolbarActivation byItemOf: ClyMethodViewToolbarGroup for: ClyFullBrowserVariableContext
]

{ #category : #activation }
ClySwitchToVariablesCommand2 class >> fullBrowserToolbarActivation [
	^ self
]

{ #category : #accessing }
ClySwitchToVariablesCommand2 >> defaultMenuItemName [
	^'Variables'
]

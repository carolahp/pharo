Class {
	#name : #ClySwitchToMethodGroupsCommand2,
	#superclass : #ClySwitchToMethodGroupsCommand,
	#category : #'Calypso-SystemTools-FullBrowser-Commands-MethodGroups'
}

{ #category : #activation }
ClySwitchToMethodGroupsCommand2 class >> canBeExecutedInContext: aToolContext [
Transcript show: self asString, ' ', aToolContext isClassSelected asString; cr. 
	
	^aToolContext isClassSelected 
]

{ #category : #activation }
ClySwitchToMethodGroupsCommand2 class >> fullBrowserGroupToolbarActivation [
	<classAnnotation>
	
	^ClyGroupToolbarActivation byItemOf: ClyMethodViewToolbarGroup for: ClyFullBrowserMethodGroupContext
]

{ #category : #activation }
ClySwitchToMethodGroupsCommand2 class >> fullBrowserGroupToolbarActivation2 [
	<classAnnotation>
	
	^ClyGroupToolbarActivation byItemOf: ClyMethodViewToolbarGroup for: ClyFullBrowserVariableContext
]

{ #category : #activation }
ClySwitchToMethodGroupsCommand2 class >> fullBrowserToolbarActivation [
	^ self
]

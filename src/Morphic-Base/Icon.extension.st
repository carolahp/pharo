Extension { #name : #Icon }

{ #category : #'*Morphic-Base' }
Icon >> asAlphaImageMorph [

	^ AlphaImageMorph new image: self asForm
]

{ #category : #'*Morphic-Base' }
Icon >> asMorph [
	^ImageMorph new form: self asForm
]

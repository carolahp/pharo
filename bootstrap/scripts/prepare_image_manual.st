Metacello new
	  baseline: 'PBManager';
	  repository: 'github://carolahp/PBManager';
	  onConflict: [ :ex | ex useLoaded ];
	  load.

GTPlayground new openOn: (GTPlayPage new saveContent: 
	'(PBBuilderUI withRepositoriesIn: (Smalltalk os environment at: ''LANGUAGE_REPOSITORIES'' ifAbsent: [''.''])) open').
(PBBuilderUI withRepositoriesIn: (Smalltalk os environment at: 'LANGUAGE_REPOSITORIES' ifAbsent: ['.'])) open

[
  Metacello new
  baseline: 'PBManager';
  repository: 'github://carolahp/PBManager';
  load.

] on: Warning do: #resume.

(PBBuilderUI withRepositoriesIn: (Smalltalk os environment at: 'LANGUAGE_REPOSITORIES' ifAbsent: ['.'])) open.

GTPlayground new openOn: (GTPlayPage new saveContent: 
	'(PBBuilderUI withRepositoriesIn: (Smalltalk os environment at: ''LANGUAGE_REPOSITORIES'' ifAbsent: [''.''])) open')
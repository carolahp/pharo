Metacello new
	  baseline: 'PBManager';
	  onConflict: [ :ex | ex useLoaded ];
	  repository: 'github://carolahp/PBManager';
	  load.

GTPlayground new openOn: (GTPlayPage new saveContent: 'PBBuilder new open').
PBBuilder new open

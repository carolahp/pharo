Metacello new
	  baseline: 'PBManager';
	  onConflict: [ :ex | ex useLoaded ];
	  repository: 'github://carolahp/PBManager:v1.2.0';
	  load.

GTPlayground new openOn: (GTPlayPage new saveContent: 'PBBuilder new open').
PBBuilder new open

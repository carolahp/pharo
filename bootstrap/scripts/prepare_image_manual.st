[
  Metacello new
	baseline: 'PBManager';
	repository: 'github://carolahp/PBManager';
	load.

  Metacello new
	baseline: 'Ring2';
	repository: 'github://carolahp/Ring2/src';
	load: #calypso.
] on: Warning do: #resume.

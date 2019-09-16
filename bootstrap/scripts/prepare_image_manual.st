[
  Metacello new
	baseline: 'PBManager';
	repository: 'github://carolahp/PBManager:BootstrapPharoCandleWithEspell1';
	load.

  "Metacello new
  	baseline: 'Ring2';
  	repository: 'github://carolahp/Ring2/src:BootstrapPharoCandleWithEspell';
  	load: #calypso."

  Metacello new
  	baseline: 'Espell';
  	repository: 'github://carolahp/Espell:BootstrapPharoCandleWithEspell';
  	load.

] on: Warning do: #resume.

(PBBuilder newWithUICandleInDirectory: '../../../PharoCandle' asFileReference ) openUI.
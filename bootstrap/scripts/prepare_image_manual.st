[
  Metacello new
  baseline: 'PBManager';
  repository: 'github://carolahp/PBManager:BootstrapPharoCandleWithEspell4';
  load.

  "Metacello new
    baseline: 'Ring2';
    repository: 'github://carolahp/Ring2/src:BootstrapPharoCandleWithEspell';
    load: #calypso."

"  Metacello new
    baseline: 'Espell';
    repository: 'github://carolahp/Espell:BootstrapPharoCandleWithEspell';
    load."

] on: Warning do: #resume.

(PBBuilder newWithUICandleInDirectory: './PharoCandleSrc-1.0' asFileReference ) openUI.
(PBBuilder newWithUIInDirectory: './../../../src' asFileReference ) openUI.
GTPlayground new openOn: (GTPlayPage new saveContent: '
(PBBuilder newWithUICandleInDirectory: ''./PharoCandleSrc-1.0'' asFileReference ) openUI.

(PBBuilder newWithUIInDirectory: ''./../../../src'' asFileReference ) openUI.')

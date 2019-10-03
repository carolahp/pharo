[
  Metacello new
  baseline: 'PBManager';
  repository: 'github://carolahp/PBManager:v1.1.0';
  load.

] on: Warning do: #resume.

(PBBuilder newWithUICandleInDirectory: './PharoCandleSrc-1.0' asFileReference ) openUI.
(PBBuilder newWithUIInDirectory: './../../../src' asFileReference ) openUI.
GTPlayground new openOn: (GTPlayPage new saveContent: '
(PBBuilder newWithUICandleInDirectory: ''./PharoCandleSrc-1.0'' asFileReference ) openUI.

(PBBuilder newWithUIInDirectory: ''./../../../src'' asFileReference ) openUI.')

#!/bin/bash

ex="2"
fzip="/home/nivkeren/Downloads/Ex${ex}.zip"
DIRECTORY=check

echo $fzip

unzip ${fzip}
if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
fi

python ex2-check.py

enscript -E --color -q -Z -p - -f Courier10 ex${ex}.py  | ps2pdf - check/ex${ex}-code.pdf
#enscript -E -q -Z -p - -f Courier10 check/ex${ex}-test.txt  | ps2pdf - check/ex${ex}-test.pdf
enscript -E -q -Z -p - -f Courier10 summary.txt  | ps2pdf - check/summary.pdf

pdfunite check/summary.pdf check/Figure_*.pdf check/ex${ex}-code.pdf check/ex${ex}-check.pdf

rm ex2.py summary.txt check/Figure_*.pdf
rm ${fzip}

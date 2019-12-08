#!/bin/bash

ex="1"
fzip="/home/nivkeren/Downloads/Ex${ex}.zip"
DIRECTORY=check

echo $fzip

unzip ${fzip}
if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
fi

python ex1-check.py > check/ex${ex}-test.txt

enscript -E --color -q -Z -p - -f Courier10 ex${ex}.py  | ps2pdf - check/ex${ex}-code.pdf
enscript -E -q -Z -p - -f Courier10 check/ex${ex}-test.txt  | ps2pdf - check/ex${ex}-test.pdf

pdfunite check/ex${ex}-test.pdf check/ex${ex}-code.pdf check/ex${ex}-check.pdf

rm ex1.py 
rm ${fzip}

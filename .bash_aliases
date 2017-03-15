alias makecsv='for f in $(ls | grep -E "(Stores|MacAddresses).*\.xlsx"); do mv -v ${f%.*}.csv ${f%.*}.csv.old; ssconvert $f ${f%.*}.csv 2> /dev/null; echo; echo "Diff output:"; diff -B -y --suppress-common-lines ${f%.*}.csv ${f%.*}.csv.old && echo "- No diff"; echo; done'


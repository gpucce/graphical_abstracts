for i in $(ls)
do
    if [ -d $i ]
    then
        inkscape --export-dpi=600 --export-type=png --export-filename $i/$i.png $i/$i.svg
    fi
done
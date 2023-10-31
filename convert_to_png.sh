for i in $(ls)
do
    if [ -d $i ]
    then
        inkscape --export-width=1000 --export-type=png --export-filename $i/$i.png $i/$i.svg
    fi
done
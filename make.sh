curl -LO https://dumps.wikimedia.org/enwiktionary/latest/enwiktionary-latest-categorylinks.sql.gz

zcat enwiktionary-latest-categorylinks.sql.gz | grep -Po '\(\d+,'\''[^'\'']*English[^'\'']*'\'','\''[A-Z]+(?=\\n|'\'')' | cut -d\' -f4 >words.txt

sort -uo words.txt words.txt

sed -i 's/^.*/\L&/g' words.txt

sed 's/^./\U&/g' words.txt >Words.txt

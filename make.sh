if [ ! -f enwiktionary-latest-categorylinks.sql ]; then
	curl -C- -LO https://dumps.wikimedia.org/enwiktionary/latest/enwiktionary-latest-categorylinks.sql.gz
	gzip -d enwiktionary-latest-categorylinks.sql.gz
fi

RE='(?<="English_)[^"]+","([A-Z]{2,})\\n\1"'
RE=${RE//\"/\'}
sed 's/),(/\n/g' enwiktionary-latest-categorylinks.sql | grep -F English_ | grep -Po "${RE}" | sed -E 's/\\n.+$//' >english.txt

cut -d\' -f3 english.txt >words.txt
sort -uo words.txt words.txt
sed -i 's/^.*/\L&/g' words.txt
sed 's/^./\U&/g' words.txt >Words.txt

grep -F initialisms english.txt | cut -d\' -f3 >initialisms.txt
sort -uo initialisms.txt initialisms.txt
cat initialisms.txt >>Words.txt

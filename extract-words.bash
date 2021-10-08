set -euxo pipefail

curl -SsLf https://kaikki.org/dictionary/raw-wiktextract-data.jsonl.gz |
	gzip --decompress --stdout |
	jq --raw-output 'select(.lang == "English" and (.word | test("^[a-zA-Z]+$"))) | .word | ascii_downcase' |
	pv --line-mode --format='%b' --numeric --interval=5 --force >words.txt

sort --unique --output words.txt words.txt

gzip --best --force words.txt

set -euxo pipefail

nproc

JQ_CMD=(
	jq
	--raw-output
	'select(.lang == "English" and (.word | test("^[a-zA-Z]+$"))) | .word | ascii_downcase'
)

curl -SsLf https://kaikki.org/dictionary/raw-wiktextract-data.jsonl.gz |
	gzip --decompress |
	parallel --pipe --block=8M --round-robin --line-buffer --will-cite "${JQ_CMD[@]@Q}" |
	pv --line-mode --format='%b' --numeric --interval=5 --force >words.txt

sort --unique --output words.txt words.txt

gzip --best --force words.txt

# English Word List

This repository provides a clean, processed list of English words derived from Wiktionary data. It is designed for developers and researchers needing a standardized dictionary file without the "noise" of raw linguistic data.

## Data Specifications

The `words.txt` file is generated using the following strict filters:

* **Language**: English only.
* **Characters**: Strictly alphabetic (`a-z`).
* **Formatting**: All entries are converted to lowercase.
* **Cleaning**: No spaces, hyphens, digits, or special characters.
* **Deduplication**: The list is sorted and contains only unique entries.
* **Source**: Extracted from the [Kaikki Wiktextract JSONL dataset](https://kaikki.org/dictionary/rawdata.html).

## Download

[**Latest release**](https://github.com/roy2220/words/releases)

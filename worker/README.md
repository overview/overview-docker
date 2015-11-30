Overview Worker
===============

Does all the things that are too slow to do within the span of a single HTTP
request.

The image contains LibreOffice and Tesseract, for file conversion and OCR.

## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.
- Searchindex named `overview-searchindex` listening on port 9300.
- Blob-storage volume shared with the frontend, mounted on `/var/lib/overview/blob-storage`.
- Web server named `overview-web`.

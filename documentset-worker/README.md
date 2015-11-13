
DocumentSet Worker
=================

The DocumentSet Worker handles file uploads. The image contains LibreOffice and Tesseract in order to allow file conversion and OCR.


## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.
- Searchindex named `overview-searchindex` listening on port 9300.
- Blob-storage volume shared with the frontend, mounted on `/var/lib/overview/blob-storage`.
- Web server named `overview-web`.

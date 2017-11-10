# TODO use 8u151 or 9 when available
FROM openjdk:8u131-jre-alpine

# libreoffice+tesseract are only for worker. Since Docker will only
# keep one copy of this image, it actually _saves_ space to include
# libreoffice+tesseract in the web+db-evolution-applier images
RUN set -x \
      && apk add --update --no-cache \
        ca-certificates \
        libreoffice \
        openssl \
        tesseract-ocr \
      && wget -P /usr/share/tessdata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/osd.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.bigrams \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ara.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/cat.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/deu.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.bigrams \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.tesseract_cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.bigrams \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.tesseract_cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/fra.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.bigrams \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.tesseract_cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ita.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/nld.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/nor.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/por.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/rus.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.bigrams \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.fold \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.lm \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.nn \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.params \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.size \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.cube.word-freq \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/spa.traineddata \
        https://github.com/tesseract-ocr/tessdata/raw/3.04.00/swe.traineddata


# This is a separate command: its result changes every time we release Overview.
# We hard-link files in separate directories rather than copy them, so there's
# only one copy on disk of each file.
RUN set -x \
      && mkdir -p /opt/overview \
      && wget https://overview-builds.overviewdocs.com/7d509c50de48a2b0172d13e1a9f47008bf2eda25.zip -O /tmp/production.zip \
      && cd /tmp \
      && unzip /tmp/production.zip \
      && mkdir -p /opt/overview/worker /opt/overview/web /opt/overview/db-evolution-applier \
      && cat /tmp/archive/worker/classpath.txt | xargs -I FILE -t ln /tmp/archive/lib/FILE /opt/overview/worker/ \
      && cat /tmp/archive/web/classpath.txt | xargs -I FILE -t ln /tmp/archive/lib/FILE /opt/overview/web/ \
      && cat /tmp/archive/db-evolution-applier/classpath.txt | xargs -I FILE -t ln /tmp/archive/lib/FILE /opt/overview/db-evolution-applier/ \
      && rm -r /tmp/production.zip /tmp/archive

WORKDIR /opt/overview

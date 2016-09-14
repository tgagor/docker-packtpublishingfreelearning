FROM debian:jessie
MAINTAINER tgagor, https://github.com/tgagor

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive
ENV PPFL_EMAIL=youremail \
    PPFL_PASSWORD=yourpassword \
    PPFL_DOWNLOAD_FOLDER=/books \
    PPFL_DOWNLOAD_FORMATS="pdf, epub, mobi, code"

# run it as unprivileged user
RUN groupadd -g 1000 ppfl \
  && useradd -ms /bin/bash -u 1000 -g ppfl ppfl \
  && mkdir -p "$PPFL_DOWNLOAD_FOLDER" \
  && chown -R ppfl:ppfl "$PPFL_DOWNLOAD_FOLDER"

# install prerequisites
RUN apt-get update \
  && apt-get install -y python3 python3-pip python3-requests git \
  && pip3 install beautifulsoup4 \
  && git clone https://github.com/igbt6/Packt-Publishing-Free-Learning.git /opt/ppfl \
  && chown -R ppfl:ppfl /opt/ppfl \
  && apt-get remove -y python3-pip git \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY genconf.sh /opt/ppfl/genconf.sh
RUN chmod +x /opt/ppfl/genconf.sh

USER ppfl
WORKDIR /opt/ppfl/
ENTRYPOINT ["/opt/ppfl/genconf.sh"]
CMD ["python3", "/opt/ppfl/packtPublishingFreeEbook.py", "-gd"]

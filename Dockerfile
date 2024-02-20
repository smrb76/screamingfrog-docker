# modified ubuntu https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:master
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y \
    wget \
    xdg-utils \
    zenity \
    ttf-mscorefonts-installer \
    fonts-wqy-zenhei \
    libgconf-2-4

RUN wget --no-verbose https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_19.6_all.deb && \
    dpkg -i /screamingfrogseospider_19.6_all.deb && \
    apt-get install -f -y

COPY spider.config /root/.ScreamingFrogSEOSpider/spider.config
COPY licence.txt /root/.ScreamingFrogSEOSpider/licence.txt

RUN mkdir /home/crawls

ENTRYPOINT ["/usr/bin/screamingfrogseospider"]

CMD ["--help"]

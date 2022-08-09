FROM perl:slim
RUN apt update && apt install -y wget unzip && \
    wget https://app.uio.no/ifi/texcount/download.php?file=texcount_3_2_0_41.zip -O texcount.zip && \
    unzip texcount.zip && \
    chmod +x texcount.pl && \
    mv texcount.pl /bin/texcount && \
    rm -r texcount.zip Doc && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt -y remove wget unzip

WORKDIR /doc

RUN useradd tex
USER tex

ENTRYPOINT [ "texcount" ]
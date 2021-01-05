FROM perl:5.20

COPY ./html /usr/src/myapp

RUN cpanm MongoDB
RUN cat /usr/src/myapp/index.pl

WORKDIR /usr/src/myapp

CMD ["perl", "/usr/src/myapp/index.pl"]

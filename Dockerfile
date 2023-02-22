FROM julia:1.8.5-bullseye

ENV JULIA_PROJECT @.
WORKDIR /home

ENV VERSION 1
ADD . /home

EXPOSE 8080

ENTRYPOINT ["julia", "-e", "using Pkg; Pkg.instantiate(); using MusicAlbums; MusicAlbums.run();"]
FROM --platform=linux/amd64 julia:1.8.5

RUN apt-get update && apt-get install -y gcc

WORKDIR /home

ENV VERSION 1
ADD . /home


# set up app environment
ENV PORT "8080"
ENV WSPORT "8080"
ENV EARLYBIND "true"

# instantiate Julia packages
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile(); "

RUN julia deploy/packagecompile.jl


ENTRYPOINT ["julia", "-JMusicAlbums.so", "-t", "2", "-e", "MusicAlbums.run();"]
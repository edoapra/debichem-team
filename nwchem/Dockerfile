ARG         IMAGE
FROM        ${IMAGE} as stage1
#FROM        ubuntu:focal as stage1

#caching from host cache dir
#COPY .  /opt
#COPY req.sh  .

ARG         FC
ARG         NWCHEM_BRANCH
ARG         GITHUB_REPOSITORY_OWNER
ARG CACHE_HIT
ENV         FC=${FC}
ENV         NWCHEM_BRANCH=${NWCHEM_BRANCH}
ENV         GITHUB_REPOSITORY_OWNER=${GITHUB_REPOSITORY_OWNER}
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /opt
RUN ls -lrt \
&& apt-get  update \
&&  apt-get install -y sudo git tar wget curl  gzip patch\
&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata  \
&& wget -q https://github.com/edoapra/debichem-team/tarball/builtin -O - |  tar  -xzf -  \
&& mv edoapra-debichem-team-* debichem-team \
&& cd debichem-team/nwchem \
&& ls -lart \
&& ./req.sh \
&& ./build_pkg.sh

FROM scratch AS export-stage
COPY --from=stage1 /opt/debichem-team/nwchem/*.deb .

#WORKDIR     /data
#ENTRYPOINT  ["nwchem"]

##CMD ["/bin/bash"]


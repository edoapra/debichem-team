ARG         IMAGE
FROM        ${IMAGE} as stage1

#caching from host cache dir
#COPY .  /opt
#COPY req.sh  .
COPY Dockerfile cache* /tmp/

ARG CACHE_HIT
ARG ARMCI_NETWORK
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /opt
#RUN  --mount=type=tmpfs.target=/dev/shm,size=256m
ARG USERNAME=nwchem
ARG USER_UID=1000
ARG USER_GID=1000

RUN ls -lrt \
&& ls -lrt /tmp \
&& df -h  /dev/shm \
&& apt-get -q=2  update \
&&  apt-get -q=2 install -y sudo git tar wget curl  gzip patch \
&& DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata  \
&& env \
&& groupadd --gid $USER_GID $USERNAME \
&& useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN \
&& arch=$(uname -m) \
&& arch5=$(uname -m|cut -c 1-5) \
&& if [[ "$arch" == "aarch64" ]]; then export FORCETARGET=" TARGET=ARMV8 "; fi \
&& if [[ "$arch" == "ppc64le" ]]; then export FORCETARGET=" TARGET=POWER8 "; fi \
&& if [[ "$arch" == "riscv64" ]]; then export FORCETARGET=" TARGET=RISCV64_GENERIC ";fi\
&& if [[ "$arch5" == "armv6" ]]; then export FORCETARGET=" TARGET=ARMV6 "; fi \
&& if [[ "$arch5" == "armv7" ]]; then export FORCETARGET=" TARGET=ARMV7 "; fi \
&& wget -q https://github.com/edoapra/debichem-team/tarball/builtin -O - |  tar  -xzf -  \
&& mv edoapra-debichem-team-* debichem-team \
&& cd debichem-team/nwchem \
&& ls -lart \
&& echo ARMCI_NETWORK is "$ARMCI_NETWORK" \
&& ./req.sh \
&& ./build_pkg.sh

FROM scratch AS export-stage
COPY --from=stage1 /opt/debichem-team/nwchem/*.deb .
COPY --from=stage1 /opt/debichem-team/nwchem/nwchem-7.2.0/src/libext/libext.tar.bz2 .

#WORKDIR     /data
#ENTRYPOINT  ["nwchem"]

##CMD ["/bin/bash"]


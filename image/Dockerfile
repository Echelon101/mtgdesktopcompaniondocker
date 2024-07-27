FROM ghcr.io/linuxserver/webtop:ubuntu-xfce

LABEL maintainer="echelon101"
ENV TITLE=MTGDesktopCompanion
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libgtk-3-bin ca-certificates wget libswt-webkit-gtk-4-jni vim xdg-utils libnss3-dev 
RUN apt remove -y xfce4-panel firefox

RUN \
    echo "**** update packages ****" && \
    apt update && apt install -y --no-install-recommends \ 
        wget \
        gnome-icon-theme* \
        thunar \
        apt-transport-https \
        unzip \
        man \
        gpg && \
    mkdir -p /usr/share/man/man1 && \
    wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt update && apt install -y temurin-21-jdk && \
    echo "**** installing MTG Desktop Companion ****" && \
    wget -q $(curl -s https://api.github.com/repos/nicho92/MtgDesktopCompanion/releases/latest | jq -r '.assets[].browser_download_url') -O /mtg-desktop-companion.zip && \
    unzip mtg-desktop-companion.zip && \
    rm -f /mtg-desktop-companion.zip && \
    echo "**** cleanup ****" && \
    rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/* && \
    chmod +x /mtg-desktop-companion/bin/*.sh

# Make sure file encoding will be set to UTF-8. 
COPY --from=debian:9.11 /usr/lib/locale /usr/lib/locale
COPY startwm.sh /defaults/startwm.sh

EXPOSE 80 8080 3000 3001
VOLUME [ "/config" ]

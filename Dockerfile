FROM incubus/ycm
MAINTAINER HowShouldIKnow
COPY .xinitrc /data/
COPY vnc /
RUN \
	pacman -Syy --noconfirm &&\
	pacman -S --noconfirm sudo xorg-server xorg-xinit xorg-utils xorg-server-utils xf86-video-vesa fluxbox xterm tigervnc kdevelop&&\

# Remove man and docs
    rm -r /usr/share/man/* && \
    rm -r /usr/share/doc/* && \
    # Delete any backup files like /etc/pacman.d/gnupg/pubring.gpg~
    find /. -name "*~" -type f -delete && \
    bash -c "echo 'y' | pacman -Scc >/dev/null 2>&1" && \
    paccache -rk0 >/dev/null 2>&1 &&  \
    pacman-optimize && \
    rm -r /var/lib/pacman/sync/*


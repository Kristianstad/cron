# Secure and Minimal image of Cron
# https://hub.docker.com/repository/docker/huggla/sam-cron

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.1"
ARG IMAGETYPE="base"
ARG COREUTILS_VERSION="8.32"
ARG MAKEDIRS="/var/spool/cron/crontabs"
ARG EXPOSEFUNCTIONS="readEnvironmentVars runBinCmdAsLinuxUser execCmdAsLinuxUser trim"
ARG DOWNLOADS="https://github.com/coreutils/coreutils/archive/v$COREUTILS_VERSION.tar.gz"
ARG BUILDDEPS="coreutils"
ARG BUILDCMDS=\
"   cd coreutils-$COREUTILS_VERSION "\
'&& eval "$COMMON_CONFIGURECMD --enable-install-program=date --sysconfdir=/etc --mandir=/usr/share/man --infodir=/usr/share/info --disable-nls --without-gmp" '\
'&& eval "$COMMON_MAKECMDS" '\
'&& cp -a /us

ARG EXECUTABLES="/usr/local/bin/date"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base}} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_LINUX_USER="cron" \
    VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8" \
    VAR_KEEP_CAPS="cap_setuid,cap_setgid"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>

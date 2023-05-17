# Secure and Minimal image of Cron for backing up Postgresql databases

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_REPO=${SaM_REPO:-ghcr.io/kristianstad/secure_and_minimal}
# NOTE! ALPINE_VERSION is set in .github/workflows/docker-image-backup-postgres.yml
ARG ALPINE_VERSION=${ALPINE_VERSION:-3.18}
ARG POSTGRES_MAINVERSION="15"
ARG IMAGETYPE="application"
ARG BASEIMAGE="ghcr.io/kristianstad/cron:backup-$ALPINE_VERSION"
ARG RUNDEPS="libpq libldap"
ARG BUILDDEPS="postgresql$POSTGRES_MAINVERSION-client"
ARG MAKEDIRS="/usr/bin"
ARG BUILDCMDS=\
"   cp -a /usr/libexec/postgresql$POSTGRES_MAINVERSION/pg_dump* /finalfs/usr/bin/ "\
"&& cp -a /usr/lib/libsasl2* /finalfs/usr/lib/"
ARG EXECUTABLES="/usr/bin/pg_dumpall /usr/bin/pg_dump"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${BASEIMAGE:-$SaM_REPO:base-$ALPINE_VERSION} as base
FROM ${INITIMAGE:-scratch} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-$SaM_REPO:build-$ALPINE_VERSION} as build
FROM ${BASEIMAGE:-$SaM_REPO:base-$ALPINE_VERSION} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_LINUX_USER="postgres" \
    VAR_PORT="5432" \
    VAR_FORMAT="custom" \
    VAR_JOBS="1" \
    VAR_COMPRESS="9" \
    VAR_DUMP_GLOBALS="yes"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>

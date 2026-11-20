FROM evilbeaver/onescript:2.2.1

EXPOSE 4444

WORKDIR /Santa
RUN adduser service-user
RUN opm install autumn winow crypto
USER service-user

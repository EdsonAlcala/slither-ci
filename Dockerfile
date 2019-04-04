FROM python:3.7.3-alpine3.9

RUN apk add --update --no-cache g++

# TODO: Make solidity version a parameter
# RUN apk add --update --no-cache ca-certificates wget && \
#     wget https://github.com/ethereum/solidity/releases/download/v0.5.4/solc-static-linux && \
#     chmod +x solc-static-linux && \
#     mv ./solc-static-linux /usr/local/bin/solc
RUN apk add --update --no-cache ca-certificates wget bash && \
    wget https://github.com/ethereum/solidity/releases/download/v0.4.24/solc-static-linux && \
    chmod +x solc-static-linux && \
    mv ./solc-static-linux /usr/local/bin/solc

RUN pip install slither-analyzer

WORKDIR /opt

COPY ./scripts/scanner .

RUN mv scanner /usr/bin/scanner && \
    chmod +x /usr/bin/scanner

CMD ["slither"]


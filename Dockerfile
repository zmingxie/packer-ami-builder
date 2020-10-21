FROM alpine:latest

LABEL "com.github.actions.name" = "Packer AMI Builder"
LABEL "com.github.actions.description" = "Use GitHub Action to execute Packer AMI build"
LABEL "com.github.actions.color"="blue"
LABEL "com.github.actions.icon"="anchor"

COPY docker-action /docker-action
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN apk add --update --no-cache docker

ENTRYPOINT ["/entrypoint.sh"]

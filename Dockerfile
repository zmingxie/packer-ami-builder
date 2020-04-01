FROM hashicorp/packer:1.5.5

LABEL "com.github.actions.name" = "Packer AMI Builder"
LABEL "com.github.actions.description" = "Use GitHub Action to execute Packer AMI build"
LABEL "com.github.actions.color"="blue"
LABEL "com.github.actions.icon"="anchor"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

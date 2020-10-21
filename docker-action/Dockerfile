ARG packer_version
FROM hashicorp/packer:${packer_version}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

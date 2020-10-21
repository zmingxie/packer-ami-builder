# Packer AMI Builder

Use GitHub Action to execute Packer build commands. This supports both HCL and
JSON packer template files.

For HCL Mode, set `packerArgs` to `build .` to load all `.pkr.hcl` files within
the dir. To use the override variable file, set `packerArgs` to
`build -var-file=overrides.pkrvars.hcl`

You can also use `packerVersion` to specify the Packer release you would like
to use.

## Input Parameters
| Name            | Description                                              | Mandatory | Default  |
| --------------- | -------------------------------------------------------- | --------- | -------- |
| `packerVersion` | Version of Packer will be used                           | No        | `latest` |
| `packerArgs`    | Arguments that will be passed down to the packer command | Yes       |          |
| `workDir`       | Working directory inside the container                   | No        | `.`      |

## Example
Create a workflow file (e.g `.github/workflows/ami-build.yaml`) like below:

```yaml
name: Build an AMI using Packer

on:
  push:
    branches:
      - 'master'
jobs:
  packer-ami-build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Packer AMI Build
        uses: zmingxie/packer-ami-builder@master
        with:
          packerVersion: '1.6.4'
          packerArgs: 'build template.json'
          workDir: '.'
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: us-east-1
```

# Packer AMI Builder
Use GitHub Action to execute Packer AMI build. This supports both HCL and JSON packer template files.

For HCL Mode, set `templateFile` to `.` to read all `pkr.hcl` files within your working directory.

## Input Parameters
| Name           | Description                            | Mandatory | Default |
| -------------- | -------------------------------------- | --------- | ------- |
| `templateFile` | Packer template file name              | Yes       |         |
| `varFile`      | Optional user variables file           | No        | `NULL`  |
| `workDir`      | Working directory inside the container | No        | `.`     |

## Example
Create a workflow file (`.github/workflows/ami-build.yaml`)like below:

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
          templateFile: 'packer-template.json'
          varFile: 'packer-vars.json'
          workDir: '.'
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: us-east-1
```

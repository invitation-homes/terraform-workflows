# Terraform Module Workflows

Shared GitHub workflows for Terraform. There are currently three workflows in this repository:

* [Module Auto Publish](#Module-Auto-Publish-Workflow)
* [Module Lint](#Module-Lint-Workflow)
* [Module Test](#Module-Test-Workflow)

## Module Auto Publish Workflow

This workflow creates a release that will be auto published by Terraform Cloud if the module is registered. This workflow is intended to be used on push to main:

1. **Get version** - The module's sematic version that is extracted from the `version` file in the module's root directory.
1. **Publish release** - Publish the release using the version as the tag name. This will trigger Terraform Cloud to publish the updated version to the registry.

> **Note**
> This workflow assumes that the `version` file is at the root of the repository and uses a semver syntax like `1.0.0` or `v1.0.0`

To use this workflow, add the following to your workflow file:

```yaml
on:
  push:
    branches:
      - main

jobs:
  terraform-module-auto-publish:
    name: Publish module
    uses: invitation-homes/terraform-workflows/.github/workflows/module-auto-publish.yml@v1
    secrets: inherit
```

## Module Lint Workflow

This workflow runs standard linting for Terraform Modules:

1. **Terraform fmt** - Verify that the Terraform code is formatted correctly
1. **tflint** - Run [tflint](https://github.com/terraform-linters/tflint) with custom rules defined in `.tflint.hcl`.
1. **kics** - Run [KICS](https://kics.io/) to scan for medium or high security concerns in IaC.
1. **golangci** - Run [golangci](https://golangci.com/) for Terratest Go code.


To use this workflow, add the following to your workflow file:

```yaml
jobs:
  terraform-module-lint:
    name: Lint module
    uses: invitation-homes/terraform-workflows/.github/workflows/module-lint.yml@v1
    secrets: inherit
```

## Module Test Workflow

This workflow runs terratest for Terraform Modules:

1. **AWS Sandbox Authentication** - Using OIDC, access the Sandbox account with read-only credentials. This is necessary for terratest to run Terraform plan. Full integration tests are not available at this time.
1. **terratest** - Run [terratest](https://terratest.gruntwork.io/) on the `./test` directory.

> **Note**
> This workflow assumes that a `test` directory is at the root of the repository

To use this workflow, add the following to your workflow file:

```yaml
jobs:
  terraform-module-lint:
    name: Lint module
    uses: invitation-homes/terraform-workflows/.github/workflows/module-lint.yml@v1
    secrets: inherit
```
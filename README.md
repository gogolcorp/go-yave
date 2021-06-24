# repo-template

|                                                                                                                                                      RELEASE                                                                                                                                                      |                                                                                                                                            ISSUES & PR                                                                                                                                             |                                                                 LICENSE                                                                 |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------: |
| [![RELEASE](https://img.shields.io/github/v/release/blyndusk/repo-template?style=flat-square)](https://github.com/blyndusk/repo-template/releases) [![RELEASE DATE](https://img.shields.io/github/release-date/blyndusk/repo-template?style=flat-square)](https://github.com/blyndusk/repo-template/commits/main) | [![ISSUES](https://img.shields.io/github/issues/blyndusk/repo-template?style=flat-square)](https://github.com/blyndusk/repo-template/issues) [![PULL REQUESTS](https://img.shields.io/github/issues-pr/blyndusk/repo-template?style=flat-square)](https://github.com/blyndusk/repo-template/pulls) | [![LICENSE](https://img.shields.io/github/license/blyndusk/repo-template)](https://github.com/blyndusk/repo-template/blob/main/LICENSE) |

|                                                                            CI                                                                             |                                                                                  CD                                                                                   |                                                                                  MANUAL                                                                                  |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [![GO](https://github.com/blyndusk/repo-template/actions/workflows/go.yml/badge.svg)](https://github.com/blyndusk/repo-template/actions/workflows/go.yml) | [![DOCKER](https://github.com/blyndusk/repo-template/actions/workflows/docker.yml/badge.svg)](https://github.com/blyndusk/repo-template/actions/workflows/docker.yml) | [![RELEASE](https://github.com/blyndusk/repo-template/actions/workflows/release.yml/badge.svg)](https://github.com/blyndusk/repo-template/actions/workflows/release.yml) |

## I - Introduction

The purpose of this repository is to provide a solid, complete and adaptable base of a Golang project oriented repository, in order to start a new project with a maximum time saving.

This repository provides commit writting and branmch naming conventions, issues and pull request templates, a custom issues labels set.

But also CI/CD and release, using GitHub Actions, Docker and GitHub Container Registry

And finally a simple RESTful API, using Golang, Postgres and Adminer, build with Docker and Docker Compose, using a Makefile.
## II - Table of content

- [repo-template](#repo-template)
  - [I - Introduction](#i---introduction)
  - [II - Table of content](#ii---table-of-content)
  - [II - Conventions, templates and guidelines](#ii---conventions-templates-and-guidelines)
    - [A - Commit conventions](#a---commit-conventions)
    - [B - Branch naming convention](#b---branch-naming-convention)
    - [C - Issue template](#c---issue-template)
    - [D - Pull request template](#d---pull-request-template)
  - [III - Use](#iii---use)
  - [IV - Project use](#iv---project-use)
    - [Help](#help)
    - [Start](#start)
    - [Stop](#stop)
    - [Restart](#restart)
    - [Display logs](#display-logs)
  - [V - License](#v---license)


## II - Conventions, templates and guidelines

### A - Commit conventions

```
tag(scope): #issue_id - message
```

See [commit_conventions.md](.github/commit_conventions.md) for more informations.

### B - Branch naming convention

```
type_scope-of-the-work
```

See [branch_naming_convention.md](.github/branch_naming_convention.md) for more informations.

### C - Issue template

See [user-story.md](.github/ISSUE_TEMPLATE/user-story.md) for more informations.


### D - Pull request template

See [pull_request_template.md](.github/pull_request_template.md) for more informations.

## III - Use

Go to `New Repository`, then choose this template

![create-as-tpl](./docs/create-as-tpl.jpg)

## IV - Project use

### Help

```bash
$ make help
```

### Start

```bash
$ make start
```

### Stop

```bash
$ make start
```

### Restart

```bash
$ make restart
```

### Display logs

```bash
$ make logs
```

## V - License

Under [MIT](./LICENSE) license.

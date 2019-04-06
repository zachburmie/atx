# atx - quick AWS role Switcher
**atx** is a very small shellscript that utilizes [fzf](https://git.io/C4FBDw)
to switch between aws roles, using aws-okta. It was inspired by [ktx](https://github.com/blendle/kns), the Kubernetes context switcher. It relies on aws-okta and the configurations in the `~/.aws/config` file.

## Installation
```bash
$ brew tap zachburmie/zachburmie
$ brew install atx
```

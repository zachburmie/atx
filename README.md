# atx - quick AWS role Switcher
**atx** is a very small shellscript that utilizes [fzf](https://git.io/C4FBDw)
to switch between aws roles, using aws-okta. It was inspired by [ktx](https://github.com/blendle/kns), the Kubernetes context switcher. It relies on aws-okta and the configurations in the `~/.aws/config` file.

## Installation
To install **atx** you can just run this command:
```bash
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
```

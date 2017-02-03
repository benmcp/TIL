Surge – Single-command web publishing. (v0.12.0)

Usage:
  surge [options]

Options:
  -p, --project       path to projects asset directory (./)
  -d, --domain        domain of your project (<random>.surge.sh)
  -e, --endpoint      domain of API server (surge.sh)
  -a, --add           adds user to list of collaborators (email address)
  -r, --remove        removes user from list of collaborators (email address)
  -V, --version       show the version number
  -h, --help          show this help message

Shorthand usage:
  surge [project path] [domain]

Additional commands:
  surge whoami        show who you are logged in as
  surge logout        expire local token
  surge login         only performs authentication step
  surge list          list all domains you have access to
  surge teardown      tear down a published project

Guides:
  Getting started     surge.sh/help/getting-started-with-surge
  Custom domains      surge.sh/help/adding-a-custom-domain
  Additional help     surge.sh/help

When in doubt, run surge from within you project directory.


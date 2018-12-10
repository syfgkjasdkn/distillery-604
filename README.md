The `rel/etc/config.exs` [requires](https://github.com/syfgkjasdkn/distillery-604/blob/master/rel/etc/config.exs#L4) some env vars to be set. This introduces some problems with `bin/app remote_console` since the config provider evalutes the config, notices that the env vars are not set, and fails.

The current workaround that I have is to create a [script](https://github.com/syfgkjasdkn/distillery-604/blob/master/bin/remsh) which sets the required env vars to something:

```bash
#! /usr/bin/env bash

export DB_PATH=""

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
BINPATH="$( cd "$(dirname "$0")" ; pwd -P )"
$BINPATH/remumb remote_console
```

and [copy](https://github.com/syfgkjasdkn/distillery-604/blob/master/rel/config.exs#L27) it into the release.

Then I'm able to call `bin/remsh` to open a remote console to the node.

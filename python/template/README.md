# snippets: python/template

template - A standalone program using argparse, classes and searchpath.

## Install

- modify python/template/makefile
    - (tool-name ?=)  Specify name of the installed tool.
    - (tool-dir  ?=)  Specify installation directory for the tool
    - TODO: Morph these vars into passable parameters with error checking.
- make install
    - copy directories bin/ and tmpl/ into destination.
    - Rename tmpl.py to {tool-name}.py
    - Update source imports to be named for the installed tool

```Python
#!/usr/bin/env python

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import argparse
import pprint

from foobar.main         import utils              as main_utils
from foobar.main         import argparse_actions   as ar_ac

import foobar.baz
```

## Modules

- foobar/

| Resource   | Descripton                                                |
| ---        | ---                                                       |
| main/      | Common utility modules                                    |
| struct/    | Data structures and classes                               |

- foobar/main/

| Resource   | Descripton                                                |
| ---        | ---                                                       |
| argparse/  | Command line switches, value typing, main_argv.get_argv() |
| file_utils | Utility methods with context: pushd/popd, with tempdir(): |
| todo       | Future script enhancements                                |
| utils      | banner(), error(), iam(), exception msg formatting        |

- foobar/main/argparse/

| Resource      | Descripton                                                |
| ---           | ---                                                       |
| utils.py      | Primary import for argparse functionality                 |
| ---           | ---                                                       |
| actions.py    | Attributes with side effects (--dir => verify exists)     |
| modes.py      | boolean args: --debug --trace --todo --verbose            |
| types.py      | Typecast storage and validate values                      |

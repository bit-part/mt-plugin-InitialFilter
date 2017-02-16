InitialFilter - Movable Type Plugin
=================

[日本語](README.ja.md)

## Overview

Set an initial filter to a list page built Listing Framework.

## Requirements

* Movable Type 6

## Installation

1. Download an archive file from [releases](https://github.com/bit-part/mt-plugin-InitialFilter/releases).
1. Unpack an archive file.
1. Upload unpacked files to the MT `plugins` directory.

Should look like this when installed:

    $MT_HOME/
        plugins/
            InitialFilter/

## Usage

### Plugin Setting

Set value of YAML format to InitialFilter Plugin Setting of Website/Blog.

Setting information is the following:

```
<The value of "_type" parameter>:
    id: <Filter ID>
    force: <Set 1 if you always wont to set the initial filter>
```

If you apply user filter to Entry List and apply `draft` filter to Page List, the sample is the following:

```
entry:
    id: 1
    force: 1
page:
    id: draft
    force: 1
```

### How to find `id`

You can find out about `id` set above YAML by the following steps:

1. Make a new filter and save it.(If you use a built-in filter, you can skip this step.)
1. Apply the new filter.
1. Reload the page.
1. View source code of the page.
1. Search the code for `var initial_filter =`.
1. Get the value of `id` in value of `initial_filter`.

---

MT::Lover::[bitpart](http://bit-part.net/)

dotfiles-windows
================

Usage
-----

Create the file `C:\dotfiles\attributes.json` with the following content

```json
{
  "workstation": {
    "user": "user",
    "password": "password",
    "aws_s3_bucket": "bucket",
    "aws_access_key_id": "id",
    "aws_secret_access_key": "secret"
  }
}
```

Download and install the Chef client from [here](https://www.chef.io/download-chef-client/)

Download and unpack the cookbooks [zipfile](https://github.com/pghalliday/dotfiles-windows/zipball/vendor)

Change to the unpacked directory

Then run

```sh
converge.bat
```

Development
-----------

Once converged (see above), change to the repository working directory, make changes to cookbooks then run

```sh
all.bat
```

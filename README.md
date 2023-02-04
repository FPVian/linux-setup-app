# Command-line utility for Linux configuration
## Installs packages and standardizes settings for Linux Mint 21.1 Vera

#

The `fpv.sh` script (called by fpv_group on line 12 of setup) installs software geared towards FPV drone and 3D printing hobbbyists. This repository is meant to serve as a template and designed to be easily configured to suit the individual needs of the end user. Start by updating `settings.sh` and removing any unused menu files in the `app-menu` folder

#

## Instructions:

### For a fresh install: 

> `bash setup full`

### To update system: 

> `bash setup update`

### To install a specific package (or package group):

> `bash setup <package_name>`

### To add 'setup' command to PATH:

> `bash setup add_to_path`

# Windows 11 base image for Horizon with Packer

This repository contains a Packer Template to create a Windows 11 base image for use with VMware Horizon.

It installs:

- Windows 11
- VMware Tools
- Horizon Agent (TODO)
- Windows Updates (TODO)

Currently, the [official packer-plugin-vsphere](https://github.com/hashicorp/packer-plugin-vsphere)
[does not support creating vTPM devices](https://github.com/hashicorp/packer-plugin-vsphere/issues/108)
which are required to install Windows 11 without modification.  There is a fork with that functionality
available [here](https://github.com/umich-vci/packer-plugin-vsphere/tree/vTPM).

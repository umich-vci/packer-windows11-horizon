# Windows 11 base image for Horizon with Packer

This repository contains a Packer Template to create a Windows 11 base image for use with VMware Horizon.

It installs:

- Windows 11
- VMware Tools
- Windows Updates (TODO)
- Horizon Agent

Currently, the [official packer-plugin-vsphere](https://github.com/hashicorp/packer-plugin-vsphere)
[does not support creating vTPM devices](https://github.com/hashicorp/packer-plugin-vsphere/issues/108)
which are required to install Windows 11 without modification.  There is a fork with that functionality
available [here](https://github.com/umich-vci/packer-plugin-vsphere/tree/vTPM).

You will need to either:

- Put the Horizon Agent installer (VMware-Horizon-Agent-x86_64-2111-8.4.0-18964730.exe) into this directory.
- Modify the `horizon_agent_installer_path` variable to point to the agent installer you would like to use.

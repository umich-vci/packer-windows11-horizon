variable "time_zone" {
  description = "The timezone to set the Windows machine to. Defaults to \"Eastern Standard Time\""
  type        = string
  default     = "Eastern Standard Time"
}

variable "owner" {
  description = "The owner to associate with the Windows install."
  type        = string
}

variable "organization" {
  description = "The organization to associate with the Windows install."
  type        = string
}

variable "computer_name" {
  description = "The name of the virtual machine and the computer name in Windows."
  type        = string
}

variable "windows_key" {
  description = "A Windows key that corresponds to the image you have specified. Defaults to the Windows 11 Enterprise KMS Client Key."
  type        = string
  default     = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
}

variable "windows_image_name" {
  description = "The name of the Windows image to use from the install media. Defaults to \"Windows 10 Enterprise\"."
  type        = string
  default     = "Windows 10 Enterprise"
}

variable "windows_iso_path" {
  description = "The path to the Windows 11 media on a vSphere Datastore."
  type        = string
}

variable "administrator_password" {
  description = "The password to use for the local Administrator account."
  type        = string
  sensitive   = true
  default     = "H0riz0n$!"
}

variable "vcenter_server" {
  description = "The hostname of the vCenter server managing the host you would like to build the image on."
  type        = string
}

variable "vcenter_username" {
  description = "The username to use to access the vCenter host."
  type        = string
}

variable "vcenter_password" {
  description = "The password to use to access the vCenter host."
  type        = string
  sensitive   = true
}

variable "esxi_host" {
  description = "The hostname of the ESXi host to build the image on."
  type        = string
}

variable "datastore" {
  description = "The name of the datastore to create the virtual machine on."
  type        = string
}

variable "tools_iso_path" {
  description = "A datastore path to the VMware Tools Installer ISO. Defaults to the local locker copy on the ESXi host."
  type        = string
  default     = "[] /vmimages/tools-isoimages/windows.iso"
}

variable "horizon_agent_installer_path" {
  description = "Path to the installer to use for the Horizon Agent. Defaults to \"./VMware-Horizon-Agent-x86_64-2111-8.4.0-18964730.exe\""
  type        = string
  default     = "./VMware-Horizon-Agent-x86_64-2111-8.4.0-18964730.exe"
}

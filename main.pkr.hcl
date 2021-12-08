source "vsphere-iso" "win11-horizon-base" {
  vcenter_server      = var.vcenter_server
  username            = var.vcenter_username
  password            = var.vcenter_password
  host                = var.esxi_host
  insecure_connection = true

  vm_name       = var.computer_name
  CPUs          = 2
  RAM           = 4096
  guest_os_type = "windows9_64Guest"
  firmware      = "efi-secure"
  vTPM          = true
  datastore     = var.datastore

  # wait for the boot menu to come up, go down to the first cd-rom drive, then wait and press enter for the press any key to boot prompt
  # I'm not sure why the press any key to boot prompt doesn't come up initially.
  boot_wait    = "60s"
  boot_command = ["<down><down><enter><wait><enter>", ]

  cd_content = {
    "/autounattend.xml" = templatefile("${path.root}/boot/autounattend.xml.pkrtpl.hcl",
      {
        administrator_password  = var.administrator_password
        computer_name           = var.computer_name
        horizon_agent_installer = basename(var.horizon_agent_installer_path)
        image_name              = var.windows_image_name
        owner                   = var.owner
        organization            = var.organization
        time_zone               = var.time_zone
        windows_key             = var.windows_key
      }
    )
  }
  cd_files = [
    var.horizon_agent_installer_path,
  ]

  cdrom_type = "sata"
  iso_paths = [
    var.windows_iso_path,
    var.tools_iso_path,
  ]

  network_adapters {
    network_card = "vmxnet3"
  }

  disk_controller_type = ["pvscsi"]
  storage {
    disk_size             = 51200
    disk_thin_provisioned = true
  }

  communicator   = "winrm"
  winrm_username = "Administrator"
  winrm_password = var.administrator_password
}

build {
  sources = ["source.vsphere-iso.win11-horizon-base"]
}

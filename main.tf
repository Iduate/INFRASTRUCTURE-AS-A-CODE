provider "proxmox" {
  pm_api_url      = "https://188.40.59.86:8006/api2/json" // Proxmox URL
  pm_user         = "david.iduate@pam"                    // Proxmox username
  pm_password     = "david01duate4433k!!"                 // Proxmox password
  pm_tls_insecure = true                                  // Transport layer security. i am telling Terraform to connect to the Proxmox server
  //using a secure connection,but it should not check if the security certificate of the Proxmox server 
  //is valid or trustworthy
}

resource "proxmox_vm_qemu" "new_virtual_machine_12" {
  name        = "xerdocs" // The name of the new server
  target_node = "ExpertProx"     // The place where the virtual machine will be deployed
  pool        = "XerdocsPool"    // The storage pool where the virtual machine will be deployed
  os_type     = "l26"            // Linux 2.6 kernal
  sockets     = 1                // physical cpu core
  cores       = 1                // processing power 
  memory      = 2048             // The memory that will the allocated to the virtual machine
  iso         = "local:iso/ubuntu-22.04.1-live-server-amd64.iso"


  network {
    model  = "virtio" // A network adaptaer that helps improve the network performance of the vitual machine
    bridge = "vmbr0"  // connects the virtual machine to the physical network
  }

  disk {
    storage = "local"  // The place where the disk is stored
    size    = "32G"    // The size of the disk in the loal storage
    type    = "virtio" // small computer system interface 
  }
}






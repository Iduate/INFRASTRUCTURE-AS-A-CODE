provider "proxmox" {
  pm_api_url      = "" 
  pm_user         = ""                    
  pm_password     = ""                 
  pm_tls_insecure = true                                  
 
}

resource "proxmox_vm_qemu" "new_virtual_machine_12" {
  name        = "xerdocs" 
  target_node = "ExpertProx"     
  pool        = "XerdocsPool"    
  os_type     = "l26"            
  sockets     = 1               
  cores       = 1                 
  memory      = 2048             
  iso         = "local:iso/ubuntu-22.04.1-live-server-amd64.iso"


  network {
    model  = "virtio" 
    bridge = "vmbr0"  
  }

  disk {
    storage = "local"  
    size    = "32G"    
    type    = "virtio"  
  }
}






# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.memory = "8192"

    # Use two CPUs
    vb.cpus = 2

    # Enable IO APIC
    vb.customize ["modifyvm", :id, "--ioapic", "on"]

    # Enable PAE/NX
    vb.customize ["modifyvm", :id, "--pae", "on"]

    # Allow for 128 MB video memory
    vb.customize ["modifyvm", :id, "--vram", 128]

    # Enable 3D accellerated video graphics
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end

  # Provisioning
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "bootstrap_user.sh", privileged: false
end

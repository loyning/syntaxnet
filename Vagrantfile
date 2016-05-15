# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    host = RbConfig::CONFIG['host_os']

    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    mem = 8388608  # default system memory (8 GB will allocate 2 GB)
    cpus = 2  # default CPU allocation
    if host =~ /darwin/
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024
      cpus = `sysctl -n hw.ncpu`.to_i / 2
    elsif host =~ /linux/
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i 
    elsif host =~ /mswin|mingw|cygwin/
      # Windows code via https://github.com/rdsubhas/vagrant-faster
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end
  
    # Use a quarter of all available memory
    vb.memory = mem / 1024 / 4

    # Use two CPUs (set as high as possible!)
    vb.cpus = cpus

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

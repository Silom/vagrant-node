VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "nodebox-precise"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.synced_folder "project/", "/var/nodespace/project/"
  config.vm.synced_folder "resources/", "/var/nodespace/resources/"

  config.vm.hostname = "nodebox"
  config.vm.network :private_network, ip: "192.168.101.101"

  # This shell script is based on mss redmine setup repository, big thanks for that. (https://github.com/mss/vagrant-ansible-redmine)
  config.vm.provision "shell" do |shell|
    shell.args = "setup/vagrant.yml"
    shell.inline = <<-end
      #!/bin/bash
      ppa=
      while getopts p OPTNAME; do
        case "$OPTNAME" in
          p)
            ppa=ppa:rquillo/ansible
          ;;
          *)
            exit 1
          ;;
        esac
      done
      shift $((OPTIND - 1))
      playbook=${1:-playbook.yml}

      set -ex
      sed -i -e "/ $(lsb_release -cs)-backports /s/^# *//" /etc/apt/sources.list
      if [ -n "$ppa" ]; then
        if ! dpkg -s python-software-properties 2>/dev/null | grep -q '^Status:.* installed'; then
          apt-get update
          apt-get install -y python-software-properties
        fi
        apt-add-repository -y $ppa
      fi
      apt-get update
      apt-get install -y ansible
      ansible-playbook /vagrant/$playbook -v -c local -i /etc/hostname
    end
  end
end

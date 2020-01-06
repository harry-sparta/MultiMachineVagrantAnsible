# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

def set_env(vars)
  # create some code that will run som ebash commands
  # source loads information into a directory
  command = <<~HEREDOC
    echo "Setting Environmental Variables"
    source ~/.bashrc
  HEREDOC

  vars.each do |key, value|
    command += <<~HEREDOC
      if [ -z "$#{key}"]; then
        echo "export #{key}=#{value}" >>~/.bashrc
        fi
    HEREDOC
  end

  command
end

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "app", "/home/ubuntu/app"
    # app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
    app.vm.provision "shell", inline: set_env({DB_HOST:"mongodb://192.168.10.150:27017/posts"}), privileged: false
    app.vm.provision "ansible_local"  do |ansible|
      ansible.playbook = "provisioning/AppPlaybook.yml"
      ansible.sudo = true
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.synced_folder "environment/db", "/home/ubuntu/environment"
    # db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
    db.vm.provision "ansible_local"  do |ansible|
      ansible.playbook = "provisioning/DbPlaybook.yml"
      ansible.sudo = true
    end
  end

  # Use :ansible or :ansible_local to
  # select the provisioner of your choice
end

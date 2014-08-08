# To run
```bash
curl https://raw.githubusercontent.com/bvallelunga/vm-init/master/init.sh | sh
```

# Setup SSH Keys

1. **Create Local SSH Keys And Add To Github**

```bash
cd ~/.ssh; ssh-keygen -t rsa -C "user@domain.com"; clear; cat ~/.ssh/id_rsa.pub;
```

2. **Add Local Keys To Server**

```bash
cat ~/.ssh/id_rsa.pub | ssh user@domain.com "cat >> ~/.ssh/authorized_keys"
```

3. **Install Git on Server**

```bash
sudo apt-get -y install git
```

4. **Paste Installer Script on Server**

  - Development

      ```bash
      cd ~; git clone git@github.com:bvallelunga/vm-init.git; sudo bash vm-init/init.sh;
      ```
  - Production

      ```bash
      cd ~; git clone git@github.com:bvallelunga/vm-init.git; sudo bash vm-init/init.sh production;
      ```

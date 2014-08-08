## To run
```bash
curl https://raw.githubusercontent.com/bvallelunga/vm-init/master/init.sh | sudo sh
```

## Setup SSH Keys

1. **Create Local SSH Keys And Add To Github**

```bash
cd ~/.ssh; ssh-keygen -t rsa -C "user@domain.com"; clear; cat ~/.ssh/id_rsa.pub;
```

2. **Add Local Keys To Server**

```bash
cat ~/.ssh/id_rsa.pub | ssh user@domain.com "cat >> ~/.ssh/authorized_keys"
```

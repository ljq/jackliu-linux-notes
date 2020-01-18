### Configuration file system


### Configuration file

###### Global
```
/ etc / ssh /

# Save the Diffie-Hellman group to build a secure network transport layer through key exchange
/ etc / ssh / moduli

# Default SSH client configuration file
/ etc / ssh / ssh_config

# Configuration file for sshd daemon
/ etc / ssh / sshd _config

# DSA private key for sshd daemon
/ etc / ssh / ssh_host_dsa_key

# DSA public key of the sshd daemon
/etc/ssh/ssh_host_dsa_key.pub

# sshd daemon's SSH protocol version 1 RAS private key
/ etc / ssh / ssh_host_key

# sshd daemon's SSH protocol version 1 RAS public key
/etc/ssh/ssh_host_key.pub

# sshd daemon's SSH protocol version 2 RAS private key
/ etc / ssh / ssh_host_rsa_key

# sshd daemon's SSH protocol version 2 RAS public key
/ etc / ssh / ssh_ho st_rsa_key.pub

# PAM configuration file for sshd daemon
/etc/pam.d/sshd

# Configuration file for sshd service
/ etc / sysconfig / sshd

```

###### Users
```
~ / .ssh /

# The client's public key used by the server to authenticate the SSH client
~ / .ssh / authorized_keys

# User's DSA private key
~ / .ssh / id_dsa

# User's DSA public key
~ / .ssh / id_dsa. pub

# RSA private key of user's SSH protocol version 2
~ / .ssh / id_rsa

# RSA public key for user's SSH protocol version 2
~ / .ssh / id_rsa.pub

# User's SSH protocol version 1 RSA private key
~ / .ssh / identity

# The user's SSH protocol version of the RSA public key
~ / .ssh / identity.pub

# SSH server public key to which the user is connected
~ / .ssh / known_hosts

```


### SSH Tunnel
# GPG (GnuPG)

The GNU Privacy Guard

` ` `

# Create a key
$ GPG -- gen - key

# Look at the public key
$ GPG -- the list - the key

# Look at the private key
$ GPG -- the list - secret - key

# A public key to delete
$ GPG --delete-keys identifies the name

# The private key to delete
$ GPG --delete-secret-keys identifies the name

# Public key export
$ GPG --export id > export file name (mostly with GPG,asc suffix)

# The private key export
$ GPG --export-secret-key

# Key import
$ GPG --import key file

# Encrypted file
$ GPG --recipient identifier --encrypt file name

# Declassified documents
$ GPG --output new file name --decrypt encrypted file name

# Modify the key
$ GPG --edit-key identifier name

` ` `

### Backup of public and private keys of GPG 

* backup public key: ```gpg-o keyfilename --export KeyID``` if there is no KeyID is the backup of all public keys, -o represents the output to the file keyfilename, if plus -a parameters output text format information, otherwise output is binary format information.

* backup private key: ```gpg-o keyfilename --export-secret-keys KeyID``` backup all private keys if there is no KeyID, -o represents the output to the file keyfilename, if plus -a parameters output text format information, otherwise output is binary format information.

* import key information: ```GPG --import filename```
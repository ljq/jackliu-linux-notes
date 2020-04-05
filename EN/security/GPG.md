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
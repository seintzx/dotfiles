# gpg

[GnuPG Best
Practice](https://riseup.net/en/security/message-security/openpgp/best-practices)

## installation

### key generation

copy the config file in this repo to your default folder (`~/.gnupg/gpg.conf`)
if you haven't change it

run `gpg --full-gen-key` and follow the steps
```
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection? 1
```
```
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
```
```
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 1y
```

### revocation certificate

In case you want to dismiss your keys for any reason use create a certificate
```bash
gpg --gen-revoke --armor --output=revoke.asc <user-id>
```

To use a certificate
```bash
gpg --import revoke.rev
```
And sen the key to the keyserver

> NOTE: Keep this stored somewhere safe, whoever has this can revoke your keys

### public keys

If you want to export your public key and give it to someone you can use this:
```bash
gpg --output public.key --armor --export <user-id>
```
to import a key from someone use this:
```bash
gpg --import public.key
```

> NOTE: always double check the source of the key

### export private

To create a backup of your private key:
```bash
gpg --export-secret-keys --armor <user-id> > privkey.asc
```

To restore a backup:
```bash
gpg --import privkey.asc
```

> NOTE: Keep this stored somewhere safe, whoever has this can use your keys and
> impersonate you

## usage

### asymmetric encrypt and decrypt

To encrypt a file with the name `doc`, use:
```bash
gpg --recipient user-id --encrypt doc
```

To decrypt a file with the name `doc.gpg` encrypted with your public key, use:
```bash
gpg --output doc --decrypt doc.gpg
```

- Add `--armor` to encrypt a file using ASCII armor
- Use `-R <user-id>` or `--hidden-recipient <user-id>` instead of `--recipient`
  to not put the recipient key IDs in the encrypted message. This helps to hide
  the receivers of the message and is a limited countermeasure against traffic
  analysis
- You can use gnupg to encrypt your sensitive documents by using your own
  `<user-id>` as recipient or by using the `--default-recipient-self` flag
  instead; however, you can only do this one file at a time, although you can
  always tarball various files and then encrypt the tarball.

### symmetric encrypt and decrypt

To encrypt a file with a passphrase (no need of key pair) use:
```bash
gpg --symmetric doc
```

To decrypt with the same passphrase use:
```bash
gpg --output doc --decrypt doc.gpg
```

### encrypt a password

First create a file with your password

You need to leave one empty line after the password, otherwise gpg will return
an error message when evaluating the file

Then run:
```bash
gpg -e -a -r <user-id> your_password_file
```
- `-e` is for encrypt
- `-a` for armor (ASCII output)
- `-r` for recipient user ID

You will be left with a new `your_password_file.asc` file

### Signatures

To sign a file use:
```bash
gpg --output doc.sig --sign doc
```

To verify a signature use:
```bash
gpg --verify doc.sig
```

## file path

- `~/.gnupg/gpg.conf`

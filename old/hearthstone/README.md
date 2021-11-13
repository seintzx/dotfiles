# Hearthtone

Dependencies:

- `yay -S lib32-libldap lib32-gnutls playonlinux winetricks`
- `winetricks corefonts`
- `winetricks vcrun2015`

Follow this
[guide](https://gist.github.com/aslafy-z/bcc8c897a1aef9910f3213444d28b565)

Now open playonlinux and go to `Configure -> select your game -> Wine tab -> Configure Wine`

In the libraries tab add:
- `api-ms-win-crt-convert-l1-1-0.dll`
- `api-ms-win-crt-heap-l1-1-0.dll`
- `api-ms-win-crt-locale-l1-1-0.dll`
- `api-ms-win-crt-runtime-l1-1-0.dll`
- `api-ms-win-crt-stdio-l1-1-0.dll`
- `api-ms-win-crt-time-l1-1-0.dll`
- `ucrtbase`
- `vcruntime140`
And set them all to `native`

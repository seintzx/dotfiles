# firefox

## installation

```bash
yay -S firefox
```

## configuration

### firefox hardening

1. Launch firefox with the profile manager `firefox --no-remote -ProfileManager`
2. Create a new profile
3. In `about:support` open the profile folder
4. Delete everything inside the folder
5. Rename the chosen profile to `user.js` and copy it into the profile folder

> NOTE
> This `user.js` its my merge between `ffprofile` and `arkenfox`, made to suits my preferences
> I suggest you read the resources to tune it according to your preferences

### profiles

There are 4 profiles:

- `full-privacy.js`: blocks most things, it breaks multimedia website (meet, teams, spotify, etc..)
- `half-privacy.js`: blocks most things without breaking multimedia websites
- `no-privacy.js`: default profile with some annoyances disabled (doesn't do much to protect your privacy)
- `complete.js`: merge of half and no privacy, it retains most privacy feature while enabling options for stream, music and other useful things

There's no out-of-the-box profile yet, the best one is the complete one since it protects privacy as much as possible without breaking stuff

If you have problems with teams or google meet set `media.peerconnection.enabled` to `true`

#### resources

- https://www.privacytools.io/#browser
- https://ffprofile.com/
- https://github.com/arkenfox/user.js
- https://www.youtube.com/watch?v=F7-bW2y6lcI


### uBlock Origin

`ublock.txt` can be imported to use my custom settings


## file path

- `/path/to/profile/user.js`

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
4. Delete everything inside and copy the `user.js` (this will delete any modification)

> NOTE
> 
> This `user.js` its my merge between `ffprofile` and `arkenfox`, made to suits my preferences
>
> I suggest you read the resources to tune it according to your preferences

#### resources

- https://www.privacytools.io/#browser
- https://ffprofile.com/
- https://github.com/arkenfox/user.js
- https://www.youtube.com/watch?v=F7-bW2y6lcI


### uBlock Origin

TODO



## file path

- `/path/to/profile/user.js`

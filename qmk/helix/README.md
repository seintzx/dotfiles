# helix

## building

- [keyboard soldering](https://github.com/MakotoKurauchi/helix/blob/master/Doc/buildguide_en.md)

## firmware

You can either use the online builder [here](https://config.qmk.fm/#/helix/rev3_5rows/LAYOUT) or you can compile it yourself

Follow [this](https://docs.qmk.fm/#/getting_started_build_tools) guide to install all the necessary stuff you need to compile

You also can keep following the guide as it explain everything perfectly, I'll report below the main steps

- windows folder path: `C:\Users\YOURUSER\qmk_firmware\keyboards\helix\keymaps\YOURLAYOUT`
- Create a new keymap: `qmk new-keymap -kb helix/rev3_5rows`
- Open the `keymap.c` file and make your edits OR copy the files in this repo into your newly created folder
- Compile it with `qmk compile -kb helix/rev3_5rows -km <keymap>`
- Once it completes you will have a `.hex` file which can be flashed from command line or by using the QMK Tool

## current layout

![layout](./helix-layout.png)

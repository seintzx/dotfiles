# quefrency rev3

## building

- [keyboard soldering](https://docs.keeb.io/quefrency-rev2-sinc-build-guide)

## firmware

You can either use the online builder [here](https://config.qmk.fm/#/keebio/quefrency/rev3/) or you can compile it yourself

Follow [this](https://docs.qmk.fm/#/getting_started_build_tools) guide to install all the necessary stuff you need to compile

You also can keep following the guide as it explain everything perfectly, I'll report below the main steps

- windows folder path: `C:\Users\YOURUSER\qmk_firmware\keyboards\keebio\quefrency\keymaps\<YOURLAYOUT>`
- Create a new keymap: `qmk new-keymap -kb keebio/quefrency/rev3`
- Open the `keymap.c`, `config.h` and `rules.mk` files and make your edits OR copy the files in this repo into your newly created folder
- Compile it with `qmk compile -kb keebio/quefrency/rev3 -km <YOURLAYOUT>`
- Once it completes you will have a `.hex` file which can be flashed from command line or by using the QMK Tool
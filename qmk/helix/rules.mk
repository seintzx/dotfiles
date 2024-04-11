NKRO_ENABLE = no            # No idea
BOOTMAGIC_ENABLE = no       # Enable Bootmagic Lite
MOUSEKEY_ENABLE = no        # Mouse keys
EXTRAKEY_ENABLE = no        # Audio control and System control
CONSOLE_ENABLE = no         # Console for debug
COMMAND_ENABLE = no         # Commands for debug and configuration
AUDIO_ENABLE = no           # Audio output
SWAP_HANDS_ENABLE = no      # Enable one-hand typing
BACKLIGHT_ENABLE = no       # Enable keyboard backlight functionality

RGBLIGHT_ENABLE = yes       # Enable WS2812 RGB underlight.
OLED_ENABLE= yes            # OLED display

# If you want to change the display of OLED, you need to change here
SRC +=  ./lib/rgb_state_reader.c \
        ./lib/layer_state_reader.c \
        ./lib/logo_reader.c \
        ./lib/keylogger.c \
        # ./lib/mode_icon_reader.c \
        # ./lib/host_led_state_reader.c \
        # ./lib/timelogger.c \

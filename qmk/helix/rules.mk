AUDIO_ENABLE = no           # Audio output
BACKLIGHT_ENABLE = no       # Enable keyboard backlight functionality
BOOTMAGIC_ENABLE = no       # Enable Bootmagic Lite
COMMAND_ENABLE = no         # Commands for debug and configuration
CONSOLE_ENABLE = no         # Console for debug
DIP_SWITCH_ENABLE = no
ENCODER_ENABLE = no
EXTRAKEY_ENABLE = no        # Audio control and System control
LTO_ENABLE = yes
MOUSEKEY_ENABLE = no        # Mouse keys
NKRO_ENABLE = no            # No idea
OLED_DRIVER = SSD1306
OLED_ENABLE= yes            # OLED display
RGB_MATRIX_DRIVER = WS2812
RGB_MATRIX_ENABLE = no
RGBLIGHT_ENABLE = yes       # Enable WS2812 RGB underlight.
SPLIT_KEYBOARD = yes
SWAP_HANDS_ENABLE = no      # Enable one-hand typing

SRC += oled_display.c

// Copyright 2022 Danny Nguyen (@nooges)
// SPDX-License-Identifier: GPL-2.0-or-later

#include QMK_KEYBOARD_H

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
enum custom_layer {
    _BASE,
    _FN1,
};

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_BASE] = LAYOUT_65(
    KC_GESC, KC_1,     KC_2,    KC_3,    KC_4,   KC_5, KC_6,  KC_7,   KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_NO,   KC_BSPC, KC_DEL,
    KC_TAB,  KC_Q,     KC_W,    KC_E,    KC_R,   KC_T,        KC_Y,  KC_U,   KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_HOME,
    KC_CAPS, KC_A,     KC_S,    KC_D,    KC_F,   KC_G,        KC_H,  KC_J,   KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_ENT,  KC_END,
    KC_LSFT, KC_Z,     KC_X,    KC_C,    KC_V,   KC_B,        KC_N,  KC_M,   KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT, KC_UP,   KC_NO,
    KC_LGUI, MO(_FN1), KC_LCTL, KC_LALT, KC_SPC,              KC_NO, KC_SPC, KC_RALT, KC_RCTL, KC_NO,   KC_LEFT, KC_DOWN, KC_RGHT
  ),

  [_FN1] = LAYOUT_65(
    KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_NO,   KC_TRNS, KC_TRNS,
    KC_TRNS, RGB_TOG, RGB_HUI, RGB_HUD, KC_NO,   KC_NO,          KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_INS, KC_TRNS,
    KC_TRNS, BL_TOGG, KC_NO,   KC_NO,   KC_NO,   KC_NO,          KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_HOME, KC_END,  KC_TRNS, KC_TRNS,
    KC_TRNS, KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,          KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_TRNS, KC_TRNS, KC_NO,
    KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,                 KC_NO,   KC_TRNS, KC_TRNS, KC_TRNS, KC_NO,   KC_TRNS, KC_TRNS, KC_TRNS
  )
};

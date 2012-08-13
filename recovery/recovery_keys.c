#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"


int device_toggle_display(volatile char* key_pressed, int key_code) {

    int alt = key_pressed[KEY_VOLUMEUP];
    if (alt && (key_code == KEY_END))
        return 1;
    return get_allow_toggle_display() && (key_pressed[KEY_VOLUMEUP] && (key_code == KEY_END));

}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case 114:
            case 139:
                return HIGHLIGHT_DOWN;

            case 115:
            case 102:
                return HIGHLIGHT_UP;

            case 217:
                return SELECT_ITEM;

            case 158:
                    return GO_BACK;

            case 116:
                if (ui_get_showing_back_button()) {
                    return SELECT_ITEM;
                }
                if (!get_allow_toggle_display())
                    return GO_BACK;
                break;
                return SELECT_ITEM;
        }
    }

    return NO_ACTION;
}
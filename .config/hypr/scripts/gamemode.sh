#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0;\
        keyword unbind CTRL, left;\
        keyword unbind CTRL, right;\
        keyword unbind CTRL, up;\
        keyword unbind CTRL, down;\
        keyword unbind CTRL, 1;\
        keyword unbind CTRL, 2;\
        keyword unbind CTRL, 3;\
        keyword unbind CTRL, 4;\
        keyword unbind CTRL, 5;\
        keyword unbind CTRL, 6;\
        keyword unbind CTRL, 7;\
        keyword unbind CTRL, 8;\
        keyword unbind CTRL, 9;\
        keyword unbind CTRL, 0;\
        keyword unbind CTRL SHIFT, 1;\
        keyword unbind CTRL SHIFT, 2;\
        keyword unbind CTRL SHIFT, 3;\
        keyword unbind CTRL SHIFT, 4;\
        keyword unbind CTRL SHIFT, 5;\
        keyword unbind CTRL SHIFT, 6;\
        keyword unbind CTRL SHIFT, 7;\
        keyword unbind CTRL SHIFT, 8;\
        keyword unbind CTRL SHIFT, 9;\
        keyword unbind CTRL SHIFT, 0"
    exit
fi
hyprctl reload

{
  config,
  pkgs,
  username,
  keyboard-path,
  ...
}: let
  kbdpath = "${keyboard-path}";
in {
  environment.systemPackages = with pkgs; [
    kmonad
  ];

  services.udev.extraRules = ''KERNEL=="uinput", OWNER="${username}",MODE="0600" '';
  users.users.rsh.extraGroups = ["input"];

  services.kmonad = {
    enable = true;
    package = pkgs.kmonad;

    keyboards."my-laptop" = {
      device = kbdpath;
      config =
        /*
        lisp
        */
        ''

          ( defcfg

          input  (device-file "${kbdpath}" )

          output (uinput-sink "kmonad-output")

          fallthrough true

          )


          ;; ╭─────────────────────────────────────────────────────────╮
          ;; │ Source                                                  │
          ;; ╰─────────────────────────────────────────────────────────╯

          ( defsrc

          esc   f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11    f12   ins     print    del
          grv   1    2    3    4    5    6    7    8    9    0    -      =     bspc
          tab   q    w    e    r    t    y    u    i    o    p    [      ]     \
          caps  a    s    d    f    g    h    j    k    l    ;    '      ret
          lsft  z    x    c    v    b    n    m    ,    .    /    rsft   up
          lctl  fn  lmet lalt            spc            ralt rctl left   down  rght

          )


          ;; ╭─────────────────────────────────────────────────────────╮
          ;; │ Functions                                               │
          ;; ╰─────────────────────────────────────────────────────────╯

          ( defalias
          mlk (layer-switch m)  ;; Main layer switch
          hwl (layer-switch q)  ;; Qwerty layer switch

          alk (tap-hold-next 300 spc (layer-toggle a))  ;; Arrow layer toggle
          nlk (tap-hold-next 300 x  (layer-toggle n) )  ;; Number layer toggle

          ectl (tap-hold-next 250 esc lctl)  ;; Tap -> escape ; Hold -> ctrl

          mla (layer-add m)
          mlr (layer-rem m)

          )


          ;; ╭───────────────────────────────────────────────────────────╮
          ;; │ Main Layer                                                │
          ;; ╰───────────────────────────────────────────────────────────╯

          ( deflayer m

          tab       f1     f2    f3    f4    f5     f6    f7    f8    f9     f10     f11    f12   ins    print  XX
          grv       1      2     3     4     5      6     7     8     9      0       -      ]     caps
          bspc      p      o     u     v     /      z     '     h     d      -       =      rsft     \
          @ectl     a      e     i     n     b      k     l     r     s      t       f      ret
          lsft    @nlk     j     m     g     q      y     c     ,     .      w      rsft    up
          lctl      fn    lmet  lalt            @alk           ralt  rctl   left    down    rght

          )


          ;; ╭─────────────────────────────────────────────────────────╮
          ;; │ Arrow Layer                                             │
          ;; ╰─────────────────────────────────────────────────────────╯

          (deflayer a

          ;;ec f1   f2   f3   f4   f5   f6    f7       f8     f9      f10    f11  f12 ins print del

          _    _    _    _    _    _    _     _        _      _       _       _    _    _   _   _
          _    _    _    _    _    _    _     _        _      _       _       _    _    @hwl
          _    *    $    %    &   ~     _     #        up     "      \_       ^    _    _
          _    \(    {    [  /    =     +    left     down   rght    rght     :    _
          del  \)    }    ]  @    !       ~        -        <      >       ;     _    _
          _    _    _    _              _                           _         _    _    _    _

          )


          ;; ╭─────────────────────────────────────────────────────────╮
          ;; │ Number Layer                                            │
          ;; ╰─────────────────────────────────────────────────────────╯

          (deflayer n

          ;;ec f1   f2   f3   f4   f5   f6    f7       f8     f9      f10       f11      f12 ins print del

          _    _           _        _     _    _    _     _        _      _       _         _        _    _   _   _
          _    _      _    _    _    _    _     _        _      _       _         _        _    _
          _    _    _    _    _    _      _    _         _      _       _         _        _    _
          _    _    0    1    2    _      _       5      6       7         8      9    _
          _    _    _    3    _    _      _       4      _       _      9            _    _
          _    _    _    _              @alk                              _    _    _    _    _

          )


          ;; ╭─────────────────────────────────────────────────────────╮
          ;; │ Qwerty Layer                                            │
          ;; ╰─────────────────────────────────────────────────────────╯

          ( deflayer q

          esc      f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11    f12   @mlk     print    del
          grv      1    2    3    4    5    6    7    8    9    0    -      =     tab
          bspc     q    w    e    r    t    y    u    i    o    p    [      ]     \
          @ectl    a    s    d    f    g    h    j    k    l    ;    '      ret
          lsft     z    x    c    v    b    n    m    ,    .    /    rsft   up
          lctl     fn  lmet lalt            @alk            ralt rctl left   down  rght

          )



        '';
    };
  };
}

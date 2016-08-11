;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ocaml
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     themes-megapack
     theming
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(smartparens)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; Start emacs server.
  (server-start)

  ;; Stop evil mode grabbing Ctrl+Z, so we can use it for SIGSTOP instead.
  (setq evil-toggle-key "C-`")

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(cyberpunk)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Merlin
  (add-to-list 'load-path "~/.merlin/share/emacs/site-lisp")
  (setq merlin-command "~/.merlin/bin/ocamlmerlin")
  (require 'merlin)

  ;; 80(etc)-column marker
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  (setq fci-rule-character-color "#666666")

  ;; Do not recentre the display upon Ctrl+L, just redraw it.
  (global-set-key (kbd "C-l") 'redraw-display)

  ;; Disable Merlin for the moment, since if it's unavailable, errors are
  ;; produced in the modeline when saving files.
  ;; (setq tuareg-mode-hook '())

  ;; Disable mouse support (mainly so that when the focus is given to a
  ;; Spacemacs window it doesn't cause the cursor to move.  Also seems to make
  ;; pasting into Spacemacs work properly)
  (xterm-mouse-mode 0)
  (gpm-mouse-mode 0)

  ;; Make Ctrl+Z suspend emacs
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z") 'suspend-frame)

  ;; Disable re-indentation of the current line and/or indentation for the
  ;; next line upon RETURN, etc.
  (add-hook 'tuareg-mode-hook (lambda ()
    (define-key tuareg-mode-map [remap newline-and-indent] 'newline)))

  ;; When pressing / or ? to search, enable up/down arrows to move through
  ;; search history.
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)

  (electric-indent-mode 0)
  (setq tuareg-electric-indent nil)

  ;; Automatic re-reading of files
  (global-auto-revert-mode 1)

  ;; Turn off display of whitespace characters in diff mode
  (setq diff-mode-hook nil)

  ;; Do not resize other windows when a window is closed
  (setq evil-auto-balance-windows nil)

  ;; Adjust the minimum height of a window to match vim
  (setq window-min-height 1)

  ;; Disable highlighting of parentheses that surround the cursor (as opposed
  ;; to highlighting a matching parenthesis when the cursor is on a
  ;; parenthesis).
  (global-highlight-parentheses-mode 0)
  (highlight-parentheses-mode 0)
  (show-paren-mode 1)

  ;; Deselect the region after indentation changes with > and <
  ;; Also ensure that the cursor stays at the start of the indented portion
  ;; as in vim.
  (define-key evil-visual-state-map (kbd ">") 'shift-right-visual-deselect)
  (define-key evil-visual-state-map (kbd "<") 'shift-left-visual-deselect)
  (defun shift-left-visual-deselect ()
    (interactive)
    (let ((pos (point)))
      (evil-shift-left (region-beginning) (region-end))
      (goto-char pos)))
  (defun shift-right-visual-deselect ()
    (interactive)
    (let ((pos (point)))
      (evil-shift-right (region-beginning) (region-end))
      ;; Still not correct -- moves to first non-blank, except at start of
      ;; line, when it stays put...
      (goto-char pos)))

  (defun my-command-error-function (data context caller)
    "Silence unnecessary messages"
    (when (not (memq (car data) '(beginning-of-buffer
                                  end-of-buffer
                                  beginning-of-line
                                  end-of-line)))
          (command-error-default-function data context caller)))

  (setq command-error-function #'my-command-error-function)

  ;; When page up/down cannot scroll by a whole screenful, move the cursor to
  ;; the top (resp. bottom) line.
  (setq scroll-error-top-bottom 1)

  ;; Stop Merlin showing errors
  (merlin-toggle-view-errors)

;;  ;; Make Page Up / Page Down behave as would be expected.
;;  ;; See https://www.emacswiki.org/emacs/Scrolling
;;  (defun sfp-page-down (&optional arg)
;;    (interactive "^P")
;;    (setq this-command 'next-line)
;;    (next-line (- (window-text-height) next-screen-context-lines)))
;;
;;  (put 'sfp-page-down 'isearch-scroll t)
;;  (put 'sfp-page-down 'CUA 'move)
;;
;;  (defun sfp-page-up (&optional arg)
;;    (interactive "^P")
;;    (setq this-command 'previous-line)
;;    (previous-line (- (window-text-height) next-screen-context-lines)))
;;
;;  (put 'sfp-page-up 'isearch-scroll t)
;;  (put 'sfp-page-up 'CUA 'move)
;;
;;  (global-set-key [next] 'sfp-page-down)
;;  (global-set-key [prior] 'sfp-page-up)

  ;; The following is done by custom-set-variables below.  It prevents use
  ;; of the dire helm completion-as-point when doing ":e <pathname>".
  ;; '(helm-mode-handle-completion-in-region nil)

  ;; Things to fix
  ;; - Something wrong with "A" in some circumstances
  ;; - Closing a window seems to move the focus in unpredictable ways.
  ;; - Sometimes when you type ":" the focus changes to a different window
  ;; - Slowness
  ;; - Page up held down doesn't scroll properly
  ;; - Page up doesn't move the cursor to the top line if there isn't a
  ;;   screenful above  (Page up/down issues apparently fixed in dev spacemacs)
  ;; - OCaml mode: tab does nothing at all
  ;; - C mode: sometimes movement wraps around from one line to the next.
  ;;   Also the indentation is a bit weird.  In C for example, type
  ;;   void (foo)
  ;;   {
  ;;   }
  ;;   and the braces will be all over the place
  ;; - Window movement commands (^W ...) don't work in customize buffers
  ;;   (and in some magit buffers IIRC)
  ;; - If you select with V and then indent with > then the selection doesn't
  ;;   clear.  Partially fixed above but the point ends up in the wrong place
  ;;   sometimes...
  ;; - Still problems with starting multiple instances on occasion. e.g. Warning
  ;;   (initialization): An error occurred while loading
  ;;   /home/mshinwell/.emacs.d/init.el: Symbol's value as variable is void:
  ;;   defun )
  ;; - "emacs foo" does not open "foo" seemingly without a keypress, which then
  ;;   also causes an error
  ;; - ":q" does not exit seemingly without a keypress
  ;; - Silence "no later matching history item" (needs match on the text)
  ;; - In tuareg mode, if you open a quote for a string, the cursor is not
  ;;   prevented from moving from the end of one line to the start of the
  ;;   next (upon pressing right-arrow), like it normally is
  ;; - Flickering upon scrolling
  ;; - Up/down arrows don't work after / (for search history)
  ;; - e.g. "4>" doesn't work; the 4 is ignored.
  ;; - When moving up to a previous ":sp" command, the cursor doesn't move to
  ;;   the end of the command suitable for easy editing
  ;; - Ctrl+G doesn't do the right thing.  This is a pain because sometimes
  ;;   the line/char positions aren't visible on the RHS of the status line
  ;;   (e.g. when window vertically split)
  ;; - Undo seems to be coalescing actions
  ;; - Something reverted window-combination-resize to t.
  ;; - Moving CR comments using < in tuareg mode screws up the indentation
  ;; - If you have a second frame in another tty then Ctrl+Z doesn't work to
  ;;   suspend the first one any more.  It says "There are other tty frames
  ;;   open; close them before suspending Emacs".
  ;; - Ediff bindings! The window motion keys don't work
  ;; - "Failed to apply window resizing" when trying to close a window
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-fine-undo t)
 '(helm-mode-handle-completion-in-region nil)
 '(hl-paren-background-colors (quote ("#ff1493")))
 '(hl-paren-colors (quote ("white" "IndianRed1" "IndianRed3" "IndianRed4")))
 '(smooth-scroll-margin 1)
 '(window-combination-resize nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#d3d3d3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :family "DejaVu Sans Mono"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(diff-added ((t (:foreground "color-48"))))
 '(diff-removed ((t (:foreground "color-198"))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "color-55"))))
 '(font-lock-doc-face ((t (:foreground "color-33"))))
 '(hl-line ((t (:background "color-234"))))
 '(link ((t (:foreground "color-172" :underline t :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "color-26"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "color-196" :foreground "color-208"))))
 '(region ((t (:background "color-17"))))
 '(show-paren-match ((t (:background "#ff1493" :foreground "white"))))
 '(show-paren-mismatch ((t (:background "color-196" :foreground "color-208")))))

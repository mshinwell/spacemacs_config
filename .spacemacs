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
   dotspacemacs-excluded-packages '(smartparens highlight-parentheses ocp-indent)
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

  ;; Silence:
  ;; Error (use-package): tuareg :init: Symbol’s value as variable is void: opam-load-path
  (setq opam-load-path "")

  ;; Start emacs server.
  ;; (server-start)

  ;; Stop evil mode grabbing Ctrl+Z, so we can use it for SIGSTOP instead.
  (setq evil-toggle-key "C-`")

  ;; TAB to select a completion, not RET.
  (setq-default dotspacemacs-configuration-layers '(
    (auto-completion :variables
      auto-completion-return-key-behavior 'nil
      auto-completion-tab-key-behavior 'complete)))

  ;; Make company-mode aware of merlin
;;  (with-eval-after-load 'company
;;    (add-to-list 'company-backends 'merlin-company-backend))

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
   dotspacemacs-editing-style 'vim
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
   dotspacemacs-smooth-scrolling nil
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
   dotspacemacs-persistent-server nil
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

  ;; Use company mode instead of auto-complete
  (global-company-mode)

  ;; Do the same thing as smooth scrolling mode, but without it
  (setq scroll-conservatively 101)

  ;; Merlin
  (add-to-list 'load-path "/mnt/local/sda1/mshinwell/opam/4.06.0+trunk/share/emacs/site-lisp")
  (setq merlin-command "/mnt/local/sda1/mshinwell/opam/4.06.0+trunk/bin/ocamlmerlin")
  (setq merlin-ac-setup 'easy)
  (setq merlin-completion-dwim t)
  (setq merlin-error-after-save nil)
  (require 'merlin)

  (setq company-auto-complete t)
  (setq company-auto-complete-chars "")
  (setq company-idle-delay 0.4)
  (setq company-minimum-prefix-length 3)

  ;; TAB to select a completion, not ENTER
  (add-hook 'company-mode-hook (lambda ()
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
    (define-key company-active-map [escape] 'company-abort)
    (define-key company-active-map (kbd "RET") nil)))

  ;; 80(etc)-column marker
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  (setq fci-rule-character-color "#666666")

  ;; Do not recentre the display upon Ctrl+L, just redraw it.
  (global-set-key (kbd "C-l") 'redraw-display)

  ;; Make Ctrl+Z suspend emacs
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z") 'suspend-frame)

  ;; When pressing / or ? to search, enable up/down arrows to move through
  ;; search history.
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)

  (electric-indent-mode 0)
  (setq tuareg-electric-indent nil)
  (setq-default tuareg-use-smie 0)

  ;; Automatic re-reading of files
  (global-auto-revert-mode 1)

  ;; Turn off display of whitespace characters in diff mode
  (setq diff-mode-hook nil)

  ;; Do not resize other windows when a window is closed
  (setq evil-auto-balance-windows nil)

  ;; Adjust the minimum height of a window to match vim
  (setq window-min-height 1)

  ;; Show matching parentheses.
  (show-paren-mode 1)

  ;; Multi-window mode for gdb mode
  (setq gdb-many-windows t)

  ;; Disable mouse clicks
  (xterm-mouse-mode 0)
  (gpm-mouse-mode 0)

  ;; Hack to prevent error, see https://github.com/syl20bnr/spacemacs/issues/8091
  (setq dotspacemacs-helm-use-fuzzy 'source)

  (setq projectile-switch-project-action 'projectile-dired)

  (setq helm-ff-skip-boring-files t)

  (setq helm-boring-file-regexp-list
    (append (progn (require 'helm-files) helm-boring-file-regexp-list)
            '("\\.cmi$" "\\.cmt$" "\\.cmti$" "\\.cmx$" "\\.d$" "\\.deps$"
              "\\.cmxa$" "\\.ml-gen$" "\\.modules$" "\\.pack-order$"
              "\\.libdeps$" "\\.names$" "\\.cmo$" "\\.cmo.js$" "\\.o$")))

  (add-hook 'tuareg-mode-hook (lambda ()
    (define-key tuareg-mode-map (kbd "<tab>") 'indent_for_tab_command)
    (define-key tuareg-mode-map [remap newline-and-indent] 'newline)
    (setq tuareg-electric-indent nil)
  ))
;;
;;  (evil-leader/set-key-for-mode 'tuareg-mode
;;    "SPC o i" 'merlin-switch-to-mli
;;    "SPC o o" 'merlin-switch-to-ml)

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

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-modified)

  (setq-default dotspacemacs-configuration-layers '(
    (org :variables org-enable-github-support t)))

  ;; Stop Merlin showing errors
;;  (merlin-toggle-view-errors)

  ;; Make Page Up / Page Down behave similarly to vim.
  (defun vim-page-down (&optional arg)
    (interactive "^P")
    (let ((remaining (count-lines (point) (buffer-end 1))))
      (if (< remaining (window-text-height))
        (progn
          (scroll-up (- (count-lines (window-start) (buffer-end 1)) 1))
          (goto-char (buffer-end 1)))
        (scroll-up (- (window-text-height) 2))
        (goto-char (window-start)))))

  (defun vim-page-up (&optional arg)
    (interactive "^P")
    (let ((old-start (window-start)))
      (if (eq old-start (buffer-end -1))
        (goto-char old-start)
        (scroll-down (- (window-text-height) 2))
        (goto-char old-start)
        (next-line))))

;;  (progn
;;    (scroll-down (- (count-lines (window-start) (buffer-end -1)) 1))
;;    (goto-char (buffer-end -1)))
;;;;
;;;;  (put 'vim-page-down 'isearch-scroll t)
;;;;  (put 'vim-page-down 'CUA 'move)
;;;;
;;;;  (put 'vim-page-up 'isearch-scroll t)
;;;;  (put 'vim-page-up 'CUA 'move)
;;;;
  (global-set-key [next] 'vim-page-down)
  (global-set-key [prior] 'vim-page-up)

  (add-to-list
    'display-buffer-alist
    '("\\*compilation\\*" display-buffer-reuse-window (reusable-frames . t))
  )

  (add-to-list
    'display-buffer-alist
    '(".*\\.ml" display-buffer-reuse-window (reusable-frames . t))
  )

  (add-to-list
   'display-buffer-alist
   '(".*\\.mli" display-buffer-reuse-window (reusable-frames . t))
  )

  (add-to-list
   'display-buffer-alist
   '(".*\\.c" display-buffer-reuse-window (reusable-frames . t))
  )

  (add-to-list
   'display-buffer-alist
   '(".*\\.h" display-buffer-reuse-window (reusable-frames . t))
  )

  (defun gdb-restore-windows-gud-io-and-source ()
    "Restore GUD buffer, IO buffer and source buffer next to each other."
    (interactive)
    ;; Select dedicated GUD buffer.
    (switch-to-buffer gud-comint-buffer)
    (delete-other-windows)
    (set-window-dedicated-p (get-buffer-window) t)
    (when (or gud-last-last-frame gdb-show-main)
      (let ((side-win (split-window nil nil t))
            (bottom-win (split-window))
            (middle-win (split-window)))
        (let ((bottom-right-win
               (split-window side-win (- (* 2 (window-height)) 1))))
          ;; Put source to the right.
          (set-window-buffer
           side-win
           (if gud-last-last-frame
               (gud-find-file (car gud-last-last-frame))
             (gud-find-file gdb-main-file)))
          (setq gdb-source-window side-win)
          ;; Show dedicated IO buffer in the middle
          (set-window-buffer
           middle-win
           (gdb-get-buffer-create 'gdb-inferior-io))
          (set-window-dedicated-p middle-win t)
          ;; Stack at the bottom left
          (set-window-buffer
           bottom-win
           (gdb-get-buffer-create 'gdb-stack-buffer))
          (set-window-dedicated-p bottom-win t)
          ;; Local vars at the bottom right
          (set-window-buffer
           bottom-right-win
           (gdb-get-buffer-create 'gdb-locals-buffer))
          (set-window-dedicated-p bottom-right-win t)
          ))))

(defun compilation-goto-locus (msg mk end-mk)
  "Jump to an error corresponding to MSG at MK.
All arguments are markers.  If END-MK is non-nil, mark is set there
and overlay is highlighted between MK and END-MK."
  ;; Show compilation buffer in other window, scrolled to this error.
;;  (message "window-buffer %s, marker-buffer msg %s"
;;   (window-buffer)
;;   (marker-buffer msg))
  (let* ((from-compilation-buffer (eq (window-buffer)
                                      (marker-buffer msg)))
         ;; Use an existing window if it is in a visible frame.
         (pre-existing (get-buffer-window (marker-buffer msg) 0))
         (w (if (and from-compilation-buffer pre-existing)
                ;; Calling display-buffer here may end up (partly) hiding
                ;; the error location if the two buffers are in two
                ;; different frames.  So don't do it if it's not necessary.
                pre-existing
	      (display-buffer (marker-buffer msg) '(nil (allow-no-window . t)))))
	 (highlight-regexp (with-current-buffer (marker-buffer msg)
			     ;; also do this while we change buffer
			     (goto-char (marker-position msg))
			     (and w (compilation-set-window w msg))
			     compilation-highlight-regexp)))
    ;; Ideally, the window-size should be passed to `display-buffer'
    ;; so it's only used when creating a new window.
    (when (and (not pre-existing) w)
      (compilation-set-window-height w))

    ;; Without this change, next-error changes the compilation buffer on the
    ;; right-hand frame for the source file.
;;    (if from-compilation-buffer
;;        ;; If the compilation buffer window was selected,
;;        ;; keep the compilation buffer in this window;
;;        ;; display the source in another window.
;;        (let ((pop-up-windows t))
;;          (pop-to-buffer (marker-buffer mk) 'other-window))
;;      (switch-to-buffer (marker-buffer mk)))
    (pop-to-buffer (marker-buffer mk) 'other-window)

    (unless (eq (goto-char mk) (point))
      ;; If narrowing gets in the way of going to the right place, widen.
      (widen)
      (if next-error-move-function
	  (funcall next-error-move-function msg mk)
	(goto-char mk)))
    (if end-mk
        (push-mark end-mk t)
      (if mark-active (setq mark-active nil)))
    ;; If hideshow got in the way of
    ;; seeing the right place, open permanently.
    (dolist (ov (overlays-at (point)))
      (when (eq 'hs (overlay-get ov 'invisible))
        (delete-overlay ov)
        (goto-char mk)))

    (when highlight-regexp
      (if (timerp next-error-highlight-timer)
	  (cancel-timer next-error-highlight-timer))
      (unless compilation-highlight-overlay
	(setq compilation-highlight-overlay
	      (make-overlay (point-min) (point-min)))
	(overlay-put compilation-highlight-overlay 'face 'next-error))
      (with-current-buffer (marker-buffer mk)
	(save-excursion
	  (if end-mk (goto-char end-mk) (end-of-line))
	  (let ((end (point)))
	    (if mk (goto-char mk) (beginning-of-line))
	    (if (and (stringp highlight-regexp)
		     (re-search-forward highlight-regexp end t))
		(progn
		  (goto-char (match-beginning 0))
		  (move-overlay compilation-highlight-overlay
				(match-beginning 0) (match-end 0)
				(current-buffer)))
	      (move-overlay compilation-highlight-overlay
			    (point) end (current-buffer)))
	    (if (or (eq next-error-highlight t)
		    (numberp next-error-highlight))
		;; We want highlighting: delete overlay on next input.
		(add-hook 'pre-command-hook
			  'compilation-goto-locus-delete-o)
	      ;; We don't want highlighting: delete overlay now.
	      (delete-overlay compilation-highlight-overlay))
	    ;; We want highlighting for a limited time:
	    ;; set up a timer to delete it.
	    (when (numberp next-error-highlight)
	      (setq next-error-highlight-timer
		    (run-at-time next-error-highlight nil
				 'compilation-goto-locus-delete-o)))))))
    (when (and (eq next-error-highlight 'fringe-arrow))
      ;; We want a fringe arrow (instead of highlighting).
      (setq next-error-overlay-arrow-position
	    (copy-marker (line-beginning-position))))))

(defun trap-nonsense ()
;;  (defun enter-debugger0 (arg) (debug))
  (defun enter-debugger1 (arg) (debug))
  (advice-add 'xterm-mouse-mode :before #'enter-debugger1)
;;  (advice-add 'company-mode :before #'enter-debugger0)
)

  ;; https://www.emacswiki.org/emacs/ToggleWindowSplit
  (defun rotate-split ()
    "If the frame is split vertically, split it horizontally or vice versa.
  Assumes that the frame is only split into two."
    (interactive)
    (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
    (let ((split-vertically-p (window-combined-p)))
      (delete-window) ; closes current window
      (if split-vertically-p
          (split-window-horizontally)
        (split-window-vertically)) ; gives us a split with the other window twice
      (switch-to-buffer nil))) ; restore the original window in this part of the frame

  ;; Put useful files first in the helm listings
;;  (defun prioritise-in-helm (filename)
;;    (let ((basename (file-name-extension filename)))
;;      (pcase basename
;;        ("ml" t)
;;        ("mli" t)
;;        ("c" t)
;;        ("h" t)
;;        (_ nil))))
;;
;;  (defun my-helm-buffers-sort-transformer (candidates _source)
;;    (if (string= helm-pattern "")
;;        candidates
;;      (sort candidates
;;            (lambda (s1 s2)
;;              (let ((s1_prioritise (prioritise-in-helm s1))
;;                    (s2_prioritise (prioritise-in-helm s2)))
;;                (if (eq s1_prioritise s2_prioritise)
;;                    (< (string-width s1) (string-width s2))
;;                  s1_prioritise))))))
;;
;;  (advice-add 'helm-buffers-sort-transformer
;;              :around 'my-helm-buffers-sort-transformer)

  ;; The following is done by custom-set-variables below.  It prevents use
  ;; of the dire helm completion-as-point when doing ":e <pathname>".
  ;; '(helm-mode-handle-completion-in-region nil)

  ;; NEW FAULTS
  ;; - When reloading .spacemacs, the highlight-search colour changes to
  ;;   yellow.
  ;; - whitespace-mode is no longer disabled in diff-mode

  ;; Things to fix
  ;; - Helm completion on file/directory names should never pick one if there
  ;;   are multiple matches when you press tab
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

;; New list of annoyances
;; Tab behaviour in OCaml mode.  Below "<spc><spc><spc><spc>|<spc>id<spc>->"
;; it indents under the "d"...
;; Company mode switching itself on after it's been disabled
;; Company mode completing not only on "."
;; When I search for something, the highlighting seems to be case insensitive,
;; even though the search itself is case sensitive.
;; "ZZ" is inconsistent.  Sometimes it quits when there are buffers remaining.
;; Make Tab in tuareg mode just go to the first non-space column from the
;; previous line, or if that is zero, indent by 8
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-buffer-alist
   (quote
    ((".*\\.h" display-buffer-reuse-window
      (reusable-frames . t))
     (".*\\.c" display-buffer-reuse-window
      (reusable-frames . t))
     (".*\\.mli" display-buffer-reuse-window
      (reusable-frames . t))
     (".*\\.ml" display-buffer-reuse-window
      (reusable-frames . t))
     ("\\*compilation\\*" display-buffer-reuse-window
      (reusable-frames . t)))))
 '(evil-want-fine-undo t)
 '(helm-ff-lynx-style-map nil)
 '(helm-mode-handle-completion-in-region nil)
 '(hl-paren-background-colors (quote ("#ff1493")))
 '(hl-paren-colors (quote ("white" "IndianRed1" "IndianRed3" "IndianRed4")))
 '(package-selected-packages
   (quote
    (log4e powerline spinner org alert merlin markdown-mode hydra projectile request anzu autothemer company bind-key packed auto-complete avy yasnippet iedit smartparens bind-map highlight evil undo-tree helm helm-core magit magit-popup git-commit with-editor dash async disable-mouse zonokai-theme zenburn-theme zen-and-art-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle seti-theme reverse-theme restart-emacs rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme elisp-slime-nav dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(smooth-scroll-margin 1)
 '(tab-width 8)
 '(tuareg-electric-indent nil)
 '(tuareg-indent-comments nil)
 '(tuareg-indent-leading-comments nil)
 '(window-combination-resize nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#d3d3d3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Monospace"))))
 '(diff-added ((t (:foreground "color-71"))))
 '(diff-indicator-removed ((t (:foreground "color-197"))))
 '(diff-refine-added ((t (:background "color-28"))))
 '(diff-removed ((t (:foreground "color-198"))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "color-55"))))
 '(font-lock-doc-face ((t (:foreground "color-33"))))
 '(hl-line ((t (:background "color-234"))))
 '(merlin-type-face ((t (:background "color-161"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "color-105"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "color-27"))))
 '(region ((t (:background "color-17"))))
 '(show-paren-mismatch ((t (:background "color-196" :foreground "color-208"))))
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "color-28"))))
 '(spaceline-highlight-face ((t (:background "#eeeeee" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(spaceline-modified ((t (:background "#bb0055" :foreground "#000000" :inherit (quote mode-line)))))
 '(spaceline-read-only ((t (:background "#444444" :foreground "#999999" :inherit (quote mode-line)))))
 '(spaceline-unmodified ((t (:background "#666666" :foreground "#000000" :inherit (quote mode-line))))))

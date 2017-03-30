;; emacs kicker --- kick start emacs setup
;; Copyright (C) 2010 Dimitri Fontaine

;; Author: Dimitri Fontaine <dim@tapoueh.org>
;; URL: https://github.com/dimitri/emacs-kicker
;; Created: 2011-04-15
;; Keywords: emacs setup el-get kick-start starter-kit
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin")
)
(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(require 'cl)				; common lisp goodies, loop
(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)

(setq inhibit-startup-message t)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")


(defun custom-set-frame-size ()
(add-to-list 'default-frame-alist '(height . 64))
(add-to-list 'default-frame-alist '(width . 120)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; undo
(defvar killed-file-list nil
  "List of recently killed files.")

(defun add-file-to-killed-file-list ()
  "If buffer is associated with a file name, add that file to the
  `killed-file-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name killed-file-list)))

(add-hook 'kill-buffer-hook #'add-file-to-killed-file-list)

(defun reopen-killed-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when killed-file-list
    (find-file (pop killed-file-list))))


;; welcome screen
(recentf-mode 1)
(setq init-open-recentf-interface 'ido)
(init-open-recentf)
(desktop-save-mode 1)

(setq-default mode-line-format
              '("%e" mode-line-front-space
                ;; Standard info about the current buffer
                ;;mode-line-mule-info
                mode-line-buffer-identification ;;" " mode-line-position
                ;; Some specific information about the current buffer:
                ;; Misc information, notably battery state and function name
                " "
                mode-line-misc-info
                ;; And the modes, which I don't really care for anyway
                               ))

;; 让 tab 键在 evil-mode & org-mode 下可用
(setq evil-want-C-i-jump nil)
(setq evil-want-C-u-scroll t)
(setq evil-cjk-emacs-word-boundary t)


(require 'evil)
(require 'evil-leader)
;; https://github.com/Vodurden/devbox/commit/bdecf8d1a93288f56b2ec61f13510f881931be74
(setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-this-buffer
  "z" 'reopen-killed-file
  "mp" 'org-pomodoro
  "mi" 'org-toggle-inline-images
  "mm" 'org-insert-heading-after-current
  "a" 'org-insert-heading-after-current
  "ma" 'org-insert-heading-after-current
  "mn" 'org-add-note
  "w" 'other-window
  "o" 'org-open-at-point
  "|" (lambda () (interactive)(split-window-horizontally) (other-window 1))
  "\\" (lambda () (interactive)(split-window-horizontally) (other-window 1))
  "-" (lambda () (interactive)(split-window-vertically) (other-window 1))
  "_" (lambda () (interactive)(split-window-vertically) (other-window 1))
)
(global-evil-leader-mode)
(evil-mode 1)


;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 
(setq vc-follow-symlinks nil)
(load-theme 'tango-dark t) 

(require 'ido)
(ido-mode t)

(setq socks-noproxy '("127.0.0.1"))
(setq socks-server '("Default server" "127.0.0.1" 1080 5))
(setq url-gateway-method 'socks)

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup)
(global-set-key (kbd "M-x") 'helm-M-x)
(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq-default indent-tabs-mode nil)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)




(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
          (make-temp-name
            (concat (buffer-file-name)
                    "_"
                    (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

;; org mode
(auto-image-file-mode t)
(setq org-descriptive-links nil)
(setq org-startup-folded 'content  ; t, 'overview, 'content, 'showall.
      org-startup-indented nil
      org-startup-truncated t
      org-startup-with-inline-images t
)
(defun org-toggle-iimage-in-org () 

  　　"display images in your org file"
  　　(interactive) 
  　　(if (face-underline-p 'org-link) 
                            (set-face-underline-p 'org-link nil)
                            (set-face-underline-p 'org-link t)) 
  (iimage-mode)
  ) 

(defun save-framegeometry ()
  "Gets the current frame's geometry and saves to ~/.emacs.d/framegeometry."
  (let (
        (framegeometry-left (frame-parameter (selected-frame) 'left))
        (framegeometry-top (frame-parameter (selected-frame) 'top))
        (framegeometry-width (frame-parameter (selected-frame) 'width))
        (framegeometry-height (frame-parameter (selected-frame) 'height))
        (framegeometry-file (expand-file-name "~/.emacs.d/framegeometry"))
        )

    (when (not (number-or-marker-p framegeometry-left))
      (setq framegeometry-left 0))
    (when (not (number-or-marker-p framegeometry-top))
      (setq framegeometry-top 0))
    (when (not (number-or-marker-p framegeometry-width))
      (setq framegeometry-width 0))
    (when (not (number-or-marker-p framegeometry-height))
      (setq framegeometry-height 0))

    (with-temp-buffer
      (insert
       ";;; This is the previous emacs frame's geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       "      '(\n"
       (format "        (top . %d)\n" (max framegeometry-top 0))
       (format "        (left . %d)\n" (max framegeometry-left 0))
       (format "        (width . %d)\n" (max framegeometry-width 0))
       (format "        (height . %d)))\n" (max framegeometry-height 0)))
      (when (file-writable-p framegeometry-file)
        (write-file framegeometry-file))))
  )

(defun load-framegeometry ()
  "Loads ~/.emacs.d/framegeometry which should load the previous frame's geometry."
  (let ((framegeometry-file (expand-file-name "~/.emacs.d/framegeometry")))
    (when (file-readable-p framegeometry-file)
      (load-file framegeometry-file)))
  )

;; Special work to do ONLY when there is a window system being used
(if window-system
    (progn
      (add-hook 'after-init-hook 'load-framegeometry)
      (add-hook 'kill-emacs-hook 'save-framegeometry))
  )

;; eof




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(sml/mode-width
   (if
       (eq
	(powerline-current-separator)
	(quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active1)
		   nil)))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   nil
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active2)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

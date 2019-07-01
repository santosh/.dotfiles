;; Hide clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; line numbers
(global-linum-mode 1)

;; TODO: Change default tab settings
;; TODO: Do not litter '~' files everywhere

;; font
(set-default-font "Fira Code 12")

;; indentation by default; no pressing C-j
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'package)
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(defun my-go-mode-hook ()
  ; gofmt before every save
  (add-hook 'before-save-hook 'gofmt-before-save) 

  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

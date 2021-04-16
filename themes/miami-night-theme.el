;;; Package --- summary:

;;; Commentary:
;; Miami Night theme

;;; miami-night-theme.el

;;; Code:

(deftheme miami-night)

(let ((background     "#181818")
      (foreground     "#b2b2b2")

      (gray-0         "#212121")
      (gray-1         "#2a2a2a")
      (gray-2         "#3d3d3d")
      (gray-3         "#555555")
      (gray-4         "#6f6f6f")
      (gray-5         "#777777")
      (gray-6         "#8a8a8a")
      (gray-7         "#aaaaaa")
      (white          "#ffffff")
      (black          "#000000")

      (blue           "#68aff7")
      (blue-light     "#939bcc")
      (blue-dark      "#5a70ad")
      (cyan           "#25d4e2")
      (cyan-light     "#46f7ff")
      (purple         "#8f45f7")
      (purple-light   "#ad73f9")
      (purple-light-2 "#b5a5c6")
      (purple-dark    "#410070")
      (red            "#d83b8c")
      (red-light      "#fa54a5")
      (violet         "#6305e6")
      (violet-light   "#8056f3")
      )

  (custom-theme-set-faces
   'miami-night

   ;; Built-in stuff
   `(default                                 ((t (:background ,background :foreground ,foreground, :weight normal))))
   `(border                                  ((t (:background ,background :foreground ,gray-2))))
   `(border-glyph                            ((t (nil))))
   `(cursor                                  ((t (:background ,cyan))))
   `(fringe                                  ((t (:background ,background))))
   `(vertical-border                         ((t (:foreground ,gray-1 :background ,background))))
   `(gui-element                             ((t (:background ,background :foreground ,foreground))))
   `(highlight                               ((t (:foreground ,black :background ,cyan))))
   `(link                                    ((t (:foreground ,blue-light))))
   `(link-visited                            ((t (:foreground ,blue-light))))
   `(minibuffer-prompt                       ((t (:foreground ,foreground))))
   `(mode-line                               ((t (:background ,gray-1 :foreground ,gray-4 :box (:line-width 5 :color ,gray-1 :style nil)))))
   `(mode-line-buffer-id                     ((t (:foreground ,purple-light :background nil))))
   `(mode-line-emphasis                      ((t (:foreground ,white :slant italic))))
   `(mode-line-highlight                     ((t (:foreground ,cyan :box nil :weight bold))))
   `(mode-line-inactive                      ((t (:inherit mode-line :background ,gray-0 :box (:line-width 5 :color ,gray-0 :style nil)))))
   `(region                                  ((t (:background ,gray-1))))
   `(secondary-selection                     ((t (:background ,gray-2))))
   `(error                                   ((t (:foreground ,red :weight normal))))
   `(warning                                 ((t (:foreground ,blue :weight normal))))
   `(success                                 ((t (:foreground ,cyan :weight normal))))
   `(tooltip                                 ((t (:foreground ,foreground :background ,black, :weight normal))))

   `(header-line                             ((t (:inherit mode-line :foreground ,gray-4 :background nil))))

   ;; Font-lock stuff
   `(font-lock-annotation-face               ((t (:foreground ,gray-5))))
   `(font-lock-builtin-face                  ((t (:foreground ,blue))))
   `(font-lock-comment-delimiter-face        ((t (:foreground ,gray-3))))
   `(font-lock-comment-face                  ((t (:foreground ,gray-4))))
   `(font-lock-constant-face                 ((t (:foreground ,blue))))
   `(font-lock-doc-face                      ((t (:foreground ,gray-4))))
   `(font-lock-doc-string-face               ((t (:foreground ,gray-4))))
   `(font-lock-function-name-face            ((t (:foreground ,white))))
   `(font-lock-keyword-face                  ((t (:foreground ,purple))))
   `(font-lock-negation-char-face            ((t (:foreground ,red))))
   `(font-lock-number-face                   ((t (:foreground ,cyan))))
   `(font-lock-operator-face                 ((t (:foreground ,blue-light))))
   `(font-lock-parenthesis-face              ((t (:foreground ,purple-light))))
   `(font-lock-preprocessor-face             ((t (:foreground ,blue))))
   `(font-lock-regexp-grouping-backslash     ((t (:foreground ,cyan))))
   `(font-lock-regexp-grouping-construct     ((t (:foreground ,cyan))))
   `(font-lock-return-face                   ((t (:foreground ,cyan))))
   `(font-lock-string-face                   ((t (:foreground ,gray-5))))
   `(font-lock-type-face                     ((t (:foreground ,blue-light))))
   `(font-lock-variable-name-face            ((t (:foreground ,foreground))))
   `(font-lock-warning-face                  ((t (:foreground ,red-light))))

   `(highlight-numbers-number                ((t (:foreground ,cyan))))
   `(highlight-todo                          ((t (:foreground ,black :background ,purple))))
   `(highlight-fixme                         ((t (:foreground ,black :background ,red))))
   `(highlight-symbol-mode                   ((t (:background ,gray-3))))
   `(highlight-operators-face                ((t (:foreground ,blue-light))))

   ;; linum-mode
   `(linum                                   ((t (:background ,black :foreground ,gray-3))))

   ;; vimish-fold
   `(vimish-fold-fringe                      ((t (:foreground ,gray-3))))
   `(vimish-fold-overlay                     ((t (:foreground ,foreground :background ,purple-dark))))

   ;; Search
   `(match                                   ((t (:foreground ,blue :background ,gray-1))))
   `(isearch                                 ((t (:foreground ,blue-light :background ,gray-1))))
   `(isearch-lazy-highlight-face             ((t (:foreground ,cyan-light :background ,gray-1))))
   `(isearch-fail                            ((t (:background ,gray-1 :inherit font-lock-warning-face))))

   ;; Flycheck
   `(flycheck-error                         ((t (:underline ,red))))
   `(flycheck-warning                       ((t (:underline ,blue))))
   `(flycheck-info                          ((t (:underline ,purple-light))))
   `(flycheck-fringe-error                  ((t (:inherit error))))
   `(flycheck-fringe-warning                ((t (:inherit warning))))
   `(flycheck-fringe-info                   ((t (:foreground ,purple-light))))
   `(flycheck-posframe-error-face           ((t (:foreground ,foreground :weight normal))))

   ;; Flymake
   `(flymake-warnline                        ((t (:inherit flycheck-warning))))
   `(flymake-errline                         ((t (:inherit flycheck-error))))
   `(flymake-infoline                        ((t (:inherit flycheck-info))))

   ;; CSS-mode
   `(css-font-lock-keywords                  ((t (:foreground ,blue-light))))
   `(css-class                               ((t (:foreground ,purple-light))))
   `(css-selector                            ((t (:foreground ,white))))
   `(css-property                            ((t (:foreground ,blue-light))))
   `(css-element                             ((t (:foreground ,white))))

   ;; PHP-mode
   `(php-variable-identifier                 ((t (:foreground ,gray-4))))
   `(php-object-arrow                        ((t (:foreground ,cyan))))
   `(php-instruction-separator               ((t (:foreground ,gray-4))))
   `(php-return-statement                    ((t (:inherit font-lock-return-face))))
   `(php-this-variable                       ((t (:foreground ,blue))))
   `(php-annotations-annotation-face         ((t (:foreground ,gray-6))))

   ;; js2-mode
   `(js2-warning                             ((t (:underline ,purple-light))))
   `(js2-error                               ((t (:underline ,red))))
   `(js2-jsdoc-tag                           ((t (:foreground ,gray-5))))
   `(js2-jsdoc-type                          ((t (:foreground ,gray-5))))
   `(js2-jsdoc-value                         ((t (:foreground ,gray-5))))
   `(js2-function-param                      ((t (:foreground ,foreground))))
   `(js2-function-call                       ((t (:foreground ,white))))
   `(js2-instance-member                     ((t (:foreground ,blue))))
   `(js2-private-member                      ((t (:foreground ,blue-light))))
   `(js2-private-function-call               ((t (:foreground ,blue-light))))
   `(js2-jsdoc-html-tag-name                 ((t (:foreground ,violet-light))))
   `(js2-jsdoc-html-tag-delimiter            ((t (:foreground ,violet))))
   `(js2-external-variable                   ((t (:foreground ,blue))))
   `(js2-instruction-separator               ((t (:foreground ,gray-4))))
   `(js2-return-statement                    ((t (:inherit font-lock-return-face))))

   ;; web-mode
   `(web-mode-builtin-face                   ((t (:inherit font-lock-builtin-face))))
   `(web-mode-comment-face                   ((t (:inherit font-lock-comment-face))))
   `(web-mode-constant-face                  ((t (:inherit font-lock-constant-face))))
   `(web-mode-current-element-highlight-face ((t (:background ,blue-light))))
   `(web-mode-css-at-rule-face               ((t (:foreground ,cyan))))
   `(web-mode-css-pseudo-class-face          ((t (:foreground ,foreground))))
   `(web-mode-doctype-face                   ((t (:foreground ,cyan-light))))
   ;; `(web-mode-folded-face
   ;; `(web-mode-function-name-face
   `(web-mode-html-attr-name-face            ((t (:foreground ,purple))))
   `(web-mode-html-attr-value-face           ((t (:inherit font-lock-string-face))))
   `(web-mode-html-entity-face               ((t (:foreground ,blue-light))))
   `(web-mode-html-tag-face                  ((t (:foreground ,purple-light))))
   `(web-mode-keyword-face                   ((t (:foreground ,blue))))
   `(web-mode-preprocessor-face              ((t (:foreground ,cyan))))
   `(web-mode-string-face                    ((t (:inherit font-lock-string-face))))
   `(web-mode-type-face                      ((t (:inherit font-lock-type-face))))
   `(web-mode-variable-name-face             ((t (:inherit font-lock-variable-name-face))))
   `(web-mode-warning-face                   ((t (:inherit font-lock-warning-face))))
   ;; `(web-mode-block-attr-name-face           ((t (:foreground ,white))))
   ;; `(web-mode-block-attr-value-face          ((t (:foregrounc ,white))))
   `(web-mode-block-variable-name-face       ((t (:foreground ,white))))
   `(web-mode-block-comment-face             ((t (:inherit font-lock-comment-face))))
   `(web-mode-block-control-face             ((t (:foreground ,cyan-light))))
   `(web-mode-block-delimiter-face           ((t (:foreground ,cyan))))
   `(web-mode-block-face                     ((t (:foreground ,cyan))))
   ;; `(web-mode-block-string-face
   ;; `(web-mode-comment-keyword-face
   ;; `(web-mode-css-color-face
   ;; `(web-mode-css-function-face
   ;; `(web-mode-css-priority-face
   `(web-mode-css-property-name-face         ((t (:foreground ,blue-light))))
   `(web-mode-css-selector-face              ((t (:foreground ,white))))
   `(web-mode-css-string-face                ((t (:inherit font-lock-string-face))))
   `(web-mode-javascript-string-face         ((t (:inherit font-lock-string-face))))
   ;; `(web-mode-json-context-face
   ;; `(web-mode-json-key-face
   `(web-mode-json-string-face               ((t (:inherit font-lock-string-face))))
   ;; `(web-mode-param-name-face
   ;; `(web-mode-part-comment-face
   ;; `(web-mode-part-face
   ;; `(web-mode-part-string-face
   `(web-mode-symbol-face                    ((t (:foreground ,blue))))
   ;; `(web-mode-whitespace-face
   `(web-mode-html-tag-bracket-face          ((t (:foreground ,gray-5))))
   `(web-mode-css-comment-face               ((t (:inherit font-lock-comment-face))))
   `(web-mode-css-variable-face              ((t (:inherit font-lock-variable-name-face))))
   `(web-mode-error-face                     ((t (:inherit error))))
   ;; `(web-mode-function-call-face
   `(web-mode-html-attr-custom-face          ((t (:foreground ,violet-light))))
   `(web-mode-html-attr-engine-face          ((t (:inherit web-mode-html-attr-custom-face))))
   `(web-mode-html-attr-equal-face           ((t (:foreground ,foreground))))
   `(web-mode-html-tag-custom-face           ((t (:foreground ,blue-dark))))
   `(web-mode-javascript-comment-face        ((t (:inherit font-lock-comment-face))))
   `(web-mode-json-comment-face              ((t (:inherit web-mode-javascript-comment-face))))

   ;; which-function
   `(which-func                              ((t (:foreground ,blue :background nil :weight bold))))

   `(trailing-whitespace                     ((t (:background ,cyan-light :foreground ,blue-light))))
   `(whitespace-empty                        ((t (:foreground ,red :background ,blue-light))))
   `(whitespace-hspace                       ((t (:background ,gray-4 :foreground ,gray-4))))
   `(whitespace-indentation                  ((t (:background ,blue-light :foreground ,red))))
   `(whitespace-line                         ((t (:background ,gray-1 :foreground ,purple))))
   `(whitespace-newline                      ((t (:foreground ,gray-4))))
   `(whitespace-space                        ((t (:background ,gray-1 :foreground ,gray-4))))
   `(whitespace-space-after-tab              ((t (:background ,blue-light :foreground ,red))))
   `(whitespace-space-before-tab             ((t (:background ,red-light :foreground ,red))))
   `(whitespace-tab                          ((t (:background ,gray-4 :foreground ,gray-4))))
   `(whitespace-trailing                     ((t (:background ,red :foreground ,blue-light))))

   ;; Parenthesis matching (built-in)
   `(show-paren-match                        ((t (:background ,white :foreground ,black))))
   `(show-paren-mismatch                     ((t (:background ,red-light :foreground ,black))))

   ;; Parenthesis matching (mic-paren)
   `(paren-face-match                        ((t (:foreground nil :background nil :inherit show-paren-match))))
   `(paren-face-mismatch                     ((t (:foreground nil :background nil :inherit show-paren-mismatch))))
   `(paren-face-no-match                     ((t (:foreground nil :background nil :inherit show-paren-mismatch))))

   `(diff-added                              ((t (:foreground ,cyan))))
   `(diff-changed                            ((t (:foreground ,blue-light))))
   `(diff-removed                            ((t (:foreground ,red))))
   `(diff-header                             ((t (:background ,gray-1))))
   `(diff-file-header                        ((t (:background ,gray-2))))
   `(diff-hunk-header                        ((t (:background ,gray-1 :foreground ,purple-light))))

   `(ediff-even-diff-A                       ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-even-diff-B                       ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-odd-diff-A                        ((t (:foreground ,gray-4 :background nil :inverse-video t))))
   `(ediff-odd-diff-B                        ((t (:foreground ,gray-4 :background nil :inverse-video t))))

   `(eldoc-highlight-function-argument       ((t (:foreground ,cyan :weight bold))))

   ;; helm
   `(helm-source-header                      ((t (:foreground ,white))))
   `(helm-visible-mark                       ((t (:foreground ,white :background ,black))))
   `(helm-selection                          ((t (:background ,gray-1))))
   `(helm-candidate-number                   ((t (:foreground ,blue))))
   `(helm-prefarg                            ((t (:foreground ,cyan-light))))
   `(helm-match                              ((t (:foreground ,cyan-light))))
   `(helm-separator                          ((t (:foreground ,red-light))))
   ;; helm-command
   `(helm-M-x-key                            ((t (:foreground ,blue-light))))
   ;; helm-buffers
   `(helm-buffer-saved-out                   ((t (:foreground ,red))))
   `(helm-buffer-not-saved                   ((t (:foreground ,red-light))))
   `(helm-buffer-size                        ((t (:foreground ,blue-light))))
   `(helm-buffer-file                        ((t (:foreground ,foreground))))
   `(helm-buffer-process                     ((t (:foreground ,blue-light))))
   `(helm-buffer-directory                   ((t (:foreground ,blue))))
   ;; helm-files
   `(helm-ff-prefix                          ((t (:foreground ,black :background ,cyan))))
   `(helm-ff-executable                      ((t (:foreground ,cyan))))
   `(helm-ff-directory                       ((t (:foreground ,blue))))
   `(helm-ff-dotted-directory                ((t (:foreground ,gray-2))))
   `(helm-ff-symlink                         ((t (:foreground ,red))))
   `(helm-ff-invalid-symlink                 ((t (:foreground ,black :background ,red-light))))
   `(helm-ff-file                            ((t (:foreground ,foreground))))
   `(helm-history-deleted                    ((t (:foreground ,black :background ,red-light))))
   `(helm-history-remote                     ((t (:foreground ,purple-light))))
   ;; helm-grep
   `(helm-grep-match                         ((t (:inherit helm-match))))
   `(helm-grep-file                          ((t (:foreground ,foreground))))
   `(helm-grep-lineno                        ((t (:foreground ,purple-light))))
   `(helm-grep-running                       ((t (:foreground ,red))))
   `(helm-grep-finish                        ((t (:foreground ,cyan))))
   `(helm-grep-cmd-line                      ((t (:foreground ,foreground))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face       ((t (:foreground ,gray-6))))
   `(undo-tree-visualizer-current-face       ((t (:foreground ,cyan :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,red))))
   `(undo-tree-visualizer-register-face      ((t (:foreground ,blue-light))))

   ;; guide-key
   `(guide-key/prefix-command-face           ((t (:foreground ,purple-light))))
   `(guide-key/higlight-command-face         ((t (:foreground ,cyan))))
   `(guide-key/key-face                      ((t (:foreground ,gray-4))))

   ;; company
   `(company-tooltip                         ((t (:foreground ,foreground :background ,gray-1))))
   `(company-tooltip-selection               ((t (:foreground ,white :background ,purple))))
   `(company-tooltip-common                  ((t (:foreground ,cyan :inherit company-tooltip))))
   `(company-tooltip-common-selection        ((t (:weight bold :inherit company-tooltip-selection))))
   `(company-tooltip-annotation              ((t (:foreground ,purple-light :inherit company-tooltip))))
   `(company-scrollbar-fg                    ((t (:background ,cyan))))
   `(company-scrollbar-bg                    ((t (:background ,gray-1))))
   `(company-preview                         ((t (:foreground ,cyan-light :background ,black))))
   `(company-preview-common                  ((t (:inherit company-preview))))
   `(company-preview-search                  ((t (:foreground ,red :inherit company-preview))))
   `(company-echo-common                     ((t (:foreground ,cyan :background nil))))

   ;; evil
   `(evil-ex-info                            ((t (:foreground ,red :slant italic))))
   `(evil-ex-command                         ((t (:foreground ,purple-light :slant italic))))
   `(evil-snipe-first-match-face             ((t (:foreground ,white :background ,purple))))
   `(evil-snipe-matches-face                 ((t (:foreground ,black :background ,purple))))
   `(evil-mode-line-insert                   ((t (:foreground ,black :background ,cyan-light :weight bold))))
   `(evil-mode-line-visual                   ((t (:foreground ,black :background ,blue :weight bold))))
   `(evil-mode-line-replace                  ((t (:foreground ,black :background ,red :weight bold))))
   `(evil-mode-line-normal                   ((t (:foreground ,gray-1))))

   ;; dired+
   `(diredp-compressed-file-suffix           ((t (:foreground ,blue))))
   `(diredp-dir-heading                      ((t (:foreground nil :background nil :inherit heading))))
   `(diredp-dir-priv                         ((t (:foreground ,cyan-light :background nil))))
   `(diredp-exec-priv                        ((t (:foreground ,blue :background nil))))
   `(diredp-executable-tag                   ((t (:foreground ,red :background nil))))
   `(diredp-file-name                        ((t (:foreground ,blue-light))))
   `(diredp-file-suffix                      ((t (:foreground ,cyan))))
   `(diredp-flag-mark-line                   ((t (:background nil :inherit highlight))))

   `(diredp-ignored-file-name                ((t (:foreground ,gray-4))))
   `(diredp-link-priv                        ((t (:background nil :foreground ,purple-light))))
   `(diredp-mode-line-flagged                ((t (:foreground ,red))))
   `(diredp-mode-line-marked                 ((t (:foreground ,cyan))))
   `(diredp-no-priv                          ((t (:background nil))))
   `(diredp-number                           ((t (:foreground ,blue-light))))
   `(diredp-other-priv                       ((t (:background nil :foreground ,purple-light))))
   `(diredp-rare-priv                        ((t (:foreground ,red :background nil))))
   `(diredp-read-priv                        ((t (:foreground ,cyan :background nil))))
   `(diredp-symlink                          ((t (:foreground ,purple-light))))
   `(diredp-write-priv                       ((t (:foreground ,blue-light :background nil))))

   ;; term and ansi-term
   `(term-color-black                        ((t (:foreground ,gray-2 :background ,background))))
   `(term-color-white                        ((t (:foreground ,gray-5 :background ,white))))
   `(term-color-red                          ((t (:foreground ,red :background ,red))))
   `(term-color-yellow                       ((t (:foreground ,blue-light :background ,blue-light))))
   `(term-color-green                        ((t (:foreground ,cyan :background ,cyan))))
   `(term-color-cyan                         ((t (:foreground ,cyan-light :background ,cyan-light))))
   `(term-color-blue                         ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta                      ((t (:foreground ,purple-light :background ,purple-light))))

   ;; Magit (a patch is pending in magit to make these standard upstream)
   `(magit-branch                            ((t (:foreground ,cyan))))
   `(magit-header                            ((t (:inherit nil :weight bold))))
   `(magit-item-highlight                    ((t (:inherit highlight :background nil))))
   `(magit-log-graph                         ((t (:foreground ,gray-4))))
   `(magit-log-sha1                          ((t (:foreground ,purple-light))))
   `(magit-log-head-label-bisect-bad         ((t (:foreground ,red))))
   `(magit-log-head-label-bisect-good        ((t (:foreground ,cyan))))
   `(magit-log-head-label-default            ((t (:foreground ,blue-light :box nil :weight bold))))
   `(magit-log-head-label-local              ((t (:foreground ,blue))))
   `(magit-log-head-label-remote             ((t (:foreground ,cyan))))
   `(magit-log-head-label-tags               ((t (:foreground ,cyan-light :box nil :weight bold))))
   `(magit-section-title                     ((t (:inherit diff-hunk-header))))

   `(link                                    ((t (:foreground nil :underline t))))
   `(widget-button                           ((t (:underline t))))
   `(widget-field                            ((t (:background ,gray-3 :box (:line-width 1 :color ,gray-6)))))

   ;; Compilation (most faces politely inherit from 'success, 'error, 'warning etc.)
   `(compilation-info                        ((t (:foreground ,blue))))
   `(compilation-column-number               ((t (:foreground ,blue-light))))
   `(compilation-line-number                 ((t (:foreground ,purple-light))))
   `(compilation-message-face                ((t (:foreground ,blue))))
   `(compilation-mode-line-exit              ((t (:foreground ,cyan))))
   `(compilation-mode-line-fail              ((t (:foreground ,red))))
   `(compilation-mode-line-run               ((t (:foreground ,blue))))

   ;; Grep
   `(grep-context-face                       ((t (:foreground ,gray-4))))
   `(grep-error-face                         ((t (:foreground ,red :weight bold :underline t))))
   `(grep-hit-face                           ((t (:foreground ,blue))))
   `(grep-match-face                         ((t (:foreground nil :background nil :inherit match))))

   `(regex-tool-matched-face                 ((t (:foreground nil :background nil :inherit match))))

   ;; mark-multiple
   `(mm/master-face                          ((t (:inherit region :foreground nil :background nil))))
   `(mm/mirror-face                          ((t (:inherit region :foreground nil :background nil))))

   ;; org-mode
   `(org-agenda-structure                    ((t (:foreground ,purple-light))))
   `(org-agenda-date                         ((t (:foreground ,blue :underline nil))))
   `(org-agenda-done                         ((t (:foreground ,cyan))))
   `(org-agenda-dimmed-todo-face             ((t (:foreground ,gray-4))))
   `(org-block                               ((t (:foreground ,red-light))))
   `(org-code                                ((t (:foreground ,blue-light))))
   `(org-column                              ((t (:background ,gray-3))))
   `(org-column-title                        ((t (:inherit org-column :weight bold :underline t))))
   `(org-date                                ((t (:foreground ,purple-light :underline t))))
   `(org-document-info                       ((t (:foreground ,cyan-light))))
   `(org-document-info-keyword               ((t (:foreground ,cyan))))
   `(org-document-title                      ((t (:weight bold :foreground ,red-light :height 1.44))))
   `(org-done                                ((t (:foreground ,cyan))))
   `(org-ellipsis                            ((t (:foreground ,gray-4))))
   `(org-footnote                            ((t (:foreground ,cyan-light))))
   `(org-formula                             ((t (:foreground ,red))))
   `(org-hide                                ((t (:foreground ,gray-3))))
   `(org-link                                ((t (:foreground ,blue))))
   `(org-scheduled                           ((t (:foreground ,cyan))))
   `(org-scheduled-previously                ((t (:foreground ,red-light))))
   `(org-scheduled-today                     ((t (:foreground ,cyan))))
   `(org-special-keyword                     ((t (:foreground ,red-light))))
   `(org-table                               ((t (:foreground ,purple-light))))
   `(org-todo                                ((t (:foreground ,red))))
   `(org-upcoming-deadline                   ((t (:foreground ,red-light))))
   `(org-warning                             ((t (:weight bold :foreground ,red))))

   `(markdown-code-face                      ((t nil))))
   `(markdown-url-face                       ((t (:inherit link))))
   `(markdown-link-face                      ((t (:foreground ,blue :underline t))))

   `(hl-sexp-face                            ((t (:background ,gray-3))))
   `(highlight-80+                           ((t (:background ,gray-3))))

   ;; Python-specific overrides
   `(py-builtins-face                        ((t (:foreground ,red-light :weight normal))))

   ;; nxml
   `(nxml-name-face                          ((t (:foreground unspecified :inherit font-lock-constant-face))))
   `(nxml-attribute-local-name-face          ((t (:foreground unspecified :inherit font-lock-variable-name-face))))
   `(nxml-ref-face                           ((t (:foreground unspecified :inherit font-lock-preprocessor-face))))
   `(nxml-delimiter-face                     ((t (:foreground unspecified :inherit font-lock-keyword-face))))
   `(nxml-delimited-data-face                ((t (:foreground unspecified :inherit font-lock-string-face))))
   `(rng-error-face                          ((t (:underline ,red))))

   ;; RHTML
   `(erb-delim-face                          ((t (:background ,gray-3))))
   `(erb-exec-face                           ((t (:background ,gray-3 :weight bold))))
   `(erb-exec-delim-face                     ((t (:background ,gray-3))))
   `(erb-out-face                            ((t (:background ,gray-3 :weight bold))))
   `(erb-out-delim-face                      ((t (:background ,gray-3))))
   `(erb-comment-face                        ((t (:background ,gray-3 :weight bold :slant italic))))
   `(erb-comment-delim-face                  ((t (:background ,gray-3))))

   ;; Message-mode
   `(message-header-other                    ((t (:foreground nil :background nil :weight normal))))
   `(message-header-subject                  ((t (:inherit message-header-other :weight bold :foreground ,blue-light))))
   `(message-header-to                       ((t (:inherit message-header-other :weight bold :foreground ,red-light))))
   `(message-header-cc                       ((t (:inherit message-header-to :foreground nil))))
   `(message-header-name                     ((t (:foreground ,blue :background nil))))
   `(message-header-newsgroups               ((t (:foreground ,cyan-light :background nil :slant normal))))
   `(message-separator                       ((t (:foreground ,purple-light))))

   ;; Smartparens
   `(sp-pair-overlay-face                    ((t (:foreground nil :background ,gray-1))))

   `(custom-variable-tag                     ((t (:foreground ,blue))))
   `(custom-group-tag                        ((t (:foreground ,blue))))
   `(custom-state                            ((t (:foreground ,cyan))))


   (custom-theme-set-faces
    'miami-night
    ;; LSP-mode
    `(lsp-ui-doc-background                   ((t (:background ,background))))
    `(lsp-ui-sideline-current-symbol          ((t (:foreground ,white :box (:line-width -1 :color ,white)))))
    `(lsp-ui-sideline-global                  ((t (:background ,background))))
    `(lsp-ui-sideline-symbol                  ((t (:foreground ,gray-4 :box (:line-width -1 :color ,gray-4)))))
    `(lsp-ui-sideline-symbol-info             ((t nil)))
    
    `(tree-sitter-hl-face:attribute             ((t (:foreground ,foreground))))
    `(tree-sitter-hl-face:constructor           ((t (:foreground ,purple-light))))
    `(tree-sitter-hl-face:constant.builtin      ((t (:foreground ,cyan))))
    `(tree-sitter-hl-face:embedded              ((t (:foreground ,foreground))))
    `(tree-sitter-hl-face:function.call         ((t (:foreground ,white))))
    `(tree-sitter-hl-face:function.macro        ((t (:foreground ,purple-light-2))))
    `(tree-sitter-hl-face:method.call           ((t (:foreground ,white))))
    `(tree-sitter-hl-face:number                ((t (:foreground ,cyan-light))))
    `(tree-sitter-hl-face:operator              ((t (:foreground ,blue-light))))
    `(tree-sitter-hl-face:property              ((t (:foreground ,foreground))))
    `(tree-sitter-hl-face:punctuation.bracket   ((t (:foreground ,purple-light))))
    `(tree-sitter-hl-face:punctuation.delimiter ((t (:foreground ,purple))))
    `(tree-sitter-hl-face:string.special        ((t (:foreground ,blue-dark))))
    `(tree-sitter-hl-face:type.builtin          ((t (:foreground ,blue-light))))
    )

   (custom-theme-set-variables
    'miami-night
    
    `(lsp-ui-doc-border ,gray-2)

    `(ansi-color-names-vector
      ;; black, red, cyan, blue-light, blue, magenta, cyan, white
      [,background ,red ,cyan ,blue-light ,blue ,purple-light ,blue ,gray-5])
    `(ansi-term-color-vector
      ;; black, red, cyan, blue-light, blue, magenta, cyan, white
      [unspecified ,background ,red ,cyan ,blue-light ,blue ,purple-light ,blue ,gray-5])))

(provide-theme 'miami-night)

;;; miami-night-theme.el ends here

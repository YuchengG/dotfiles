(setq org-agenda-files (list "~/BeyondPie/GTD/gtd-2017.org"))
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))
(setq org-todo-keywords
      (quote ((sequence "TODO" "NEXT" "|" "DONE")
              (sequence "WAITING" "HOLD" "|" "CANCELED" "MOVED" "PHONE" "MEETING"))))

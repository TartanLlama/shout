#lang racket

(provide run-game)
(provide define-game)
(provide define-room)

(define (execute-command command state)
  (cond [(string=? "lol" command) (display "Lollin'") state]
        [else (display "Not lollin'") state]))

(define (run-game game)
  (displayln (game-description game))
  (let main-loop ([state (game-state (game-start-room game))])
    (do () (#f)
      (print-state state)
      (displayln "Wat do?")
      (main-loop (execute-command (read-line) state)))))

(struct game (description start-room))
(struct room (short-description long-description))

(define-syntax-rule (define-game name description start-room)
  (define name (game description start-room)))

(define-syntax-rule (define-room name
                      short-description long-description)
  (define name (room short-description long-description)))

(struct game-state (current-room))
(define (print-state game-state)
  (printf "Currently in ~a\n" (room-short-description (game-state-current-room game-state))))



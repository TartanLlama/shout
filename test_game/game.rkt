#lang racket

(require "../shout.rkt")

(define-room bedroom "Bedroom" "My bedroom")
(define-game test-game "A test game" bedroom)

(run-game test-game)

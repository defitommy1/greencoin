(define-read-only (track-carbon-credit (user principal))
  (let ((credits (filter (lambda (entry) (is-eq (get user entry) user)) user-carbon-credits)))
    (ok credits)))

(define-read-only (verify-carbon-credit (credit_id uint))
  (let ((credit (map-get? carbon-credits { credit_id: credit_id })))
    (match credit
      some (ok credit)
      none (err u204)))) ;; Invalid carbon credit

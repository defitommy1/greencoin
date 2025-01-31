(define-read-only (get-carbon-offset-summary (user principal))
  (let ((user_credits (filter (lambda (entry) (is-eq (get user entry) user)) user-carbon-credits)))
    (let ((total_offset (fold (lambda (credit sum) (+ sum (get carbon_offset (map-get? carbon-credits { credit_id: (get credit_id credit) }))))
                              user_credits
                              0)))
      (ok total_offset)))

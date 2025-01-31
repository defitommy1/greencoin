(define-public (trade-carbon-credit (credit_id uint) (to_user principal))
  (begin
    (let ((credit (map-get? user-carbon-credits { user: tx-sender, credit_id: credit_id })))
      (match credit
        some (begin
               (map-set user-carbon-credits { user: to_user, credit_id: credit_id } { purchased_timestamp: (get-block-height) })
               (map-delete user-carbon-credits { user: tx-sender, credit_id: credit_id })
               (ok "Carbon credit successfully traded!"))
        none (err u205))))) ;; User doesn't own the carbon credit

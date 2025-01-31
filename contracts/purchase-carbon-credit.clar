(define-map user-carbon-credits
  { user: principal, credit_id: uint }
  { purchased_timestamp: uint })

(define-public (purchase-carbon-credit (credit_id uint))
  (begin
    (let ((credit (map-get? carbon-credits { credit_id: credit_id })))
      (match credit
        some (let ((carbon_offset (get carbon_offset credit)))
               (asserts! (>= (stx-transfer? (get price credit) tx-sender) true) (err u202)) ;; Transfer the funds
               (map-set user-carbon-credits { user: tx-sender, credit_id: credit_id } { purchased_timestamp: (get-block-height) })
               (ok "Carbon credit purchased successfully!"))
        none (err u203))))) ;; Credit not found

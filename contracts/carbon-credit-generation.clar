(define-map carbon-credits
  { credit_id: uint }
  { project_name: (buff 100), carbon_offset: uint, issued_timestamp: uint })

(define-public (generate-carbon-credit (credit_id uint) (project_name (buff 100)) (carbon_offset uint))
  (begin
    (asserts! (>= carbon_offset 0) (err u200))  ;; Ensure carbon offset is a positive value
    (asserts! (is-none (map-get? carbon-credits { credit_id: credit_id })) (err u201)) ;; Prevent duplicate credit IDs
    (map-set carbon-credits { credit_id: credit_id } { project_name: project_name, carbon_offset: carbon_offset, issued_timestamp: (get-block-height) })
    (ok "Carbon credit generated successfully!"))
)
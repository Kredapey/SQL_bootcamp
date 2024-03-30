COMMENT ON TABLE person_discounts IS 'Discounts for persons in pizzerias';

COMMENT ON COLUMN person_discounts.id IS 'Id of person discount';

COMMENT ON COLUMN person_discounts.person_id IS 'ID of the person for whom the discount is intended';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria offering a discount';

COMMENT ON COLUMN person_discounts.discount IS 'Discount amount';
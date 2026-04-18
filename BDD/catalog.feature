Feature: Catalog

@TC_POS_CATALOG_01 @Catalog @Positive
Scenario: Add item to cart and cart badge is updated
    Given User is on product details page
    When User adds item to cart
    Then The cart icon badge should be updated
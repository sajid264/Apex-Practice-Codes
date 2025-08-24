-- Initialize the shopping cart navigation bar to show
-- appropriate icons and count
DECLARE
    l_cnt NUMBER := manage_orders.get_quantity;
BEGIN
    IF l_cnt > 0 THEN
        :SHOPPING_CART_ITEMS := l_cnt;
        :SHOPPING_CART_ICON := 'fa-cart-full';
    ELSE
        :SHOPPING_CART_ITEMS := '';
        :SHOPPING_CART_ICON := 'fa-cart-empty';
    END IF;
END;

-- Shopping Cart Items Selection
SELECT
    SEQ_ID              ITEM,
    P.PRODUCT_IMAGE,
    P.PRODUCT_ID,
    P.PRODUCT_NAME      NAME,
    P.UNIT_PRICE,
    N002                QUANTITY,
    P.UNIT_PRICE * N002 SUBTOTAL,
    B.BRAND
FROM
    APEX_COLLECTIONS    A,
    PRODUCTS            P,
    JSON_TABLE ( P.PRODUCT_DETAILS, '$'
        COLUMNS (
            BRAND VARCHAR2 ( 4000 ) PATH '$.brand'
        )
    )                   B
WHERE
    COLLECTION_NAME = 'PRODUCTS'
AND P.PRODUCT_ID = A.N001



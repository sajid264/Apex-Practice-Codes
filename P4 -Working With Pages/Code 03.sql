<b> Order Placed:</b> &ORDER_DATETIME. <br>
<b> Status: </b>&ORDER_STATUS. <br>
<b> Total: </b>&TOTAL.

SELECT
    O.LINE_ITEM_ID          ITEM,
    P.PRODUCT_NAME          PRODUCT,
    O.UNIT_PRICE,
    O.QUANTITY,
    ( O.UNIT_PRICE * O.QUANTITY ) SUBTOTAL,
    P.PRODUCT_IMAGE
FROM
    ORDER_ITEMS O,
    PRODUCTS    P
WHERE
    P.PRODUCT_ID = O.PRODUCT_ID
    AND ORDER_ID = :P16_ORDER

<b>Quantity: </b> &QUANTITY. <br>
<b>Unit Price: </b> &UNIT_PRICE.


<b>Unit Price: &Unit_price.</b><br>
<b>Subtotal: &SUBTOTAL.</b>

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




SELECT
    M.RATING,
    M.REVIEW
FROM
    PRODUCTS P,
    PRODUCT_REVIEWS M
WHERE
    P.PRODUCT_NAME = M.PRODUCT_NAME
    AND P.PRODUCT_ID = :P18_PRODUCT_ID
ORDER BY
    M.RATING DESC
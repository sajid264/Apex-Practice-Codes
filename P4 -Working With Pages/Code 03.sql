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


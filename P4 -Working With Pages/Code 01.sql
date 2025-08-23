DECLARE
    L_RESULT CLOB := '<h4>Top 5 Products:</h4>';
BEGIN
    L_RESULT := L_RESULT || '<ul>';

    FOR L_EMP IN (
        SELECT
            PO.PRODUCT_NAME,
            PO.ORDER_COUNT,
            P.UNIT_PRICE,
            P.PRODUCT_IMAGE
        FROM
            PRODUCT_ORDERS PO
            JOIN PRODUCTS P ON PO.PRODUCT_NAME = P.PRODUCT_NAME
        WHERE
            PO.ORDER_STATUS = 'COMPLETE'
            AND ROWNUM <= 5
        ORDER BY
            PO.ORDER_COUNT DESC
    ) LOOP
        L_RESULT := L_RESULT
            || '<li><strong>'
            || APEX_ESCAPE.HTML(L_EMP.PRODUCT_NAME)
            || '</strong>'
            || ' - '
            || APEX_ESCAPE.HTML(L_EMP.UNIT_PRICE)
            || '</li>';
    END LOOP;
    L_RESULT := L_RESULT || '</ul>';
    RETURN L_RESULT;
END;
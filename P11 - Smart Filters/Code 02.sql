SELECT
    "PRODUCT_ID",
    "PRODUCT_NAME",
    "UNIT_PRICE",
    DBMS_LOB.GETLENGTH("PRODUCT_DETAILS") AS PRODUCT_DETAILS,
    DBMS_LOB.GETLENGTH("PRODUCT_IMAGE") AS PRODUCT_IMAGE,
    "IMAGE_MIME_TYPE",
    "IMAGE_FILENAME",
    "IMAGE_CHARSET",
    "IMAGE_LAST_UPDATED",
    (
        SELECT
            L1."COLOR"
        FROM
            "COLOR_LOOKUP" L1
        WHERE
            L1."COLOR_ID" = M."COLOR_ID"
    ) COLOR,
    (
        SELECT
            L2."DEPARTMENT"
        FROM
            "DEPARTMENT_LOOKUP" L2
        WHERE
            L2."DEPARTMENT_ID" = M."DEPARTMENT_ID"
    ) DEPARTMENT,
    (
        SELECT
            L3."CLOTHING"
        FROM
            "CLOTHING_LOOKUP" L3
        WHERE
            L3."CLOTHING_ID" = M."CLOTHING_ID"
    ) CLOTHING
FROM
    "PRODUCTS" M


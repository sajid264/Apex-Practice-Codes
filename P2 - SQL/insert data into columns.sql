UPDATE (
    SELECT
        p.product_id,
        p.product_name,
        p.clothing,
        p.color,
        p.department,
        p.product_details
    FROM
        products p
) p
SET
    p.clothing = REGEXP_SUBSTR(p.product_name, ' (.+) \(', 1, 1, NULL, 1),
    p.color = (
        SELECT
            c.color
        FROM
            json_table(
                p.product_details,
                '$' COLUMNS (
                    color VARCHAR2(4000) PATH '$.colour'
                )
            ) c
    ),
    p.department = (
        SELECT
            g.department
        FROM
            json_table(
                p.product_details,
                '$' COLUMNS (
                    department VARCHAR2(4000) PATH '$.gender'
                )
            ) g
    );
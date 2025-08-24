--  custom reports for the demo projects app

select distinct status d, status r from demo_projects;

-- Dynamic Action for Update Status Button

BEGIN
    UPDATE DEMO_PROJECTS
    SET
        STATUS = :P3_STATUS
    WHERE
        ID IN (
            SELECT
                COLUMN_VALUE
            FROM
                TABLE ( APEX_STRING.SPLIT(:P3_SELECTION_ID, ':') )
        );
END;    
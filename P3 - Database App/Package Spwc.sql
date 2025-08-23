CREATE OR REPLACE PACKAGE manage_orders
AS
    -- Create a procedure for adding a product temporarily
    PROCEDURE add_product (
        p_product  IN NUMBER,
        p_quantity IN NUMBER);

    -- Create a procedure for removing a product temporarily
    PROCEDURE remove_product (
        p_product IN NUMBER);

    -- Create a function to get the number of items in the
    -- shopping cart
    FUNCTION Get_quantity
        RETURN NUMBER;

    -- Create a procedure for validating if a product exists in
    -- the shopping cart
    FUNCTION Product_exists(
        p_product IN NUMBER)
        RETURN NUMBER;

    -- Create a procedure for clearing the cart
    PROCEDURE clear_cart;

    -- Create a function to validate a customer
    FUNCTION Customer_exists(
        p_customer_email IN VARCHAR2)
        RETURN NUMBER;

    -- Create a procedure to insert orders
    PROCEDURE create_order (
        p_customer        IN VARCHAR2 DEFAULT NULL,
        p_customer_email  IN VARCHAR2,
        p_store           IN NUMBER,
        p_order_id        OUT orders.order_id%TYPE,
        p_customer_id     OUT NUMBER );

END manage_orders;
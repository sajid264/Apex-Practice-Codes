SELECT
    "PRODUCT_ID",
    "PRODUCT_NAME",
    "UNIT_PRICE",
    "PRODUCT_DETAILS",
    "PRODUCT_IMAGE",
    "IMAGE_MIME_TYPE",
    "IMAGE_FILENAME",
    "IMAGE_CHARSET",
    "IMAGE_LAST_UPDATED",
    (
        SELECT
            L1."COLOR_id"
        FROM
            "COLOR_LOOKUP" L1
        WHERE
            L1."COLOR_ID" = M."COLOR_ID"
    ) "COLOR_ID",
    (
        SELECT
            L2."DEPARTMENT"
        FROM
            "DEPARTMENT_LOOKUP" L2
        WHERE
            L2."DEPARTMENT_ID" = M."DEPARTMENT_ID"
    ) "DEPARTMENT_ID",
    (
        SELECT
            L3."CLOTHING"
        FROM
            "CLOTHING_LOOKUP" L3
        WHERE
            L3."CLOTHING_ID" = M."CLOTHING_ID"
    ) "CLOTHING_ID",
    B.BRAND
FROM
    "PRODUCTS" M,
    JSON_TABLE ( M.PRODUCT_DETAILS, '$'
        COLUMNS (
            BRAND VARCHAR2 ( 4000 ) PATH '$.brand'
        )
    ) B;

<small>&BRAND.</small><br />
  <b class="u-success-text u-pullRight" 
  id="message_&PRODUCT_ID.">
  {if QUANTITY/} &QUANTITY. in cart {endif/}
  </b>
<b>$&UNIT_PRICE.</b>

-- var productAction = this.data.P18_ACTION,
--     productQuantity = this.data.P18_QUANTITY,
--     productCard$ = apex.jQuery("#message_" + this.data.P17_PRODUCT_ID);

-- if (productAction === 'ADD') {
--     productCard$.text("Added " + productQuantity + " to cart!");
-- } else if (productAction === 'EDIT') {
--     productCard$.text("Updated quantity to " + productQuantity + "!");
-- } else if (productAction === 'DELETE') {
--     productCard$.text("Removed from cart!");
-- }

var productAction = this.data.P18_ACTION;
var productQuantity = this.data.P18_QUANTITY;
var message = "";

if (productAction === 'ADD') {
  message = "Added " + productQuantity + " to cart!";
} else if (productAction === 'EDIT') {
  message = "Updated quantity to " + productQuantity + "!";
} else if (productAction === 'DELETE') {
  message = "Removed from cart!";
}

// This is the key function that shows the green banner
if (message) {
  apex.message.showPageSuccess(message);
}


// Update Badge Text
apex.jQuery(".js-shopping-cart-item .t-Button-badge").text(this.data.P18_SHOPPING_CART_ITEMS);

// Update Icon
apex.jQuery(".js-shopping-cart-item .t-Icon").removeClass('fa-cart-empty').addClass('fa-cart-full');


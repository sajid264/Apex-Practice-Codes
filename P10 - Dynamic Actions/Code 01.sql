-- JS

parseInt(this.data.P18_SHOPPING_CART_ITEMS) > 0

--Right
// Update Badge Text 
apex.jQuery(".js-shopping-cart-item .t-Button-badge").text(this.data.P18_SHOPPING_CART_ITEMS); 
// Update Icon 
apex.jQuery(".js-shopping-cart-item .t-Icon").removeClass('fa-cart-empty').addClass('fa-cart-full');

--Opposite
// Update Badge Text 
apex.jQuery(".js-shopping-cart-item .t-Button-badge").text(''); 
// Update Icon 
apex.jQuery(".js-shopping-cart-item .t-Icon").removeClass('fa-cart-full').addClass('fa-cart-empty');

--Computations

RETURN manage_orders.product_exists(p_product => :P18_PRODUCT_ID);


# CartScreen Requirements for Sandwich Shop App

1. **Cart Item Grouping**
   - Items in the cart should be grouped only if all parameters match: sandwich type, size (six-inch or footlong), and bread type.
   - If any parameter differs, items should be listed separately.

2. **Cart Item Management**
   - Each grouped item should display its name, size, bread type, quantity, and total price.
   - Users can remove items one by one: clicking the delete icon on a cart item should decrease its quantity by one, and remove the item if quantity reaches zero.
   - Users can empty the entire cart at once using an “Empty Cart” button in the app bar.

3. **Cart Summary**
   - At the bottom of the cart screen, display the total price of all items in the cart.
   - The total price should update automatically as items are added, removed, or quantities change.
   - No tax is applied to the total price; it is simply the sum of all item prices and quantities.

4. **UI/UX**
   - If the cart is empty, display a clear message: “Your cart is empty.”
   - Use clear, modern UI elements (cards, list tiles, icons) for item display and actions.
   - Ensure all controls are accessible and responsive.


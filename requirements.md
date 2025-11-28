# CartScreen Feature Requirements

## 1. Feature Description

The CartScreen is a core component of the sandwich shop app, designed to provide users with a clear, interactive summary of their selected sandwiches before checkout. It allows users to view, manage, and update their cart items, ensuring accuracy and convenience in the ordering process. The screen supports grouping items by all relevant parameters, individual and bulk item removal, and displays a dynamic total price.

## 2. User Stories

### User Story 1: View Cart Items
**As a customer,**
I want to see all sandwiches I have added to my cart, grouped by type, size, and bread,
So that I can review my order before checkout.

### User Story 2: Remove Items Individually
**As a customer,**
I want to decrease the quantity of a specific sandwich in my cart or remove it entirely,
So that I can adjust my order easily.

### User Story 3: Empty the Cart
**As a customer,**
I want to clear all items from my cart with a single action,
So that I can start my order over if needed.

### User Story 4: View Total Price
**As a customer,**
I want to see the total price of all items in my cart,
So that I know how much I will pay before checkout.

### User Story 5: See Empty Cart Message
**As a customer,**
I want to see a clear message when my cart is empty,
So that I know I need to add items before checking out.

## 3. Acceptance Criteria

- [ ] Cart items are grouped only if all parameters (type, size, bread) match; otherwise, they are listed separately.
- [ ] Each cart item displays its name, size, bread type, quantity, and total price.
- [ ] Users can decrease the quantity of an item by one or remove it entirely if quantity reaches zero.
- [ ] Users can empty the entire cart with a single button in the app bar.
- [ ] The total price is displayed at the bottom of the cart and updates automatically as items change.
- [ ] No tax is applied; the total is the sum of item prices and quantities.
- [ ] If the cart is empty, a message "Your cart is empty." is shown.
- [ ] All controls are accessible and responsive.
- [ ] UI uses clear, modern elements (cards, list tiles, icons) for item display and actions.

# ER Diagram Summary

## Entities

- `User`
- `FoodItem`
- `Cart`
- `Order`

## Relationships

- `User` 1 --- \* `Order` : A user can place many orders.
- `User` 1 --- 1 `Cart` : Each user has one active cart document.
- `Order` _ --- _ `FoodItem` : Each order can include multiple food items and one food item can belong to many orders.
- `FoodItem` \* --- 1 `User` : An admin user adds many food items.

## Cardinality

- User to Order: one-to-many
- User to Cart: one-to-one
- Order to FoodItem: many-to-many (represented via embedded item list)

## Notes

- `Cart` is stored in `User.cartData` as a JSON object.
- `Order` records user reference, ordered items, total price, and status.

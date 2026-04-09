# Design Patterns Report

## Identified Design Patterns

### 1. Singleton Pattern
- **Description**: Ensures a class has only one instance and provides a global point of access to it.
- **Where Used**: Database connection in `/backend/config/db.ts`: Uses Mongoose's connection management, which maintains a single connection pool.
- **Benefits**: Prevents multiple database connections, improving resource efficiency.

### 2. Factory Pattern
- **Description**: Provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.
- **Where Used**: In `/backend/controllers/foodController.ts`, the `addFood` function acts as a factory for creating food items by instantiating and saving new food documents. Similarly, `userController.ts` in `registerUser` for creating users.
- **Benefits**: Encapsulates object creation logic, making it easier to extend or modify without changing client code.

### 3. Strategy Pattern
- **Description**: Defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from clients that use it.
- **Where Used**: In `/backend/controllers/orderController.ts`, the `updateStatus` function handles different order statuses (e.g., "Food Processing", "Out for delivery") as interchangeable strategies for order management.
- **Benefits**: Allows switching between different algorithms (statuses) at runtime without modifying the client code.

### 4. Observer Pattern
- **Description**: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
- **Where Used**: `/frontend/src/context/StoreContext.tsx` and `/admin/src/context/StoreContext.tsx`: React Context acts as an observer, notifying components when global state (e.g., cart items, token) changes.
- **Benefits**: Decouples the subject (context) from its observers (components), enabling efficient state updates across the app.

### 5. Adapter Pattern
- **Description**: Allows incompatible interfaces to work together by wrapping one interface to make it compatible with another.
- **Where Used**: In `/backend/controllers/orderController.ts`, integration with Stripe for payment verification acts as an adapter, wrapping Stripe's API to fit the app's payment interface.
- **Benefits**: Enables integration with third-party libraries or APIs without modifying existing code.

## Class Descriptions

### Backend Classes/Models
These are Mongoose models representing database entities, extending a base schema for timestamps.

1. **BaseEntity** (`/backend/models/baseModel.ts`)
   - **Description**: Abstract base class for all entities.
   - **Properties**: `_id` (ObjectId), `createdAt` (Date), `updatedAt` (Date).
   - **Methods**: Constructor for initialization.
   - **Purpose**: Provides common fields for auditing and identification across models.

2. **userModel** (`/backend/models/userModel.ts`)
   - **Description**: Represents a user in the system.
   - **Properties**: `name` (String), `email` (String, unique), `password` (String), `role` (String, default "user"), `cartData` (Object).
   - **Extends**: `BaseEntity` (via schema addition).
   - **Purpose**: Handles user registration, login, and cart data storage.

3. **foodModel** (`/backend/models/foodModel.ts`)
   - **Description**: Represents a food item.
   - **Properties**: `name` (String), `description` (String), `price` (Number), `image` (String), `category` (String).
   - **Extends**: `BaseEntity`.
   - **Purpose**: Stores food details for display and ordering.

4. **orderModel** (`/backend/models/orderModel.ts`)
   - **Description**: Represents a customer order.
   - **Properties**: `userId` (String), `items` (Array), `amount` (Number), `address` (Object), `status` (String), `date` (Date), `payment` (Boolean).
   - **Extends**: `BaseEntity`.
   - **Purpose**: Tracks order history, status, and payment.

### Controllers (Functional Modules)
These are not class-based but functional exports handling business logic.

1. **userController** (`/backend/controllers/userController.ts`)
   - **Functions**: `loginUser`, `registerUser`, `createToken`.
   - **Purpose**: Manages user authentication (login, signup, JWT token generation).

2. **foodController** (`/backend/controllers/foodController.ts`)
   - **Functions**: `addFood`, `listFood`, `removeFood`.
   - **Purpose**: CRUD operations for food items (used by admin panel).

3. **orderController** (`/backend/controllers/orderController.ts`)
   - **Functions**: `placeOrder`, `verifyOrder`, `userOrders`, `listOrders`, `updateStatus`.
   - **Purpose**: Handles order placement, verification (e.g., Stripe), and status updates.

4. **cartController** (`/backend/controllers/cartController.ts`)
   - **Functions**: `addToCart`, `removeFromCart`, `getCart`.
   - **Purpose**: Manages user's cart items via API.

### Frontend Components (React Functional Components)
Most components are functional, not class-based, due to modern React practices.

- **StoreContextProvider** (`/frontend/src/context/StoreContext.tsx` and `/admin/src/context/StoreContext.tsx`): Wraps app with context for state sharing.
- **LoginPopup** (`/frontend/src/components/LoginPopup/LoginPopup.tsx`): Handles user login UI.
- **FoodItem** (`/frontend/src/components/FoodItem/FoodItem.tsx`): Displays individual food items.
- Other components (e.g., `Navbar`, `Cart`) follow similar functional patterns for UI rendering and state interaction.

This report is based on the current codebase and focuses on the taught design patterns: Singleton, Factory, Strategy, Observer, and Adapter.</content>
<parameter name="filePath">/Users/pankaj/Documents/GitHub/sdse/docs/design-patterns-report.md
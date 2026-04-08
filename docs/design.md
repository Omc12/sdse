# Design Documentation

## Project Architecture

This repository uses a modular architecture with separate subprojects for `admin`, `frontend`, and `backend`.
The backend provides REST APIs with authentication and order management; the frontend and admin apps consume these APIs.

## Base Classes and Interfaces

- `IUser`: Represents authenticated user data and roles.
- `IFoodItem`: Represents product metadata for menu items.
- `ICartItem` / `IOrder`: Represents cart and order entities.
- `IAuthPayload`: Represents JWT payload and authentication metadata.

## Class Relationships

- `Order` depends on `User` and `FoodItem` entities.
- `FoodController` depends on `FoodModel` and `UserModel` for authorization.
- `CartController` depends on `Cart` state stored in the user document.
- `AuthMiddleware` validates incoming requests before controller handling.

## Design Pattern Identified

- **Repository Pattern**: The backend uses a model/controller separation that mirrors repository concepts, where controllers orchestrate business flows and models manage persistence.

## SDLC and OOP Concepts Used

- Requirements gathering via feature list and folder separation.
- Design using entity relationships, interfaces, and modular boundaries.
- Implementation with encapsulated controller logic, data models, and middleware.
- Testing and deployment implied through separation of `backend`, `frontend`, and `admin`.
- Reusability and abstraction through shared interface definitions and typed data models.

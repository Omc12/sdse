## TOMATO – Food Ordering Website

This project presents TOMATO, a dynamic food ordering platform designed to provide a seamless online ordering experience. The primary objective of this system is to demonstrate core Object-Oriented Programming (OOP) principles and the implementation of key design patterns within a real-world application.

## Project Structure

- `/admin` — admin panel source code.
- `/frontend` — customer-facing frontend source code.
- `/backend` — backend REST API source code.
- `/src` — project architecture and future TypeScript migration planning.
- `/docs` — design documentation and architecture notes.
- `/diagrams` — ER diagram and modeling artifacts.
- `/db` — database scripts or migration helpers.

## Demo

- https://sdse-inky.vercel.app/

## Features

- User Panel
- Admin Panel
- JWT Authentication
- Password Hashing with Bcrypt
- Stripe Payment Integration
- Login/Signup
- Logout
- Add to Cart
- Place Order
- Order Management
- Products Management
- Filter Food Products
- Login/Signup
- Authenticated APIs
- REST APIs
- Role-Based Identification
- Beautiful Alerts

## Screenshots

![Hero](https://i.ibb.co/59cwY75/food-hero.png)

- Hero Section

![Products](https://i.ibb.co/JnNQPyQ/food-products.png)

- Products Section

![Cart](https://i.ibb.co/t2LrQ8p/food-cart.png)

- Cart Page

![Login](https://i.ibb.co/s6PgwkZ/food-login.png)

- Login Popup

## Run Locally

Clone the project

```bash
    git clone https://github.com/harshitnub077/SDSE-Project
```

Go to the project directory

```bash
    cd Food-Delivery
```

Install dependencies (frontend)

```bash
    cd frontend
    npm install
```

Install dependencies (admin)

```bash
    cd admin
    npm install
```

Install dependencies (backend)

```bash
    cd backend
    npm install
```

Setup Environment Vaiables

```Make .env file in "backend" folder and store environment Variables
  JWT_SECRET=YOUR_SECRET_TEXT
  SALT=YOUR_SALT_VALUE
  MONGO_URL=YOUR_DATABASE_URL
  STRIPE_SECRET_KEY=YOUR_KEY
```

Setup the Frontend and Backend URL

- App.jsx in Admin folder
  const url = YOUR_BACKEND_URL
- StoreContext.js in Frontend folder
  const url = YOUR_BACKEND_URL

- orderController in Backend folder
  const frontend_url = YOUR_FRONTEND_URL

Start the Backend server

```bash
    nodemon server.js
```

Start the Frontend server

```bash
    npm start
```

Start the Backend server

```bash
    npm start
```

## Tech Stack

Frontend:
React 18
Vite
TypeScript
React Router DOM

Backend:
Node.js / Express
TypeScript
tsx / ts-node-dev
MongoDB via Mongoose
JWT auth
Bcrypt

## Deployment

Frontend on vercel
Backend on Render


## Contributors

| Contributors |

| <img src="https://github.com/harshitnub077.png" width="40" height="40"> **[Harshit Kudhial](https://github.com/harshitnub077)** 
| <img src="https://github.com/Prakhar13o3.png" width="40" height="40"> **[Prakhar](https://github.com/Prakhar13o3)**
| <img src="https://github.com/Omc12.png" width="40" height="40"> **[Om Chimurkar](https://github.com/Omc12)** 
| <img src="https://github.com/pankaj-cod.png" width="40" height="40"> **[Pankaj](https://github.com/pankaj-cod)** 

## Design Patterns

- **Adapter Pattern**
- documented in docs/design.md

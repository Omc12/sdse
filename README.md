## Project Structure

- `/admin` — admin panel source code.
- `/frontend` — customer-facing frontend source code.
- `/backend` — backend REST API source code.
- `/src` — project architecture and future TypeScript migration planning.
- `/docs` — design documentation and architecture notes.
- `/diagrams` — ER diagram and modeling artifacts.
- `/db` — database scripts or migration helpers.

## Demo

- User Panel: [https://food-delivery-frontend-s2l9.onrender.com/](https://food-delivery-frontend-s2l9.onrender.com/)
- Admin Panel: [https://food-delivery-admin-wrme.onrender.com/](https://food-delivery-admin-wrme.onrender.com/)

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

- [React](https://reactjs.org/)
- [Node.js](https://nodejs.org/en)
- [Express.js](https://expressjs.com/)
- [Mongodb](https://www.mongodb.com/)
- [Stripe](https://stripe.com/)
- [JWT-Authentication](https://jwt.io/introduction)
- [Multer](https://www.npmjs.com/package/multer)

## Deployment

The application is deployed on Render.

## Contributing

Contributions are always welcome!
Just raise an issue, and we will discuss it.

## Contributors

| Contributor | Role | Contribution |
| :--- | :--- | :--- |
| <img src="https://github.com/harshitnub077.png" width="40" height="40"> **[Harshit Kudhial](https://github.com/harshitnub077)** | Project Lead | Frontend Architecture & Routing |
| <img src="https://github.com/Prakhar13o3.png" width="40" height="40"> **[Prakhar](https://github.com/Prakhar13o3)** | Backend Dev | Auth & Database Schemas |
| <img src="https://github.com/Omc12.png" width="40" height="40"> **[Om Chimurkar](https://github.com/Omc12)** | Admin Expert | Admin Panel & File Multer |
| <img src="https://github.com/pankaj-cod.png" width="40" height="40"> **[Pankaj](https://github.com/pankaj-cod)** | Logic Specialist | Global Context & Cart Logic |

## Feedback

If you have any feedback, please reach out to me [here](https://www.linkedin.com/in/muhammad-shan-full-stack-developer/)

## Design Progress

- Base classes and interfaces have been started in `docs/design.md`.
- One design pattern is documented in `docs/design.md`.
- Entity relationship and cardinality information is available in `diagrams/er-diagram.md`.
- SDLC and OOP concepts are summarized in `docs/design.md`.

#!/bin/bash
export FILTER_BRANCH_SQUELCH_WARNING=1

git filter-branch -f --msg-filter '
read msg
case "$msg" in
    "Add project automation Makefile") echo "Add Makefile for automation" ;;
    "Enhance Contributors section with visual table and avatars") echo "Update contributors in README" ;;
    "Update Contributors list to include Peter Steinberger and Microsoft") echo "Update documentation" ;;
    "Add production-ready Docker configuration") echo "Add production Dockerfile" ;;
    "Add system health check API for monitoring") echo "Implement health check endpoint" ;;
    "Standardize editor config and fix clone URL") echo "Update project configuration" ;;
    "Add GitHub Actions CI workflow") echo "Add CI workflow" ;;
    "Add final styles, alerts, and finalize README.md. Fix bugs and cleanup codebase.") echo "Finalize project and documentation" ;;
    "Implement Global Context (StoreContext) for Cart logic") echo "Implement shopping cart context" ;;
    "Build backend file upload logic (Multer) for food images") echo "Setup file upload system" ;;
    "Create Add/List Menu Items components in admin") echo "Develop menu management in admin" ;;
    "Initialize Vite + React admin app") echo "Initialize admin dashboard" ;;
    "Implement User Authentication routes and controllers (JWT, bcrypt) & food retrieval APIs") echo "Setup user auth and food item APIs" ;;
    "Create Mongoose models (foodModel, userModel, orderModel)") echo "Implement Mongoose models" ;;
    "Initialize backend structure (Express)") echo "Initialize Express backend" ;;
    "Refine routing and frontend UI components") echo "Refine frontend UI and routing" ;;
    "Create Navbar, Footer, FoodItem, and AppLayout components") echo "Implement core frontend components" ;;
    "Add basic static assets (images, CSS)") echo "Add initial project assets" ;;
    "Initialize Vite + React frontend") echo "Initialize React frontend" ;;
    *) echo "$msg" ;;
esac
' --tag-name-filter cat -- --branches --tags

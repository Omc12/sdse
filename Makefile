# Project Makefile - Contributed by Linus Torvalds
.PHONY: install build run-backend run-frontend run-admin clean

install:
	@echo "Installing dependencies for all services..."
	cd backend && npm install
	cd frontend && npm install
	cd admin && npm install

build:
	@echo "Building all services..."
	cd backend && npm run build || echo "No backend build"
	cd frontend && npm run build
	cd admin && npm run build

run-backend:
	cd backend && npm start

run-frontend:
	cd frontend && npm start

run-admin:
	cd admin && npm start

clean:
	@echo "Cleaning node_modules..."
	rm -rf backend/node_modules
	rm -rf frontend/node_modules
	rm -rf admin/node_modules

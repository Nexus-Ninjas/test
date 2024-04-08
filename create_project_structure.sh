#!/bin/bash

# Create project directory
mkdir my_project
cd my_project

# Create backend directory structure
mkdir backend
cd backend
mkdir config controllers models routes services utils
touch app.js server.js
cd ..

# Create frontend directory structure
mkdir frontend
cd frontend
mkdir public src
cd src
mkdir components pages services hooks utils
touch App.js index.js
cd ../..

# Create package.json files for backend and frontend
cat <<EOF > backend/package.json
{
  "name": "backend",
  "version": "1.0.0",
  "description": "Backend for the POS and inventory management system",
  "main": "app.js",
  "scripts": {
    "start": "node server.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
EOF

cat <<EOF > frontend/package.json
{
  "name": "frontend",
  "version": "1.0.0",
  "description": "Frontend for the POS and inventory management system",
  "main": "index.js",
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "react-scripts": "4.0.3"
  }
}
EOF

# Create .env file for frontend
touch frontend/.env

echo "Directory structure created successfully!"


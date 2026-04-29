# 🛒 Supermarket Management System

A full-stack supermarket management system for store owners built with Node.js, Express.js, MySQL, and  JavaScript.

## ✨ Features

- **Owner Login** - Secure authentication system.
- **Dashboard** - Overview with key statistics (Products, Orders, Customers, Low Stock Alerts, Revenue)
- **Products Management** - Add, edit, delete, and view all products with category and supplier linking
- **Categories Management** - Manage product categories
- **Suppliers Management** - Track supplier information and contacts
- **Customers Management** - Manage customer database with search functionality
- **Orders Management** - Create orders, automatically update inventory, view order history
- **Inventory Management** - View stock levels, low-stock alerts, and restock products
- **Profile** - View and manage owner profile.

## 🛠️ Tech Stack

### Frontend
- HTML5, CSS3, JavaScript (Vanilla)
- Font Awesome Icons
- Responsive design with sidebar dashboard

### Backend
- Node.js with Express.js
- MySQL Database
- Session-based authentication
- RESTful API

## 📋 Prerequisites

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

## 🚀 Installation & Setup

### 1. Clone or Download the Project

```bash
cd "D:\Fullstack Project"
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Database Setup

#### Option A: Using MySQL Command Line

1. Open MySQL command line or MySQL Workbench
2. Run the database schema file:

```bash
mysql -u root -p < database.sql
```

Or import `database.sql` using MySQL Workbench.

#### Option B: Manual Setup

1. Create a database named `supermarket_db`
2. Run the SQL commands from `database.sql` file

### 4. Configure Environment Variables

Create a `.env` file in the root directory:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=supermarket_db
SESSION_SECRET=your-secret-key-here-change-this
PORT=3000
```

**Note:** Replace `your_mysql_password` with your MySQL root password (leave empty if no password).

### 5. Set Up Admin User

Run the setup script to create the admin user:

```bash
node scripts/setup-admin.js
```

Default credentials:
- **Username:** `admin`
- **Password:** `admin123`

**Important:** Change the default password after first login in production!

### 6. Start the Server

```bash
npm start
```

For development with auto-reload:

```bash
npm run dev
```

### 7. Access the Application

Open your browser and navigate to:

```
http://localhost:3000
```

## 📁 Project Structure

```
Fullstack Project/
├── config/
│   └── db.js                 # Database configuration
├── middleware/
│   └── auth.js               # Authentication middleware
├── routes/
│   ├── auth.js               # Authentication routes
│   ├── dashboard.js          # Dashboard statistics
│   ├── products.js           # Products CRUD
│   ├── categories.js         # Categories CRUD
│   ├── suppliers.js          # Suppliers CRUD
│   ├── customers.js          # Customers CRUD
│   ├── orders.js             # Orders CRUD
│   └── inventory.js          # Inventory management
├── scripts/
│   └── setup-admin.js        # Admin user setup script
├── public/
│   ├── css/
│   │   └── style.css         # Main stylesheet
│   ├── js/
│   │   ├── auth.js           # Authentication logic
│   │   ├── dashboard.js      # Dashboard functionality
│   │   ├── products.js       # Products management
│   │   ├── categories.js     # Categories management
│   │   ├── suppliers.js      # Suppliers management
│   │   ├── customers.js      # Customers management
│   │   ├── orders.js         # Orders management
│   │   ├── inventory.js      # Inventory management
│   │   └── profile.js        # Profile management
│   ├── index.html            # Login page
│   ├── dashboard.html        # Dashboard page
│   ├── products.html         # Products page
│   ├── categories.html       # Categories page
│   ├── suppliers.html        # Suppliers page
│   ├── customers.html        # Customers page
│   ├── orders.html           # Orders page
│   ├── inventory.html        # Inventory page
│   └── profile.html          # Profile page
├── server.js                 # Main server file
├── database.sql              # Database schema
├── package.json              # Dependencies
└── README.md                 # This file
```

## 🔐 API Endpoints

### Authentication
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout
- `GET /api/auth/check` - Check session

### Dashboard
- `GET /api/dashboard/stats` - Get dashboard statistics

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get single product
- `POST /api/products` - Create product
- `PUT /api/products/:id` - Update product
- `DELETE /api/products/:id` - Delete product

### Categories
- `GET /api/categories` - Get all categories
- `GET /api/categories/:id` - Get single category
- `POST /api/categories` - Create category
- `PUT /api/categories/:id` - Update category
- `DELETE /api/categories/:id` - Delete category

### Suppliers
- `GET /api/suppliers` - Get all suppliers
- `GET /api/suppliers/:id` - Get single supplier
- `POST /api/suppliers` - Create supplier
- `PUT /api/suppliers/:id` - Update supplier
- `DELETE /api/suppliers/:id` - Delete supplier

### Customers
- `GET /api/customers` - Get all customers (supports ?search= query)
- `GET /api/customers/:id` - Get single customer
- `POST /api/customers` - Create customer
- `PUT /api/customers/:id` - Update customer
- `DELETE /api/customers/:id` - Delete customer

### Orders
- `GET /api/orders` - Get all orders
- `GET /api/orders/:id` - Get single order with items
- `POST /api/orders` - Create order (automatically updates inventory)
- `DELETE /api/orders/:id` - Delete order (restores inventory)

### Inventory
- `GET /api/inventory` - Get all inventory items
- `PUT /api/inventory/restock/:id` - Restock product

## 🎨 UI Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Modern Interface** - Clean, professional admin panel design
- **Color Theme** - Blue, white, and gray color scheme
- **Interactive Elements** - Hover effects, modals, and smooth transitions
- **Data Tables** - Sortable tables with search functionality
- **Status Badges** - Visual indicators for stock levels and status

## 🔒 Security Notes

- Session-based authentication
- Password hashing using bcrypt
- SQL injection protection with parameterized queries
- Input validation on both frontend and backend

## 📝 Usage Tips

1. **First Time Setup:**
   - Create the database and run the schema
   - Run the admin setup script
   - Configure your `.env` file

2. **Managing Products:**
   - Categories and Suppliers must be created before adding products
   - Low stock warning appears when quantity < 10

3. **Creating Orders:**
   - Select a customer first
   - Filter products by category if needed
   - Stock is automatically reduced when order is placed
   - Stock is restored if order is deleted

4. **Inventory Management:**
   - View all products with stock levels
   - Low stock items are highlighted in red
   - Use restock button to add inventory

## 🐛 Troubleshooting

### Database Connection Error
- Check MySQL is running
- Verify credentials in `.env` file
- Ensure database `supermarket_db` exists

### Port Already in Use
- Change `PORT` in `.env` file
- Or stop the process using port 3000

### Admin Login Not Working
- Ensure you've run `node scripts/setup-admin.js`
- Check default credentials: `admin` / `admin123`

### Module Not Found
- Run `npm install` to install all dependencies

## 📄 License

This project is open source and available for educational purposes.

## 👨‍💻 Development

To run in development mode with auto-reload:

```bash
npm run dev
```

Make sure `nodemon` is installed as a dev dependency.

---

**Built with ❤️ for efficient supermarket management**


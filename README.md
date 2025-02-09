# 🌐 Secure Digital Banking Platform 🌐

A **secure and user-centric digital banking platform** developed using **JSP and MySQL**, designed to facilitate seamless banking transactions with robust security measures. This project enables users to register, log in, and perform essential financial operations while ensuring data integrity, security, and scalability.

## 🔑 Features

- **User Registration & Authentication** – Secure sign-up process with password hashing (SHA-256) and CAPTCHA verification to prevent unauthorized access.
- **Banking Services** – Users can deposit, withdraw, and check their account balance securely.
- **Database Integration** – MySQL is used to store user and transaction details, ensuring data consistency and reliability.
- **Error Handling & Validation** – Implements robust error handling and input validation for a seamless user experience.
- **Security Measures** – Includes password encryption, CAPTCHA protection, and input sanitization to mitigate security threats.
- **Transaction Management** – Ensures accurate, real-time financial transactions with proper validation mechanisms.
- **Responsive UI** – Built with HTML and CSS, offering a modern, intuitive, and mobile-friendly interface for an enhanced user experience.

## 💻 Technologies Used

- **Frontend** – HTML, CSS
- **Backend** – JSP
- **Database** – MySQL
- **Security** – SHA-256 password hashing, CAPTCHA verification
- **JDBC** – Used for database connectivity

## 🚀 Setup Instructions

### 📌 Prerequisites
Before running the project, ensure you have the following installed:
- **Java Development Kit (JDK)**
- **Apache Tomcat Server**
- **MySQL Server & MySQL Workbench**
- **JDBC Driver for MySQL**

### 🛠 Steps to Run the Project

1. **Clone the Repository**  
   ```sh
   git clone https://github.com/your-username/secure-banking-platform.git
   cd secure-banking-platform
   ```  

2. **Import the project into an IDE** 

3. **Configure Apache Tomcat Server within the IDE**

4. **Create the MySQL database:**
   ```sql
   CREATE DATABASE bank;
   ```
   
5. **Create the required tables:**
   ```sql
   CREATE TABLE registration (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       account_number VARCHAR(20) UNIQUE,
       account_type VARCHAR(20),
       branch VARCHAR(50),
       city VARCHAR(50),
       mobile_number VARCHAR(15)
   );

   CREATE TABLE accounts (
       account_number VARCHAR(20) PRIMARY KEY,
       name VARCHAR(100),
       balance DOUBLE DEFAULT 0
   );
   ```
   
6. **Run the Application**  
   - Deploy the project in a **Tomcat server**.  
   - Access the application at `http://localhost:8080/jsp-digital-banking-platform` after successful deployment.  

## 🎯 Outcome

This project demonstrates **secure and scalable web application development**, providing practical experience in **Java-based web technologies, database management, and cybersecurity best practices**.

## 📜 License

This project is licensed under the **MIT License**

# JSP Banking Portal

## Description
The JSP Banking Portal is a secure, web-based application designed to offer users a seamless experience for managing their banking accounts. Built using JavaServer Pages (JSP), this portal enables users to perform essential banking operations such as registration, login, and account management. With added security features like CAPTCHA verification, users can safely interact with their personal banking data, including profile information and transaction history.

**Password Security:** Passwords are securely hashed using the SHA-256 cryptographic technique before storing them in the database, ensuring that user credentials are protected.

### Features
- **User Registration:** Secure registration form to create new accounts.
- **Login:** User authentication with CAPTCHA for added security.
- **Profile Information:** Display of informations after login.
- **Banking Operations:** Manage accounts and perform banking transactions such as deposit, withdrawal, and balance inquiry.

## Technologies Used
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java, MySQL
- **Database:** MySQL
- **Password Security:** SHA-256 hashing for secure password storage

## Setup Instructions
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/jsp-bank-portal.git
    ```

2. Navigate to the project folder:
    ```bash
    cd jsp-bank-portal
    ```

3. Set up your MySQL database and configure the database connection in the project.

4. Build and deploy using your preferred server (Tomcat, for example).

## License
This project is licensed under the MIT License.

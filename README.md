# **Inception Project**

## **Summary**
This project is a System Administration exercise designed to enhance knowledge of Docker. The goal is to create and manage a virtualized infrastructure by building and deploying custom Docker images.

---

## **Requirements**

### **General Guidelines**
- Work on a **Virtual Machine**.
- Place all configuration files in the `srcs/` directory.
- Include a `Makefile` at the project root to set up the entire application.
- Use **custom Dockerfiles** for all services (no pre-built images except Alpine/Debian).
- Use `docker-compose.yml` for container orchestration.

---

### **Mandatory Part**
1. **Services** (each in a dedicated container):
   - **NGINX**: Configured with TLSv1.2 or TLSv1.3.
   - **WordPress**: Installed with `php-fpm`, without NGINX.
   - **MariaDB**: Database service, without NGINX.

2. **Volumes**:
   - One for the WordPress database.
   - One for WordPress website files.

3. **Networking**:
   - Create a Docker network to connect all containers.
   - Do not use `network: host`, `--link`, or similar shortcuts.

4. **Security**:
   - Store sensitive data in a `.env` file.
   - Use the NGINX container as the sole entry point via **port 443** (TLS only).
   - Implement crash recovery for all containers.
   - Avoid infinite loops (e.g., `tail -f`, `while true`).

5. **Domain Name**:
   - Map `login.42.fr` (replace `login` with your username) to your local IP address.

---

### **Bonus Part** (Optional)
- Add Redis for WordPress caching.
- Set up an FTP server for WordPress file access.
- Build a static website (not using PHP).
- Deploy Adminer for database management.
- Add a custom service and explain its purpose during evaluation.

---

## **Project Structure**
```plaintext
.
├── Makefile
├── srcs
│   ├── .env
│   ├── docker-compose.yml
│   ├── requirements
│   │   ├── mariadb
│   │   │   ├── Dockerfile
│   │   │   ├── .dockerignore
│   │   │   └── conf/
│   │   ├── nginx
│   │   │   ├── Dockerfile
│   │   │   ├── .dockerignore
│   │   │   └── conf/
│   │   ├── wordpress
│   │   │   ├── Dockerfile
│   │   │   ├── .dockerignore
│   │   │   └── tools/

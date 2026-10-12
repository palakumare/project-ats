# Recruitment and Applicant Tracking System with ATS Resume Score Detector

A next-generation enterprise **Recruitment and Applicant Tracking System (ATS)** with an integrated **0–100 Weighted ATS Resume Score Detector**, multi-tier role-based authentication, and full candidate pipeline management across India's premier hiring hubs: **Nagpur, Pune, Hyderabad, and Mumbai**.

---

## 1. Final Folder Structure

```text
Recruitment-ATS/
├── frontend/                               # React 18 + Vite SPA Client
│   ├── public/                             # Static public assets & favicon
│   ├── src/
│   │   ├── components/                     # Reusable UI & Glassmorphic Components
│   │   │   ├── AtsScoreGauge.jsx           # Animated circular SVG score gauge
│   │   │   ├── CandidateCard.jsx           # Recruiter candidate card with ATS score badge
│   │   │   ├── Footer.jsx                  # Responsive footer with location hubs
│   │   │   ├── InterviewModal.jsx          # Modal for scheduling interviews
│   │   │   ├── JobCard.jsx                 # Interactive job card with ATS matching modal
│   │   │   ├── Navbar.jsx                  # Dynamic multi-role navbar with notifications
│   │   │   └── ProtectedRoute.jsx          # Role-based route authorization guard
│   │   ├── context/
│   │   │   └── AuthContext.jsx             # React Context for session & authentication state
│   │   ├── pages/                          # Application Views & Dashboards
│   │   │   ├── AdminDashboard.jsx          # System command center with KPI telemetry
│   │   │   ├── AdminHr.jsx                 # Recruiter account oversight & suspension
│   │   │   ├── AdminInterviews.jsx         # Master audit schedule of all interviews
│   │   │   ├── AdminJobs.jsx               # Job requisition moderation & management
│   │   │   ├── AdminUsers.jsx              # Candidate management & compliance
│   │   │   ├── AtsCheckerPage.jsx          # Dedicated 6-factor ATS resume scanner
│   │   │   ├── CandidateApplications.jsx   # Candidate applied jobs tracker
│   │   │   ├── CandidateDashboard.jsx      # Candidate dashboard with live ATS gauge
│   │   │   ├── CandidateInterviews.jsx     # Candidate interview schedules & video links
│   │   │   ├── CandidateProfile.jsx        # Candidate profile & resume re-upload
│   │   │   ├── CandidateRegisterPage.jsx   # Candidate signup with resume upload
│   │   │   ├── HrCandidates.jsx            # Candidates sorted by Highest ATS Score
│   │   │   ├── HrDashboard.jsx             # Recruiter analytics & talent pipeline
│   │   │   ├── HrInterviews.jsx            # Recruiter interview management
│   │   │   ├── HrJobs.jsx                  # Job requisition creation & management
│   │   │   ├── HrProfile.jsx               # Recruiter company profile & password settings
│   │   │   ├── HrRegisterPage.jsx          # Recruiter organization signup
│   │   │   ├── JobsPage.jsx                # Search, filter, and apply to job openings
│   │   │   ├── LandingPage.jsx             # Hero landing page with live ATS preview
│   │   │   └── LoginPage.jsx               # Multi-role login with 1-click test credentials
│   │   ├── services/
│   │   │   └── api.js                      # REST API client service connecting to Spring Boot
│   │   ├── App.jsx                         # Main router with protected portal routes
│   │   ├── index.css                       # Premium glassmorphic styling system
│   │   └── main.jsx                        # React entry point
│   ├── package.json
│   └── vite.config.js                      # Port 3000 config with /api and /uploads proxy
│
├── backend/                                # Java Spring Boot REST API & ATS Engine
│   ├── src/main/java/com/ats/
│   │   ├── config/
│   │   │   └── DataInitializer.java        # Database bootstrapper with demo accounts & jobs
│   │   ├── controller/
│   │   │   ├── ApiController.java          # REST API endpoints (Auth, Jobs, Apps, ATS, Admin)
│   │   │   ├── HomeController.java         # Legacy MVC controller
│   │   │   └── SpaController.java          # Client-side SPA forward controller
│   │   ├── dto/
│   │   │   ├── AtsResultDto.java           # Multi-dimensional ATS score payload
│   │   │   ├── ChangePasswordDto.java
│   │   │   ├── HrProfileDto.java
│   │   │   ├── HrRegistrationDto.java
│   │   │   ├── InterviewDto.java
│   │   │   ├── JobDto.java
│   │   │   ├── UserProfileDto.java
│   │   │   └── UserRegistrationDto.java
│   │   ├── entity/
│   │   │   ├── Application.java            # Job application with ATS matching columns
│   │   │   ├── AtsScore.java               # Persisted multi-factor ATS score history
│   │   │   ├── HR.java                     # HR recruiter entity with company details
│   │   │   ├── Interview.java              # Interview schedule entity
│   │   │   ├── Job.java                    # Job requisition entity
│   │   │   ├── Notification.java           # Real-time alert notifications
│   │   │   └── User.java                   # Candidate user entity with resume & skills
│   │   ├── repository/                     # Spring Data JPA repositories
│   │   ├── security/
│   │   │   ├── CustomUserDetails.java      # UserDetails wrapper with role helpers
│   │   │   ├── CustomUserDetailsService.java # Multi-table identifier authentication
│   │   │   └── SecurityConfig.java         # CORS, CSRF, and role security configuration
│   │   └── service/
│   │       ├── ApplicationService.java     # Application logic & resume verification
│   │       ├── AtsScoringService.java      # 6-Factor dynamic 0-100 ATS scoring algorithm
│   │       ├── FileStorageService.java     # Secure upload handling for PDF, DOCX, DOC
│   │       ├── HrService.java              # Recruiter management & statistics
│   │       ├── InterviewService.java       # Scheduling & notification dispatches
│   │       ├── JobService.java             # Requisition publishing & filtering
│   │       ├── NotificationService.java    # Automated candidate & recruiter alerts
│   │       ├── ResumeParserService.java    # PDFBox 3.0.2 & Apache POI text extractor
│   │       └── UserService.java            # Candidate account & profile management
│   ├── src/main/resources/
│   │   ├── application.properties          # Production properties with env variable overrides
│   │   └── static/                         # Pre-compiled unified React assets
│   └── pom.xml                             # Maven build file with Java 21 & Apache PDFBox
│
├── database/
│   ├── schema.sql                          # Complete normalized MySQL DDL schema
│   └── seed.sql                            # Production seed data script
│
├── uploads/
│   └── resumes/                            # Secure local resume storage directory
│
├── .env.example                            # Production environment template
├── .gitignore                              # Git exclusion rules
├── Dockerfile                              # Multi-stage production container build
├── docker-compose.yml                      # Full-stack Docker orchestration with MySQL
├── package.json                            # Root npm runner delegating to frontend
├── Run_Recruitment_ATS.bat                 # 1-Click Windows execution script
├── Share_ATS_Online.bat                    # 1-Click public HTTPS sharing script
└── README.md                               # Project documentation & deployment manual
```

---

## 2. Technologies Used

### Frontend
- **React.js 18.2**: Component-based reactive user interface.
- **Vite 5.4**: High-performance frontend build tool and development server.
- **React Router DOM 6.22**: Client-side single-page application routing with role guards.
- **Lucide React**: Modern iconography system.
- **Vanilla CSS3 Design System**: Custom glassmorphism, responsive CSS grid, flexbox, CSS custom properties, and animated SVG gauges.

### Backend
- **Java 21 (LTS)**: High-performance modern Java runtime.
- **Spring Boot 3.2.5**: Enterprise microservice framework.
- **Spring Security 6.2**: Role-based access control (`ROLE_ADMIN`, `ROLE_HR`, `ROLE_USER`) with BCrypt password hashing.
- **Spring Data JPA / Hibernate 6.4**: ORM persistence and relational mapping.
- **Apache PDFBox 3.0.2**: Deep text extraction and structural analysis for `.pdf` resumes.
- **Apache POI 5.2.5**: Document parsing for `.docx` and `.doc` resumes.

### Database & Storage
- **MySQL 8.0**: Normalized relational database with foreign key constraints and performance indexes.
- **H2 In-Memory Database**: Zero-config development fallback.
- **Local Secure Storage**: Sandboxed file repository with randomized naming and size validation.

---

## 3. How to Run Frontend

### Prerequisites
- Node.js 18.x or 20.x installed.

### Steps
1. Open terminal in the project directory:
   ```bash
   cd frontend
   ```
2. Install npm dependencies:
   ```bash
   npm install
   ```
3. Start the Vite development server:
   ```bash
   npm run dev
   ```
4. Open your browser at:
   ```text
   http://localhost:3000
   ```
   *(Requests to `/api` and `/uploads` are automatically proxied to Spring Boot on port 8080).*

---

## 4. How to Run Backend

### Prerequisites
- Java Development Kit (JDK 21) installed.
- Maven 3.9+ installed (or use `./mvnw`).

### Steps
1. Open terminal in the backend directory:
   ```bash
   cd backend
   ```
2. Compile and package the application:
   ```bash
   mvn clean package -DskipTests
   ```
3. Run the Spring Boot application:
   ```bash
   mvn spring-boot:run
   ```
   *Or run the compiled JAR directly:*
   ```bash
   java -jar target/recruitment-ats-1.0.0.jar
   ```
4. The backend server starts on port `8080`.
   - REST API Base: `http://localhost:8080/api`
   - Unified Web Application: `http://localhost:8080/`

---

## 5. How to Configure MySQL

### Step 1: Create Database
Open MySQL Workbench, phpMyAdmin, or the MySQL command line client and execute:
```sql
CREATE DATABASE IF NOT EXISTS `recruitment_ats_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Step 2: Import Schema & Seed Data
Execute the provided SQL scripts:
```bash
mysql -u root -p recruitment_ats_db < database/schema.sql
mysql -u root -p recruitment_ats_db < database/seed.sql
```

### Step 3: Configure Spring Boot Connection
Update `backend/src/main/resources/application.properties` or set environment variables:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/recruitment_ats_db?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=your_mysql_password
spring.jpa.hibernate.ddl-auto=update
```

---

## 6. How the ATS Score Detector Works

The platform features an automated **ATS Resume Score Detector** that dynamically parses uploaded resumes (`.pdf`, `.docx`, `.doc`, `.txt`) using Apache PDFBox and Apache POI.

The resume text is analyzed against an extensive technical skill dictionary, job requirements, education taxonomy, and structural formatting heuristics.

### The 6 Weighted Dimensions (0–100 Scale)

| Dimension | Weight | Scoring Logic |
| :--- | :---: | :--- |
| **Keyword Match** | **30%** | Extracts significant keywords from the job description and title, measures resume keyword frequency and density. |
| **Skills Match** | **25%** | Matches candidate skills against required and preferred technologies across programming languages, frameworks, cloud platforms, and databases. |
| **Experience Match** | **20%** | Regex parses career tenure (`X years`, `X+ yrs`, role titles) and benchmarks against requisition seniority thresholds. |
| **Education Match** | **10%** | Identifies degrees (B.Tech, B.E., M.Tech, MCA, BCA, MS, MBA, Ph.D) and awards full score for meeting qualification criteria. |
| **Resume Structure** | **10%** | Checks for core sections: Contact Information, Summary, Skills, Experience, Projects, and Education. |
| **ATS Compatibility** | **5%** | Evaluates document formatting, character encoding, length, layout cleanliness, and readability. |

### Score Categories
- **80 – 100**: `Excellent` — Highly competitive candidate; recommended for immediate interview.
- **60 – 79**: `Good` — Strong candidate profile; meets primary job criteria.
- **40 – 59**: `Average` — Partial alignment; requires additional skill acquisition.
- **0 – 39**: `Needs Improvement` — Missing critical keywords and structured sections.

---

## 7. REST API Endpoints

### Authentication
- `POST /api/auth/login` — Universal login for Candidate, HR, and Admin.
- `POST /api/auth/candidate/register` — Candidate registration with multipart resume upload and auto-scoring.
- `POST /api/auth/hr/register` — Recruiter organization registration.
- `GET /api/auth/me` — Inspect current authenticated session profile.
- `POST /api/auth/logout` — Invalidate session and destroy cookies.

### ATS Resume Detector
- `POST /api/ats/analyze` — Multipart resume upload for on-the-fly ATS scoring.
- `POST /api/ats/analyze/text` — Raw text ATS scoring against optional Job ID.
- `GET /api/ats/{candidateId}` — Retrieve candidate's latest ATS score breakdown.
- `GET /api/ats/job-match/{candidateId}/{jobId}` — Job-specific ATS matching comparison.

### Job Requisitions
- `GET /api/jobs` — Public job listings with keyword, location, experience, and salary filtering.
- `GET /api/jobs/{id}` — Job details and requirements.
- `POST /api/jobs` — Create new job opening *(HR only)*.
- `PUT /api/jobs/{id}` — Update existing job opening *(HR only)*.
- `DELETE /api/jobs/{id}` — Delete job requisition *(HR/Admin)*.

### Applications & ATS Pipeline
- `POST /api/jobs/{id}/apply` — Candidate applies to job with mandatory resume verification and auto-scoring.
- `GET /api/user/applications` — Candidate's applied jobs with match scores and status.
- `GET /api/hr/applications` — Recruiter's applicants **ranked by highest ATS score**.
- `PUT /api/applications/{id}/status` — Update application status (`SHORTLISTED`, `REJECTED`, `SELECTED`).

### Interviews & Scheduling
- `POST /api/interviews` — Schedule interview with date, time, type, and meeting link.
- `GET /api/user/interviews` — Candidate's "My Interviews" list.
- `GET /api/hr/interviews` — Recruiter's scheduled interviews.
- `PUT /api/interviews/{id}/status` — Update interview status (`COMPLETED`, `CANCELLED`).

### Administration & Telemetry
- `GET /api/admin/stats` — System KPIs (total users, HRs, jobs, applications, average ATS score).
- `GET /api/admin/users` — Candidate management list.
- `PUT /api/admin/users/{id}/toggle-status` — Activate/deactivate candidate account.
- `DELETE /api/admin/users/{id}` — Delete candidate record.
- `GET /api/admin/hrs` — HR recruiter accounts audit list.
- `PUT /api/admin/hrs/{id}/toggle-status` — Suspend/activate recruiter account.
- `DELETE /api/admin/hrs/{id}` — Delete recruiter account.

---

## 8. Environment Variables Required

Create a `.env` file in the project root:

```env
# Server Port
PORT=8080
SERVER_PORT=8080

# Database Configuration
SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/recruitment_ats_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
SPRING_DATASOURCE_USERNAME=root
SPRING_DATASOURCE_PASSWORD=your_secure_password

# Hibernate Configuration
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_JPA_SHOW_SQL=false

# Security & CORS
JWT_SECRET=super_secret_jwt_key_ats_recruitment_system_2026_xyz987654321
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080,https://yourdomain.com

# File Upload Configuration
FILE_UPLOAD_DIR=uploads/resumes
SPRING_SERVLET_MULTIPART_MAX_FILE_SIZE=10MB
SPRING_SERVLET_MULTIPART_MAX_REQUEST_SIZE=15MB
```

---

## 9. GitHub Setup Instructions

1. Initialize git in the root folder:
   ```bash
   git init
   ```
2. Verify `.gitignore` is present so that `.env`, `node_modules`, `target`, and private candidate resumes are not tracked.
3. Stage and commit the project:
   ```bash
   git add .
   git commit -m "feat: complete Recruitment and ATS platform with dynamic resume score detector"
   ```
4. Create a repository on GitHub (e.g., `recruitment-applicant-tracking-system`).
5. Link remote and push:
   ```bash
   git remote add origin https://github.com/your-username/recruitment-applicant-tracking-system.git
   git branch -M main
   git push -u origin main
   ```

---

## 10. Deployment Instructions

### Option A: Docker & Docker Compose (Recommended)
Deploy anywhere with Docker installed:
```bash
docker-compose up -d --build
```
This starts both the MySQL 8.0 container and the multi-stage compiled Spring Boot + React container.

### Option B: Cloud Hosting (Render / Railway / AWS / DigitalOcean)

#### Backend Deployment (Render or Railway):
1. Connect your GitHub repository to Render or Railway.
2. Select **Docker** environment (using the provided `Dockerfile`).
3. Add a MySQL service and link environment variables (`SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD`).
4. Set `PORT=8080`.
5. Deploy service.

#### Frontend Deployment (Vercel / Netlify / Unified):
- **Unified Deployment**: The backend `Dockerfile` automatically builds the React SPA and packages it into `src/main/resources/static/`. Deploying the backend automatically serves the full frontend.
- **Standalone Frontend**: Point Vercel or Netlify to `frontend/`, set build command `npm run build`, output directory `dist`, and set `VITE_API_URL` to your backend HTTPS URL.

---

## 11. Public URL Setup Instructions

To provide instant public access without a custom domain:

### Quick HTTPS Tunnel via Cloudflare (Zero Configuration)
1. Run the included script:
   ```cmd
   Share_ATS_Online.bat
   ```
2. Or run directly:
   ```bash
   cloudflared tunnel --url http://localhost:8080
   ```
3. Cloudflare will output a public HTTPS URL:
   ```text
   https://recruitment-ats-random-name.trycloudflare.com
   ```
4. Share this URL with anyone. They can access the full platform from any smartphone, tablet, or desktop browser.

---

## 12. Demo Accounts & Credentials

The platform includes pre-seeded demo accounts for instant evaluation:

| Portal | Username / Email | Password | Role | Description |
| :--- | :--- | :--- | :--- | :--- |
| **System Admin** | `admin` | `admin123` | `ROLE_ADMIN` | Full administrative command center |
| **Candidate Pune** | `aarav_m` | `user123` | `ROLE_USER` | Aarav Mehta (ATS Score: 88/100, Java & Cloud) |
| **Candidate Nagpur** | `palak_j` | `user123` | `ROLE_USER` | Palak Joshi (ATS Score: 84/100, React & Frontend) |
| **Candidate Demo** | `amit` | `user123` | `ROLE_USER` | Amit Kumar (ATS Score: 86/100) |
| **HR Recruiter Pune** | `priya@tcs.com` | `hr123` | `ROLE_HR` | Priya Sharma (Tata Consultancy Services) |
| **HR Recruiter Nagpur** | `rajesh@infosys.com` | `hr123` | `ROLE_HR` | Rajesh Kulkarni (Infosys Technologies) |

*(1-click login buttons are also available on the `/login` page for fast role switching).*

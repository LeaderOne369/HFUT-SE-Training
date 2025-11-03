# Knowledge Sharing Platform (KSP)

A comprehensive knowledge sharing and community platform built with modern web technologies, featuring AI-powered assistance, real-time search capabilities, and a full suite of social interactions.

## 🎯 Project Overview

Knowledge Sharing Platform is a full-stack web application developed as a software engineering capstone project. The platform provides users with a collaborative environment to share knowledge, engage in discussions, manage content collections, and interact with an intelligent AI assistant. It features a clean separation of concerns with a robust backend API and a responsive frontend interface.

## ✨ Key Features

### User Management & Authentication

- **JWT-based Authentication**: Secure user authentication and authorization
- **Role-based Access Control**: Separate interfaces for administrators and regular users
- **User Profiles**: Comprehensive user profile management with statistics

### Content Management

- **Post Creation & Editing**: Rich text editor with Markdown support for creating knowledge posts
- **Categories & Sections**: Organized content structure with multiple categories and sections
- **Search & Discovery**: Elasticsearch-powered full-text search with real-time indexing via Canal
- **Ranking System**: Popular content ranking based on engagement metrics

### Social Interactions

- **Comments & Replies**: Nested comment system with like functionality
- **Collections**: Organize content into curated collections
- **Favorites**: Save posts to personalized folders
- **Following & Followers**: User relationship management
- **Real-time Notifications**: Push notifications for user activities

### AI Integration

- **AI Chat Assistant**: Intelligent conversational AI powered by Coze API
- **Streaming Responses**: Real-time streaming chat responses
- **Content Generation**: AI-assisted article writing based on user inputs
- **Activity Summaries**: Automatic generation of user activity summaries

### Admin Dashboard

- **User Management**: Comprehensive user administration
- **Content Moderation**: Post and comment review system
- **Statistics & Analytics**: Platform-wide metrics and insights
- **Report Management**: Handle user-reported content
- **Feedback System**: User feedback collection and management

### Media & Storage

- **MinIO Integration**: Object storage for images and files
- **Multi-file Upload**: Support for multiple file types
- **CDN-ready**: Optimized media delivery

## 🏗️ Architecture

### Backend (Java/Spring Boot)

```
kspback/
├── common/               # Shared utilities and configurations
│   ├── async/           # Asynchronous task processing
│   ├── config/          # Spring configurations
│   ├── filter/          # Request filters
│   ├── handler/         # Exception and response handlers
│   └── utils/           # Utility classes
├── framework/           # Framework integrations
│   ├── ai/              # AI service integration
│   ├── elasticsearch/   # Search engine integration
│   ├── minio/           # Object storage integration
│   └── security/        # Security components
├── modules/
│   ├── admin/           # Admin management APIs
│   ├── client/          # Client-facing APIs
│   ├── proxy/           # Proxy services
│   └── system/          # Core system services
└── test/                # Test utilities
```

### Frontend (Vue 3)

```
kspfront-master/
├── api/                 # API service layer
│   ├── admin/           # Admin API endpoints
│   └── client/          # Client API endpoints
├── components/          # Reusable Vue components
├── views/               # Page components
│   ├── admin/           # Admin interface views
│   └── client/          # Client interface views
├── router/              # Vue Router configuration
├── stores/              # Pinia state management
└── utils/               # Frontend utilities
```

## 🛠️ Technology Stack

### Backend

- **Framework**: Spring Boot 3.3.1
- **Language**: Java 17
- **Security**: Spring Security + JWT
- **ORM**: MyBatis-Plus 3.5.7
- **Database**: MySQL 8.0
- **Cache**: Redis
- **Search**: Elasticsearch 8.10.3
- **Object Storage**: MinIO 8.5.7
- **Canal**: Database change capture and ES synchronization
- **AI**: Coze API integration
- **Documentation**: Swagger/OpenAPI 3
- **Build Tool**: Maven

### Frontend

- **Framework**: Vue 3.5.13
- **Build Tool**: Vite 6.0.5
- **UI Library**: Element Plus 2.9.1
- **State Management**: Pinia 2.3.0
- **Routing**: Vue Router 4.5.0
- **HTTP Client**: Axios 1.7.9
- **Rich Text Editor**: Vue Quill
- **Markdown**: markdown-it

## 🚀 Getting Started

### Prerequisites

- Java 17 or higher
- Node.js 18+ and npm
- MySQL 8.0+
- Redis 6.0+
- Elasticsearch 8.10+
- MinIO server
- Canal server (optional, for ES sync)

### Backend Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd HFUT-SE-Training/kspback
   ```

2. **Configure database**

   - Create MySQL database `ksp2`
   - Import the SQL schema: `ksp2.sql`

3. **Update configuration**

   - Edit `src/main/resources/application.yml`
   - Configure database, Redis, Elasticsearch, MinIO, and other service endpoints

4. **Build and run**

   ```bash
   ./mvnw clean install
   ./mvnw spring-boot:run
   ```

5. **Access Swagger UI**
   - Navigate to `http://localhost:7001/swagger-ui.html`

### Frontend Setup

1. **Navigate to frontend directory**

   ```bash
   cd kspfront-master
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Configure API endpoint**

   - Update API base URL in `src/utils/request.js`

4. **Run development server**

   ```bash
   npm run dev
   ```

5. **Build for production**
   ```bash
   npm run build
   ```

## 📊 Database Schema

The platform includes comprehensive database design with the following key entities:

- **User**: User accounts, roles, and authentication
- **Post**: Knowledge posts with rich content
- **Comment**: Nested comment system
- **Collection**: Content collections and folders
- **Favorite**: User favorites management
- **Section**: Content categorization
- **Like**: Interaction tracking
- **Share**: Content sharing records
- **Notification**: User notifications
- **Report**: Content reporting system
- **Feedback**: User feedback
- **Citation**: Reference management

## 🔒 Security

- JWT-based stateless authentication
- Spring Security for authorization
- Password encryption with BCrypt
- CORS configuration
- SQL injection prevention via MyBatis-Plus parameter binding
- XSS protection in frontend rendering

## 🔍 Search Functionality

- **Full-text Search**: Elasticsearch-powered content search
- **Real-time Indexing**: Canal-based MySQL to ES synchronization
- **Advanced Filters**: Category, section, and time-based filtering
- **Search History**: User search history tracking

## 📱 Features in Detail

### AI Assistant

- **Conversational Interface**: Natural language interaction
- **Streaming Responses**: Real-time streaming for better UX
- **Context Awareness**: Maintains conversation context
- **Content Assistance**: Helps with article writing and content generation

### Admin Features

- Comprehensive dashboard with statistics
- User management and role assignment
- Content moderation workflow
- Report handling and resolution
- System configuration

### User Experience

- Responsive design for all devices
- Real-time notifications
- Rich text editing with Quill
- Markdown support
- File upload and management
- Personal activity tracking

## 🧪 Testing

- Backend unit tests with JUnit
- Integration tests for API endpoints
- Frontend component testing (recommended)

## 📝 API Documentation

Comprehensive API documentation is available via Swagger UI at:

```
http://localhost:7001/swagger-ui.html
```

## 🤝 Contributing

This project was developed as part of a university capstone course. For contributions or inquiries, please contact the project maintainers.

## 📄 License

This project is proprietary software developed for educational purposes.

## 👥 Team

Developed by the KSP Development Team as part of the Software Engineering Capstone course at Hefei University of Technology.

## 🎓 Learning Outcomes

- Full-stack web development with modern frameworks
- RESTful API design and implementation
- Database design and optimization
- Search engine integration
- AI integration and API usage
- Authentication and authorization
- Real-time data synchronization
- Responsive UI/UX design
- Project management and team collaboration

---

**Note**: This is a showcase project demonstrating proficiency in modern web development, software architecture, and collaborative development practices.

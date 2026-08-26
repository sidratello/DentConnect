# 🦷 DentConnect

DentConnect is a graduation project developed to create a digital connection between **dentists and dental laboratories**.

The platform simplifies communication and collaboration between dentists and dental laboratories by providing tools for laboratory discovery, dental case management, order tracking, digital scanning appointments, invoicing, payments, advertisements, professional content, and real-time notifications.

---

## 📱 About the Project

DentConnect is a Flutter mobile application designed around two main user roles:

- 👨‍⚕️ Dentists
- 🧪 Dental Laboratories

Each role has its own dedicated workflows and features while both sides are connected through one integrated platform.

The goal of DentConnect is to digitize the workflow between dentists and dental laboratories, starting from finding a suitable laboratory and creating a dental case, through production and communication, until the final restoration is completed and delivered.

---

# 👨‍⚕️ Dentist Application

The dentist side allows dentists to find laboratories, manage patients and cases, send orders, and follow the progress of dental restorations.

### Main Features

Dentists can:

- Create and manage their professional account.
- Upload professional information and required verification documents.
- Search for dental laboratories.
- Search based on available laboratory information and services.
- View laboratory profiles.
- View laboratory specialties.
- View available materials and services.
- View laboratory prices.
- View ratings and laboratory work galleries.
- Connect and communicate with laboratories.
- Create and manage patient records.
- Create dental cases.
- Create orders associated with patient cases.
- Specify restoration requirements.
- Select teeth related to the restoration.
- Specify shade and other clinical information.
- Add delivery dates.
- Upload digital files, images, and case attachments.
- Send orders to laboratories.
- Track the status of submitted orders.
- Receive requests for additional information from laboratories.
- Review order details and production updates.
- Use reusable templates for frequently created orders.
- View invoices.
- Pay eligible invoices through the application.
- Book digital scanning appointments.
- View notifications.
- Submit complaints.
- Browse professional dental content and blog posts.

---

# 🧪 Dental Laboratory Application

The laboratory side provides a comprehensive environment for laboratories to manage their presence on the platform and handle their workflow with dentists.

It covers the process from laboratory account creation and profile management to receiving orders, production tracking, pricing, invoicing, digital scanning appointments, advertisements, and communication.

## 🔐 Laboratory Account & Profile

Dental laboratories can:

- Create a laboratory account.
- Manage authentication and account information.
- Complete the laboratory profile.
- Manage laboratory information and description.
- Define available specialties.
- Define materials used by the laboratory.
- Add available services.
- Add and manage prices.
- Upload and manage a laboratory profile image.
- Create and manage a gallery of completed work.
- Configure the availability of digital scanning services.
- Manage additional laboratory information.

---

## 🤝 Dentist Relationship Management

Laboratories can manage their professional relationships with dentists through the platform.

They can:

- Receive connection requests from dentists.
- Accept or reject connection requests.
- View connected dentists.
- Manage requests from individual dentists.
- Disconnect when necessary.

This creates a direct digital connection between the dentist and laboratory.

---

## 📦 Dental Order Management

One of the main components of the laboratory application is the dental order management system.

Laboratories can:

- Receive orders submitted by dentists.
- Review complete order information before accepting it.
- Review patient and case-related information.
- View requested restoration details.
- View uploaded images and digital files.
- Accept an order.
- Reject an order.
- Request additional information from the dentist.
- Add notes and documentation.
- Upload images related to the production process.
- Track and update the progress of each order.
- View previous and active orders.

---

## ⚙️ Dental Restoration Production Workflow

After an order is accepted, the laboratory can manage its progress through different production stages.

The workflow includes:

1. **Accepted**
2. **In Design**
3. **In Production**
4. **Coloring**
5. **Ready**
6. **Delivered**

### In Design

The dental restoration is being prepared and designed according to the case information and digital data provided by the dentist.

### In Production

The restoration moves from the design stage to the actual manufacturing process using the appropriate laboratory technique and material.

### Coloring

The restoration is adjusted aesthetically according to the required tooth shade and appearance.

### Ready

The laboratory has completed the restoration and it is ready to be delivered.

### Delivered

The completed restoration has been delivered to the dentist.

This workflow allows both sides to follow the progress of the dental order more clearly.

---

## 💰 Pricing & Invoices

The laboratory application includes functionality for managing prices and order-related financial information.

Laboratories can:

- Define prices for their available services and restoration types.
- Manage laboratory pricing information.
- Set pricing related to dental orders.
- Determine estimated and final order prices when applicable.
- Review order invoices.
- Manage invoice-related information.
- Follow payment status.

This allows financial information to remain connected directly to the corresponding dental order.

---

## 📅 Digital Scanning Service & Appointments

Laboratories that provide digital scanning services can manage this service directly through the application.

The laboratory can:

- Enable the digital scanning service.
- Add available scanning appointments.
- Manage available appointment times.
- View reservations made by dentists.
- Organize scanning appointments through a calendar-based workflow.

Dentists can then view available appointments and reserve an appropriate time for their patients.

The purpose is to simplify coordination of intraoral digital scanning between dentists and laboratories.

---

## 💳 Laboratory Subscription System

DentConnect includes a subscription system for dental laboratories.

A laboratory can initially access the application through the available free subscription and then manage or renew its subscription according to the plans provided by the system.

The subscription workflow includes:

- Viewing subscription plans.
- Viewing subscription information.
- Subscription status management.
- Renewal workflow.
- Online payment integration.

This allows the platform to manage laboratory access according to the current subscription status.

---

## 📢 Laboratory Advertisements

Dental laboratories can promote their services directly inside DentConnect.

The advertisement system allows laboratories to:

- Create advertisements.
- Add advertisement information.
- Upload advertisement images.
- Publish promotional content.
- Manage advertisements.
- View advertisement information.
- Handle advertisement-related payment workflows.

Advertisements can be used to promote:

- Laboratory services.
- Special offers.
- New technologies.
- Dental materials.
- Digital scanning services.
- Other professional laboratory services.

---

## 📝 Professional Blog

DentConnect includes a professional content and blog section.

Laboratories can use this section to share professional dental content and information with dentists.

The blog functionality includes:

- Creating posts.
- Adding text content.
- Uploading images.
- Viewing published posts.
- Viewing post details.
- Managing pending content according to the application workflow.

The purpose of this feature is to create a professional space for sharing knowledge, laboratory work, techniques, and relevant dental information.

---

## 📩 Complaints & Communication

The application provides functionality to improve communication between dentists and laboratories.

Laboratories can:

- Receive complaints submitted by dentists.
- Review complaint information.
- Respond to complaints.
- Follow communication related to orders and professional relationships.

This helps keep important communication connected to the platform rather than relying entirely on external communication channels.

---

## 🔔 Real-Time Notifications

DentConnect includes a real-time notification system to keep laboratories and dentists informed about important activities.

The application uses **SignalR** for real-time communication together with local notifications on the mobile device.

Notifications can be used for events such as:

- New dental orders.
- Order updates.
- Order status changes.
- Dentist/laboratory requests.
- Appointment-related activities.
- Other important platform events.

---

# 🛠️ Technologies Used

The mobile application was developed using:

- **Flutter**
- **Dart**
- **GetX**
- **REST APIs**
- **SignalR**
- **Local Notifications**
- **JSON**
- **Git**
- **GitHub**
- **Android**

The Flutter application communicates with backend APIs for authentication, profiles, laboratories, dentists, orders, payments, subscriptions, advertisements, notifications, and other platform functionality.

---

# 🏗️ Application Architecture

The Flutter project is organized into different features and modules to separate responsibilities within the application.

The project includes components for:

- Models
- Controllers
- Repositories
- Views
- Reusable widgets
- API communication
- Authentication
- Storage
- Routing
- State management
- Notifications

GetX is used for state management, dependency management, and navigation in different parts of the application.

---

# 🎓 Graduation Project

DentConnect was developed as a graduation project for the:

**Faculty of Informatics Engineering**

**Software Engineering Specialization**

### Project Title

**DentConnect – A Connection Between Dentists and Dental Laboratories**

The project focuses on digitizing and simplifying the collaboration between dentists and dental laboratories throughout the dental restoration workflow.

---

# 👩‍💻 My Contribution

DentConnect was developed collaboratively as a graduation project.

My primary responsibility was the **complete development of the Dental Laboratory side of the Flutter application**, which represents a major part of the overall DentConnect platform.

I designed and implemented the laboratory application's functionality and integrated it with the backend APIs.

### My work included:

- Complete Flutter development of the Dental Laboratory application.
- Laboratory registration and authentication workflows.
- Laboratory account and profile management.
- Laboratory profile image management.
- Laboratory work gallery.
- Specialties management.
- Materials management.
- Services and pricing.
- Dentist connection and relationship management.
- Receiving and managing dentists' dental orders.
- Complete laboratory-side order workflow.
- Dental restoration production-stage management.
- Order details and case information.
- File and image handling.
- Production documentation.
- Estimated and final pricing workflows.
- Invoice-related functionality.
- Laboratory subscription system.
- Subscription payment workflows.
- Digital scanning service management.
- Digital scanning appointment management.
- Laboratory advertisements.
- Advertisement payment workflows.
- Laboratory professional blog functionality.
- Complaint management.
- Real-time communication using SignalR.
- Local notification integration.
- REST API integration.
- GetX state management and navigation.
- Form validation and error handling.
- Testing and debugging.
- Final integration and preparation of the laboratory application for release.

The laboratory application covers the workflow from **laboratory account setup and professional profile management to dentist communication, order reception, restoration production, pricing, invoicing, payments, and final delivery**.

---

## 📌 Project Status

The application was completed as a university graduation project.

The repository contains the final integrated Flutter application for both the dentist and dental laboratory sides.
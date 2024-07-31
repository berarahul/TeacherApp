# Teacher Attendance App

## Overview
The Teacher Attendance App is designed for college teachers to manage student attendance, monitor attendance percentages, and determine eligibility for exams based on attendance criteria. Teachers can use this app to ensure that students with less than 75% attendance are not allowed to take exams, while those with 75% or more are eligible.

## Features
### Sign Up and Login
- **Sign Up:**
    - Teachers register using their name, Aadhaar card, username, password, and confirm password.
    - Upon clicking the sign-up button, a request is sent to the controller.
    - If the controller accepts the registration request, the teacher is eligible to log in.

- **Login:**
    - Teachers can log in with their username and password.
    - Successful login grants access to the main app features.

### Main Tabs
After logging in, the following tabs are available:

1. **Home:**
    - Overview of the app.
    - Quick access to important features and notifications.

2. **Attendance:**
    - Take and manage attendance for students.
    - View attendance records for each subject.
    - Determine student eligibility for exams based on attendance percentage.

3. **Students:**
    - View student details and attendance percentages.
    - Check which students are eligible or ineligible for exams.

4. **Profile:**
    - Manage teacher profile information.
    - Update personal details and password.

### Holiday Feature
- If the current day is a holiday, the attendance tab is disabled.
- The reason for the holiday is displayed, preventing attendance from being taken on that day.

## Technology Stack
- **Framework:** Flutter
- **Platform:** Currently available for Android

## Functionality
1. **Sign Up:**
    - Teachers fill in their details and submit the form.
    - The controller verifies the details and approves the registration.

2. **Login:**
    - Teachers log in using their credentials.
    - Upon successful login, the main interface with four tabs is displayed.

3. **Attendance Management:**
    - Teachers select a class and subject to take attendance.
    - Attendance is recorded and stored in the database.
    - Attendance percentages are calculated automatically.
    - Eligibility for exams is determined based on attendance percentages:
        - Less than 75%: Not eligible for exams.
        - 75% or more: Eligible for exams.

4. **Holiday Feature:**
    - The app checks for holidays.
    - If it's a holiday, the attendance tab is disabled, and the reason is displayed.

## User Interface
### Sign Up Page
- Fields: Name, Aadhaar Card, Username, Password, Confirm Password
- Sign Up button to submit the form.

### Login Page
- Fields: Username, Password
- Login button to access the app.

### Main Tabs
- **Home:** Dashboard with notifications and quick access.
- **Attendance:** Attendance recording interface.
- **Students:** List of students with attendance percentages.
- **Profile:** Editable teacher profile information.

## Conclusion
The Teacher Attendance App is a comprehensive solution for managing student attendance in colleges, ensuring compliance with attendance requirements, and simplifying the process of determining exam eligibility. The app's holiday feature adds convenience by automatically disabling attendance on holidays. Built with Flutter, the app is currently available for Android users.

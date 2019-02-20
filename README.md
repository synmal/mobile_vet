# Mobile Vet
Mobile Vet is a web-app for booking vet appointment. Vets will travel to user's preferred appointment point to check on their pets.

This is for NEXT Academy final assessment.

# User Authentication

  - User authentication without using Clearance/Devise
  - Password encryted using Bcrypt gem
  - Phone Number encryted using [attr_encrypted](https://github.com/attr-encrypted/attr_encrypted) gem

# Role Concept
- User of the website have 3 roles: user, doctor & admin
- Each role will have an effect to the view. Eg. Doctor can view all the views, Admin have access to admin dashboard etc.
- Admin dashboard is set up using [rails_admin](https://github.com/sferik/rails_admin) gem.

# Search Functionality
- Search using [pg_search](https://github.com/Casecommons/pg_search) gem.

# Integrating [Twilio](https://www.twilio.com/) API
- Twilio API integration using [twilio-ruby](https://github.com/twilio/twilio-ruby) gem.
- Send SMS to users if their appointment is accepted or declined

# AJAX Implementation
- Search bar
- Pagination
- Updating appointment status (for Doctor)

# RSpec & Capybara
- RSpec testing on user, pet and appointment
- Capybara test on sign up feature


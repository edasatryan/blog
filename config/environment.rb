# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Uploaded file location
Blog::Application.config.x.file.path = 'public/images/upload'
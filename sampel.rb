#!/usr/bin/env ruby
# This is a sample Ruby file to test tree-sitter parsing capabilities

# A module for organization
module SampleModule
  # A simple Ruby class
  class Person
    attr_accessor :name, :age, :email
    
    def initialize(name, age, email = nil)
      @name = name
      @age = age
      @email = email
    end
    
    def greeting
      "Hello, my name is #{@name} and I am #{@age} years old."
    end
    
    def adult?
      @age >= 18
    end
    
    # Method with complex parameters
    def update_info(name: nil, age: nil, email: nil)
      @name = name if name
      @age = age if age
      @email = email if email
      self
    end
  end
  
  # Class with inheritance
  class Employee < Person
    attr_accessor :job_title, :salary
    
    def initialize(name, age, job_title, salary, email = nil)
      super(name, age, email)
      @job_title = job_title
      @salary = salary
    end
    
    def greeting
      super + " I work as a #{@job_title}."
    end
  end
  
  # Module for Ruby mixins
  module Loggable
    def log(message)
      puts "[LOG] #{Time.now}: #{message}"
    end
  end
  
  # Class that includes a module
  class Logger
    include Loggable
    
    def initialize
      log("Logger initialized")
    end
  end
  
  # Rails-like model
  class User < ApplicationRecord
    belongs_to :department
    has_many :posts
    has_many :comments, through: :posts
    
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    
    before_save :normalize_email
    after_create :send_welcome_email
    
    scope :active, -> { where(active: true) }
    scope :admins, -> { where(admin: true) }
    
    def normalize_email
      self.email = email.downcase.strip if email.present?
    end
    
    def send_welcome_email
      # Some code to send an email
      puts "Sending welcome email to #{email}"
    end
    
    def self.find_by_credentials(email, password)
      user = find_by(email: email)
      return user if user&.authenticate(password)
      nil
    end
  end
end

# Code outside of modules/classes
def standalone_function(param)
  "This is a standalone function: #{param}"
end

# Some execution code
person = SampleModule::Person.new("Alice", 30, "alice@example.com")
puts person.greeting

employee = SampleModule::Employee.new("Bob", 25, "Developer", 75000)
puts employee.greeting

logger = SampleModule::Logger.new

# Hash with symbol keys
config = {
  host: "localhost",
  port: 3000,
  debug: true
}

# Usage of blocks and procs
[1, 2, 3, 4, 5].each do |number|
  puts "Number: #{number}"
end

# Lambda expression
multiply = ->(x, y) { x * y }
puts multiply.call(5, 3)

puts standalone_function("Hello, world!") 

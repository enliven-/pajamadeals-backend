require 'rubygems'
require 'bundler'

Bundler.require

ENV['RACK_ENV'] ||= 'development'

Dir.glob('./{config/initializers,lib,app/uploaders,app/helpers,app/controllers,app/models}/*.rb').each do |file|
  require file
end

# university
university = University.create name: 'Pune University'

# college
college = College.create name: 'Vishwakarma Institute of Technology',
  abbr: 'VIT', city: 'Pune', zipcode: '411037', latitude: '18.464156',
  longitude: '73.868132', university: university

# department
department = Department.create name: 'Mechanical Engineering', abbr: 'Mech'

# course
course = Course.create name: 'Bachelor of Engineering', abbr: 'BE'

# semester
semester = Semester.create name: '1'

# subject
subject = Subject.create name: 'Machine Design', abbr: 'MD'

# publication
publication = Publication.create name: 'Techmax'

# book
book = Book.create title: 'Design of Machine', authors: 'Shantaram', mrp: '450',
  university: university, department: department, course: course,
  semester: semester, subject: subject, publication: publication

# user
user1 = User.create name: 'Ankush Zanwar', mobile: '9975454381', college: college
user2 = User.create name: 'Abhisekh Sohane', mobile: '9975454382', college: college

# listing
listing = Listing.create book: book, user: user1, description: 'lorem ipsum',
  price: '200', markings: 0, quality: 0

# order
order = Order.create listing: listing, buyer: user2, handler: AdminUser.first

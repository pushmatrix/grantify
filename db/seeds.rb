# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

testUser1 = User.create({:email=>"test@uottawa.ca",:password=>"123456"})

Grant.create(:user=>testUser1,:conference_name=>"Rails Conf 2011",:status=>1)
Grant.create(:user=>testUser1,:conference_name=>"CUSEC 2011",:status=>1)

testAdmini = User.create({:email=>"admin@uottawa.ca",:password=>"admin",:admin=>:true})
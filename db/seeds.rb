# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

testUser1 = User.create({:student_number=>"111111",:password=>"bloh"})
testUser2 = User.create({:student_number=>"222222",:password=>"bloh"})
testUser3 = User.create({:student_number=>"333333",:password=>"bloh"})
testUser4 = User.create({:student_number=>"444444",:password=>"bloh"})
testUser4 = User.create({:student_number=>"555555",:password=>"555555"})
testUser4 = User.create({:student_number=>"666666",:password=>"666666"})
testUser4 = User.create({:student_number=>"777777",:password=>"777777"})
testUser4 = User.create({:student_number=>"888888",:password=>"888888"})

defaults = {:conference_date=>'March 2011',:prev_apply=>false,:region=>'0',:registration_cost=>'52',:transportation_cost=>'54',:accommodation_cost=>'100',:meal_cost=>'60',:department_assis=>'100',:faculty_assis=>'0',:other_assis=>'0'}

Grant.create({:user=>testUser1,:conference_name=>"Rails Conf 2011", :status=>Grant::STATUS['IN PROCESS']}.merge defaults)
Grant.create({:user=>testUser1,:conference_name=>"SXSW", :status=>Grant::STATUS['IN PROCESS']}.merge defaults)

Grant.create({:user=>testUser2,:conference_name=>"Ruby Conf 2011", :status=>Grant::STATUS[:EDITING]}.merge defaults)
Grant.create({:user=>testUser2,:conference_name=>"SXSW 2011", :status=>Grant::STATUS['TEMPORARY']}.merge defaults)

Grant.create({:user=>testUser3,:conference_name=>"RazibConf 2012", :status=>Grant::STATUS[:EDITING]}.merge defaults)
Grant.create({:user=>testUser3,:conference_name=>"Comicon 2011", :status=>Grant::STATUS['IN PROCESS']}.merge defaults)

Grant.create({:user=>testUser4,:conference_name=>"Open Data Hackfest", :status=>Grant::STATUS[:TEMPORARY]}.merge defaults)
Grant.create({:user=>testUser4,:conference_name=>"NXNE", :status=>Grant::STATUS[:EDITING]}.merge defaults)

testAdmini = User.create({:student_number=>"admin",:password=>"bloh"})
testAdmini.admin = true
testAdmini.name = "Razib Iqbal"
testAdmini.save(:validate=>false)

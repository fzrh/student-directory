require 'student_directory'
require 'csv'

describe 'student directory' do

  it 'converts hash to array' do
    hash_example = {:name=>"Kate", :cohort=>"May", :year=>2014}
    expect(array_from(hash_example)).to eq ["Kate", "May", 2014]
  end

  it 'reads(loads) csv file' do
    file = "students.csv"
    read(file)
    expect(students.include?({:name=>"cats", :cohort=>"May", :year=>2014}))
  end

  it 'writes to csv file' do
    file = "students.csv"
    input = [["cats", "May", "2014"], ["dogs", "May", "2014"]]
    write(file, input)
    expect(read(file).include?({:name=>"cats", :cohort=>"May", :year=>2014}))
  end  

end
require 'csv'

def students
	@students ||= []
end 

def hash_from(array)
	{:name=> array[0],:cohort=> array[1],:year=> array[2].to_i}
end

def array_from(hash)
	hash.values
end

def read(file)
	CSV.foreach(file).map {|row| students << hash_from(row)}
	return students
end

def write(file, student)
	i = 0
	while i < student.length
		CSV.open(file, "a+") {|csv| csv << student[i]}
		i += 1
	end
end  
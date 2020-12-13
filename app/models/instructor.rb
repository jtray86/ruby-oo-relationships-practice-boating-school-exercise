class Instructor
    @@all =[]
    attr_reader :name
    def initialize(name_instructor)
       @name = name_instructor
       @@all << self
    end    
    def self.all
        @@all
    end  
    def instructor_test
        BoatingTest.all.select {|student| student.instructor ==self}
    end   
    def all_students
        self.all_tests.map{|test| test.student} 
    end 
    # * `Instructor#passed_students` should return an array of students who passed a boating test with this specific instructor.  
    def passed_students
        self.instructor_test.select {|student| student.test_status == "passed"}  
    end
    def find_student(name)
        Student.all.find{|student| student.student_name == name}
    end 
    def find_test(test_name_str)
        BoatingTest.all.find{|test| test.test_name == test_name_str}
    
    def pass_student (name_str, test_name_str)
        test = find_test(test_name_str)

        if test && test.student.student_name == name_str
            test.test_status = "passed"
        else    
            student = find_student(name_str)
            BoatingTest.new(student, test_name, "passed", self)  
        
    end
    def fail_stude(name_str, test_name_str)
        test = find_test(test_name_str)

        if test && test.student.student_name == name_str
            test.test_status = "failed"
        else    
            student = find_student(name_str)
            BoatingTest.new(student, test_name, "failed", self)  
    end
            
end
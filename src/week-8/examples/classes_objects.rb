
class A
    def m1
        34
    end
    def m2 (x, y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end
end

a = A.new
puts a.m2(3, 4)

class B
    def m1
        5
    end
    def m3 x
        x.abs * 2 + self.m1
    end
    def m4
        # No hoisting # puts t
        t = 5
        puts t
    end
end

b = B.new
puts b.m3(3)
puts b.m4

# Chaining

class C
    def m1
        print "Hello"
        self
    end
    def m2
        print " World"
        self
    end
    def m3
        print "My Name is Medet"
        self
    end
    def m4
        print "\n"
        self
    end
end

c = C.new
c.m1.m2.m4.m3.m4


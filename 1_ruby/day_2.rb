path = './t.txt'
File.write(path, "foo \nbar \nbaz")

f = File.open(path)
puts f.readlines

File.open(path) {|l| puts l.readlines} # using code block

# idea to convert hash to array
h = {a: 0, b: 1, c: 2}
harr = []
h.each {|key, value| harr.push([key, value])}
p harr

# conversion of array to hash
a = ['x','y','z']
ahash = {}
i = 0
while i < a.length do
    ahash[i] = a[i]
    i += 1
end
p ahash

# arr of sixteen numbers
ar = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
sli = []
ar.each { |e|
    sli.push(e)
    if sli.length == 4
      p sli
      sli.clear
    end
}

ar.each_slice(4) {|a| p a}
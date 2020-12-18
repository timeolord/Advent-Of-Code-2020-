using Pkg
using CSV
using DataFrames
using Zygote

minMax = String[]
letter = String[]
passwords = String[]


for row in CSV.File("Advent_2_2020_List.csv", normalizenames=true)
    push!(minMax, row.a)
    push!(letter, row.b)
    push!(passwords, row.c)
end

max = Int[]
min = Int[]

for nums in minMax
    splitup = split(nums,'-')
    push!(min,parse(Int, splitup[1]))
    push!(max,parse(Int, splitup[2]))
end

character = Char[]

for letters in letter
    lett = split(letters, ':')
    push!(character, only(lett[1]))
end

okaypass = 0
i = 1
for pass in passwords
    maxVal = max[i]
    minVal = min[i]
    lettr = character[i]
    if pass[maxVal] == lettr && pass[minVal] != lettr
        global okaypass += 1
    elseif pass[maxVal] != lettr && pass[minVal] == lettr
        global okaypass += 1
    end
    global i += 1
end


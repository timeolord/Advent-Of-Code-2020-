using Pkg

passports = open("Day 4\\Advent-4-2020.txt") do file
    readlines(file)
end

function getPassInfo(passportList::Array{String})
    list = Array{String}[]
    i = 0
    temp = String[]
    for lines in passportList
        if length(lines) == 0
            push!(list, copy(temp))
            empty!(temp)
            i += 1
        end
        push!(temp, lines)
    end
    return list
end

function assignPass(passportList::Array{Array{String}})
    temp = String[]
    for people in passportList
        push!(temp, join(people, " "))
    end
    valid = 0
    for (index, ids) in enumerate(temp)
        if check(ids)
                valid += 1
        end
            #=byr = contains(ids, "byr")
            iyr = contains(ids, "iyr")
            eyr = contains(ids, "eyr")
            hgt = contains(ids, "hgt")
            hcl = contains(ids, "hcl")
            ecl = contains(ids, "ecl")
            pid = contains(ids, "pid")
            =#
    end
    return valid
end

function check(string::String)
    if (contains(string, "byr:") && contains(string, "iyr:") && contains(string, "eyr:") && contains(string, "hgt:") && contains(string, "hcl:") && contains(string, "ecl:") && contains(string, "pid:"))
        return true
    else
        return false
    end
end

#println(getPassInfo(passports))
assignPass(getPassInfo(passports))
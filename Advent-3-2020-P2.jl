using Pkg

hill = open("Advent-3-2020-List.txt") do file
    readlines(file)
end

function traverse(list::Array, right::Int, down::Int)
    trees = 0
    i = right+1
    j = down+1
    while (j <= length(list))
        if i > 31
            i -= 31
        end 
        if list[j][i] == '#'
            trees += 1
        end
        i += right
        j += down
    end
    return trees
end

variable = traverse(hill, 1, 1)
variable1 = traverse(hill, 3, 1)        
variable2 = traverse(hill, 5, 1)            
variable3 = traverse(hill, 7, 1)
variable4 = traverse(hill, 1, 2)

print(variable * variable1 * variable2 * variable3 * variable4)
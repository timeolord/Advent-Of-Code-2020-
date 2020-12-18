using Pkg

hill = open("Advent-3-2020-List.txt") do file
    readlines(file)
end

function traverse(list::Array)
    trees = 0
    i = 1
    for rows in list
        if i > 31
            i -= 31
        end 
        if rows[i] == '#'
                trees += 1
        end
        i += 3
        if rows == list[1]
            continue
        end
    end
    return trees
end

traverse(hill)
        
            
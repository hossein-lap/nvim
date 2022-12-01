#!/bin/lua5.4

for i = 1, 5, 1 do
    for j = 1, 5, 1 do
        io.write(i * j .. '\t')
    end
    io.write("\n")
end

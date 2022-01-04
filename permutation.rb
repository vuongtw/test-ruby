def permutation(str="", prefix="")
    if str.length == 0
        puts prefix
    else
        for i in 0..str.length - 1 do
            rem = str.dup
            str_i = rem.slice! i
            permutation(rem, prefix + str_i)
        end
    end
end

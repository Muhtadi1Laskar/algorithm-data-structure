find_min :: [Int] -> Int
find_min = \list -> 
    case list of
        [] -> error "List cannot be empty!"
        [x] -> x
        x:xs | x > find_min xs -> find_min xs
        x:_ -> x

remove_one :: [Int] -> Int -> [Int]
remove_one = \list -> \v -> 
    case list of 
        [] -> error "Element not found!"
        x:xs | v==x -> xs
        x:xs -> x:remove_one xs v

selection_sort :: [Int] -> [Int]
selection_sort = \list ->
    case list of 
        [] -> []
        _ -> find_min list:selection_sort
                (remove_one list (find_min list))

main = print (selection_sort [8, 9, 3, 4, 7])
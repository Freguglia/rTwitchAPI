#Creates the query list appropriately.
QueryList = function(...){
  a = list(...) 
  setNames(unlist(a), rep(names(a), sapply(a, length))) %>% 
    as.list
}
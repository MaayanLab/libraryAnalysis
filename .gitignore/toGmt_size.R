# by size of original GMT

newGmt = list()

for (n in 1:ncol(gtexListCoAvg[[8]])) {
	setOne = (gtexListCoAvg[[8]])[,n] 
	names(setOne) = rownames(gtexListCoAvg[[8]])

	setOne = sort(setOne, decreasing = TRUE)

	newSet = setOne[1:length(go[[n]])]

	newGmt[[length(newGmt) + 1]] = names(newSet)
	names(newGmt)[length(newGmt)] = colnames(gtexListCoAvg[[8]])[n]

}

for (i in 1:length(newGmt)) {

	cat(names(newGmt)[i], paste0(paste(newGmt[[i]], collapse = "\t")), sep = "\t\t")
	cat("\n")

}
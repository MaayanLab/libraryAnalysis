# newGmt <- list()

# for (n in 1:ncol(listCoAvg[[4]])) {
# 	setOne <- (listCoAvg[[4]])[,n] 
# 	names(setOne) <- rownames(listCoAvg[[4]])

# 	setOne <- sort(setOne)

# 	pop_mean <- mean(setOne)
# 	pop_sd <- sd(setOne)

# 	pop_z <- (setOne - pop_mean) / pop_sd

# 	# cutting off at 3 standard deviations
# 	# cutOff <- sort(pop_z[pop_z >= 3], decreasing = TRUE)
# 	newSet <- names(pop_z[pop_z >= 4]) 

# 	newGmt[[length(newGmt) + 1]] <- newSet
# 	names(newGmt)[length(newGmt)] <- colnames(listCoAvg[[4]])[n]

# }

# by standard deviation cut-off

newGmt = list()

# needs correlation averages for all expression genes against gene sets
for (n in 1:ncol(gtexListCoAvg[[8]])) {
	setOne = (gtexListCoAvg[[8]])[,n] 
	names(setOne) = rownames(gtexListCoAvg[[8]])

	setOne = sort(setOne, decreasing = TRUE)

	pop_mean = mean(setOne)
	pop_sd = sd(setOne)

	pop_z = (setOne - pop_mean) / pop_sd

	# cutting off at 3 standard deviations
	newSet = names(pop_z[pop_z >= 3]) 

	newGmt[[length(newGmt) + 1]] = newSet
	names(newGmt)[length(newGmt)] = colnames(gtexListCoAvg[[8]])[n]

}

# prints in GMT format
for (i in 1:length(newGmt)) {

	cat(names(newGmt)[i], paste0(paste(newGmt[[i]], collapse = "\t")), sep = "\t\t")
	cat("\n")

}

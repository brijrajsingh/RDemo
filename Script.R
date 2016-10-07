#require(deployrUtils)

#deployrInput('{"name":"input_state","default":"TX","render":"character","label":"State"}')
#deployrInput('{"name":"input_outcome","default":"heart attack","render":"character","label":"Outcome"}')

best <- function(state, outcome) {
    sortedHospitalData <- NULL

    ##Read outcome data
    outcomeVal <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

    ## Check that state and outcome are valid
    filteredStateData <- outcomeVal[outcomeVal$State == state,]

    ##outcome can be "heart attack", "heart failure", or "pneumonia"

    if (outcome == "heart attack") {
        sortedHospitalData <- filteredStateData[which.min(filteredStateData[, 11]),]
    } else if (outcome == "heart failure") {
        sortedHospitalData <- filteredStateData[which.min(filteredStateData[, 17]),]
    } else if (outcome == "pneumonia") {
        sortedHospitalData <- filteredStateData[which.min(filteredStateData[, 23]),]
    }

    ## Return hospital name in that state with lowest 30-day death ## rate
    sortedHospitalData$Hospital.Name
}

best('TX','heart attack')

#retval <- best(input_state,input_outcome)
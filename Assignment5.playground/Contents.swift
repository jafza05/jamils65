//: Playground - noun: a place where people can play


/* Bonus Proposal
 
 My interest is in the area of business intelligence and analytics. 
 
 My bonus proposal probably won't sound too sophisticated but I would like to try to add some graphical analytics to the Statistics tab that chart the number of cells in each state over a rolling period of 5-10 iterations. And the percentage breakdown of how many cells of each state are currently on the grid. 
 
 */

func isLeap(input: Int) ->  Bool {
    return (input % 4 == 0 && input % 100 != 0) || input % 400 == 0  ? true : false
}

isLeap(1960)
isLeap(1900)
isLeap(2000)


func julianDate(year: Int, month: Int, day: Int) -> Int {
    var cumDays: [Int] = [0,31,59,90,120,151,181,212,243,273,304,334]
    let daysToMonth = Array(1900..<year).filter({ isLeap($0) }).count + (year - 1900) * 365 + cumDays[month-1]
    return daysToMonth + day + ((isLeap(year) && month > 2) ? 1  : 0)
}


julianDate(1900, month:  9, day: 28)
julianDate(1961, month:  9, day: 28)
julianDate(1900, month:  1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)



//testing for my own purposes
julianDate(1960, month:  2, day: 28)
julianDate(1961, month:  2, day: 28)

julianDate(1960, month:  3, day: 28)
julianDate(1961, month:  3, day: 28)


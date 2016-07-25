//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func isLeap(input: Int) ->  Bool {
    return (input % 4 == 0 && input % 100 != 0) || input % 400 == 0  ? true : false
}

isLeap(1960)
isLeap(1900)
isLeap(2000)


func julianDate(year: Int, month: Int, day: Int) -> Int {
    var cumDays: [Int] = [0,31,59,90,120,151,181,212,243,273,304,334]
    return (isLeap(year) && month > 2) ? cumDays[month-1] + day + 1  : cumDays[month-1] + day
}

// I could have eliminated the [month-1] and made it [month] by padding the cumDays array with a leading zero, however I thought it made more "readable" sense to make it plus one since you don't want to count all the days of the month you are currently in


julianDate(1960, month:  9, day: 28)
julianDate(1961, month:  9, day: 28)
julianDate(1900, month:  1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)



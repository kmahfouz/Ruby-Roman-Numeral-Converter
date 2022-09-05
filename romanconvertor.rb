ROMAN_NUMBERS_HASH = {
    1000=> "M",
    900=> "CM",
    500=> "D",
    400=> "CD",
    100=> "C",
    90=> "XC",
    50=> "L",
    40=> "XL",
    10=> "X",
    9=> "IX",
    5=> "V",
    4=> "IV",
    1=> "I"
}


def fromRoman(romanNumber)
    romanNumber.split('').each do |c| 
       if ((c =~ /I|V|X|L|C|D|M/) == nil)
        raise TypeError
       end
    end 
    convertedNumber = 0
    ROMAN_NUMBERS_HASH.each do |number|
        numeral = number[1]
        arabicNumber = number[0]
        while romanNumber.start_with?(numeral)
            convertedNumber += arabicNumber
            romanNumber = romanNumber.slice(numeral.length, romanNumber.length)
        end
    end
    return convertedNumber
end

def toRoman(arabicNumber)
    convertedNumeral = ""
    if(arabicNumber > 3999 or arabicNumber < 1 or !arabicNumber)
        raise RangeError
    else
        ROMAN_NUMBERS_HASH.each do |number|
            int = number[0] 
            numeral = number[1]
            convertedNumeral << numeral * (arabicNumber/int)     
            arabicNumber = arabicNumber % int
        end  
    end
    puts convertedNumeral
    return convertedNumeral
end
//: [Previous](@previous)

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        // key->字母，value->字母个数
        var dic: [Character: Int] = [:]
        for item in s {
            if let count = dic[item] {
                dic[item] = count + 1
            }else {
                dic[item] = 1
            }
        }
        var result: Int = 0
        var hasOdd: Bool = false

        for (_, n) in dic {
            if n.isMultiple(of: 2) {
                result += n
            }else {
                hasOdd = true
                if n > 2 {
                    result += n - 1
                }
            }
        }
        return hasOdd ? result + 1 : result
    }

    var dic: [String: Bool] = [:]

    func longestPalindromeSubStr(_ s: String) -> String {
        if s.isEmpty || s.count == 1 {
            return s
        }

        var resStart = s.startIndex
        var resEnd = resStart

        for (n, _) in s.enumerated() {
            let idx = String.Index(utf16Offset: n, in: s)
            let disCenterX = palindromeDistanceWith(midleft: idx, midRight: idx, within: s)
            var after = idx
            if idx < s.index(before: s.endIndex) {
                after = s.index(after: idx)
            }
            let disCneterXX = palindromeDistanceWith(midleft: idx, midRight: after, within: s)
            var maxDis = disCneterXX
            if disCenterX.distance > disCneterXX.distance {
                maxDis = disCenterX
            }
            if maxDis.distance > s.distance(from: resStart, to: resEnd) {
                resStart = maxDis.left
                resEnd = maxDis.right
            }
        }

        let result = s[resStart...resEnd]

        return String(result)
    }

    func palindromeDistanceWith(midleft: String.Index, midRight: String.Index, within s: String) -> (distance: Int, left: String.Index, right: String.Index) {
        if midRight == s.endIndex || midleft == s.endIndex {
            return (1, midleft, midRight)
        }
        var midL = midleft
        var midR = midRight
        let start = s.startIndex
        let end = s.endIndex

        var flag = true

        while midL >= start && midR < end && s[midL] == s[midR]  {
            flag = false
            if midL > start {
                midL = s.index(before: midL)
            }else {
                break
            }
            midR = s.index(after: midR)
            flag = true
        }
        if flag && s.distance(from: midL, to: midR) >= 1 {
            midR = s.index(before: midR)
            midL = s.index(after: midL)
        }
        return (s.distance(from: midL, to: midR), midL, midR)
    }
}

//: [Next](@next)

let solution = Solution()

//let result = Solution().longestPalindrome("abccccdd")
//print(result)

//print(solution.isPalindrome("ww"))
//print(solution.longestPalindromeSubStr("whdqcudjpisufnrtsyupwtnnbsvfptrcgvobbjglmpynebblpigaflpbezjvjgbmofejyjssdhbgghgrhzuplbeptpaecfdanhlylgusptlgobkqnulxvnwuzwauewcplnvcwowmbxxnhsdmgxtvbfgnuqdpxennqglgmspbagvmjcmzmbsuacxlqfxjggrwsnbblnnwisvmpwwhomyjylbtedzrptejjsaiqzprnadkjxeqfdpkddmbzokkegtypxaafodjdwirynzurzkjzrkufsokhcdkajwmqvhcbzcnysrbsfxhfvtodqabvbuosxtonbpmgoemcgkudandrioncjigbyizekiakmrfjvezuzddjxqyevyenuebfwugqelxwpirsoyixowcmtgosuggrkdciehktojageynqkazsqxraimeopcsjxcdtzhlbvtlvzytgblwkmbfwmggrkpioeofkrmfdgfwknrbaimhefpzckrzwdvddhdqujffwvtvfyjlimkljrsnnhudyejcrtrwvtsbkxaplchgbikscfcbhovlepdojmqybzhbiionyjxqsmquehkhzdiawfxunguhqhkxqdiiwsbuhosebxrpcstpklukjcsnnzpbylzaoyrmyjatuovmaqiwfdfwyhugbeehdzeozdrvcvghekusiahfxhlzclhbegdnvkzeoafodnqbtanfwixjzirnoaiqamjgkcapeopbzbgtxsjhqurbpbuduqjziznblrhxbydxsmtjdfeepntijqpkuwmqezkhnkwbvwgnkxmkyhlbfuwaslmjzlhocsgtoujabbexvxweigplmlewumcone"))

//print(solution.isPalindrome("aaaa"))
//print(solution.isPalindrome("babadada"))
print(solution.longestPalindromeSubStr("cbbd"))
//print(solution.longestPalindromeSubStr("cbbd"))
print(solution.longestPalindromeSubStr("jglknendplocymmvwtoxvebkekzfdhykknufqdkntnqvgfbahsljkobhbxkvyictzkqjqydczuxjkgecdyhixdttxfqmgksrkyvopwprsgoszftuhawflzjyuyrujrxluhzjvbflxgcovilthvuihzttzithnsqbdxtafxrfrblulsakrahulwthhbjcslceewxfxtavljpimaqqlcbrdgtgjryjytgxljxtravwdlnrrauxplempnbfeusgtqzjtzshwieutxdytlrrqvyemlyzolhbkzhyfyttevqnfvmpqjngcnazmaagwihxrhmcibyfkccyrqwnzlzqeuenhwlzhbxqxerfifzncimwqsfatudjihtumrtjtggzleovihifxufvwqeimbxvzlxwcsknksogsbwwdlwulnetdysvsfkonggeedtshxqkgbhoscjgpiel"))

//print(Solution().longestPalindromeSubStr("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))

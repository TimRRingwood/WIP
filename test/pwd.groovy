def upperAlpha = ['A'..'Z'].flatten()
def lowerAlpha = ['a'..'z'].flatten()
def numbers = ['0'..'9'].flatten()
def specialChars = ['^','#','*','!',':','\$'].flatten()

def pool = upperAlpha + lowerAlpha + numbers + specialChars;
//def pool = upperAlpha+lowerAlpha+numbers;

def upperAlphaCt = 0;
def lowerAlphaCt = 0;
def numbersCt = 0;
def specialCharsCt = 0;

Random rand = new Random(System.currentTimeMillis())
StringBuilder sb = new StringBuilder()
//println "pool: " + pool.getClass()
def lastChar = " ";
def x = " "
for (int i = 0; i < 15; i++) {
    // Need to have two each, so lets check how we are doing
    if (i > 11) {
       // All conditions are met... pick any character
       if (upperAlphaCt > 1 && lowerAlphaCt > 1 && numbersCt > 1 && specialCharsCt > 1) {
           println "set pool to all"
           pool = upperAlpha + lowerAlpha + numbers + specialChars;
       }
       else if (upperAlphaCt < 2) {
           println "set pool to upper alpha"
           pool = upperAlpha;
       }
       else if (lowerAlphaCt < 2) {
            println "set pool to lower alpha"
            pool = lowerAlpha;
       }
       else if (numbersCt < 2) {
           println "set pool to numbers"
           pool = numbers;
       }
       else if (specialCharsCt < 2) {
           println "set pool to special chars"
           pool = specialChars;
       }
     }
         println pool     
       while (x == lastChar) {
            println "I   " + i        
            x = pool[rand.nextInt(pool.size())]
            println "X: " + x
       }
       lastChar = x;
       if (upperAlpha.contains(x)) {
             upperAlphaCt++
       }
       else if (lowerAlpha.contains(x)) {
           lowerAlphaCt++
       }
       else if (numbers.contains(x)) {
           numbersCt++
       }
       else if (specialChars.contains(x)) {
           specialCharsCt++;
       }
   
   
    println "SB: " + sb.toString()
    sb.append(x);
}

//char x = pool[rand.nextInt(pool.size())]
println "SB: " + sb.toString()

//def passChars = (0..10).collect { pool[rand.nextInt(pool.size())] }
//def password = passChars.join()
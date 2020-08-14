const { TokenType, Keyword} = require('./constance')

let log = () => {}

const isNumber = (char) => {
  return ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].includes(char)
}

const numberToken = (source, i) => {
  const start = i
  let char = source[i]
  while(isNumber(char)) {
    i++;
    char = source[i]
  }
  return source.slice(start, i);
}

function Token (tokenType, text, value) {
  this.tokenType = tokenType
  this.text = text
  this.value = value
}

const scanner = (source) => {
  const tokenList = []

  let i = 0
  while (i < source.length) {
    let char = source[i];
    // log('char', char)
    if (char === Keyword.leftBracket) {
      tokenList.push(new Token(TokenType.leftBracket, char, char))
      i++
    } else if (char === Keyword.rightBracket) {
      tokenList.push(new Token(TokenType.rightBracket, char, char))
      i++
    } else if (char === Keyword.add) {
      tokenList.push(new Token(TokenType.add, char, char))
      i++
    } else if (char === Keyword.substract) {
      tokenList.push(new Token(TokenType.substract, char, char))
      i++
    } else if (char === Keyword.multiple) {
      tokenList.push(new Token(TokenType.multiple, char, char))
      i++
    } else if (char === Keyword.division) {
      tokenList.push(new Token(TokenType.division, char, char))
      i++
    } else if (isNumber(char)) {
      const num = numberToken(source, i)
      tokenList.push(new Token(TokenType.number, num, Number(num)))
      i += num.length
    } else {
      // log('unhandle Token')
      i++;
    }
  }

  log('token list', tokenList)
  return tokenList;
}

const test = () => {
  log = (...args) =>{
    args.forEach(arg => {
      console.log(arg);
      console.log('\r\n')
    })
  }


  function testNumberToken () {
    const str = 'abc123sdf'
    log(numberToken(str,3))
  }

  testNumberToken();

  const addStr =  '(+ 11 22)'

  const substract = '(- 21 11)'

  const multiple = '(* 22 2)'

  const division = '(/ 42 2)'


  scanner(addStr)

  scanner(substract)

  scanner(multiple)

  scanner(division)

}

if (require.main === module) {
  test()
}

module.exports = { scanner }
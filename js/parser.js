
const { NodeType, TokenType } = require('./constance')
const { scanner } = require('./scanner')

const log = console.log;

function Node (type, value, parent) {
  this.nodeType = type
  this.value = value
  this.parent = parent
  this.children = []
}

const parser = (tokenList) => {
  let rootNode = new Node(NodeType.program, 'program', null)
  let currNode = rootNode

  for(let i = 0; i < tokenList.length; i++) {
    const token = tokenList[i]

    if (token.tokenType === TokenType.leftBracket) {
      const exprNode = new Node(NodeType.expression, 'expressoin', currNode)
      currNode.children.push(exprNode)
      currNode = exprNode
    } else if ([TokenType.add, TokenType.substract, TokenType.multiple, TokenType.division].includes(token.tokenType)) {
        const operateNode = new Node(token.tokenType, token.value, currNode)
        currNode.children.push(operateNode)
        // currNode = currNode
    } else if (token.tokenType === TokenType.number) {
      currNode.children.push(new Node(token.tokenType, token.value, currNode))
    } else if (token.tokenType === TokenType.rightBracket) {
      currNode = currNode.parent
    }
  }

  // log('ast', rootNode.children[0].children[2])
  return rootNode
}

const test = () => {

  const addStr =  '(+ 11 22)'

  const substract = '(- 21 11)'

  const multiple = '(* 22 2)'

  const division = '(/ 42 2)'

  const str1 = `(+ (- 3 1) (* 2 2))`


  // parser(scanner(addStr))

  // parser(scanner(substract))

  // parser(scanner(multiple))

  // parser(scanner(division))

  parser(scanner(str1))
}

if(require.main === module) {
  test()
}


module.exports = { parser }

const { NodeType, TokenType } = require('./constance')
const { scanner } = require('./scanner')

let log = () => {}

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
      const exprNode = new Node(NodeType.expression, 'expression', currNode)
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

  log(rootNode)

  return rootNode
}

const test = () => {


  const logTree = (tree) => {
    console.log(tree)
    console.log()
    tree.children.map(child => logTree(child))
  }

  log = logTree

  const str1 = `(+ (- 3 1) (* 2 2))`

  parser(scanner(str1))
}

if(require.main === module) {
  test()
}


module.exports = { parser }
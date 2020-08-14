
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

  const treeStringify = tree => {
    if (!tree instanceof Node) {
      return tree
    }
    return{
      ...tree,
      parent: tree.parent && tree.parent.toString(),
      children: tree.children.map(child => treeStringify(child))
    }
  }

  const logTree = (tree) => {
    if (!tree instanceof Node) {
      return console.log(tree)
    }
    console.log(tree)
    console.log()
    tree.children.map(child => logTree(child))
  }

  log = logTree

  const addStr =  '(+ 11 22)'

  const substract = '(- 21 11)'

  const multiple = '(* 22 2)'

  const division = '(/ 42 2)'

  parser(scanner(addStr))

  // parser(scanner(substract))

  // parser(scanner(multiple))

  // parser(scanner(division))

}

if(require.main === module) {
  test()
}


module.exports = { parser }
const { NodeType } = require('./constance')
const { parser } = require('./parser')
const { scanner } = require('./scanner')

let log = () => {}

const compiler = ast => {
  let currNode = ast
  if (currNode.nodeType === NodeType.program) {
    // 特殊处理
    currNode= currNode.children[0]
    return compiler(currNode)
  } else if (currNode.nodeType === NodeType.expression) {
    for(let i = 0; i < currNode.children.length; i++) {
      const [operator, operand1, operand2] = currNode.children;
      if (operator.nodeType === NodeType.add) {
        return compiler(operand1) + compiler(operand2)
      } else if (operator.nodeType === NodeType.substract) {
        return compiler(operand1) - compiler(operand2)
      } else if (operator.nodeType === NodeType.multiple) {
        return compiler(operand1) * compiler(operand2)
      } else if (operator.nodeType === NodeType.division) {
        return compiler(operand1) / compiler(operand2)
      } else {
        log('Unknown Operation')
      }
    }
  } else if (currNode.nodeType === NodeType.number) {
    return currNode.value
  } else {
    log('Unknown Node', currNode)
  }
}

function test () {

  log = console.log

  const str1 = `(+ (- 3 1) (* 2 2))` // 6

  log(compiler(parser(scanner(str1))))

  const str2 = `(+ (- 10 8) (* (- 3 2) 2))` // 4

  log(compiler(parser(scanner(str2))))
}

if (require.main === module) {
  test()
}
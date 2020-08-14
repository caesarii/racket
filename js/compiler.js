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
        return operand1.value + operand2.value
      } else if (operator.nodeType === NodeType.substract) {
        return operand1.value - operand2.value
      } else if (operator.nodeType === NodeType.multiple) {
        return operand1.value * operand2.value
      } else if (operator.nodeType === NodeType.division) {
        return operand1.value / operand2.value
      } else {
        log('Unknown Operation')
      }
    }
  } else if (currNode.nodeType === NodeType.number) {
    return Number(currNode.value)
  } else {
    log('Unknown Node', currNode)
  }
}

function test () {

  log = console.log

  const addStr =  '(+ 11 22)'

  const substract = '(- 21 11)'

  const multiple = '(* 22 2)'

  const division = '(/ 42 2)'

  log(compiler(parser(scanner(addStr))))

  log(compiler(parser(scanner(substract))))

  log(compiler(parser(scanner(multiple))))

  log(compiler(parser(scanner(division))))
}

if (require.main === module) {
  test()
}
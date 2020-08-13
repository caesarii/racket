const TokenType = {
  leftBracket: 'leftBracket',
  rightBracket: 'rightBracket',
  add: 'add',
  substract: 'substract',
  multiple: 'multiple',
  division: 'division',
  number: 'number',
}

const Keyword = {
  [TokenType.leftBracket]: '(',
  [TokenType.rightBracket]: ')',
  [TokenType.add]: '+',
  [TokenType.substract]: '-',
  [TokenType.multiple]: '*',
  [TokenType.division]: '/',
}

const NodeType = {
  program: 'program',
  expression: 'expression',
  add: 'add',
  substract: 'substract',
  multiple: 'multiple',
  division: 'division',
  number: 'number',
}

module.exports = { TokenType, Keyword, NodeType }
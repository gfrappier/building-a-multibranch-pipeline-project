def constants = load 'Constants.groovy'

def myMethod() {
  //Fail here
  println constants.SingleMessage
}

return this
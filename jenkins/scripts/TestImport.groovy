def constants = load './jenkins/scripts/Constants.groovy'

def myMethod() {
  //Fail here
  println constants.SingleMessage
}

return this
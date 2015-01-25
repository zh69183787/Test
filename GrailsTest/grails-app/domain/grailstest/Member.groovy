package grailstest

class Member {
    Team team
    String name
    String gender = 'F'
    String address
    String email
    String phone
    String id

    static mapping = {
        id generator:'uuid.hex',sqlType:'varchar2(50)'
    }
    static belongsTo = [Team]
    static constraints = {
        name(size:3..20,blank:false,unique:true)
        email(email:true,blank:false)
        gender(inList:["F", "M"] )
    }
}

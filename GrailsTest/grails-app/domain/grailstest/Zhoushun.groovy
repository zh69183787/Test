package grailstest

class Zhoushun {
    static mapping = {
        table 'Zhoushun'
        version true
        id generator:'uuid.hex',sqlType:'varchar2(20)'
        loginName type: 'text'
        birthDate type:'date'
        sort "name"
    }

    String id;
    String loginName
    String name
    Date birthDate
    static constraints = {
        name(blank:false, maxSize:5,unique:true)
        loginName()
        birthDate(validator: {return (it > new Date())}) // ...
    }

    def beforeInsert = {
        println("dasdsa")
    }
    def beforeUpdate = {
        // your code goes here
    }
    def beforeDelete = {
        // your code goes here
    }
    def onLoad = {
        // your code goes here
    }
}

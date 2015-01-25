package grailstest

class Team {
    String teamName
    Date foundDate
    String id

    static mapping = {
        id generator:'uuid.hex',sqlType:'varchar2(50)'
    }
    static constraints = {
        teamName(size:3..50,blank:false,unique:true)
    }
    static hasMany = [members:Member]
    String toString(){
        return teamName
    }
}

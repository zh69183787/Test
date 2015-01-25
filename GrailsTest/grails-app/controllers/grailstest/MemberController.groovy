package grailstest

import grails.transaction.Transactional
import org.hibernate.FetchMode

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class MemberController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def search = {
            //使 Action 获取了页面表单提交的查询条件
        SearchMemberCommand  searchCmd ->
            //如果 request 的请求方式是 POST，则进行查询，否则会输出查询表单
            if(request.method == "POST") {
                def criteria = Member.createCriteria() //创建了一个 Hibernate 的 Criteria 查询
                def resultList = criteria{
                    and {  //所有条件之间是与的关系
                        //如果 searchCmd.name 不为空，则加入条件
                        if(searchCmd.name)
                            like ('name',"%${searchCmd.name}%")
                        if(searchCmd.gender)
                            eq ('gender',"${searchCmd.gender}")

                        //如果 teamName 不为空，则与 team 表进行连接，并加入查询条件
                        if(searchCmd.teamName) {
                            team{
                                like ('teamName',"%${searchCmd.teamName}%" )
                            }
                            fetchMode('team', FetchMode.EAGER)
                        }
                    }
                    order("id", "asc") //加入了排序的条件，以 id 字段进行升序查询
                }
                render(view:"index" , model:[memberInstanceList: resultList])
            }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Member.list(params), model:[memberInstanceCount: Member.count()]
    }

    def show(Member memberInstance) {
        respond memberInstance
    }

    def create() {
        respond new Member(params)
    }

    @Transactional
    def save(Member memberInstance) {
        if (memberInstance == null) {
            notFound()
            return
        }

        if (memberInstance.hasErrors()) {
            respond memberInstance.errors, view:'create'
            return
        }

        memberInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
                redirect memberInstance
            }
            '*' { respond memberInstance, [status: CREATED] }
        }
    }

    def edit(Member memberInstance) {
        respond memberInstance
    }

    @Transactional
    def update(Member memberInstance) {
        if (memberInstance == null) {
            notFound()
            return
        }

        if (memberInstance.hasErrors()) {
            respond memberInstance.errors, view:'edit'
            return
        }

        memberInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect memberInstance
            }
            '*'{ respond memberInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Member memberInstance) {

        if (memberInstance == null) {
            notFound()
            return
        }

        memberInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

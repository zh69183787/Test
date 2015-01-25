package grailstest



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ZhoushunController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Zhoushun.list(params), model:[zhoushunInstanceCount: Zhoushun.count()]
    }

    def show(Zhoushun zhoushunInstance) {
        respond zhoushunInstance
    }

    def create() {
        respond new Zhoushun(params)
    }

    @Transactional
    def save(Zhoushun zhoushunInstance) {
        if (zhoushunInstance == null) {
            notFound()
            return
        }

        if (zhoushunInstance.hasErrors()) {
            respond zhoushunInstance.errors, view:'create'
            return
        }

        zhoushunInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'zhoushun.label', default: 'Zhoushun'), zhoushunInstance.id])
                redirect zhoushunInstance
            }
            '*' { respond zhoushunInstance, [status: CREATED] }
        }
    }

    def edit(Zhoushun zhoushunInstance) {
        respond zhoushunInstance
    }

    @Transactional
    def update(Zhoushun zhoushunInstance) {
        if (zhoushunInstance == null) {
            notFound()
            return
        }

        if (zhoushunInstance.hasErrors()) {
            respond zhoushunInstance.errors, view:'edit'
            return
        }

        zhoushunInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Zhoushun.label', default: 'Zhoushun'), zhoushunInstance.id])
                redirect zhoushunInstance
            }
            '*'{ respond zhoushunInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Zhoushun zhoushunInstance) {

        if (zhoushunInstance == null) {
            notFound()
            return
        }

        zhoushunInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Zhoushun.label', default: 'Zhoushun'), zhoushunInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'zhoushun.label', default: 'Zhoushun'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

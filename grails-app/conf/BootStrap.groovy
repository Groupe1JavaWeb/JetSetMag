import com.jetsetmag.auth.User;

class BootStrap {

    def init = { servletContext ->
		//new User(email:"root@jetsetmag.com",username:"super7Admin",secret:"j7mag2014",firstName:"Admin",lastName:"Jet 7 Magazine",status:0).save()
    }
    def destroy = {
    }
}
